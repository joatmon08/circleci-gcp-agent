FROM google/cloud-sdk:alpine
RUN apk update && apk upgrade \
    && apk add --no-cache bash git openssl ca-certificates docker python3 \
    && gcloud components install kubectl \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --upgrade pip setuptools \
    && if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi \
    && if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi \
    && rm -r /root/.cache \
    && rm -f /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python \
    && pip install jinja2 invoke