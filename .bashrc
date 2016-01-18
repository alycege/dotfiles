# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Change the prompt to something that I like
# Replace 0 with 1 for dark color
# Black 0;30 - Blue 0;34 - Green 0;32 - Cyan 0;36 - Red 0;31
# Purple 0;35 - Brown 0;33
#PS1='\[\e[36m\]\u@\h \W $ \[\e[0m\]'
green=$(tput setaf 2)
reset=$(tput sgr0)
PS1='\[$green\]\u@\h \W $ \[$reset\]'
export PS1

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Sets the Mail Environment variable
MAIL=/var/spool/mail/alex
export MAIL

# User specific aliases and functions
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ll='ls -alhF'
alias tree='tree -Ch'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias wget='wget -c'

