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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'kien/ctrlp.vim'                                    " Good search command
Plug 'junegunn/vim-easy-align'                           " Text alignment
Plug 'sheerun/vim-polyglot'                              " One to rulethem all
Plug 'scrooloose/nerdcommenter'                          " Easy comments
Plug 'tpope/vim-fugitive'                                " Git fugitive bar
Plug 'tpope/vim-surround'                                " Adding surround to variables
Plug 'tpope/vim-repeat'                                  " Better repeat
Plug 'psf/black', {'for': 'python', 'branch': 'stable' } " Python black formatting
Plug 'rafi/awesome-vim-colorschemes'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
"Plug 'lervag/vimtex'                                     " LaTeX for vim

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
set t_ut=
set t_Co=256
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


" Set true colorscheme"
if (has("termguicolors"))
    set termguicolors
endif

" Good colorscheme
colorscheme material
set background=dark " for the dark version
let g:material_terminal_italics = 1
" set background=light " for the light versionolorscheme solarized8_flat

"let g:material_theme_style = 'dark'
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
let g:vimtex_view_method='skim'

" Fix clipboard problem
set clipboard=unnamed
