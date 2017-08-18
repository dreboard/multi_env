#!/usr/bin/env bash

# Deploy staging branch

echo ".....preparing commands"
vagrant ssh -c "
cd  /var/www/staging
if [ -d .git ]; then
  git init
  git remote add origin https://github.com/dreboard/multi_env.git
else
  echo no git installed
fi;
git pull origin staging

"