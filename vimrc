" This is a compilation of what I found to be useful vim configuration
" Author: pesap
" Use it at your own risk

if has ('vim_starting')
    set nocompatible " Remove compatibility with regular VI
endif

" Check if Vim Plug is installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"""""""""""""""""""""""""""""
" Plugins configuration
"""""""""""""""""""""""""""""

" Plug packages:
call plug#begin(expand('~/.vim/plugged'))

" FZF configuration
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

Plug 'kien/ctrlp.vim'               " Good search command
Plug 'junegunn/vim-easy-align'      " Text alignment
Plug 'scrooloose/nerdcommenter'     " Easy comments
Plug 'tpope/vim-fugitive'           " Git fugitive bar
Plug 'tpope/vim-surround'           " Adding surround to variables
Plug 'tpope/vim-repeat'             " Better repeat
Plug 'psf/black', {'for': 'python'} " Python black formatting
Plug 'rafi/awesome-vim-colorschemes'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'

call plug#end()

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" Source configuration
source ~/.vimrc.global
source ~/.vimrc.maps
source ~/.vimrc.plugins

" Filetype plugins
filetype plugin indent on

"""""""""""""""""""""""""""""
" Color configuration
"""""""""""""""""""""""""""""

" Syntax
syntax enable

" Set colors
set background=dark
set t_ut=
set t_Co=256
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


" Set true colorscheme"
if (has("termguicolors"))
    set termguicolors
endif

" Good colorscheme
colorscheme solarized8_flat

let g:material_theme_style = 'dark'
let g:indentLine_char = '¦'
let g:indentLine_color_gui = "#073642"

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_frontmatter = 1
