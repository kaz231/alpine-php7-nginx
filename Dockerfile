FROM kaz231/alpine-php7:latest

LABEL maintainer "Kamil Zajac <kaz231@outlook.com>"

RUN apk update \
    && apk add \
      php7-fpm \
      nginx \
      supervisor \
    && ln -s /usr/sbin/php-fpm7 /usr/bin/php-fpm \
    && rm -rf /var/cache/apk/* \
    && chown -R $APP_USER:$APP_GROUP /var/log/nginx \
    && chown -R $APP_USER:$APP_GROUP /var/log/php7 \
    && mkdir /var/log/supervisord \
    && chown -R $APP_USER:$APP_GROUP /var/log/supervisord \
    && rm /etc/nginx/conf.d/default.conf \
    && rm /etc/php7/php-fpm.d/www.conf

ADD conf/prod/supervisor/supervisord.conf /etc/supervisord.conf
ADD conf/prod/nginx/nginx.conf /etc/nginx/nginx.conf
ADD conf/prod/nginx/app.conf /etc/nginx/conf.d/app.conf
ADD conf/prod/php-fpm/app.conf /etc/php7/php-fpm.d/app.conf
ADD conf/prod/php-fpm/php-fpm.conf /etc/php7/php-fpm.conf

EXPOSE 8080

CMD supervisord -n
