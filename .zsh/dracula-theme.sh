# Enable dracula theme
ZSH_THEME="dracula"

# Dracula theme for FZF
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4 --preview-window=40% --height=90% --layout=reverse --border="rounded" --preview-window="border-rounded" --preview-label="[ Preview ]" --prompt="▶ " --marker="♡ "  --pointer="󰋇" --info="right" '

#Enable zsh syntax highlighting with dracula theme
source $HOME/.oh-my-zsh/dracula/zsh-syntax-highlighting.sh

#alias
alias cat='/bin/bat --paging=never --theme=Dracula'
export PAGER="bat --theme=Dracula"
alias less=$PAGER
alias zless=$PAGER

#Dracula theme for tty
source $HOME/.oh-my-zsh/dracula/dracula-tty.sh
