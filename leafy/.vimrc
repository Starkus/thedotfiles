set exrc
set secure

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'git://git.wincent.com/command-t.git'

Plugin 'scrooloose/nerdtree.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'Valloric/YouCompleteMe'

Plugin 'chriskempson/base16-vim'

Plugin 'tikhomirov/vim-glsl'

call vundle#end()
filetype plugin indent on


"Close vim when only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


syntax on

colorscheme base16-gruvbox-dark-hard
hi Normal ctermbg=NONE guibg=NONE

highlight YcmErrorSection ctermbg=1
