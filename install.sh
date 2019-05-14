#!/bin/bash

export PATH_TO_REPOS=$1

if [ -z "$PATH_TO_REPOS" ]
then
      echo "Укажите путь к папке с репозиториями"
      exit 0;
fi

cd $PATH_TO_REPOS

# IStat install

git clone git@bitbucket.org:icontext/istat.git

cd ./istat

git remote rm origin
git remote add bitbucket git@bitbucket.org:icontext/istat.git
git remote add gitlab git@gitlab.icontextdev.ru:cabinet/cabinet.git

# Proxy install

cd ../

git clone git@bitbucket.org:icontext/proxy.git

cd ./proxy

git remote rm origin
git remote add bitbucket git@bitbucket.org:icontext/proxy.git
git remote add gitlab git@gitlab.icontextdev.ru:bot/proxy.git

# Leads install

cd ../

git clone git@bitbucket.org:icontext/leads.git

cd ./leads

git remote rm origin
git remote add bitbucket git@bitbucket.org:icontext/leads.git
git remote add gitlab git@gitlab.icontextdev.ru:bot/leads.git

echo "Установка выполнена успешно!"

exit 0;