" ====================================================
"      _    ___                    
"     | |  / (_)___ ___  __________
"     | | / / / __ `__ \/ ___/ ___/
"    _| |/ / / / / / / / /  / /__  
"   (_)___/_/_/ /_/ /_/_/   \___/  
"
"=====================================================

" 'vi' compatability off
set nocompatible

" Filetype detection on
filetype on

" Enable plugins
filetype plugin on

" Load indent file for detected filetype
filetype indent on

" Syntax highlights
syntax on

" Line numbers
" set number            " normal
set relativenumber      " relative

set shiftwidth=4
set tabstop=4
set expandtab

set nobackup
set scrolloff=10

set nowrap
set incsearch
set ignorecase
set smartcase

set showcmd
set showmode
set showmatch
set hlsearch
set history=100

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


" ====================== P L U G I N S ====================== {{{

call plug#begin('~/.vim/plugged')

    Plug 'preservim/nerdtree'

call plug#end()

" }}}

" ===================== M A P P I N G S ===================== {{{

" space leader
let mapleader = " " 

inoremap jj <esc>

" Nerdtree mappings

nnoremap <leader>e :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" }}}

" ==================== V I M S C R I P T ==================== {{{

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" ================== S T A T U S   L I N E ================== {{{

" }}}
