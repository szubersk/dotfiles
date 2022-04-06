set backspace=2
set cursorline
set expandtab
set fileencoding=utf-8
set fileencodings=utf-8
set history=1000
set hlsearch
set ignorecase
set incsearch
set modeline
set mouse=
set nobackup
set nocompatible
set noswapfile
set number
set ruler
set shiftwidth=2
set showcmd
set showmatch
set showmode
set showtabline=2
set smartcase
set smartindent
set softtabstop=2
set tabstop=2
set textwidth=0
set wildmode=list:full
set omnifunc=syntaxcomplete#Complete

packloadall

let g:ale_fixers = {'json': ['jq'], 'python': ['autopep8'], 'sh': ['shfmt'], 'yaml': ['yamlfix']}

let g:ale_python_flake8_options = '--max-line-length 88'
let g:ale_python_pylint_options = '--confidence=HIGH --disable=C'
let g:ale_sh_shell_default_shell = 'bash'
let g:ale_sh_shellcheck_options = '--format=gcc --enable=all --exclude=SC1090,SC1091,SC2250,SC2312,SC3043'
let g:ale_sh_shfmt_options = '-i 2 -bn -ci'

filetype plugin indent on
colorscheme desert
syntax enable

autocmd BufRead,BufNewFile *log,*LOG set filetype=messages
autocmd BufRead,BufNewFile [mM]akefile,*.mak set list
autocmd BufRead,BufNewFile *.py set shiftwidth=4 softtabstop=4 tabstop=4

augroup templates
  autocmd BufNewFile *.sh 0r ~/.vim/templates/bash
augroup END

vnoremap < <gv
vnoremap > >gv

function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END
