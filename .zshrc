figlet -kc rl1k

#source  ~/.oh-my-zsh/plugins/gf-completion.zsh 

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/bin/go/bin:/usr/local/:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/rl1k/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="clean"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
 export UPDATE_ZSH_DAYS=2

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker zsh-autosuggestions last-working-dir systemadmin)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nano'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# cheat autocompletion; just add to ~/.zshrc
 _cmpl_cheat() {
 reply=($(cheat -l | cut -d' ' -f1))
 }
 compctl -K _cmpl_cheat cheat

#Autocompletion gf tool from tomnomnom
_cmpl_gf() {
	reply=($(ls $GOPATH/src/github.com/tomnomnom/gf/examples | cut -f1 -d"."))
}
compctl -K _cmpl_gf gf


#Autocompletion optirun
_cmpl_optirun() {
	reply=($(ls /usr/bin))
}
compctl -K _cmpl_optirun optirun

#nmap 
_cmpl_yt() {
	reply=($(yt --help | grep '^ ' | grep -v '^  [A-Z]'))
}
compctl -K _cmpl_yt yt  

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip


#Config default editor for cheat and system
 export CHEAT_EDITOR=/usr/bin/vi
 export CHEATCOLORS=true

 export EDITOR=/usr/bin/vi

# ex - archive extractor
# usage: ex <file>
extract ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#gopath                                                                                                  
export GOROOT=/usr/lib/go/
export GOPATH=/home/rl1k/bin/go
export PATH=$PATH:$GOROOT:$GOPATH  

function gitPrompt {
  command -v __git_ps1 > /dev/null && __git_ps1 " (%s)"
}

txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset

# Prompt colours
atC="${txtpur}"
nameC="${txtpur}"
hostC="${txtpur}"
pathC="${txtgrn}"
gitC="${txtpur}"
pointerC="${txtgrn}"
normalC="${txtwht}"

# Red name for root
if [ "${UID}" -eq "0" ]; then 
  nameC="${txtred}" 
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias npms="npm start"

function windowshellhere() {  
    dirname=${PWD##*/}
    docker -c 2019-box run --rm -it -v "C:${PWD}:C:/source" -w "C:/source" "$@"
}

source /usr/share/autojump/autojump.zsh

##Config
alias zshr="source ~/.zshrc"
alias zshc="vi ~/.zshrc"
alias cmd32="wine /root/.wine/drive_c/windows/system32/cmd.exe"
alias cmd="wine /root/.wine/drive_c/windows/syswow64/cmd.exe"
alias web="sudo python2 -m SimpleHTTPServer 80"
alias myip="curl ipinfo.io"
alias open="xdg-open"
alias vimrc="vi /home/rl1k/.vimrc"
alias vimrc_="sudo vi /root/.vimrc"
alias tmuxconf="vi /home/rl1k/.tmux.conf"


#bash command
alias .="cd .."
alias ..="cd ../../"
alias ...="cd ../../../"
alias rm="rm -v"
alias ifconfig+='ip addr | grep UP | cut -f2 -d":"'
alias updatedb="sudo updatedb"
alias :q="exit"
alias update="sudo pacman -Syy && yay"
alias pac="sudo pacman -S"
alias pacs="sudo pacman -Ss"
alias pacu="sudo pacman -Syy"
alias pacr="sudo pacman -Rns"
alias gc="git clone"
alias gc+="sudo git clone"
alias ga="git add ."
alias gcm="git commit -m"
alias gpo="git push origin"
alias gp="git push"
alias gpu="git push upstream"
alias gpul="git pull"
#Basics tools
alias bettercap="sudo bettercap"
alias bettercapui="sudo bettercap -caplet http-ui"
alias teamserver="sudo teamserver"
alias cobaltstrike="sudo cobaltstrike"
alias nc="ncat"
alias lbzip="lbzip2 -v"
alias bunzip="bunzip -v"
alias unrar="unrar x"
alias googli="google-chrome --incognito" 
alias google="google-chrome" 
alias yts="youtube-dl --write-auto-sub "
alias ytn="youtube-dl -f bestvideo+bestaudio"
alias yt="youtube-dl -f bestvideo+bestaudio --write-auto-sub"
alias yta="youtube-dl -f22 --write-auto-sub"
alias tmuxks="tmux kill-session -t"
alias gui="xdg-open"
alias msfupdate="sudo msfupdate"
alias collaborator="sudo java -Xms1G -Xmx4G -Xbootclasspath/p:burp-loader-keygen.jar -jar /opt/Burpsuite/burpsuite_pro_v1.7.37.jar --collaborator-server"
alias empire="sudo empire"
alias mysql="sudo mysql"
alias systemctl="sudo systemctl"
alias tor-browser="tor-browser-en"
alias tor="sudo tor"

#SYMFONY
alias symfstop="php bin/console serve:stop"
alias symfstart="php bin/console serve:start"
alias cache="php bin/console c:c"
alias symf="php bin/console"
alias docup="php bin/console doctrine:schema:update --force"
alias docreate="php bin/console doctrine:schema:create"

alias symf4start="php bin/console server:start"
alias symf4stop="php bin/console server:stop"
