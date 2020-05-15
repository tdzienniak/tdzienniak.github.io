#!/bin/bash

mkdir build

JEKYLL_ENV=production bundle exec jekyll build -s . -d build
echo "Jekyll build done"

cd build

# No need to have GitHub Pages to run Jekyll
touch .nojekyll

remote_repo="git@github.com:tdzienniak/tdzienniak.github.io.git" && \
git init && \
git add . && \
git commit -m "publish" && \
git push --force $remote_repo master:master && \
rm -fr .git && \
cd .. 
