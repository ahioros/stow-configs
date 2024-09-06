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
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  "powerline installed with pacman
  "vim-ansible installed with pacman
  "rainbow_parenthesis installed manual (renamed)
  Plug 'lilydjwg/colorizer'
  Plug 'ryanoasis/vim-devicons'
  Plug 'preservim/nerdtree'
call plug#end()
