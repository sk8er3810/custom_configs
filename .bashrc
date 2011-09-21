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
# set them to the Cygwin temporary directory
export TMP=/tmp
export TEMP=/tmp

# Or use TMPDIR instead
export TMPDIR=/tmp


# Shell Options
# #############

# Don't wait for job termination notification
set -o notify

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

# Check for that we haven't already sourced completion.
# Any completions you add in ~/.bash_completion are sourced last.
if [ -z "$BASH_COMPLETION" ] && [ -f /etc/bash_completion ]; then
  source /etc/bash_completion 
fi


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
HISTSIZE=20000
#export HISTSIZE=2048
unset HISTFILESIZE
#export HISTFILESIZE=4096
export HISTTIMEFORMAT='%F %T '

~/.scripts/bash_history_archive.sh


# Shortcut for terminal colors for PS1
[ -f ~/.bash_colors ] && source ~/.bash_colors

function prompt_command {
  # Whenever displaying the prompt, write the previous line to disk
  history -a

  # save the current git branch if within a git repo
  SCM_BRANCH=$(__git_ps1 "(git:%s)" 2> /dev/null)

  # Find the width of the prompt:
  TERMWIDTH=${COLUMNS}

  # Add all the accessories below ...
  local tempPS1="-(${USER}@${HOSTNAME})-${SCM_BRANCH}-(${PWD})-"
  fill=""
  # how much more do we need to fill
  let fillsize=${TERMWIDTH}-${#tempPS1}-2
  if [ "$fillsize" -gt "0" ]; then
    while [ $fillsize -gt "0" ]; do
      fill="${fill}-"
      let fillsize=${fillsize}-1
    done
    newPWD="${PWD}"
  elif [ "$fillsize" -le "0" ]; then
    fill=""
    let cut=3-${fillsize}
    newPWD="...${PWD:${cut}}"
  fi
}

PROMPT_COMMAND="prompt_command"

case $HOSTNAME in
  jarule)
    hcolor=${txtred} ;;
  mikebook)
    hcolor=${txtgry} ;;
  *)
    hcolor=${txtpur} ;;
esac

# Set my prompt variable
export PS1="-(${txtgrn}\u${txtrst}@${hcolor}\h${txtrst})\
-\${SCM_BRANCH}-\${fill}-(${bldblu}\${newPWD}${txtrst})-\n\
$ "

function path
{
    local IFS=: ;
    printf "%s\n" $PATH;
}

if [ "$OSTYPE" = 'darwin' ]; then
  PATH="$PATH:/Library/Developer/android-sdk-mac_x86/platform-tools"
elif [ "$OSTYPE" = 'cygwin' ]; then
  PATH="$PATH:/cygdrive/c/tools/android-sdk-windows/platform-tools"
elif [ "$OSTYPE" = 'linux-gnu' ]; then
  PATH="$PATH:/tools/android-sdk-linux/platform-tools"
fi

