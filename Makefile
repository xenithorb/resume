
all: pdf png

pdf:
	xelatex resume.tex

png: pdf
	pdftocairo -png resume.pdf

clean:
	find . -type f -name "resume*.*" ! -name "resume.tex" -exec rm -vf '{}' \+

.PHONY: clean
