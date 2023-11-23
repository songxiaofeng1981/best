#!/bin/bash

# Jekyll 构建逻辑
JEKYLL_SOURCE_DIR=/app

cd $JEKYLL_SOURCE_DIR
bundle exec jekyll build --destination _site
