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
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
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

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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


eval $(dircolors -b $HOME/.dircolors)

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

#CONFIG PROMTEC
export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[38;5;208m\]┌─\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;197m\]<\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;226m\]FernandoLC\[$(tput sgr0)\]\[\033[38;5;197m\]/>\[\033[38;5;208m\](\[$(tput sgr0)\]\[\033[38;5;2m\]\w\[$(tput sgr0)\]\[\033[38;5;208m\])\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;1m\]\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;208m\]\n└──┤▶\[$txtblu\]\$batery\$git_branch\[$txtred\]\$git_dirty\[$txtrst\] \$"


#FUNCTIONS
gitcomit() {
    if [ "$@" ];
    then
        git add . && git commit -m "$*"
    else
        echo 'Ingresa una descripción del commit'
    fi
}

gitcomitprofile () {

    git_branch=" <<="${branch}"=>>"


    if [ "$1" ]; then
        if [ "$2" ]; then
            #echo (${#1}+1)
            echo "${1}_${2}_____${*}"
            #git add . && git commit -m "$description"
        else
            echo 'Upps... La _descripción del commit es requerida'
        fi
    else
        echo 'Upps... El [MODULO] del commit es requerido'
    fi
}

gitpush() {
    if [ "$@" ];
    then
        git push origin "$*"
    else
        echo 'Ingresa el origin del push'
    fi
}

openprojects() {
    if [ "$@" ]
    then
        cd '/home/fernandolc/Documentos/Projects/Gnp/GAE-GNP-Suscribe-Semi-RC-Profesional-Front-End'
        xdotool key --window windows ctrl+shift+0x0038
        xdotool key --window windows ctrl+shift+0x0039
    else
        echo 'no hay proyecto seleccionado'
    fi
}

# Alias

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias reload='source ~/.bashrc'
alias editbash='code ~/.bashrc'
alias editgit='git config --global -e'

alias suspend='systemctl suspend'

alias sv='npm run dev'
alias sy='yarn run dev'

alias ll='ls -al'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias projects="cd /home/fernandolc/Documentos/Projects"
alias aeromexico="cd /home/fernandolc/Documentos/Projects/Aeromexico"
alias e4="cd /home/fernandolc/Documentos/Projects/Aeromexico/am-e4-ui"
alias gnp="cd /home/fernandolc/Documentos/Projects/Gnp"
#alias rcpro="cd /home/fernandolc/Documentos/Projects/Gnp/GAE-GNP-Suscribe-Semi-RC-Profesional-Front-End"
alias rcpro=openprojects

# PARAMETROS DE ENTRADA DE SONAR
# { console | start | stop | force-stop | restart | status | dump }
alias sonar='/home/fernandolc/Documentos/Sonarqube/sonarqube-9.1/bin/linux-x86-64/sonar.sh "$@"'
alias sonar-scanner='/home/fernandolc/Documentos/Sonarqube/sonar-scanner-4.6/bin/sonar-scanner'

#GIT
alias com=gitcomit
#alias comp=gitcomitprofile
alias push=gitpush
alias status='git status'
alias checkout='git checkout'


alias build="npm run build"
alias deploy="gcloud app deploy --version=example"


