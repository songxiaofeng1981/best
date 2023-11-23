#!/bin/bash



# 添加 Ruby 和 Gem 的路径到 PATH
export PATH="/usr/local/bin:$PATH"

# 确保当前工作目录是 /app
cd /app

# 安装依赖并构建网站
bundle install
bundle exec jekyll build

# Jekyll 构建逻辑
JEKYLL_SOURCE_DIR=/app

cd $JEKYLL_SOURCE_DIR
bundle exec jekyll build --destination _site
