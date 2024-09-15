# Catppuccin Frappe theme for FZF
export FZF_DEFAULT_OPTS=" \
    --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
    --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
    --color=marker:#babbf1,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284 \
    --color=selected-bg:#51576d \
    --multi \
    --preview-window=40% \
    --height=90% \
    --layout=reverse \
    --border='rounded' \
    --preview-window='border-rounded' \
    --preview-label='[ Preview ]' \
    --prompt='▶ ' --marker='♡ ' \
    --pointer='󰋇' --info='right' "

#Enable zsh syntax highlighting with catppuccin Frappe theme
source $HOME/.oh-my-zsh/catppuccin/zsh-syntax-highlighting/themes/catppuccin_frappe-zsh-syntax-highlighting.zsh

#alias
alias cat='/bin/bat --paging=never --theme="Catppuccin Frappe"'
export PAGER='bat --theme="Catppuccin Frappe"'
alias less=$PAGER
alias zless=$PAGER
alias glow="glow -s $HOME/.config/glow/catppuccin_frappe.json -w 80"

#Catppuccin theme for tty
source $HOME/.oh-my-zsh/catppuccin/catppuccin_frappe-tty.sh

#btop themes
#installed $HOME/.config/btop/themes

#bat themes
#installed $HOME/.config/bat/themes
bat cache --build 1&>/dev/null
