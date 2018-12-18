TEX=resume.tex
PDF=$(TEX:.tex=.pdf)
PNG=$(PDF:.pdf=.png)
LOG=build.log

.SUFFIXES: .png .pdf .tex

all: $(PDF) $(PNG)

.tex.pdf:
	@echo "- Converting $< to $@"
	@xelatex $< >>$(LOG) 2>&1

.pdf.png:
	@echo "- Converting $< to $@"
	pdftocairo -png $< >>$(LOG) 2>&1

update: docker_xelatex git_commit_updates

git_add_updates:
	@echo "- Adding $(PDF) $(basename $(PNG))-*.png to the git index"
	@git add $(PDF) $(basename $(PNG))-*.png

git_commit_updates: git_add_updates
	@echo "- Committing files to the git repository"
	@git commit -m 'Update current version PNG images and PDF'

docker_build:
	@echo "- Building resume docker container image..."
	@docker build -t resume . >>$(LOG) 2>&1
	@echo "Done."

docker_xelatex: docker_build
	@echo "- Running LaTeX docker container to convert to PDF..."
	@docker run -v "$$PWD:/src:Z" resume
	@echo "Done."

clean:
	find . -type f -name "resume*.*" ! -name "resume.tex" -exec rm -vf '{}' \+
	git clean -ffdx