set exrc
set secure

set tabstop=4
set shiftwidth=4

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

"LaTeX"
Plugin 'vim-latex/vim-latex'

filetype plugin on
filetype indent on
let g:tex_flavor='latex'

"Plugin 'itchyny/lightline.vim'
"Plugin 'powerline/powerline'
Plugin 'vim-airline/vim-airline'

"Plugin 'chriskempson/base16-vim'"
Plugin 'drewtempelmeyer/palenight.vim'

Plugin 'tikhomirov/vim-glsl'

"Web dev plugins"
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'

call vundle#end()
filetype plugin indent on

colorscheme palenight
set background=dark
let g:lightline = {'colorscheme': 'palenight'}
"Weird lightline fix
set laststatus=2
set noshowmode

"Close vim when only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


syntax on

"No background"
hi Normal ctermbg=NONE guibg=NONE
hi Visual term=reverse cterm=reverse guibg=Gray

highlight YcmErrorSection ctermbg=1

nmap <F8> :TagbarToggle<CR>

nmap <F2> :NERDTree<CR>

nnoremap ; :
nnoremap : ;

" Powerline
let g:airline_powerline_fonts = 1
