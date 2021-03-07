#!/bin/ash
PS1='[\u@\h \W]\$ '

# alias define

# for ls
alias ls='ls --color=auto'
alias ll='ls -la'
alias l.='ls -d .* --color=auto'

# for grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# for mount
alias mount='mount |column -t'

# firewall for typo
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias rm='rm --preserve-root'
