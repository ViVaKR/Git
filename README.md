# Git Note  

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

