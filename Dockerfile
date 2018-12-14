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

ENV WORKDIR /src

RUN mkdir -p ${WORKDIR}

COPY . ${WORKDIR}/

WORKDIR ${WORKDIR}

CMD ["make"]