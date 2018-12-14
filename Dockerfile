FROM fedora:latest

RUN rm -rf /var/cache/dnf /var/cache/yum \
    && rm /etc/*.repos.d/*-modular.repo \
    && dnf install -y \
        texlive-scheme-small \
        poppler-utils \ 
        make \ 
        @development-tools \
    && rm -rf /var/cache/dnf /var/cache/yum \
    && dnf clean all

RUN useradd -m -u 1000 -d /src builder
WORKDIR /src 

COPY . .
RUN chown -R builder. /src

USER builder

CMD ["make"]