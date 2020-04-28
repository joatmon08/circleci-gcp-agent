FROM alpine

ENV TERRAFORM_VERSION=0.12.24
ENV CONFTEST_VERSION=0.18.2

RUN apk update && apk upgrade \
    && apk add --no-cache bash git make \
    && cd /tmp \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin \
    && wget https://github.com/instrumenta/conftest/releases/download/v${CONFTEST_VERSION}/conftest_${CONFTEST_VERSION}_Linux_x86_64.tar.gz \ 
    && tar xzf conftest_${CONFTEST_VERSION}_Linux_x86_64.tar.gz \
    && mv conftest /usr/local/bin \
    && rm -r /tmp/*