FROM acdhch/noske:5.58.1-2.214.1-open
LABEL maintainer kirill@altlinux.org

WORKDIR /tmp

USER root

COPY run_lighttpd.sh /

RUN cd /tmp && \
    curl -LO https://git.altlinux.org/tasks/317801/build/100/x86_64/rpms/crystal-open-2.130.1-alt4.noarch.rpm && \
    yum remove -y crystal-open && \
    yum install -y /tmp/crystal-open*.rpm && \
    yum clean all

CMD ["/bin/sh", "/run_lighttpd.sh"]
