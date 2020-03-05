FROM google/cloud-sdk:alpine

ENV TERRAFORM_VERSION=0.12.21

RUN apk update && apk upgrade \
    && apk add --no-cache bash git openssl ca-certificates \
    && gcloud components install kubectl \
    && gcloud components install beta \
    && cd /tmp \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin \
    && rm -r /tmp/*