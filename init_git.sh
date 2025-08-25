#!/usr/bin/env zsh

# 초기화
mkdir $1
cd $1
git init

# README.md 생성
echo "# $1 Project" >README.md

# .gitignore 생성 (기본 Node.js 예제)
echo "node_modules/" >.gitignore
echo "*.log" >>.gitignore

# 첫 커밋
git add .

git commit -m "Initial commit with README.md and .gitignore"

# 원격 저장소 추가
git remote add origin $2
git push -u origin main

# 실행
# --> ./init_git.sh Demo git@github.com:ViVaKR/Demo.git

# 새로운 원격 저장소 추가하기
# --> git remote add Demo git@github.com:ViVaKR/Demo.git
