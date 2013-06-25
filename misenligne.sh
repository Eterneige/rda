#!/usr/bin/env bash
##
find . -name "*~" -exec rm {} \;
make html
cp -a .htaccess htdocs/
git add htdocs
git add content
git commit -a
git push gandi master
ssh 120749@git.dc0.gpaas.net 'deploy rda.sploing.fr.git'
git push origine master
