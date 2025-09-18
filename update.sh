#!/usr/bin/env sh

# 确保脚本在遇到错误时立即退出
set -e

# 1. 保存所有修改到暂存区
echo "将所有修改添加到暂存区..."
git add -A

# 2. 提交暂存区内容，如果工作区没有修改，则跳过此步
echo "提交本地修改..."
git commit -m 'general update' || true

# 3. 拉取远程仓库的最新内容，并显式指定远程分支
echo "拉取远程仓库最新内容..."
git pull origin main

# 4. 强制推送本地内容到远程仓库
echo "强制推送至远程仓库..."
git push -f origin main

echo "操作完成！"