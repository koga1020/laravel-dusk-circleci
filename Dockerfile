FROM circleci/php:7.2-apache-node-browsers

RUN sudo apt-get install -y \
  git \
  unzip \
  zlib1g-dev \
  libpq-dev \
  libicu-dev \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  libnss3 \
  libgconf-2-4 \
  libfontconfig1 \
  chromium \
  xvfb \
  libpq-dev

RUN sudo docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN sudo docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql
RUN sudo docker-php-ext-install \
  pdo \
  pdo_pgsql \
  zip \
  intl \
  gd