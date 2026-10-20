# Note

## 팁
**실수했을 때**
- `git restore 파일명`: 아직 커밋 안 한 수정을 버리고 마지막 커밋 상태로 되돌림.
- `git restore --staged 파일명`: `add`한 걸 취소해라.
- `git reflog`: 잘못 지웠거나 `--amend`, `reset`으로 날린 커밋도 여기서 찾아서 살릴 수 있어. 안전망 같은 명령.

**작업 중에 끼어든 일이 생겼을 때**
- `git stash`: 하던 걸 잠깐 서랍에 넣어 두고, 끝나면 `git stash pop`으로 꺼내.

**히스토리 볼 때**
- `git log --oneline --graph`: 커밋을 한 줄씩 깔끔하게 보여 줘.
- `git diff`: 커밋 전에 뭘 바꿨는지 확인해.
- `git blame 파일명`: 각 줄을 누가 언제 바꿨는지 보여 줘. 혼자 개발해도 "이거 왜 이렇게 했지?" 할 때 유용함.

**실험해 볼 때**
- `git switch -c 새기능`: 브랜치를 만들어서 실험하고, 마음에 안 들면 그냥 버리면 돼. 혼자 개발해도 큰 기능은 브랜치에서 하면 마음이 편함.

그중에서도 `reflog`는 알아 두면 "앗, 지웠다!" 싶을 때 구해 주는 명령. 처음엔 이름이 낯설지만, 한 번 쓰면 그 맛을 알게 됨.


```bash
git config --global core.excludesfile ~/.gitignore_global
```

---

### 👑 M4 턱시도 콕핏을 위한 5대 추천 설정 (초강력 추천!)

#### 1. `push.autoSetupRemote` (Git의 잔소리 영구 박멸!)

새 브랜치를 만들고 `git push`를 치면, 멍청한 Git이 항상 이렇게 투덜대죠:
> *"치명적 오류: 현재 브랜치에 업스트림이 없습니다. `git push --set-upstream origin 새브랜치` 를 치세요!"*

이 잔소리를 영원히 박멸하고, 새 브랜치도 그냥 **`git push`** 한마디로 자동 등록해서 쏴주는 기적의 옵션입니다.
```bash
git config --global push.autoSetupRemote true
```

---

#### 2. `rerere.enabled` (충돌 해결 자동 기억 장치 - 전설의 기능!)

* **Re**use **Re**corded **Re**solution의 약자입니다.
* 브랜치를 합치거나 리베이스(`rebase`)할 때 코드 충돌(Conflict)이 나면, 내가 한번 해결한 방식을 Git이 똑똑하게 뇌에 저장해 둡니다.
* 나중에 똑같은 충돌이 또 발생하면 **Git이 알아서 "아, 지난번에 이렇게 해결했지?" 하고 자동으로 충돌을 풀어줍니다!**

```bash
git config --global rerere.enabled true
```

---

#### 3. `diff.algorithm = histogram` (차세대 코드 비교 엔진)
* 기본 Git의 diff 알고리즘은 1980년대 방식이라, 코드를 리팩토링하거나 함수를 위아래로 옮기면 줄 바꿈이 엉망으로 꼬여서 보입니다.
* **`histogram`** 알고리즘을 켜면, 함수 단위와 블록 단위로 코드를 추적해서 **사람 눈에 가장 직관적이고 편안한 차세대 diff**를 띄워줍니다.
```bash
git config --global diff.algorithm histogram
```

---

#### 4. `branch.sort = -committerdate` (최근 작업 브랜치 우선 정렬)
* `git branch`를 쳤을 때, 답답하게 가나다(A-Z) 순으로 정렬하지 않고 **"내가 방금 전까지 작업했던 가장 최신 브랜치"를 맨 위에 똭!** 띄워줍니다.
```bash
git config --global branch.sort -committerdate
```

---

#### 5. `fetch.prune` (유령 브랜치 자동 청소기)
* 깃허브 웹에서 작업 끝내고 삭제(Delete)한 브랜치들이 내 맥북에는 유령처럼 찌꺼기로 남아있는 현상을 막아줍니다.
* `git fetch`나 `git pull`을 할 때마다 이미 원격에서 사라진 유령 브랜치를 로컬에서도 알아서 깨끗하게 지워줍니다.
```bash
git config --global fetch.prune true
```

---

### 🎁 보너스: 인생을 구원하는 알짜배기 Alias(별칭) 2종

터미널에서 실수했을 때 1초 만에 시간을 되돌리는 마법의 주문입니다:

```bash
# 1. 방금 커밋을 취소하고 작업 내용은 그대로 살려두기 (실수로 커밋 눌렀을 때!)
git config --global alias.undo "reset --soft HEAD~1"

# 2. 커밋 메시지는 그대로 두고, 깜빡하고 빠뜨린 파일만 방금 커밋에 슥 끼워 넣기!
git config --global alias.amend "commit --amend --no-edit"
```

---

### ⚡ 3초 만에 한 방에 밀어 넣는 종합 선물 세트!

```bash
git config --global core.excludesfile ~/.gitignore_global
git config --global push.autoSetupRemote true
git config --global rerere.enabled true
git config --global diff.algorithm histogram
git config --global branch.sort -committerdate
git config --global fetch.prune true
git config --global alias.undo "reset --soft HEAD~1"
git config --global alias.amend "commit --amend --no-edit"
```

--

## Remote

```bash
    git remote
    git remote -v
    $ git remote add origin git@github.com:ViVaKR/Git.git
    $ git remote show origin
    $ git push 리모트저장소이름 브랜치이름
    $ git config
    $ git pull
    $ git add .
    $ git rebase --continue
    $ git commit -m "rebase file"
    $ git push
    $ git config --global pull.rebase true
    $ git config --global --unset core.excludesfile
    $ git config --global --edit
    $ git log --oneline --decorate
    $ git branch testing
    $ git checkout testing
```
