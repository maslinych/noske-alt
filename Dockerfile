FROM acdhch/noske:5.58.1-2.214.1-open
LABEL maintainer kirill@altlinux.org

WORKDIR /tmp

USER root

RUN cd /tmp && \
    curl -LO https://git.altlinux.org/tasks/315222/build/100/x86_64/rpms/crystal-open-2.130.1-alt2.noarch.rpm && \
    yum remove -y crystal-open && \
    yum install -y /tmp/crystal-open*.rpm && \
    yum clean all && \
    sed -i '/URL_BONITO/s,"http://localhost,",' /var/www/crystal/config.js

CMD ["/bin/sh", "/run_lighttpd.sh"]
