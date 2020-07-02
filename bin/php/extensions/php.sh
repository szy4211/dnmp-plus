#!/bin/sh

echo
echo "============================================"
echo "Install extensions from   : ${MORE_EXTENSION_INSTALLER}"
echo "PHP version               : ${PHP_VERSION}"
echo "Extra Extensions          : ${PHP_EXTENSIONS}"
echo "Multicore Compilation     : ${MC}"
echo "Work directory            : ${PWD}"
echo "============================================"
echo


if [ -z "${EXTENSIONS##*,tideways_xhprof,*}" ]; then
    echo "---------- Install tideways_xhprof ----------"
    mkdir tideways_xhprof \
    && tar -xf tideways-5.0.2.tgz -C tideways_xhprof --strip-components=1 \
    && ( cd tideways_xhprof && phpize && ./configure && make ${MC} && make install ) \
    && docker-php-ext-enable tideways_xhprof
fi

if [ -z "${EXTENSIONS##*,mcrypt,*}" ]; then
    echo "---------- mcrypt was REMOVED from PHP 7.2.0 ----------"
fi


if [ -z "${EXTENSIONS##*,mysql,*}" ]; then
    echo "---------- mysql was REMOVED from PHP 7.0.0 ----------"
fi


if [ -z "${EXTENSIONS##*,sodium,*}" ]; then
    echo "---------- Install sodium ----------"
    echo "Sodium is bundled with PHP from PHP 7.2.0 "
fi


if [ -z "${EXTENSIONS##*,redis,*}" ]; then
    echo "---------- Install redis ----------"
    apk add --no-cache
    printf "\n" | pecl install redis
    docker-php-ext-enable redis
fi


if [ -z "${EXTENSIONS##*,memcached,*}" ]; then
    echo "---------- Install memcached ----------"
    apk add --no-cache
    printf "\n" | pecl install memcached
    docker-php-ext-enable memcached
fi


if [ -z "${EXTENSIONS##*,xdebug,*}" ]; then
    echo "---------- Install xdebug ----------"
    apk add --no-cache
    printf "\n" | pecl install xdebug
    docker-php-ext-enable xdebug
fi


if [ -z "${EXTENSIONS##*,swoole,*}" ]; then
    echo "---------- Install swoole ----------"
    apk add --no-cache
    printf "\n" | pecl install swoole
    docker-php-ext-enable swoole
fi

if [ -z "${EXTENSIONS##*,pdo_sqlsrv,*}" ]; then
    echo "---------- Install pdo_sqlsrv ----------"
    apk add --no-cache
    pecl install pdo_sqlsrv
    docker-php-ext-enable pdo_sqlsrv
fi

if [ -z "${EXTENSIONS##*,sqlsrv,*}" ]; then
    echo "---------- Install sqlsrv ----------"
    apk add --no-cache
    printf "\n" | pecl install sqlsrv
    docker-php-ext-enable sqlsrv
fi

if [ -z "${EXTENSIONS##*,mongodb,*}" ]; then
    echo "---------- Install mongodb ----------"
    apk add --no-cache
    printf "\n" | pecl install mongodb
    docker-php-ext-enable mongodb
fi
