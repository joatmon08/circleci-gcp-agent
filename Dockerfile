FROM google/cloud-sdk:alpine

ENV TERRAFORM_VERSION=0.12.24
ENV VAULT_VERSION=1.3.3
ENV CONFTEST_VERSION=0.17.1

RUN apk update && apk upgrade \
    && apk add --no-cache bash git make \
    && gcloud components install kubectl \
    && gcloud components install beta \
    && cd /tmp \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin \
    && wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip \
    && unzip vault_${VAULT_VERSION}_linux_amd64.zip -d /usr/bin \
    && curl -L -o opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64 \
    && chmod 755 ./opa \
    && mv opa /usr/local/bin \
    && rm -r /tmp/*