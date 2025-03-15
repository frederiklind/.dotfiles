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
syntax enable

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
    Plug 'lervag/vimtex'

call plug#end()

" }}}

" ===================== M A P P I N G S ===================== {{{

" space leader
let mapleader = " " 

inoremap jj <esc>

nnoremap <C-q> :q<CR>
nnoremap <C-s> :w<CR>

" Nerdtree mappings

nnoremap <leader>e :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" }}}

" ==================== V I M S C R I P T ==================== {{{

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" ================== S T A T U S   L I N E ================== {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}
