# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="duellj"
ZSH_THEME="dracula"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker archlinux docker-compose terraform sudo themes copydir copyfile copybuffer jsontools alias-finder history emoji web-search vagrant vagrant-prompt colored-man-pages colorize zsh-interactive-cd zsh-autosuggestions)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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

#Enable colorized plugins and alias ccat, cless
ZSH_COLORIZE_STYLE="colorful"

#Enable command-not-found
source /usr/share/doc/pkgfile/command-not-found.zsh

#Enable autosuggest with ctrl+space
zle -N autosuggest-accept
bindkey '^ ' autosuggest-accept

#Enable zsh syntax highligting with dracula theme 
source $HOME/.oh-my-zsh/dracula/zsh-syntax-highlighting.sh

#Enable zsh syntax highlig
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Highlight brackets patter curosr main 
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

alias powersave='sudo cpupower -c all frequency-set -g powersave'
alias performance='sudo cpupower -c all frequency-set -g performance'
alias conservative='sudo cpupower -c all frequency-set -g conservative'
alias userspace='sudo cpupower -c all frequency-set -g userspace'
alias listavailablegovernors='cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors'
alias listcurrentgovernors='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias updatearch='yay -Syu '
alias ys='yay -S'
alias yqs='yay -Qs '
alias yqi='yay -Qi '
alias yss='yay -Ss  '
alias yssa='yay -Ss --aur'
alias yrn='yay -Rnd '
alias yql='yay -Ql '
alias pqtdq='sudo pacman -Rns $(pacman -Qtdq)' #orphan packages
alias poweroffhd='udisksctl power-off -b /dev/'
alias ysc='sudo yay -Sc'
alias yscc='sudo yay -Scc'
alias cp='rsync -aPWh --info=progress2'
alias top='htop'
alias dmesg='sudo dmesg'
#alias cat='ccat'
#alias ls='ls --color=auto'
alias cat='/bin/bat'
alias catn='/bin/cat'
alias catnl='/bin/bat --paging=never'
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias less='cless'
alias sunlock='faillock --user $USER --reset'
alias firefox='firejail firefox'
alias chromium='firejail chromium'
alias steam='flatpak run com.valvesoftware.Steam'
alias vi='vim'
alias localstack-start='docker run --rm -it -p 4566:4566  -p 4510-4559:4510-4559 localstack/localstack'
alias network-monitor='nload'

#Color for less
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R '

source $ZSH/oh-my-zsh.sh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e

#Dracula theme for FZF 
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

#Dracula theme for tty
source $HOME/.oh-my-zsh/dracula/dracula-tty.sh

#Change the alias if we are running since a tty
case $(tty) in /dev/tty[0-9]*)
    unalias ls && alias ls='ls --color=auto' ;;
esac

#For docker
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

screenfetch 
