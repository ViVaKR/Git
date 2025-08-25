# Gitignore

## 작성규칙

`.env` : 확장자가 .env 인 모든 파일을 무시
`dist/` : dist 폴더의 모든 파일을 무시
`ignore_folder/*.txt` : 해당 폴더에서 확장자 .txt 인 모든 파일을 무시, 하위 폴더는 해당 없음
`ignore_folder/**/*.sec` : 해당 폴더 포함한 하위 폴더 포함 확장자가 .sec 인 모든 파일을 무시
`/*.asm` : 현재 폴더에서만 확장자 .asm 인 모든 파일 무시
`!public.asm` : 무시하는 모든 파일 확장자 .asm 중에서 public.asm 파일은 무시 하지 않음
`/modules` : 현재 폴더 중에서 'modules' 폴더에 있는 모든 파일 무시
`modules/` : 프로젝트의 모든 폴더 중 'modules' 라는 폴더명의 하위 파일은 모두 무시

```bash
# 전역 설정 파일
git config --global core.excludesfile <filepath> 형식
```

## Git 기본 명령어 모음

```bash

# 기본 설정
git config --global user.name "[사용자명]"
git config --global user.email "[사용자 이메일 주소]"

# 저장소 초기화
git init

# 스테이지 추가
git add [파일이름.확장자]
git add .
git status

# 스테이징 취소
git restore --staged <fileName>
# or
git reset HEAD # 전체 취소

# 커밋
git commit -m "[message]"
git commit -am "[message]"

# 커밋 취소
git revert [가장최근커밋해시] # 해당 커밋 이전 상태로 되돌리는 명령, 커밋을 삭제하지 않고 이전 커밋을 새로 복사 추가 방식.

git reset --soft [id] # HEAD 만 바뀜
git reset --mixed [id] # 기본값, staging 만 바뀜
git reset --hard [id] # 워킹/스테이징 모두 바꿈

git reset HEAD^ # 보편적인 방식, 현재 HEAD 의 이전 커밋으로 되돌리기
git reset HEAD~2 # 현재로 부터 n번째 이전 커밋으로 되돌리기

git reset [커밋해시] # 롤백할 커밋을 지정


# 커밋 수정
git commit -m "committing"
git commit --amemd # 최신 커밋 수정


# 커밋 내용 확인
git log
git shortlog
git log --oneline
git log --format=oneline
git log -p
git log --stat
git log --graph
git show [id]

# 차이 확인
git diff
git diff --color-words


# 환경설정 보기
git config --edit --global

git config list # View All Settings
git config list --system # System Level
git config list --global # Global Level
git config list --local # Repository Level

git confit user.name # Particular Configuration

git config list --show-origin
git config list --show-scope

git config --global --get user.name
git config --global --get user.email
git config --global --get init.defaultBranch

# global
git config --unset --global user.name
git config --unset --global user.email

# global
git config --unset user.name
git config --unset user.email

# ignore 처리된 파일 삭제
git clean -Xn # 목록 표시
git clean -Xf # 파일 삭제

# 원격저장소
git clone [원격저장소주소]
git remote add origin [원격저장소주소]

git fetch # 원격저장소의 커밋을 가져오기만 하고 merge 하지 않음

git diff main origin/main

git remote -v # url 보기

git remote rename 기존이름 변경할이름
git remote show 이름

git push origin main
git pull origin main

git remote rm 이름 # 저장소제거
```

## 취소 하기

1. git add 만 했을때,  스테이징 취소 (Unstage) -> `git reset HEAD`
2. git commit 까지 했을 때 (로컬), 방금한 커밋 취소 -> `git reset HEAD~1`
3. git push 까지 했을 때 (원격), 원격에 올린 커밋을 되돌리기 -> `git revert [커밋 해시]`

```bash
# git add . 한 것 취소
git reset HEAD <파일명> # 특정 <파일명> 파일을 스테이지에서 제거 또는 모든 파일을 스테이지에서 제거 이때 <파일명> 은 생략

# 또는 restore
git restore --staged <파일명>, git restore --staged . # git reset HEAD 추천 함.

# git commit --amend
# 마지막 커밋 작업에서 아주 살짝 뭔가 빠뜨린 것을 살짝 넣거나 변경하는 것을 새로운 커밋을 만들지 않을때 즉 간단한 수정작업 커밋
git commit -m 'initial commit'
git add forgetten_file
git commit --amend

# reset
# soft : 파일 보존, add 한 상태 + staged 상태
# mixed : 파일 보존, add 하기 전 + unstaged 상태
# hard : 파일 삭제, add 하기 전 + unstaged 상태, 모두 취소 작업내용 모두 다 사라짐으로 위험함.
# 커밋 기록 자체를 말소
# 꺽쇠 수만큼 이전으로 돌아감
# ^: 한단계, ^^: 두단계, ~3: 세단계 즉 숫자로도 가능함.
# reset 은 로그 자체를 지워 버림으로 미래로 되 돌릴수 없음
git reset --soft HEAD^

git reset HEAD^
git reset HEAD~1
git reset --mixed HEAD~1 # 기본 옵션, 커밋을 취소하고 변경내용은 워킹 디렉토리로 되돌림, add 하기전 상태로 돌아감.

git reset HEAD^^
git reset HEAD~2

git reset --hard HEAD^

# revert 는 로그를 덮어 쓰는 방식으로 미래로 되돌릴 수 있음.

# example
# 1 단계 커밋 : 파일 a.txt 생성 (커밋번호 1)
# 2 단계 커밋 : 파일 b.txt 생성 (커밋번호 2)

git revert 2 # 새로운 커밋 번호 3이 새로 생성되어 커밋번호 1과 동일한 상태를 가짐으로


```

## git reset / revert

```bash

# 이전 커밋 번호 여섯자리로 되돌려라 (삭제)
git reset <이전 커밋번호 여섯자리>

# <현재 커밋번호 여섯자리> 에서 이전으로 되돌려라 (생성 덮어쓰기)
git revert <현재 커밋번호 여섯자리>

```

## git log

```bash

git log --oneline
git log --graph
git log --since="2 weeks age"
git log --since=2.weeks
git log -3 # -(n) 최근 n 개의  커밋만 조회
git log -p -2 # 최근 2개, --patch: 각 커밋의 diff 결과 조회
git log --stat # 각 커밋의 통계 정보 조회, 어떤 파일 얼마나 많은 파일이 수정됐는지등의 정보 조회

git log --pretty=oneline
git log --pretty=format:"%h - %an, %ar : %s"

# pretty 옵션
# - %H, h : 커밋 해시
# - %T, t : 트리 해시
# - %s : 요약
# - %an, ae, ad, ar : (Author : 원래 작업을 수행한 원작자) 저자 이름, 메일, 시각, 상대적 시각
# - %cn, ce, cd, cr : (Committer : 마지막으로 작업을 적용 저장소에 포함시킨 사람) 커밋한 이 이름, 메일, 시각, 상대적 시각

# --since, --after : 명시한 날짜 이후의 커밋만 조회
# --untile, --before : 명시한 날짜 이전의 커밋한 조회
# --author : 입력한 저자의 커밋만 조회
# --committer : 입력한 커미터의 커밋만 조회
# --grep : 커밋 메시지 안의 텍스트 검색
# --S : 커밋 변경(추가/삭제) 내용에서 텍스트 검색

```

### `git reset` vs. `git restore` : 역할과 철학의 차이

이 두 명령어는 Git 2.23 버전부터 역할이 명확하게 분리되었어. 그 전에는 `git checkout`과 `git reset`이 여러 가지 일을 다 해서 혼란스러웠음.

#### 1. `git reset` : 브랜치의 시간을 되돌리는 타임머신 🚀

*   **핵심 역할:** **`HEAD` 포인터를 옮긴다.** 즉, 브랜치가 가리키는 커밋 자체를 과거로 되돌린다.
*   **요약:** "현재 해시를 지우는 방식" -> 정확히는 `HEAD`를 이전 커밋으로 옮겨서, 최신 커밋이 브랜치 역사에서 보이지 않게(사실상 지워진 것처럼) 만드는 것.
*   **영향 범위:** **커밋 히스토리(역사)**에 직접적인 영향을 준다.
*   **비유:** 만화 주인공이 타임머신을 타고 과거로 돌아가서 미래(최신 커밋)를 없애버리는 것과 같아.
*   **주요 사용처:**
    *   `git reset HEAD~1` : **로컬 커밋 자체를 취소할 때.**

#### 2. `git restore` : 파일을 특정 버전으로 복원하는 복원술사 🪄

*   **핵심 역할:** **파일의 내용을 특정 상태로 되돌린다.** `HEAD` 포인터는 절대 건드리지 않음.
*   **오해의 소지:** "새로운 HEAD 해시를 생성하는 방식" -> **이 부분이 다름** `restore`는 커밋 히스토리를 전혀 바꾸지 않고, 새로운 커밋도, 새로운 해시도 만들지 않고. 다만 파일만 '복원'할 뿐.
*   **영향 범위:** **워킹 디렉토리** 또는 **스테이징 에어리어**의 **파일**에만 영향을 준다.
*   **비유:** 도서관에서 어제 자 신문(`HEAD` 커밋)을 복사해서, 내가 낙서해 놓은 오늘 자 신문(워킹 디렉토리) 위에 덮어쓰는 것과 같아. 도서관의 기록(커밋 히스토리)은 전혀 바뀌지 않듯.
*   **주요 사용처:**
    *   `git restore <file>` : 워킹 디렉토리에서 수정한 파일 내용을 **마지막 커밋 상태로 되돌릴 때.** (수정 내용 폐기)
    *   `git restore --staged <file>` : **`git add` 한 파일을 스테이징 에어리어에서 내릴 때.** (Unstage)

---

### ✨ 한눈에 보는 핵심 정리

| 구분              | `git reset`                               | `git restore`                                                                 |
| :---------------- | :---------------------------------------- | :---------------------------------------------------------------------------- |
| **목표**          | **커밋 히스토리**를 바꾼다 (브랜치 이동)  | **파일 상태**를 되돌린다 (파일 복원)                                          |
| **`HEAD` 포인터** | **움직인다 🚀** (이게 핵심!)               | **움직이지 않는다 不动** (이게 핵심!)                                         |
| **안전성**        | 강력하지만, 히스토리를 바꾸므로 주의 필요 | 파일만 건드리므로 훨씬 안전                                                   |
| **주요 명령어**   | `git reset HEAD~1` (커밋 취소)            | `git restore <file>` (변경 취소) <br> `git restore --staged <file>` (Unstage) |

> **"reset 은 HEAD~1 로 되돌아 가서 현재 해시를 지우는방식이고.. restore 는 되돌리려는 내용으로 새로운 HEAD 해시를 생성하는 방식이 맞는가?.."**

*   **앞부분은 완벽히 맞음!** `reset`은 `HEAD`를 옮겨서 최신 커밋(해시)을 히스토리에서 없애는 방식이야.
*   **뒷부분은 `revert`에 대한 설명에 더 가까워!** 되돌리려는 내용의 **반대 작업을 하는 새로운 커밋(새로운 해시)을 생성**하는 것은 **`git revert`**의 역할이고. `restore`는 커밋을 만들지 않음.

세 가지 역할 `reset`, `restore`, `revert` 의 명확한구분?

*   **`restore` (파일 복원):** 가장 안전. 파일 수정/스테이징을 되돌릴 때.
*   **`reset` (시간 여행):** 로컬 커밋을 되돌릴 때.
*   **`revert` (이력 남기기):** 원격에 올라간 커밋을 안전하게 되돌릴 때.

## 파일 생성(c.txt)후 되돌렸다 복원하는 예시

```bash
echo "ccc" >> c.txt
git add c.txt
git commit -m "Add c.txt file"
git log -3
git revert 07075b # 취소하기, 파일 (c.txt) 삭제
git log -3 --format=oneline
git status

# 특정 커밋 버전 상태로 되돌리기 (파일복원)
git restore --source=07075bf72f4540d3e07463ceb2171a9d7024d6a8 c.txt
```


## git push 취소하기

## 수정된 파일 삭제하기

```bash
git restore 파일명
```

## 파일 삭제

```bash

# 로컬, 원격 저장소 모든 파일이 삭제됨
git rm <fileName>

# 커밋후 원격저장소만 해당 파일 삭제시
git rm <filenName> --cached

```
