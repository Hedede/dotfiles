set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugins/')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'endel/vim-github-colorscheme'
"Plugin 'project.vim'
Plugin 'project.tar.gz'

call vundle#end()
filetype plugin indent on

if has('gui_running')
	colorscheme github
endif

" Settings
syn on
set nu
set showcmd

" enable modelines
set modeline
set modelines=5

" Mappings
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

" source system-specific .vimrec
if filereadable(expand('~/.local/vimrc'))
    source ~/.local/vimrc
endif
