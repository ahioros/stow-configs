" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

" Turn on syntax highlight
syntax on

" Set the dracula theme
colorscheme dracula

" For plugins to load correctly
filetype plugin indent on

" Show line numbers
set number

" Show file stats show lines and columns bottom right
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

"Convert tabs to space
set expandtab

"Highlig current line
set cursorline

"Highling current column
set cursorcolumn

"Turn on backup option
set backup

"Backup files in dir ~/.vimbackups
set backupdir=~/.vimbackups

"Make backup before overwriting the current buffer
set writebackup

"Overwrite the original backup file
set backupcopy=yes

"Spell checker
setlocal spell spelllang=en_us

"Backup files with ORIGINALFILENAME-YYYYMMDD-HHMMSS.vimbackup
au BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M%S") . '.vimbackup'

"Add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml "foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"Enable indent-rainbow plugin - https://github.com/adi/vim-indent-rainbow
let g:rainbow_colors_black= [ 233, 235, 237, 238, 240, 242 ]
let g:rainbow_colors_color= [ 226,  83, 213,  87,   7, 250 ]
call togglerb#map('<F9>')

if has("autocmd")
 augroup python
  au!
  autocmd BufNewFile,BufReadPre,FileReadPre        *.py set tabstop=4
  autocmd BufNewFile,BufReadPre,FileReadPre        *.py set softtabstop=4
  autocmd BufNewFile,BufReadPre,FileReadPre        *.py set shiftwidth=4
  autocmd BufNewFile,BufReadPre,FileReadPre        *.py set expandtab
  autocmd BufNewFile,BufReadPre,FileReadPre        *.py set autoindent
  autocmd WinEnter,VimEnter *.py :call rainbow#enable()
  autocmd FileType python map <buffer> <F5> :exec '!clear && python3 -m pdb' shellescape(@%, 1)<cr>
  autocmd FileType python map <buffer> <F6> :exec '!clear && python3' shellescape(@%, 1)<cr>
 augroup END
endif

if has("autocmd")
 augroup sh
  au!
  autocmd BufNewFile,BufReadPre,FileReadPre        *.sh set tabstop=4
  autocmd BufNewFile,BufReadPre,FileReadPre        *.sh set softtabstop=4
  autocmd BufNewFile,BufReadPre,FileReadPre        *.sh set shiftwidth=4
  autocmd BufNewFile,BufReadPre,FileReadPre        *.sh set expandtab
  autocmd BufNewFile,BufReadPre,FileReadPre        *.sh set autoindent
  autocmd WinEnter,VimEnter *.sh :call rainbow#enable()
  autocmd FileType sh map <buffer> <F5> :exec '!clear && bash -xv ' shellescape(@%, 1)<cr>
  autocmd FileType sh map <buffer> <F6> :exec '!clear && bash ' shellescape(@%, 1)<cr>
 augroup END
endif

if has("autocmd")
 augroup terraform
  au!
  autocmd BufNewFile,BufReadPre,FileReadPre        *.tf set tabstop=2
  autocmd BufNewFile,BufReadPre,FileReadPre        *.tf set softtabstop=2
  autocmd BufNewFile,BufReadPre,FileReadPre        *.tf set shiftwidth=2
  autocmd BufNewFile,BufReadPre,FileReadPre        *.tf set expandtab
  autocmd BufNewFile,BufReadPre,FileReadPre        *.tf set autoindent
  autocmd WinEnter,VimEnter *.tf :call rainbow#enable()
  autocmd FileType terraform  map <buffer> <F5> :exec '!clear && terraform fmt -check -diff' shellescape(@%, 1)<cr>
  autocmd FileType terraform  map <buffer> <F6> :exec '!clear && terraform fmt' shellescape(@%, 1)<cr>
  autocmd FileType terraform  map <buffer> <F7> :exec '!clear && terraform init' <cr>
  autocmd FileType terraform  map <buffer> <F8> :exec '!clear && terraform plan' <cr>
 augroup END
endif

"Uncomment to disable codeium plugin
"let g:codeium_enabled = v:false

"Uncomment to disable vim-isort plugin
"let g:vim_isort = v:false

"Uncomment to disable ale plugin - https://github.com/dense-analysis/ale
"let g:ale_enabled = v:false

"Uncomment to disable ale plugin specific linters
" ruff, pylint
let g:ale_linters = {
\   'python': ['pylint'],
\}

"Optional: Configure ale to automatically fix files on save
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\}
"Optional: Configure ale to use isort with parameters
"let g:ale_python_isort_options = '--profile black -l 100'

"Optional: Configure ale to use ruff and fix on save
"let: g:ale_python_ruff_use_global = 1

"Optional: Configure ale_fixers to fix on save
let g:ale_fix_on_save = 1

"Uncomment to disable ale plugin whitespace warnings
"let g:ale_warn_about_trailing_whitespace = 0

"Optional: configure ale to use flake8
"let g:ale_python_flake8_use_global = 1

"Change ale signs
if &term=~'xterm-256color'
        let g:ale_sign_error = '✘'
        let g:ale_sign_warning = '⚠'
        "Enable powerline status bar
        let g:powerline_pycmd="py3"
        "Enable status bar by default
        set laststatus=2
else
        let g:ale_sign_error = '>>'
        let g:ale_sign_warning = '--'
endif

""
