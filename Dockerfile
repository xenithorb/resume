FROM fedora:latest

RUN rm -rf /var/cache/dnf /var/cache/yum \
    && dnf install -y texlive-scheme-small @development-tools make \
    && rm -rf /var/cache/dnf /var/cache/yum \
    && dnf clean all

ENV WORKDIR /src

RUN mkdir -p ${WORKDIR}

COPY . ${WORKDIR}/

WORKDIR ${WORKDIR}

CMD ["make"]