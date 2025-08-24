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
# 커밋 기록 자체를 말소
# 꺽쇠 수만큼 이전으로 돌아감
# ^: 한단계, ^^: 두단계, ~3: 세단계 즉 숫자로도 가능함.

# git reset 옵션
# soft : 파일 보존, add 한 상태 + staged 상태
# mixed : 파일 보존, add 하기 전 + unstaged 상태
# hard : 파일 삭제, add 하기 전 + unstaged 상태, 모두 취소 작업내용 모두 다 사라짐으로 위험함.


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
