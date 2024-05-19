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
"let g:codeium_enabled = v:false

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
\   'md':     ['markdownlint'],
\   'xml':    ['xmllint'],
\}

"Optional: Configure ale to use flake8 with parameters
let g:ale_python_flake8_options = '--max-line-length 100'

"Optional arguments for pylint
let g:ale_python_pylint_options = '--disable=missing-docstring,too-few-public-methods --max-line-lenhth=100'

"Optional: Configure ale to automatically fix files on save
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
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
if $TERM ==# 'xterm-256color'
        let g:ale_sign_error = '✘'
        let g:ale_sign_warning = '⚠'

        "Enable powerline status bar
        let g:powerline_pycmd="py3"

        "Enable status bar by default
        set laststatus=2

        "Each indent level has a distinct character
        let g:indentLine_char_list = ['|', '¦', '┆', '┊']

        "Plugin wfxr/minimap.vim
        "code-minimap installed with cargo
        let g:minimap_width = 5
        let g:minimap_auto_start = 1
        let g:minimap_auto_start_win_enter = 1
else
        let g:ale_sign_error = '>>'
        let g:ale_sign_warning = '--'

        "Each indent level has a distinct character
        let g:indentLine_char_list = ['|', '¦']

        "Disable powerline status bar
        let g:powerline_loaded = 1
endif
