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
> $ git rm **file Name**  & rm **file Name**

### 저장소 복제, Clone
> $ git clone [깃링크](git@github.com:ViVaKR/GitNote.git)  
> $ git log  // 상태 확인  
>> 순간순으로 커밋 히스토리 보여줌  
>> 가장 최근 커밋이 가장 먼저 표시됨  
>> $ __git log -p__  // 각 커밋의 diff 결과 표시  
>> $ __git log -p -2__ // 최근 두개의 결과만 표시, 즉 동료가 무엇을 했는지 확인가능  
>> $ __git log --stat__  // 각 커밋의 통계 정보 조회, 요약정보는 가장 뒤에 표시됨  
>> $ __git log --pretty=oneline__  // 각 커밋을 하나의 라인으로 보여줌  
>> $ __git log --pretty=format:"%h - %an, %ar : %s"__  // 결과를 포맷 일치 파싱
>>> format options :   
>>> %H, %h, %T, %t, %P, %p, %an, %ae, %ad, %ar, %cn, %ce, % %cd, %cr, %s  
>>> 저자(Author) : 원 작업을 수행한 사람  
>>> 커미터(Committer) : 마지막으로 이 작업을 적용한(저장소에 포함시킨) 사람  
>>>> (ex) 어떤 프로젝트에 패치를 보냈고 그  프로젝트의 담당자가 패치를 적용했다면 두 명의 정보 중
>>>> 당신이 저자이고 담당자가 커미터가 됨













