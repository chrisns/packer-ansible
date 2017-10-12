FROM hashicorp/packer:light

RUN apk add --no-cache --virtual .run-deps \
       python2 \
    && apk add --no-cache --virtual .build-deps \
        alpine-sdk \
        py-setuptools \
        libffi-dev \
        python2-dev \
        openssl-dev \
    && easy_install-2.7 pip \
    && pip install ansible \
    && apk --purge del .build-deps \
    && rm -rf /var/cache/apk /root/.cache
