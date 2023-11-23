# 使用 Ubuntu 作为基础镜像
FROM ubuntu:latest

# 安装依赖
RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    libsqlite3-dev

# 安装 RVM (Ruby Version Manager)
RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import - \
    && curl -sSL https://rvm.io/pkuczynski.asc | gpg --import - \
    && curl -sSL https://get.rvm.io | bash -s stable

# 激活 RVM
RUN /bin/bash -l -c "source /usr/local/rvm/scripts/rvm"

# 安装 Ruby
# 替换下面的 "3.1.2" 为 Gemfile 中指定的 Ruby 版本
RUN /bin/bash -l -c "rvm install 3.1.2 && rvm use 3.1.2 --default"

# 安装 Node.js 和 npm
RUN apt-get install -y nodejs npm

# 安装 Jekyll 和 Bundler
RUN /bin/bash -l -c "gem install jekyll bundler"

# 安装其他依赖
RUN apt-get install -y imagemagick libvips

# 安装 Squoosh CLI
RUN npm install @squoosh/cli -g

# 创建一个目录来存放应用程序代码
WORKDIR /app

# 安装 Ruby 依赖
COPY app/Gemfile app/Gemfile.lock /app/
RUN /bin/bash -l -c "bundle install"

# 拷贝您的应用程序代码到镜像中
COPY app/ /app

# 拷贝处理图片和构建网站的脚本到镜像中
COPY process-images.sh /process-images.sh
COPY build-site.sh /build-site.sh
RUN chmod +x /process-images.sh /build-site.sh
