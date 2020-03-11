FROM google/cloud-sdk:alpine

ENV TERRAFORM_VERSION=0.12.23
ENV CONFTEST_VERSION=0.17.1

RUN apk update && apk upgrade \
    && apk add --no-cache bash git openssl ca-certificates make \
    && gcloud components install kubectl \
    && gcloud components install beta \
    && cd /tmp \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin \
    && wget https://github.com/instrumenta/conftest/releases/download/v${CONFTEST_VERSION}/conftest_${CONFTEST_VERSION}_Linux_x86_64.tar.gz \
    && tar xzf conftest_${CONFTEST_VERSION}_Linux_x86_64.tar.gz \
    && mv conftest /usr/local/bin \
    && curl -L -o opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64 \
    && chmod 755 ./opa \
    && mv opa /usr/local/bin \
    && rm -r /tmp/*