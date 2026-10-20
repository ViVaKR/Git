# Git 원격 저장소 주소 오타 수정 (remote URL fix)

저장소 이름이나 주소가 잘못 등록되어 있을 때(예: `doctor` → `dockor`) 고치는 방법.

## 증상

푸시는 되는데 이런 메시지가 나온다.

```
remote: This repository moved. Please use the new location:
remote:   https://github.com/ViVaKR/nginx-conf-doctor.git
To https://github.com/ViVaKR/nginx-conf-dockor.git
```

GitHub가 옛 주소를 새 주소로 리디렉션해주고 있다는 뜻이다. 지금은 되지만, 나중에 막힐 수 있으니 고쳐두자.

## 1. 현재 주소 확인

```bash
git remote -v
```

```
origin  https://github.com/ViVaKR/nginx-conf-dockor.git (fetch)
origin  https://github.com/ViVaKR/nginx-conf-dockor.git (push)
```

## 2. 주소 수정

```bash
git remote set-url origin https://github.com/ViVaKR/nginx-conf-doctor.git
```

SSH 방식을 쓰고 있다면 이렇게 한다.

```bash
git remote set-url origin git@github.com:ViVaKR/nginx-conf-doctor.git
```

## 3. 확인

```bash
git remote -v        # 바뀐 주소 확인
git push             # "repository moved" 메시지가 없으면 성공
```

## 4. 같은 오타가 다른 곳에도 있는지 수색

```bash
grep -rn "dockor" . --exclude-dir=node_modules --exclude-dir=.git
```

아무것도 안 나오면 깨끗하다. 확인할 만한 곳은 `package.json`(`repository`, `homepage`, `bugs`), README의 링크, 다른 폴더에 clone해 둔 같은 저장소의 `origin`이다.

## 참고: 자주 쓰는 remote 명령어

| 하고 싶은 일 | 명령어 |
|--------------|--------|
| 주소 보기 | `git remote -v` |
| 주소 바꾸기 | `git remote set-url origin <새 주소>` |
| 이름 바꾸기 | `git remote rename origin upstream` |
| 새 remote 추가 | `git remote add <이름> <주소>` |
| remote 삭제 | `git remote remove <이름>` |
| 자세한 정보 | `git remote show origin` |

## 핵심 정리

- 주소는 `.git/config`에 저장되는 **로컬 설정**이라 스크립트(`.sh`)를 고칠 필요가 없다.
- 한 번 고치면 그 폴더에서는 계속 유효하다.
- clone을 여러 곳에 해뒀다면 **각 폴더마다** 한 번씩 고쳐야 한다.
