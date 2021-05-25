alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

alias homestead-up='cd ~/Homestead && vagrant up && cd -'
alias homestead-down='cd ~/Homestead && vagrant halt && cd -'
alias homestead-ssh='cd ~/Homestead && vagrant ssh && cd -'

alias et='firejail ~/Documents/et/et-sdl-sound +connect clan-etc.de'

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

alias kbfix='echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode && echo 0 | sudo tee /sys/module/hid_apple/parameters/swap_opt_cmd'

if [ -f ~/.bash_aliases_private ]; then
    . ~/.bash_aliases_private
fi

startup() {
	echo "Running startup..."
	kbfix
	vpn-connect
	update
}
