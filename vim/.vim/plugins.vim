call plug#begin()
  Plug 'Yggdroot/indentLine'
  Plug 'adi/vim-indent-rainbow'
  Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
  Plug 'Exafunction/codeium.vim'
  Plug 'dense-analysis/ale'
  Plug 'jvirtanen/vim-hcl'
  Plug 'rkitover/vimpager'
  Plug 'jiangmiao/auto-pairs'
  Plug 'dracula/vim', { 'as': 'dracula' }
  "deps installed pacman -S rust for minimap plugin
  Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}
  "powerline installed with pacman
  "vim-ansible with pacman
  "rainbow_parenthesis installed manual (renamed)
call plug#end()
