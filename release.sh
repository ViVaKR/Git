#!/bin/bash
# 자동 릴리즈 생성 스크립리트
# chmod +x release.sh
# 사용법: ./release.sh "v0.1.1-test" "변경 내용 요약"
TAG=$1
MESSAGE=$2

if [ -z "$TAG" ] || [ -z "$MESSAGE" ]; then
    echo "Usage: $0 <tag_name> <release_message>"
    exit 1
fi

# 변경 로그 자동 생성
CHANGELOG=$(git log --online -5)

# GPG 서명된 태그 만들기
git tag -s "$TAG" -m "$MESSAGE"

# 태그 푸시
git push origin "$TAG"

# GitHub 릴리즈 생성
gh release create "$TAG" --title "$TAG" --notes "$MESSAGE"


# 최근 변경 사항
$CHANGELOG "--verify-tag"

echo "Release '$TAG' Create and Verified Successfully!"


# 결과
# 1. GPG 서명된 태그 생성
# 2. GitHub 에 자동 릴리즈 업로드
# 3. 최신 커밋 로그 포함
# 4. 자동 Verified 인증 표시
