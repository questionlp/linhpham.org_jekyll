#!/usr/bin/bash

export SITE_DIR=/u01/www/linhpham.org
export JEKYLL_ENV=production

eval "$(rbenv init -)"
bundle exec jekyll build -d ${SITE_DIR}

