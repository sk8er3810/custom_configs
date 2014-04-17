
#echo "Running .bashrc"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Alias definitions
# #################
[ -f ~/.bash_aliases ] && source ~/.bash_aliases


# Environment Variables
# #####################

export EDITOR=vim

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes

    case "$TERM" in
    xterm*|rxvt*) 
    # vim-nox needs the $TERM env variable to be xterm-256color
    # in order to correctly perform syntax highlighting
        export TERM=xterm-256color
        ;;
    *)
        ;;
    esac
    else
	color_prompt=
    fi
fi


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
else
  source ~/.scripts/git-completion.bash
fi

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

# History Options
# ###############

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
#export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:?:??:???'
export HISTIGNORE=$'[ \t]*:&'

# Don't put duplicate lines in the history.
# ignoredups and ignorespace
export HISTCONTROL="ignoreboth:erasedups"

# double the size of the command history
# average ~ 200 unique commands per day (9000 is good for ~ 4 months)
HISTSIZE=18000
#export HISTSIZE=2048
unset HISTFILESIZE
#export HISTFILESIZE=4096
# remember 2 lines per command (<cmd>\n<timeEpoch>)
export HISTTIMEFORMAT='%F %T '

# keep all bash history but only load last 20,000 commands
#~/.scripts/bash_history_archive.sh


# Shortcut for terminal colors for PS1
[ -f ~/.bash_colors ] && source ~/.bash_colors

LDELIM="["
RDELIM="]"
function prompt_command {
  # Whenever displaying the prompt, write the previous line to disk
  history -a

  # save the current git branch if within a git repo
  SCM_BRANCH=$(__git_ps1 "git:%s" 2> /dev/null)
  #if [ -z $SCM_BRANCH ]; then # maybe we are in a hg repo
      #SCM_BRANCH=`hg prompt "{[+{incoming|count}]-->}{root|basename}{/{branch}}:{rev}{-->[+{outgoing|count}]}{ at {bookmark}}{status}" 2> /dev/null`
  #fi
  TIME=$(date +%R)

  # Find the width of the prompt:
  TERMWIDTH=${COLUMNS}

  # Add all the accessories below ...
  #local tempPS1="-(${USER}@${HOSTNAME})-${SCM_BRANCH}-(${PWD})-"
  local tempPS1="-${LDELIM}${USER}@${HOSTNAME}${RDELIM}-${LDELIM}${PWD}${RDELIM}-${LDELIM}${SCM_BRANCH}${RDELIM}-${TIME}"
  fill=""
  # how much more do we need to fill
  let fillsize=${TERMWIDTH}-${#tempPS1}-2
  if [ "$fillsize" -gt "0" ]; then
    eval printf -v fill '%.0s-' {1..$fillsize}
    newPWD="${PWD}"
  elif [ "$fillsize" -le "0" ]; then
    fill=""
    let cut=3-${fillsize}
    newPWD="...${PWD:${cut}}"
  fi

case "$TERM" in xterm*|rxvt*)
    echo -ne "\033]0;${USER}@${HOSTNAME}: ${newPWD}\007"
    ;;
*)
    ;;
esac
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

function path
{
    local IFS=: ;
    printf "%s\n" $PATH;
}

function pathmunge () {
if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
    if [ "$2" = "after" ] ; then
        PATH=$PATH:$1
    else
        PATH=$1:$PATH
    fi
fi
}

pathmunge ${HOME}/bin
t2cc_path=~/.scripts/t2cc/
if [ "$(uname -s)" = 'Darwin' ]; then
  export ANDROID_HOME=$HOME/SDKs/google/android/adt-bundle-mac-x86_64/sdk
  t2cc=$t2cc_path/t2cc_osx
  # macport paths
  pathmunge /opt/local/bin
  pathmunge /opt/local/sbin
  # Development paths
#  PATH=$PATH:/Volumes/CyanogenMod/bin
  pathmunge /Developer/usr/bin
elif [ "$OSTYPE" = 'cygwin' ]; then
#  export ANDROID_HOME=$HOME/SDKs/google/android/adt-bundle-mac-x86_64/sdk
  t2cc=$t2cc_path/t2cc_win64.exe
elif [ "$OSTYPE" = 'linux-gnu' ]; then
#  export ANDROID_HOME=$HOME/SDKs/google/android/adt-bundle-linux-x86_64/sdk
  if [ `uname -m` =  "x86_64" ]; then
    t2cc=$t2cc_path/t2cc_64
  else
    t2cc=$t2cc_path/t2cc_32
  fi
fi
if [ $ANDROID_HOME ]  && [ -f $ANDROID_HOME/platform-tools/adb ]; then
  pathmunge $ANDROID_HOME/platform-tools
  pathmunge $ANDROID_HOME/tools
fi

hcolor="\[\e[`$t2cc $HOSTNAME `m\]"
# Set my prompt variable
# example output
# -[mdeschu@debian6dms]-[git:master]-[/home/mdeschu]---------------------------------------
export PS1="-${LDELIM}${txtgrn}\u${txtrst}@${hcolor}${HOSTNAME}${txtrst}${RDELIM}\
-${LDELIM}\${SCM_BRANCH}${RDELIM}-${LDELIM}${bldblu}\${newPWD}${txtrst}${RDELIM}\${fill}-\${TIME}-\n\
$ "

# why shouldn't this be here
export PS4='+[$(basename $0).$LINENO]> '

export JAVA_HOME=/usr/lib/jvm/java-6-sun/
export NODE_PATH=/usr/local/lib:/usr/local/lib/node_modules

# include .bashrc_work if it exists any sensitive info must go in .bashrc_work
if [ -f "$HOME/.bashrc_work" ]; then
    . "$HOME/.bashrc_work"
fi

