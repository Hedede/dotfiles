set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugins/')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'endel/vim-github-colorscheme'

call vundle#end()
filetype plugin indent on

if has('gui_running')
	colorscheme github
endif

syn on
set nu
