
all: pdf png

pdf:
	xelatex resume.tex

png: pdf
	pdftocairo -png resume.pdf

update: docker
	git add resume*.png resume.pdf && git commit -m "Update current version PNG images and PDF"

docker:
	docker build -t resume . && docker run -v "$$PWD:/src:Z" resume

clean:
	find . -type f -name "resume*.*" ! -name "resume.tex" -exec rm -vf '{}' \+

.PHONY: clean
