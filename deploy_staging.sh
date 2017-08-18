#!/usr/bin/env bash

# Deploy staging branch
# git pull origin staging
echo ".....preparing commands"
vagrant ssh -c "

if [ -d .git ]; then
  echo ......initialize git;
  env -i git init
  env -i git remote add origin https://github.com/dreboard/multi_env.git

else
  echo ......pulling staging branch;
  env -i git pull origin master
fi;

ls -ah  /var/www/staging
"