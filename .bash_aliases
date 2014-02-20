# ~/.bash_aliases

if [ "$(uname -s)" = "Cygwin" ]; then
  alias np='c:/Program Files (x86)/Notepad++/notepad++.exe'
fi

if [ "$(uname -s)" = "Darwin" ]; then
  alias ls='ls -G'
else
  alias dir='ls --color=auto --format=vertical'
  alias vdir='ls --color=auto --format=long'
  alias ls='ls --color=auto --ignore="NTUSER*"'
fi
    
alias grep='grep --color=auto'

# Aliases
# #######

# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
# alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias dh='du -h'

alias ds='du -s'
alias dsh='du -sh'

# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour

# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

alias backup_vms='time rsync -arvv Documents/Virtual\ Machines.localized/ /Volumes/G\ Drive/VM\ Backups/'
