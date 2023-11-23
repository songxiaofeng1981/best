# 使用 Ubuntu 作为基础镜像
FROM ubuntu:latest

# 安装必要的软件包
RUN apt-get update && apt-get install -y \
    imagemagick \
    libvips \
    ruby \
    ruby-dev \
    build-essential \
    nodejs \
    npm

# 安装 Jekyll 和 Bundler
RUN gem install jekyll bundler

# 安装 Squoosh CLI
RUN npm install @squoosh/cli -g

# 创建一个目录来存放应用程序代码
WORKDIR /app

# 安装 Ruby 依赖
# 注意：确保您的 Gemfile 和 Gemfile.lock 文件在 app/ 目录中
COPY app/Gemfile app/Gemfile.lock /app/
RUN bundle install

# 拷贝您的应用程序代码到镜像中
COPY app/ /app

# 设置容器启动时执行的命令
# 这里使用一个 shell 脚本来处理图片并启动 Jekyll
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
