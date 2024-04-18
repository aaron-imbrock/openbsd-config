# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
## ALIASES 

# User specific environment and startup programs
alias students='cd ~/src/codefellows/401-python/students'
alias pin='python3 -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt'
alias info='info --vi-keys'
alias ll='ls -lah'
alias 301='cd /home/aimbrock/src/Codefellows/301/301d98'
alias dsa='cd /home/aimbrock/src/Codefellows/301/data-structures-and-algorithms'
alias wireguard_down='nmcli connection down wireguard'
alias wireguard_up='nmcli connection up wireguard'


# https://github.com/magicmonty/bash-git-prompt
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

## EXPORTS

#export TZ=/usr/share/zoneinfo/US/Pacific

## GO Path
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin/

## Brew

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

## PyCharm

export PATH=$PATH:/home/aimbrock/bin/pycharm/pycharm-2023.1.4/bin

## FUNCTIONS

nagme () {
    [ "$#" -ne 2 ] && printf "usage: $0 [in_minutes] [text]\n" && return 1
    printf "sleeping $1 min before telling you to $2\n"
    sleep $(echo $1\*60|bc)
    espeak "$2" > /dev/null 2>&1
    while :
    do
        sleep 30
        echo -n '.'
        espeak "I'm nagging you to $2" > /dev/null 2>&1
    done
}


# Created by `pipx` on 2024-02-12 05:19:41
export PATH="$PATH:/home/aimbrock/.local/bin"
alias venv='python3 -m venv .venv; source .venv/bin/activate'
