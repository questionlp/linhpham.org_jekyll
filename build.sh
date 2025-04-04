#!/usr/bin/bash

export SITE_PARENT=/u01/www/
export SITE_DIR=linhpham.org
export BACKUP_DIR=/u01/www/_backups/
export JEKYLL_ENV=production

eval "$(rbenv init -)"
npm run all
cp -r _site ${SITE_PARENT}${SITE_DIR}.new
mv ${SITE_PARENT}${SITE_DIR} ${BACKUP_DIR}${SITE_DIR}-`date +%Y%m%d-%H%M%S`
mv ${SITE_PARENT}${SITE_DIR}.new ${SITE_PARENT}${SITE_DIR}
