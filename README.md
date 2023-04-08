# Git 시작하기

## Git 설치 : [Git Download](https://git-scm.com "Git")

## Git 처음 환경설정

```bash
    git config --global user.name "Kim Bum Jun"
    git config --global user.email "hello@email.com"
    git config --global color.ui auto
    git config --global core.safecrlf false
```

## Github 회원가입 : [Github](https://github.com "Github")  

1. 첫 저장소 생성 (Create new repository)  
2. 생성한 저장소(Repository) 주소 복사 (`Copy` Created Repository URL: HTTPS, SSH or CLI)
3. 내 컴퓨터에서 가져올 폴더 루트로 이동 : 클론하면 해당 저장소(Repository)가 서브 디렉토리로 자동 생성됨  
4. 생성한 저장소 가져오기 (Clone): $ git clone `<Repo URL Paste>`

---

## 로컬 저장소(Local Repository)을 먼저 만든 후 원격 저장소(Remote Repository)로 Push 하기

> or First, Create Local Repository Push to Remote Repository

```bash
mkdir learnin-git  # 작업폴더 생성
cd learning-gi
echo "# Demo Repo" >> README.md # README File 만들기
git init . # 초기화 .git 로컬 저장소 생성 
git add README.md # or `$ git add .` 스태이징 에리어에 추적할 파일 추가
git commit -m "Add new file README" # 
git remote add origin git@github.com:...? # 푸시할 원격 저장소 추가 (처음 한번)
git push -u origin main # 원격 저장소에 저장
```

## 흐름도

`Working Directory -> (git add) -> Staging Area -> (git commit) -> Commit History -> (git push) -> Remote Server`

## 용어

- Repository : 프로젝트가 보관되는 폴더의 위치로 저장소를 의미함
- Directory : 폴더 (Folder)

---

## 명령어

- clone : Github 에서 호스팅 된는 리포지토리를 내 컴퓨터의 현재 폴더로 가져옴.  
- add : Git 에서 추가한 파일의 변경사항을 추척하도록 함
- commit : Git 에 파일을 저장함
- push : 커밋(Commit) 된 파일과 내용들을 Github 원격(Remote) 저장소(Repository)에 전송(Upload)합니다.  
- pull : push 의 반대로 원격(Remote) 저장소(Repository)에서 내 컴퓨터 현재 프로젝트로 가져옵니다.

---

## 기본 환경설정 : 전역적인 환경설정

```bash
    git config --global user.name # 실명 또는 적당한 이름  
    git config --global user.email # 이메일 주소  
    git config --global core.editor "code --wait"
    git config --global color.ui true
    git config --global --list #확인하여 보기`
```

---

## ssh key 생성

```bash
    ssh-keygen -t rsa -b 4096 -C "이메일 주소"
    # Generatin pulblic/private rsa key pair.
    # Enter file in shich to save the key (/Users/../.ssh/id_rsa): testkey 
    # Enter passphrase (empty for no passphrase) : (empty)
    # generated..
    ls | grep testkey
    # testkey (private key, 개인키)
    # testkey.pub  (public key, 공개키)
    cat testkey.pub
    # printed key string....
    # copy or 
    pbcopy < ~/.ssh/testkey.pub # copy command
```

## Github SSH and GPG keys 에 등록하기
>
> Add new
> Add Title, Key (Paste to here)
> Add SSH key  

## (MacOS) Add SSH key to the ssh-agent

```bash
    eval  "$(ssh-agent -s)"
    # result -> Agent pid 74204
    ssh-add -K ~/.ssh/id_rsa
```

---

## 추적  

```bash
    git add demo.txt # demo.txt 파일 변경사항 추적 시작
    git add .  # 모든 변경사항을 스테이지에 올림
    git add ./src # src 디렉토리의 모든 변경사항을 스테이지에 올림
    git add -p # 변경된 사하을 하나하나 확인하면서 스테이지에 올림
    
    # add 취소
    git restore --staged `<file>` # 특정 파일 add 취소
    
    # 커밋을 취소하고 해당 파일들은 staged 상태로
    # 워킹 디렉토리에 보존
    git reset --soft HEAD^
    
    ## 커밋을 취소하고 해당 파일들은 unstaged 상태로
    # 워킹 디렉토리에 보존
    git reset --mixed HEAD^ # 기본옵션사항
    git reset HEAD^ # 위와 동일
    git reset HEAD~2 # 마지막 2개의 commit 취소
    
    # 커밋을 취소하고 해당 파일들은 unstaged 상태로 
    # 워킹 디렉토리에서 삭제
    git reset --hard HEAD^
```

---

## 상태

```bash  
git status  
git status -s # 짤막하게 확인하기
git status -v # 변경사항 확인
```

---

## log

```bash
    git log
    git log --oneline

```

## commit

## 제외, 무시
>
> $ touch __.gitignore__  // 프로젝트 루트에 '.gitignore' 파일 생성  
> $ echo *.log >> .gitignore  // 모든 log 파일 무시 예시  

- 표준 Glob  패턴 사용, 프로젝트 전체에 해당됨  

1. __.a__ : 확장자가 .a 인 파일 전체 제외  
2. __!lib.a__ : lib.a 는 제외하지 않음
3. __build/__ : build/ 디렉토이에 있는 모든 파일 무시
4. __doc/**/*.pdf__ : doc  디렉토리의 모든 .pdf 파일 무시

> 기본예제 : [GitIgnore](https://github.com/github/gitignore)

## Refresh the indexes
>
> $ git rm --cached -r .
> $ git reset --hard

## 수정 후 staged 상태가 아닌 파일 비교
>
> $ git diff // Unstaged 상태인 것만 보여줌

## commit 전에 staging area 의 변경부분 확인
>
> $ git diff --staged

## 변경사항 커밋
>
> $ git commit -m "message note"
> $ git commit -a -m "staging area & commit"

## 파일삭제
>
> $ git rm __file Name__  & rm __file Name__

## 저장소 복제, Clone
>
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
