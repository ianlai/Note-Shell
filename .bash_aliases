alias c='clear'
alias ll='ls -l'
alias hg='history | grep'
alias myip='ifconfig | grep inet | grep -v inet6'
alias restart='sudo shutdown now -r'

alias cdvm='cd ~/vmsandbox/ubuntu14'
alias vssh='cd ~/vmsandbox/ubuntu14; vagrant ssh'

alias sshian='ssh -X ian@192.168.1.2'
alias sshlocal='ssh -p 1250 -X ian@localhost'

#With Arguments 
alias cgrep='function _dummy(){ find . -name "*.c" | xargs grep $1 --color=ALWAYS;};_dummy'
alias hgrep='function _dummy(){ find . -name "*.h" | xargs grep $1 --color=ALWAYS;};_dummy'
alias aaa='function _aaa(){ echo "First: $1"; echo "Second: $2"; };_aaa'


