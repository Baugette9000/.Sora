

#      ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
#      ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
#      ██████╔╝███████║███████╗███████║██████╔╝██║     
#      ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║     
#   ██╗██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
#   ╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
                                                   

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi
export EDITOR='nvim'
export VISUAL='nvim'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\[$(tput bold)\]\[$(tput setaf 13)\]  \[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]'
LS_COLORS='di=1;35:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90:*.png=35:*.gif=36:*.jpg=35:*.c=92:*.jar=33:*.py=93:*.h=90:*.txt=94:*.doc=104:*.docx=104:*.odt=104:*.csv=102:*.xlsx=102:*.xlsm=102:*.rb=31:*.cpp=92:*.sh=92:*.html=96:*.zip=4;33:*.tar.gz=4;33:*.mp4=105:*.mp3=106'
export LS_COLORS

# Aliasing
alias \
  bashrc="nvim ~/.bashrc" \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -v" \
	mkd="mkdir -pv" \
	ffmpeg="ffmpeg -hide_banner" \
  thunar="devour thunar" \
  vencord="devour vesktop" \
  ka="killall" \
	g="git" \
  ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi" \
  bfetch="~/.config/i3/custom/uptimeecho" \
  l="ls -lh --color=auto" \
  ll="ls -lah --color=auto" \
  la="ls -A --color=auto" \
  lm="ls -m --color=auto" \
  lr="ls -R --color=auto" \
  lg="ls -l --group-directories-first" \
  sync="sudo pacman -Syu" \
  logq="pkill dwm" \
  bfetch="~/.config/i3/custom/uptimeecho" \

# Plugins 
#if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
#    GIT_PROMPT_ONLY_IN_REPO=1
#    source "$HOME/.bash-git-prompt/gitprompt.sh"
#fi

# Execute Prompt Customizations 
echo " "
pokemon-colorscripts -r 
echo " "
source ~/.dotfilesNix/blesh/ble.sh

