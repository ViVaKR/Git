# Git Note  

### 기본 환경설정
> 1. git config --global core.autocrlf input  ' windows -> true
> 2. git config --global user.name 'full name'
> 3. git config --global user.email id@email.com
---
### 상태  
> $ git status  
> $ git status -s  ' 짤막하게 확인하기

### 추적  
> $ git add .
> $ git add **fileName**

### 제외, 무시
> $ touch __.gitignore__  // 프로젝트 루트에 '.gitignore' 파일 생성  
> $ echo *.log >> .gitignore  // 모든 log 파일 무시 예시  
- 표준 Glob  패턴 사용, 프로젝트 전체에 해당됨  
1. __.a__ : 확장자가 .a 인 파일 전체 제외  
2. __!lib.a__ : lib.a 는 제외하지 않음
3. __build/__ : build/ 디렉토이에 있는 모든 파일 무시
4. __doc/**/*.pdf__ : doc  디렉토리의 모든 .pdf 파일 무시
> 기본예제 : [GitIgnore](https://github.com/github/gitignore)

### Refresh the indexes
> $ git rm --cached -r .
> $ git reset --hard

### 수정 후 staged 상태가 아닌 파일 비교
> $ git diff // Unstaged 상태인 것만 보여줌

### commit 전에 staging area 의 변경부분 확인
> $ git diff --staged 

### 변경사항 커밋
> $ git commit -m "message note"
> $ git commit -a -m "staging area & commit"

### 파일삭제
> $ git rm **file Name**


