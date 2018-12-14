pdf:
	xelatex resume.tex

png: pdf
	pdftocairo -png resume.pdf

all: pdf png