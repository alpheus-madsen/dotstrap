# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	"xterm-color" | "xterm-256color")    color_prompt=yes;;
esac

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
    else
	color_prompt=
    fi
fi

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

# Alternatives to PS1, in a clumsy attempt to turn on and
# off certain information.
#
# They can be "activated" via
# ```bash
#    # To remove the Date/Time from prompt
#    export PS1=$PS1_TIMELESS
#
#    # To restore PS1 to the "full" prompt
#    export PS1=$PS1_FULL
# ```
### Color Prompts!
PS1_FULL="cd \[\e[1;36m\]\w\[\e[m\] \[\e[1;49;33m\]\`parse_git_branch\`\[\e[m\]  \[\e[38;5;236m\]\`date +\"%a %Y-%m-%d %H:%M:%S %z %Z\\[\e[m\]\"\`\n\[\e[1;32m\]  <] \u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[1;32m\]\h [> \[\e[m\]\[\e[37;40m\]\\[\e[m\]"

PS1_TIMELESS="cd \[\e[1;36m\]\w\[\e[m\] \[\e[1;49;33m\]\`parse_git_branch\`\[\e[m\]\n\[\e[1;32m\]  <] \u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[1;32m\]\h [> \[\e[m\]\[\e[37;40m\]\\[\e[m\]"

### BW Prompts!
PS1_BW_SIMPLE='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

PS1_BW_FULL="cd \w \`parse_git_branch\`  \`date +\"%a %Y-%m-%d %H:%M:%S %z %Z\"\`\n  <] \u@\h [> "

PS1_BW_TIMELESS="cd \w \`parse_git_branch\` \n  <] \u@\h [> "


if [ "$color_prompt" = yes ]; then
    PS1=$PS1_FULL
else
    PS1=$PS1_BW_FULL
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash/.bash_aliases ]; then
    . ~/.bash/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

### TODO:  CONSIDER LOADING local configuration from here!
## activate NixOS (if I have it!)
#if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
#	source ~/.nix-profile/etc/profile.d/nix.sh
#fi

export NIXPROMPT="\[\e[1;31m\]{\e[1;49;33m\]nix-env\[\e[1;31m\]} $PS1"

# since I don't particularly want any command line program to launch
# websites willy-nilly:
export BROWSER=none
