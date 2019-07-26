FROM google/cloud-sdk:alpine

ENV TERRAFORM_VERSION=0.12.5
ENV HELM_VERSION=2.14.2
ARG INSPEC_VERSION=4.3.2
ARG GEM_SOURCE=https://rubygems.org

RUN apk update && apk upgrade \
    && apk add --no-cache bash git openssl ca-certificates docker python3 \
    ruby ruby-bundler ruby-dev g++ libffi-dev musl-dev make gnupg \
    && gcloud components install kubectl \
    && gcloud components install beta \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --upgrade pip setuptools \
    && if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi \
    && if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi \
    && rm -r /root/.cache \
    && rm -f /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python \
    && pip install jinja2 invoke \
    && cd /tmp \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin \
    && wget https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz \
    && tar -xzf helm-v${HELM_VERSION}-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/bin/helm \
    && rm -r /tmp/* \
    && echo "gem: --no-document" > /etc/gemrc \
    && gem install --no-document --source ${GEM_SOURCE} --version ${INSPEC_VERSION} inspec