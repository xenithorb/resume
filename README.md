## Usage (Docker style)
To generate a PDF from this LaTeX code, navigate to this folder in a terminal and run:

    docker build -t resume . && docker run -it -v "$PWD:/src:Z" resume

## Usage (Classic on Fedora)
To generate a PDF from this LaTeX code, navigate to this folder in a terminal and run:

    dnf install -y texlive-scheme-small poppler-utils
    make 

## Requirements
You will need to have `xelatex` installed on your machine.

Alternatively, you can use a site like [ShareLaTeX](https://sharelatex.com) to build and edit your LaTeX instead.

## Current Version

![](resume-1.png)
![](resume-2.png)