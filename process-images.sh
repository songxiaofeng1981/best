#!/bin/bash

# 图片处理逻辑
IMAGE_DIR=/images

# 检查图片目录是否存在
if [ ! -d "$IMAGE_DIR" ]; then
    echo "Error: Image directory $IMAGE_DIR does not exist."
    exit 1
fi

# 压缩图片
for file in "$IMAGE_DIR"/*.{jpg,jpeg,png}; do
    if [[ -f $file ]]; then
        # 使用 squoosh-cli 压缩图片
        squoosh-cli --webp auto "$file" -d "$IMAGE_DIR/after"
        compressedFile="$IMAGE_DIR/after/$(basename "$file" .jpg).webp"
        if [ -f "$compressedFile" ]; then
            compressedSize=$(du -k "$compressedFile" | cut -f1)
            echo "Compressed: $(basename "$compressedFile"), Size: ${compressedSize}KB"
        else
            echo "Error: Compressed file not found - $compressedFile"
        fi
    fi
done

echo "Image processing completed."
