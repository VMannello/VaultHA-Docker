FROM centos:7.6.1810
RUN curl https://releases.hashicorp.com/vault/1.1.3/vault_1.1.3_linux_amd64.zip | zcat > /usr/local/bin/vault
RUN chmod +x /usr/local/bin/vault && \
	mkdir /etc/vault && mkdir -p /var/lib/vault/data && \
	useradd --system --home /etc/vault --shell /bin/false vault && \
    chown -R vault:vault /etc/vault /var/lib/vault/
RUN yum clean all && rm -rf /var/cache/yum
ENV VAULT_ADDR=http://127.0.0.1:8200
ENV AWS_ACCESS_KEY_ID=X
ENV AWS_SECRET_ACCESS_KEY=X

EXPOSE 8200 8201