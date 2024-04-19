#!/bin/bash

# 1. 接受输入gpt_name
read -p "请输入 gpt_name: " gpt_name
# 2. 接受输入category，并在对应的category下创建category.md文件，如果没有则创建对应的category目录
read -p "请输入 category: " category

# 3. 根据gpt_name 创建./gpt/${gpt_name}的目录
mkdir -p "./gpt/${gpt_name}"

# 4. 为每个三级目录创建一组["program", "inspiration", "read"]目录
base_categoires=("unit_test" "ui_test" "all")
for category in "${base_categoires[@]}"; do
    mkdir -p "./gpt/${gpt_name}/${category}"
done

# 遍历所有的gpt_names
for dir in ./gpt/*/; do
    # 获取目录名称
    dir_name=$(basename "$dir")
    
    # 在对应的category下创建category.md文件，如果没有则创建对应的category目录
    mkdir -p "./gpt/${dir_name}/${category}"
    touch "./gpt/${dir_name}/${category}/${category}.md"
done

echo "操作完成。"
