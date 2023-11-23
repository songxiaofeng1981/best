#!/bin/bash

# Jekyll 源文件目录
JEKYLL_SOURCE_DIR=/app

# 待处理图片目录
IMAGE_DIR=/big

# 检查图片目录是否存在
if [ ! -d "$IMAGE_DIR" ]; then
    echo "Error: Image directory $IMAGE_DIR does not exist."
    exit 1
fi

# 在这里添加您的图片处理逻辑
# 例如，优化 $IMAGE_DIR 中的图片

# 启动 Jekyll 服务
cd $JEKYLL_SOURCE_DIR
bundle exec jekyll build --destination _site
