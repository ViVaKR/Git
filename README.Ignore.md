# Gitignore

## 규칙

`.env` : 확장자가 .env 인 모든 파일을 무시
`dist/` : dist 폴더의 모든 파일을 무시
`ignore_folder/*.txt` : 해당 폴더에서 확장자 .txt 인 모든 파일을 무시, 하위 폴더는 해당 없음
`ignore_folder/**/*.sec` : 해당 폴더 포함한 하위 폴더 포함 확장자가 .sec 인 모든 파일을 무시
`/*.asm` : 현재 폴더에서만 확장자 .asm 인 모든 파일 무시
`!public.asm` : 무시하는 모든 파일 확장자 .asm 중에서 public.asm 파일은 무시 하지 않음
`/modules` : 현재 폴더 중에서 'modules' 폴더에 있는 모든 파일 무시
`modules/` : 프로젝트의 모든 폴더 중 'modules' 라는 폴더명의 하위 파일은 모두 무시

```bash

# 전역 설정
git config --global core.excludesfile <filepath> 형식

```

```bash
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
```

## 커밋 취소 하기

```bash

# git add . 한 것 취소
git reset HEAD <파일명> # 특정 <파일명> 파일을 스테이지에서 제거 또는 모든 파일을 스테이지에서 제거 이때 <파일명> 은 생략

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
