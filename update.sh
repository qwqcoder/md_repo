#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e
 
# 保存和提交所有修改
git add -A
git commit -m 'general update' || true

git remote remove origin
git remote add origin git@github.com:qwqcoder/md_repo.git

git push -f origin main