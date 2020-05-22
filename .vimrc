set exrc
"set secure

" File find paths
"set path+=,/mnt/c/Users/starkus/source/repos/*

" Indentation
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent

" Line numbers
set relativenumber
set number

" Formatting
set formatoptions=tcqj
set textwidth=100

" Search
set incsearch
set hlsearch
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Show whitespaces
set list
set listchars=tab:\ ,space:·

" Other settings
set hidden
set nocompatible
filetype off
set lazyredraw
" set undofile " nooo

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ericcurtin/CurtineIncSw.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'kyoz/purify', {'rtp': 'vim' }

call vundle#end()

" Colorscheme
set t_Co=256
set background=dark
set laststatus=2
set noshowmode

colorscheme purify

" CtrlP
"set runtimepath^=~/.vim/bundle/ctrlp.vim
nnoremap <C-J> :CtrlPTag<CR>
set tags=tags

let g:lightline = {
	\ 'colorscheme': 'purify',
	\ 'component': {
	\   'lineinfo': ' %3l:%-2v',
	\ },
	\ 'component_function': {
	\   'readonly': 'LightlineReadonly',
	\   'fugitive': 'LightlineFugitive'
	\ },
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '', 'right': '' }
	\ }

function! LightlineReadonly()
	return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
	if exists('*FugitiveHead')
		let branch = FugitiveHead()
		return branch !=# '' ? ''.branch : ''
	endif
	return ''
endfunction

syntax on

" No background
highlight Normal ctermbg=none
"highlight Visual cterm=reverse ctermfg=Gray

" Context menu colors
highlight Pmenu ctermbg=darkgray ctermfg=lightgray
highlight PmenuSel ctermbg=yellow

highlight VertSplit ctermbg=yellow ctermfg=black

highlight Search cterm=reverse ctermbg=none ctermfg=none

" REMAPS
" Resize with arrow keys
nnoremap <Up>		<c-w>+
nnoremap <Down>		<c-w>-
nnoremap <Left>		<c-w><
nnoremap <Right>	<c-w>>
nnoremap <C-Up>		5<c-w>+
nnoremap <C-Down>	5<c-w>-
nnoremap <C-Left>	5<c-w><
nnoremap <C-Right>	5<c-w>>

" Switch source <-> header
nnoremap <silent> <C-H> :silent! call CurtineIncSw()<CR>

" Consistent Y
nnoremap Y y$

" Sensible ~
nnoremap ` ~
nnoremap ~ `

" Sensible :
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
