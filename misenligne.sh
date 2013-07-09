#!/usr/bin/env bash
##
find . -name "*~" -exec rm {} \;
make html
cp -a  favicon.ico googlea877ebc45daa60ac.html .htaccess wiki htdocs/
git add htdocs
git add content
git commit -a
git push gandi master
ssh 120749@git.dc0.gpaas.net 'deploy rda.sploing.fr.git'
git push origine master
