#!/bin/bash



# 添加 Ruby 和 Gem 的路径到 PATH
export PATH="/usr/local/bin:$PATH"

# 加载 RVM 环境
source /usr/local/rvm/scripts/rvm

# 添加 Ruby 和 Gem 的路径到 PATH
export PATH="/usr/local/rvm/bin:$PATH"

# 确保当前工作目录是 /app
cd /app

# 安装依赖并构建网站
bundle install


echo "The repository name is $REPO_NAME"



bundle exec jekyll build --baseurl $REPO_NAME --destination _site

         

 