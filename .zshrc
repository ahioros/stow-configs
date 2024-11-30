# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="duellj"

if [[ "$TERM" == "xterm-256color" ]] || \
    [[ "$TERM" == "screen-256color" ]]; then

    # set THEME
    # Edit ~/.tmux.conf,
    # Edit ~/.gitconfig,
    # Edit ~/.config/bat/bat.conf,
    # vim (plugins,plugins-config, vimrc),
    # ~/.config/starship/starship.toml
    THEME="catppuccin_frappe"

    case $THEME in
        'dracula')
            source $HOME/.zsh/dracula-theme.sh
        ;;
        'catppuccin_frappe')
            source $HOME/.zsh/catppuccin_frappe-theme.sh
        ;;
    esac

    #Enable tmux plugin
    ZSH_TMUX_AUTOSTART=true

    # Enable zellij
    #if [[ -z "$ZELLIJ" ]]; then
    #  if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
    #    zellij attach -c
    #  else
    #    zellij
    #  fi

    #  if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
    #    exit
    #  fi
    #fi

    # Enable fzf-tab plugin (install fzf-tab plugin)
    source $HOME/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.plugin.zsh

    # Enable fzf-tab-source plugin (install fzf-tab-source plugin)
    source $HOME/.oh-my-zsh/custom/plugins/fzf-tab-source/fzf-tab-source.plugin.zsh

    # enable fzf menu for completion
    # Replace zsh's default completion selection menu with fzf
    zstyle ':completion:*' menu no

    # enable fzf-tab preview (install fzf-tab plugin)
    enable-fzf-tab
    zstyle ":fzf-tab:complete:cd:*" fzf-preview '/usr/bin/lsd --group-dirs=first $realpath'

    # disable sort when completing `git checkout`
    zstyle ':completion:*:git-checkout:*' sort false

    # NOTE: don't use escape sequences here, fzf-tab will ignore them
    zstyle ':completion:*:descriptions' format '[%d]'

    # fzf colors
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

else
    # Enable theme for tty
    ZSH_THEME="dst" #gentoo #jtriley #mikeh #rkj-repos ## #"daveverwer" "dieter"

    #Default command to use when inputs tty
    export FZF_DEFAULT_COMMAND='fd --type f'

    export PAGER="less"
    alias less=$PAGER
    alias zless=$PAGER
fi

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
DISABLE_AUTO_TITLE="true"

#echo -n -e "\033]0;$USER  \007"

case $TERM in xterm*)
    precmd () {print -Pn "\e]0;$USER   %~\a"}
    ;;
esac

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
plugins=(tmux git docker fzf archlinux kubie kubectl helm docker-compose terraform sudo themes copydir copyfile copybuffer jsontools alias-finder history emoji web-search vagrant vagrant-prompt colored-man-pages colorize zsh-interactive-cd zsh-autosuggestions)

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

#Enable zsh syntax highlight
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Highlight brackets pattern cursor main
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

alias powersave='sudo cpupower -c all frequency-set -g powersave'
alias performance='sudo cpupower -c all frequency-set -g performance'
alias conservative='sudo cpupower -c all frequency-set -g conservative'
alias userspace='sudo cpupower -c all frequency-set -g userspace'
alias listavailablegovernors='cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors'
alias listcurrentgovernors='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias updatearch='yay -Syu --removemake'
alias ys='yay -S'
alias yqs='yay -Qs '
alias yqi='yay -Qi '
alias yss='yay -Ss  '
alias yssa='yay -Ss --aur'
alias yrn='yay -Rnd '
alias yql='yay -Ql '
alias pqtdq='sudo pacman -Rns $(pacman -Qtdq)' #orphan packages
alias pacsize='pacman -Qi | awk '"'"'/^Name/{name=$3} /^Installed Size/{print $4$5, name}'"'"' | sort -h'
alias poweroffhd='udisksctl power-off -b /dev/'
alias ysc='sudo yay -Sc'
alias yscc='sudo yay -Scc'
alias cp='rsync -aPWh --info=progress2'
#alias top='htop'
alias top='btop'
alias dmesg='sudo dmesg'
#alias cat='ccat'
#alias ls='ls --color=auto'
alias catn='/bin/cat'
alias catnl='/bin/bat --paging=never'
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias sl='ls'
alias tree="lsd --tree"
alias sunlock='faillock --user $USER --reset'
alias firefox='firejail firefox'
alias chromium='firejail chromium'
alias steam='flatpak run com.valvesoftware.Steam'
alias vi='vim'
alias localstack-start='docker run -d --rm -it -p 4566:4566  -p 4510-4559:4510-4559 localstack/localstack'
alias ntop='nload'

#Color for less
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R '

source $ZSH/oh-my-zsh.sh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory autocd extendedglob nomatch notify
setopt sharehistory hist_ignore_space hist_save_no_dups
setopt hist_ignore_dups hist_find_no_dups
unsetopt beep

# key bindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# enable grc (install grc package) color ouput for some commands
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

#Change the alias if we are running since a tty
if [[ $(tty) = /dev/tty[0-9]* ]] || [[ $TERM == "screen" ]]; then
    unalias ls
    alias ls='ls --color=auto'

    # for nuphy air 75 keyboard
    if [ $(lsusb | grep "Apple, Inc. Aluminium Keyboard" | wc -l) -gt 0 ];then
        sudo loadkeys us
    else
        sudo loadkeys la-latin1
    fi
fi

#For docker
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

#Dracula man-pages
export MANPAGER="/usr/bin/less -s -M +Gg"
export LESS_TERMCAP_mb=$'\e[1;31m'      # begin bold
export LESS_TERMCAP_md=$'\e[1;34m'      # begin blink
export LESS_TERMCAP_so=$'\e[01;45;37m'  # begin reverse video
export LESS_TERMCAP_us=$'\e[01;36m'     # begin underline
export LESS_TERMCAP_me=$'\e[0m'         # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'         # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'         # reset underline
export GROFF_NO_SGR=1                   # for konsole

#automount-iso
#if [ $(mount | grep "Pandemic" | wc -l) -eq 0 ];
#then
#  automount-iso
#fi

#screenfetch
cores=$(nproc)
load=$(awk '{print $3}'< /proc/loadavg)

usage=$(echo | awk -v c="${cores}" -v l="${load}" '{print l*100/c}' | \
    awk -F. '{print $1}')

if [[ ${usage} -lt 60 ]]; then
    if [ -f /usr/bin/screenfetch ]; then
        screenfetch  -d '-de;-wm;-wmtheme' -D 'Arch Linux' -A 'Arch Linux';
    fi
fi

# starship
if [[ "$TERM" == "xterm-256color" ]] || [[ "$TERM" == "screen-256color" ]] \
    &&  [[ -n "$TMUX" ]] || [[ -n "$ZELLIJ" ]]; then
    export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
    eval "$(starship init zsh)"
fi

#fortune cookie with cowsay
fortune | cowsay -f /usr/share/cowsay/cows/tux.cow
# vim: set ft=sh ts=4 sw=4 et :
