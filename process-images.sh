#!/bin/bash

# 图片处理逻辑
IMAGE_DIR=/images

# 检查图片目录是否存在
if [ ! -d "$IMAGE_DIR" ]; then
    echo "Error: Image directory $IMAGE_DIR does not exist."
    exit 1
fi

# 在这里添加您的图片处理逻辑
# 例如，使用 Squoosh CLI 优化 $IMAGE_DIR 中的图片
