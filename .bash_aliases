alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

alias homestead-up='cd ~/Homestead && vagrant up'
alias homestead-down='cd ~/Homestead && vagrant halt'
alias homestead-ssh='cd ~/Homestead && vagrant ssh'

alias et='firejail ~/Documents/et/et-sdl-sound'

alias ll='ls -la --color=auto --human-readable'
alias lt='ls --human-readable --size -1 -S --classify --color=auto'
alias ..='cd ..'
alias c='clear'

alias grep='grep --color=auto'
alias open="xdg-open"

alias left='ls -t -1 --color=auto'
alias count='find . -type f | wc -l'
alias cpv='rsync -ah --info=progress2'
alias mountls='mount | grep -E ^/dev | column -t'

alias update='sudo apt update && sudo apt list --upgradable'
alias upgrade='sudo apt upgrade -y'

alias gh='history|grep'

alias ports='netstat -tulanp'

if [ -f ~/.bash_aliases_private ]; then
    . ~/.bash_aliases_private
fi
