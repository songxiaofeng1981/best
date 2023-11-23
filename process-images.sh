#!/bin/bash

# 图片处理逻辑
IMAGE_DIR=/images

# 检查图片目录是否存在
if [ ! -d "$IMAGE_DIR" ]; then
    echo "Error: Image directory $IMAGE_DIR does not exist."
    exit 1
fi



# 重命名图片并压缩
count=1
for file in "$IMAGE_DIR"/*.{jpg,jpeg,png}; do
    if [[ -f $file ]]; then
        # 重命名逻辑
        date=$(identify -verbose "$file" | grep "exif:DateTimeOriginal:" | awk '{print $2}' | sed 's/:/-/g' | sed 's/ //g')
        if [ ! -z "$date" ]; then
            formattedDate=$(date -d "$date" +'%Y%m%d')
            randomNumber=$(shuf -i 1-1000 -n 1)
            newName="${formattedDate}${randomNumber}-${file##*/}"
        else
            newName=$(printf "%04d-%s" $count "${file##*/}")
            ((count++))
        fi
        newFilePath="$(dirname "$file")/$newName"
        mv "$file" "$newFilePath"

		# 压缩逻辑
		originalSize=$(du -k "$newFilePath" | cut -f1)
		# 确保使用正确的命令格式
		squoosh-cli --webp -d "$IMAGE_DIR/after" -- "$newFilePath"
		compressedFile="$IMAGE_DIR/after/$(basename "$newFilePath" .jpg).webp"
		if [ -f "$compressedFile" ]; then
			compressedSize=$(du -k "$compressedFile" | cut -f1)
			echo "Original: $newName, Size: ${originalSize}KB; Compressed: $(basename "$compressedFile"), Size: ${compressedSize}KB"
		else
			echo "Error: Compressed file not found - $compressedFile"
		fi

    fi
done

echo "Image processing completed."
