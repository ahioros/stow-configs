"Plugin Yggdroot/indentLineset encoding=utf-8
"Add Yggdroot/indentLine plugin use theme color
"https://github.com/Yggdroot/indentLine
let g:indentLine_setColors = 0

"Plugin indent-rainbow
"Enable indent-rainbow plugin - https://github.com/adi/vim-indent-rainbow
let g:rainbow_colors_color= [ 233, 235, 237, 238, 240, 242 ]
let g:rainbow_colors_black= [ 226,  83, 213,  87,   7, 250 ]
call togglerb#map('<F9>')

"Plugin rainbow-parenthesis
"Enable rainbow parenthesis - Installed Manual
"       https://github.com/frazrepo/vim-rainbow/tree/master I renamed the code
"       because conflict with rainbow-indent
let g:rainbow_parenthesis_active = 1
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick', 'dracula']
let g:rainbow_parenthesis_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

"Plugin YouCompleteMe
"close the up buffer youcompletme https://github.com/ycm-core/YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1

"youcompletme fix pipenv
let pipenv_venv_path = system('pipenv --venv')
if shell_error == 0
        let venv_path = substitute(pipenv_venv_path, '\n', '', '')
        let g:ycm_python_binary_path = venv_path . '/bin/python'
else
        let g:ycm_python_binary_path = 'python'
endif

"Enable youcompletme server log level
"let g:ycm_server_log_level = 'debug'

"Plugin codeium
"Uncomment to disable codeium plugin
let g:codeium_enabled = v:false

"Plugin copilot
"Uncomment to disable copilot plugin
"let g:copilot_enabled = v:false
let g:copilot_filetypes = {
\   'python': v:true,
\   'yaml':   v:true,
\   'tf':     v:true,
\   'vim':    v:true,
\   'sh':     v:true,
\   'markdown': v:true,
\   'xml':    v:true,
\   'go': v:true,
\   'css': v:true,
\   'javascript': v:true,
\   'json': v:true,
\   'perl': v:true,
\   'gitcommit': v:true
\ }

"Disable copilot for extremely large files
"http://curtispoe.org/articles/using-github-copilot-with-vim.html
autocmd BufReadPre *
      \ let f=getfsize(expand("<afile>"))
      \ | if f > 100000 || f == -2
      \ | let b:copilot_enabled = v:false
      \ | endif

"Plugin ale
"Uncomment to disable ale plugin - https://github.com/dense-analysis/ale
"let g:ale_enabled = v:false

"Uncomment to disable ale plugin specific linters
let g:ale_linters = {
\   'python': ['mypy', 'pylint', 'flake8', 'ruff'],
\   'yaml':   ['yamllint'],
\   'tf':     ['tflint', 'tfsec'],
\   'vim':    ['vint'],
\   'sh':     ['bashate', 'shellcheck'],
\   'markdown': ['mdl'],
\   'xml':    ['xmllint'],
\   'go': ['gofmt'],
\   'css': ['stylelint'],
\   'javascript': ['oxlint'],
\}

"markdown mdl configuration
" file ~/.mdlrc
" file ~/.config/mdl/markdownlint.rb

"Optional: Configure ale to use flake8 with parameters
let g:ale_python_flake8_options = '--max-line-length 100'

"Optional arguments for pylint
let g:ale_python_pylint_options = '--disable=missing-docstring,too-few-public-methods --max-line-lenhth=100'

"Optional: Configure ale to automatically fix files on save
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\   'markdown': ['prettier'],
\   'json': ['prettier'],
\   'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines' ],
\   'javascript': ['prettier'],
\   'go':['gofmt'],
\}

"Optional: Configure ale to use isort with parameters
let g:ale_python_isort_options = '--profile black -l 100'

"Optional: Configure ale to use black with parameters
let g:ale_python_black_options = '--line-length 100'

"Optional: Configure ale to use ruff and fix on save
"let: g:ale_python_ruff_use_global = 1

"Optional: Configure ale_fixers to fix on save
let g:ale_fix_on_save = 1

"Uncomment to disable ale plugin whitespace warnings
"let g:ale_warn_about_trailing_whitespace = 0

"Optional: configure ale to use flake8
"let g:ale_python_flake8_use_global = 1

"Change configs for different terminals
if $TERM ==# 'xterm-256color' || $TERM ==# 'screen-256color'

        let g:ale_sign_error = '✘'
        let g:ale_sign_warning = '⚠'

        "Enable powerline status bar
        "let g:powerline_pycmd="py3"

        "Enable powerline status bar by default
        "set laststatus=2
        "Disable powerline status bar
        let g:powerline_loaded = 1

        "Enable vim-airline powerline fonts
        let g:airline_powerline_fonts = 1

        "Enable vim-airline display all buffers when only one tab is open
        let g:airline#extensions#tabline#enabled = 1

        "Enable vim-airline path formatter
        let g:airline#extensions#tabline#formatter = 'unique_tail'

        "Set vim-airline theme
        "let g:airline_theme = 'dracula'

        "Set vim-airline theme
        let g:airline_theme = 'catppuccin_frappe'

        "Enable vim-airline symbols
        if !exists('g:airline_symbols')
            let g:airline_symbols = {}
        endif

        " unicode symbols
        let g:airline_left_sep = '»'
        let g:airline_left_sep = '▶'
        let g:airline_right_sep = '«'
        let g:airline_right_sep = '◀'
        let g:airline_symbols.linenr = '␊'
        let g:airline_symbols.linenr = '␤'
        let g:airline_symbols.linenr = '¶'
        let g:airline_symbols.branch = '⎇'
        let g:airline_symbols.paste = 'ρ'
        let g:airline_symbols.paste = 'Þ'
        let g:airline_symbols.paste = '∥'
        let g:airline_symbols.whitespace = 'Ξ'

        " airline symbols
        let g:airline_left_sep = ''
        let g:airline_left_alt_sep = ''
        let g:airline_right_sep = ''
        let g:airline_right_alt_sep = ''
        let g:airline_symbols.branch = ''
        let g:airline_symbols.readonly = ''
        let g:airline_symbols.linenr = ''
        let g:airline_symbols.crypt = '🔒'

        "Each indent level has a distinct character
        let g:indentLine_char_list = ['|', '¦', '┆', '┊']

        "Plugin wfxr/minimap.vim
        "code-minimap installed with cargo
        let g:minimap_width = 5
        let g:minimap_auto_start = 1
        let g:minimap_auto_start_win_enter = 1

        "Enable ryanoasis/vim-devicons
        let g:webdevicons_enable = 1

        " Start NERDTree when Vim is started without file arguments.
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

        " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
        autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
        \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

        " Exit Vim if NERDTree is the only window remaining in the only tab.
        autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 || winnr('$') == 2 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

        nnoremap <leader>n :NERDTreeFocus<CR>
        nnoremap <C-n> :NERDTree<CR>
        nnoremap <C-t> :NERDTreeToggle<CR>
        nnoremap <C-f> :NERDTreeFind<CR>

else
        let g:ale_sign_error = '>>'
        let g:ale_sign_warning = '--'

        "Each indent level has a distinct character
        let g:indentLine_char_list = ['|', '¦']

        "Disable powerline status bar
        let g:powerline_loaded = 1

        "Disable vim-airline display all buffers when only one tab is open
        let g:airline#extensions#tabline#enabled = 0

        " Disable ryanoasis/vim-devicons
        let g:webdevicons_enable = 0
endif
