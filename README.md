[![Build Status](https://travis-ci.org/kaz231/alpine-php7-nginx.svg?branch=master)](https://travis-ci.org/kaz231/alpine-php7-nginx)

PHP7-nginx Docker Images
========================

Small docker images based on kaz231/alpine-php7 with nginx and php-fpm.

### Contained images

* kaz231/alpine-php7-nginx
* kaz231/alpine-php7-nginx-dev

### How to use it ?

Image contains directory for your that is stored in $APP_DIR env var that is set as workdir. Directoru is owned by dedicated user ($APP_USER:$APP_USER_GROUP) that is also a default user for image. Container runs supervisor that spawns two additional processes - php-fpm and nginx. Nginx listenes on port 8080 which is exposed.

You can use it in following way:

```
docker run -v $(pwd):/var/app kaz231/alpine-php7-nginx
```

or simple extend after this image and add your project in the following way:

```
ADD <path-to-your-app> /var/app/
```

### How to run tests ?

All tests are created using ansible. First created image is run and then output is verfied using assertions. You can simple run tests with command:

```
ansible-playbook tests/<image>/tests.yml -i tests/localhost -c local
```

where __image__ is e.g. alpine-php7-nginx.

### Change-log

* __0.1.0__:
  - initial version
