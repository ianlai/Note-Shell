# Git

## #刪除目前的unstage

| 語法                | 目的                                                          | 例子 |
| ------------------- | ------------------------------------------------------------- | ---- |
| `git checkout -- .` | 刪掉本來有 track 的檔案修改（有一個點）                       |
| `git clean -ifd`    | 刪掉本來 untrack 的檔案修改 -i(interactive) -f(force) -d(dir) |

## #暫存目前的unstage
| 語法                      | 目的                | 例子               |
| ------------------------- | ------------------- | ------------------ |
| `git stash `              | 暫存目前的unstage   |
| `git stash list`          | 查看目前的stash     |
| `git stash apply`         | 恢復stash中最上層的 |
| `git stash drop [number]` | 查看目前的stash     | `git stash drop 0` |

## #從Remote取得code
| 語法                      | 目的                | 例子               |
| ------------------------- | ------------------- | ------------------ |
| `git fetch -p `              | 更新遠端的資訊到本地 -p(prune) 遠端刪掉的才會在本地也刪掉 不會動到任何本地branch  |
| `git fetch origin pull/ID/head:BRANCHNAME`          | 取得PR     |`git fetch origin pull/2/head:PRICE-345` |
| `git checkout <remote>/<rbranch>`         | 暫時跳到遠端的某分支上 進入detach mode 但不能commit回去| `git checkout origin/PRICE-345`|
| `git pull <remote> <rbranch>` | 直接把遠端某分支merge到當前branch上 可能會conflict     | `git pull origin PRICE-345` |


## #Git Reset ＆ Git Checkout
| 語法                      | 目的                | 例子               |
| ------------------------- | ------------------- | ------------------ |
| `git reset --hard` | 同時改變HEAD和目前branch的位置。可以用 HEAD~ 或是 commit ID 都可以 可以往前跳 也可以往後跳|
| `git checkout`     | 不改變目前branch，只把HEAD暫時跳到別的位置，會進入 detach mode |

## #操縱遠端的branch
| 語法                      | 目的                | 例子               |
| ------------------------- | ------------------- | ------------------ |
| `git push origin :<rbranch>` | 把遠端的branch刪掉 因為意義上其實是推一個空的過去|

## #查看單一狀態
| 語法                      | 目的                | 例子               |
| ------------------------- | ------------------- | ------------------ |
| `git log <commit>` | 查看該commit包含的全部commit 
| `git show <commit>` | 查看該commit本身
| `git log <branch> --oneline --grep <string>`  | 查看title含有某string的commit已經進去某branch了沒 |`git log staging --oneline --grep "PRICE-345"`

## #查看兩個狀態的差異
| 語法                      | 目的                | 例子               |
| ------------------------- | ------------------- | ------------------ |
| `git log <commit-1>..<commit-2> --oneline`              | 只要看有哪些commit |
| `git diff <commit-1>..<commit-2> -- <file>`              | 要看檔案有哪些變化 | `git diff develop..staging -- internal/data/migrations/`

## #Tag相關
| 語法                      | 目的                  | 例子               |
| -------------------------- | ------------------- | ------------------ |
| `git tag `                 | Show tags (local)         |
| `git ls-remote --tags origin` | Show tags (remote)     |
| `git tag <tag>`            | Tag at the current commit (local)   |
| `git tag -D <tag> `        | Remove a tag (local)      |
| `git push --tags`          | Push the tag (remote)     |
| `git push origin :<tag>`   | Remove a tag (remote)     | `git push origin :v1.0.0` |

## #Git Config ＆ Git Alias
| 語法                      | 目的                | 例子               |
| ------------------------- | ------------------- | ------------------ |
| `git config --local --list `                 | 顯示local的設定 |
| `git alias`            | Tag at the current commit (local)   |
| `git config --local --add alias.<alias> "<action>"`        | 設定alias: git dev | `git config --local --add alias.dev "checkout develop"`
| `git config --global --unset-all <key>`          | 把設定刪掉 因為key可能重複 所以all是必要的  | `git config --global --unset-all user.name`


## #Multiple account 
- 如果有兩個帳號 需要提供兩組key給GitHub (才可以兩邊都登入)
- 確認可以用兩組key來登入ssh (無法登入但GitHub會顯示是否通過認證)
  - `ssh git@github.com`
- 決定哪個domain name要使用哪組key或是要取什麼別名的設定檔在`~/.ssh/config`
- 最後還要設定以下欄位
  
| 步驟                      | 目的                | 例子               |
| ------------------------- | ------------------- | ------------------ |
| 設定`remote.origin.url`    | 上傳位置   | `remote.origin.url=git@github.com:ianlai/Note-Python.git`
| 設定`user.name`            | 上傳name  | 
| 設定`user.email`           | 上傳email |


## #Git hook
- 事前或事後檢查的 pre- / post- conditions
- https://yodalee.blogspot.com/2016/12/git-hook-unittest.html