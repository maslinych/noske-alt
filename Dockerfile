FROM acdhch/noske:5.63.9-2.223.6-open
LABEL maintainer kirill@altlinux.org

WORKDIR /tmp

USER root

COPY run_lighttpd.sh /

RUN cd /tmp && \
    curl -LO https://git.altlinux.org/tasks/322277/build/100/x86_64/rpms/crystal-open-2.142-alt1.noarch.rpm && \
    yum remove -y crystal-open && \
    yum install -y /tmp/crystal-open*.rpm && \
    yum clean all

CMD ["/bin/sh", "/run_lighttpd.sh"]
