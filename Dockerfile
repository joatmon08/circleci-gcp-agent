FROM google/cloud-sdk:alpine
RUN apk update \
    && apk add bash \
    && gcloud components install kubectl