# Git

## #刪除目前的unstage

| 語法                | 目的                                                          | 例子 |
| ------------------- | ------------------------------------------------------------- | ---- |
| `git checkout -- .` | 刪掉本來有 track 的檔案修改（有一個點）                       |
| `git clean -ifd`    | 刪掉本來 untrack 的檔案修改 -i(interactive) -f(force) -d(dir) |

## #Merge & Rebase
| 語法                      | 目的                | 例子               |
| ------------------------- | ------------------- | ------------------ |
| `[STG] git merge origin/develop --no-ff`              | 從base的staging上面merge遠端的develop過來，並且強制產生一個merge commit |
| `[FEATURE] git rebase origin/develop` | 更新讓自己正在開發的feature可以有新的feature，也能早點解conflict|

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
| `git log <commit-1>..<commit-2> --oneline --no-merges`              | 看兩點相差哪些commit |
| `git diff <commit-1>..<commit-2> -- <file>`              | 看兩點的所有差異檔案有哪些變化 | `git diff develop..staging -- internal/data/migrations/`
| `git diff --name-status <commit-1>..<commit-2> -- <file>`              | 看兩點的所有檔案差異 | `git diff --name-only origin/staging..develop -- internal/data/migrations`

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
- 決定哪個domain name要使用哪組key或是要取什麼別名的設定檔在`~/.ssh/config`，假設設定如下：

```
# githubPersonal
Host ianlai.com
   HostName github.com
   User git
   IdentityFile ~/.ssh/id_rsa_personal

# githubWork
Host work
   HostName github.com
   User git
   IdentityFile ~/.ssh/id_rsa 
```

此設定代表
`ssh git@ianlai.com` 會使用id_rsa_personal來連線。
`ssh git@work` 會使用id_rsa來連線。
因此可以確認用前面製作的兩組key來登入ssh是否會成功 (無法登入但GitHub會顯示是否通過認證)
 
- 設定local參數
  
| 步驟                      | 目的                | 例子               |
| ------------------------- | ------------------- | ------------------ |
| 設定`remote.origin.url`    | 上傳位置   | `remote.origin.url=git@github.com:ianlai/Note-Python.git`
| 設定`user.name`            | 上傳name  | 
| 設定`user.email`           | 上傳email |

user.name和user.email只是影響到commit顯示的訊息，關鍵在於remote url。
設定user.name: 

git config --local --add user.name [Ian]       //隨意 

git config --local --add user.email [my-email] //隨意 

- 設定Remote URL 

`git remote add origin git@ianlai.com:ianlai/redux-todo-app.git`  //決定要連到哪一個repo，以及要用哪一個帳號連 

使用`git remote -v` 來查看當前repo使用哪一個帳號。

假設顯示如下，使用`https`，這代表使用的是default帳號，也就是work。
origin	https://github.com/ianlai/react-todo-app.git (fetch)
origin	https://github.com/ianlai/react-todo-app.git (push)

要修改成如下，才會使用personal

origin	git@ianlai.com:ianlai/react-todo-app.git (fetch)
origin	git@ianlai.com:ianlai/react-todo-app.git (push)

git remote set-url origin `git@ianlai.com:ianlai/react-todo-app.git`

## #Git hook
- 事前或事後檢查的 pre- / post- conditions
- https://yodalee.blogspot.com/2016/12/git-hook-unittest.html

## 使用外部的工具產生Repo
- 刪除第一個Commit (可能不是自己想要的) 
`git update-ref -d HEAD`

## #Git Flow (工作流程) 
- Master (PROD) <- Staging (STG) <- Develop <- Feature <- Subtask
- Jira的story對應到Feature; Jira的subtask則對應到Subtask
- Feature merge進Develop的時候可以使用Squash merge，比較好追蹤有哪些Feature要release 
- Develop進到Staging或Staging進到Master則是使用一般的merge，確保每一個Feature還是可見的
- Merge進一層的時候，最好是使用PR，而不要使用local merge，否則會失去merge的資訊
- 同理，merge時盡量不要使用Fast Forwarding，也就是要產生merge commit比較好追蹤，否則可能會找不到哪一天merge的
  -  [staging] git merge origin/develop --no-ff
  -  不過這樣有一個缺點是merge之後兩個branch也不會完全同步，會差一個commit (merge commit)，會比較亂
- 在Staging合併到Master之後，會在Master上建立tag，並且推到github上，這就是我們下次要發佈的版本
- Hotfix用在需要直接對Master修改的時候，做法是直接從Master fork出一個分支，叫做Hotfix-xxxx
  - 修完並且測完之後，就直接合併回Master，當然也要把該Hotfix一起合併回Staging和Develop
