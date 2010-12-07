# .bashrc file

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Alias definitions
# #################
[ -f ~/.bash_aliases ] && source ~/.bash_aliases


# Environment Variables
# #####################

export EDITOR=vim

# TMP and TEMP are defined in the Windows environment.  Leaving
# them set to the default Windows temporary directory can have
# unexpected consequences.
unset TMP
unset TEMP

# Alternatively, set them to the Cygwin temporary directory
# or to any other tmp directory of your choice
export TMP=/tmp
export TEMP=/tmp

# Or use TMPDIR instead
export TMPDIR=/tmp

export PATH=$PATH:"/cygdrive/c/Program Files (x86)/Notepad++";


# Shell Options
# #############

# Don't wait for job termination notification
set -o notify

# Don't use ^D to exit
# set -o ignoreeof

# if arg to cd is not a directory, use the name of a variable 
# whose value is the directory 
shopt -s cdable_vars

# filenames beginning with '.' are included in file globbing
shopt -s dotglob

# Use case-insensitive filename globbing
shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# Completion options
# ##################

# These completion tuning parameters change the default behavior of bash_completion:

# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1

# If this shell is interactive, turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# case $- in
#   *i*) [ -f /etc/bash_completion ] && . /etc/bash_completion ;;
# esac


# History Options
# ###############

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls'

# Don't put duplicate lines in the history.
# ignoredups and ignorespace
export HISTCONTROL="ignoreboth"

# double the size of the command history
export HISTSIZE=2048
export HISTFILESIZE=4096
export HISTTIMEFORMAT='%F %T '

# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a"

# Shortcut for terminal colors for PS1
[ -f ~/.bash_colors ] && source ~/.bash_colors

# Set my prompt variable
PS1="${txtgrn}\u@\h${txtrst} "

# display the git branch in the prompt if possible
[ -f ~/.scripts/mygitcompletion.bash ] && source ~/.scripts/mygitcompletion.bash
[ "`type -t __git_ps1`" == "function" ] && PS1="${PS1}\$(__git_ps1 \"[git:%s]\")"

PS1=${PS1}":${txtgry}\w${txtrst}\n\$ "
export PS1

