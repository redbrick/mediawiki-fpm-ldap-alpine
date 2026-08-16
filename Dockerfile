FROM mediawiki:1.43-fpm-alpine

RUN apk add --no-cache openldap

RUN apk add --no-cache --virtual .build-deps openldap-dev \
    && docker-php-ext-configure ldap --with-libdir=lib/ \
    && docker-php-ext-install ldap \
    && apk del .build-deps
