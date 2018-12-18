[![pipeline status](https://gitlab.com/xenithorb/resume/badges/master/pipeline.svg)](https://gitlab.com/xenithorb/resume/commits/master)

## Usage (Docker style)
To generate a PDF from this LaTeX code, navigate to this folder in a terminal and run:

    docker build -t resume . && docker run -it -v "$PWD:/src:Z" resume

Alternatively, which runs the same command above and more:

    $ make update
    - Building resume docker container image...
    Done.
    - Running LaTeX docker container to convert to PDF...
    - Converting resume.tex to resume.pdf
    - Converting resume.pdf to resume.png
    Done.
    - Adding resume.pdf resume-*.png to the git index
    - Committing files to the git repository
    [master 36f6502] Update current version PNG images and PDF
     2 files changed, 0 insertions(+), 0 deletions(-)
     rewrite resume-1.png (89%)
     rewrite resume.pdf (76%)

## Usage (Classic on Fedora)
To generate a PDF from this LaTeX code, navigate to this folder in a terminal and run:

    dnf install -y texlive-scheme-small poppler-utils
    make 

Or 

    make resume.pdf
    make resume.png

## Requirements (without docker)
You will need to have `xelatex` installed on your machine. On Fedora:

    sudo dnf install -y texlive-scheme-small


## Current Version

![](resume-1.png)
![](resume-2.png)