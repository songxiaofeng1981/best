#!/bin/bash







echo "The repository name is $REPO_NAME"



bundle install && bundle exec jekyll build --baseurl $REPO_NAME --destination _site

         

 