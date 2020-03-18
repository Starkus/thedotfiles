set exrc
"set secure

set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent

set incsearch
set hlsearch
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Show whitespaces
set list
set listchars=tab:\ ,space:·

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ericcurtin/CurtineIncSw.vim'

call vundle#end()

" CtrlP
"set runtimepath^=~/.vim/bundle/ctrlp.vim
nnoremap <C-J> :CtrlPTag<CR>
set tags=tags

" Context menu colors
highlight Pmenu ctermbg=darkgray guibg=darkgray ctermfg=lightgray guifg=lightgray
highlight PmenuSel ctermbg=yellow guibg=yellow

set background=dark
" Weird lightline fix
set laststatus=2
set noshowmode

" Switch source <-> header
nnoremap <C-H> :call CurtineIncSw()<CR>

" Close vim when only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

syntax on

" No background
hi Normal ctermbg=NONE guibg=NONE
hi Visual term=reverse cterm=reverse guibg=Gray

nmap <F8> :TagbarToggle<CR>

nnoremap ; :
nnoremap : ;

vnoremap ; :
vnoremap : ;
