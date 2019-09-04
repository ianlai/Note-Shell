# Git

### 刪除目前的unstage

| 語法                | 目的                                                          | 例子 |
| ------------------- | ------------------------------------------------------------- | ---- |
| `git checkout -- .` | 刪掉本來有 track 的檔案修改（有一個點）                       |
| `git clean -ifd`    | 刪掉本來 untrack 的檔案修改 -i(interactive) -f(force) -d(dir) |

### 暫存目前的unstage
| 語法                      | 目的                | 例子               |
| ------------------------- | ------------------- | ------------------ |
| `git stash `              | 暫存目前的unstage   |
| `git stash list`          | 查看目前的stash     |
| `git stash apply`         | 恢復stash中最上層的 |
| `git stash drop [number]` | 查看目前的stash     | `git stash drop 0` |

### 取得 PR
- `git fetch origin pull/ID/head:BRANCHNAME`
  `ex. git fetch origin pull/2/head:PRICE-345`

### git fetch
- `git fetch -p` //更新 (遠端刪除的 branch 才會反應回 local)

### command merge

- git checkout [branch]
- git checkout origin/[remote-branch] //head 會跳上去 變成 detached mode 但不能 commit 回去
- git pull origin [remote-feature-branch] //will try to merge in this step so you can know any conflict happens



### git reset vs git checkout

- git reset --hard 可以把 HEAD 帶到各處 可以用 HEAD~ 或是 commit ID 等等都可以 可以往前跳 也可以往後跳
- git checkout 是不改變 HEAD 暫時的跳到別的 commit 所以會進入 detach mode

### git alias

- git alias
- git config --local --add alias.ck "checkout"

### git hook

- 事前或事後檢查的 pre- / post- conditions
- https://yodalee.blogspot.com/2016/12/git-hook-unittest.html[NMC] Implement consumer API and test code -- (2) /gift-options [GET]

### 查看某個檔案在兩個 branch 間的差異

- git diff develop..staging -- internal/data/migrations/

### 查看某個 branch 裡面有沒有某個字串的 commit

- ex. 查看 PRICE-912 已經進去 staging 了沒
- git log staging --oneline --grep "PRICE-912"

git log <commit id>
git show <commit id>

### 刪除遠端的 branch

- `git push origin :serverfix` //把遠端的 serverfix branch 刪掉 因為意義上其實是推一個空的過去

### Tag

- `git tag`
- `git tag v1.0.0`
- `git push --tags`
