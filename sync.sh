#!/bin/bash

cd /var/www/hooks/var/repos/$1

git branch -r | grep -v '\->' | while read remote; do IFS='/' read -ra a <<<"$remote"; git checkout ${a[1]} && git pull ${a[0]} ${a[1]} 2>&1; done

git branch -r | grep -v '\->' | while read remote; do IFS='/' read -ra a <<<"$remote"; if ([ "${a[0]}" == "bitbucket" ] && [ "$2" == "bitbucket.org" ]) || ([ "${a[0]}" == "gitlab" ] && [ "$2" == "gitlab.icontextdev.ru" ]); then continue; fi; git checkout ${a[1]} && git push ${a[0]} ${a[1]} --force 2>&1; done

exit 0;