set exrc
"set secure

" File find paths
"set path+=,/mnt/c/Users/starkus/source/repos/*

" No delay for <Esc>O
set timeoutlen=1000 ttimeoutlen=0

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
" Search for visually selected
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Show whitespaces
set list
set listchars=tab:\ ,space:·

" Other settings
set hidden
set nocompatible
filetype off
set lazyredraw
" set undofile " nooo

call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline' " Show buffer list on lightline
Plug 'ericcurtin/CurtineIncSw.vim' " Switch between source and header files
Plug 'wadackel/vim-dogrun' " Colorscheme
Plug 'NLKNguyen/c-syntax.vim' " Few more highlight groups
Plug 'haya14busa/vim-asterisk' " Better * and #
Plug 'justinmk/vim-dirvish' " Browse current buffer's directory with - and open another file
Plug 'markonm/traces.vim' " Realtime :s preview
Plug 'tommcdo/vim-exchange' " Swap
Plug 'tpope/vim-fugitive' " Git

call plug#end()

" Colorscheme
set t_Co=256
set background=dark
set laststatus=2
set noshowmode

" Asterisk
map * <Plug>(asterisk-*)
map # <Plug>(asterisk-#)
map g* <Plug>(asterisk-g*)
map g# <Plug>(asterisk-g#)
map z* <Plug>(asterisk-z*)
map z# <Plug>(asterisk-z#)
map gz* <Plug>(asterisk-gz*)
map gz# <Plug>(asterisk-gz#)

" Lightline
set showtabline=2
let g:lightline#bufferline#show_number = 2
let g:lightline = {
	\ 'colorscheme': 'dogrun',
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '', 'right': '' },
	\ 'active': {
		\ 'left': [['mode', 'paste'],
				\ ['readonly', 'filename', 'modified']],
		\ 'right': [['lineinfo']]
	\ },
	\ 'tabline': {
		\ 'left': [['buffers']]
	\ },
	\ 'component': {
		\ 'lineinfo': ' %3l:%-2v',
	\ },
	\ 'component_expand': {
		\ 'buffers': 'lightline#bufferline#buffers'
	\ },
	\ 'component_type': {
		\ 'buffers': 'tabsel'
	\ },
	\ 'component_function': {
		\ 'readonly': 'LightlineReadonly',
		\ 'fugitive': 'LightlineFugitive'
	\ }
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

" Extra C highlighting
hi cUserFunction ctermfg=yellow
hi cOperator ctermfg=red
hi cDelimiter ctermfg=lightblue
hi cType ctermfg=cyan
hi cConditional ctermfg=yellow
hi cRepeat ctermfg=yellow
hi cStorageClass ctermfg=lightgreen
hi cInclude ctermfg=darkmagenta
hi cDefine ctermfg=darkmagenta
hi PreProc ctermfg=darkmagenta
hi Comment ctermfg=darkgrey
colorscheme dogrun " Gvim hack, change colorscheme so highlights take effect.

" My silly tags
au BufRead,BufNewFile *.cpp syn match myTag "@\w\+"
au BufRead,BufNewFile *.h   syn match myTag "@\w\+"
hi myTag ctermfg=magenta

" No background
highlight Normal ctermbg=none

highlight Visual cterm=reverse ctermbg=black

" Context menu colors
highlight Pmenu ctermbg=darkgray ctermfg=lightgray
highlight PmenuSel ctermbg=yellow ctermfg=black

highlight VertSplit ctermbg=yellow ctermfg=black

highlight Search ctermbg=yellow ctermfg=black

" REMAPS
" Resize with arrow keys
nnoremap <Up>		<C-w>+
nnoremap <Down>		<C-w>-
nnoremap <Left>		<C-w><
nnoremap <Right>	<C-w>>
nnoremap <C-Up>		5<C-w>+
nnoremap <C-Down>	5<C-w>-
nnoremap <C-Left>	5<C-w><
nnoremap <C-Right>	5<C-w>>

" Switch source <-> header
nnoremap <silent> <C-H> :silent! call CurtineIncSw()<CR>

" Consistent Y
nnoremap Y y$

" Sensible ~
nnoremap ` ~
nnoremap ~ `
vnoremap ` ~
vnoremap ~ `

" Sensible :
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Move lines up and down
nnoremap <silent> <M-Up>	:m .-2<CR>
nnoremap <silent> <M-Down>	:m .+1<CR>
vnoremap <silent> <M-Up>	:m .-2<CR>
vnoremap <silent> <M-Down>	:m .+1<CR>

" I PRESS THIS BY ACCIDENT
nnoremap K k

" Bindings to make/remove C scopes blocks
" Close scope on new line and indent inside
:nnoremap <Leader>] o}<Esc>vi{>''
" Remove current scope and de-indent
:nnoremap <Leader>[ <i{Va{<Esc>'<dd'>dd
" Indent selected and close scope in new line
:vnoremap <Leader>] >'>o}<Esc>
" Put selection in new scope
:vnoremap <Leader>} >'<O{<Esc>'>o}<Esc>

" Switch tabline tabs
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" Close tabline tabs
nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>c0 <Plug>lightline#bufferline#delete(10)

" Project building/running
function! StartTerminal()
	if bufnr("terminal") == -1
		if filereadable("shell.bat")
			belowright call term_start("cmd.exe /k shell.bat", {'term_name':'terminal', 'vertical':1, 'term_cols':80, 'term_kill':'quit'})
		else
			belowright call term_start("cmd.exe", {'term_name':'terminal', 'vertical':1, 'term_cols':80, 'term_kill':'quit'})
		endif
	endif
	autocmd bufenter * if (winnr("$") == 1 && bufwinnr("terminal") == 1) | q! | endif
endfunction

function! ShowTerminal()
	if bufwinnr("terminal") == -1
		exe "vertical botright " . bufnr("terminal") . "sbuffer +vertical\\ resize\\ 80\\ |\\ wincmd\\ p"
		return 1
	else
		return 0
	endif
endfunction

function! HideTerminal()
	if bufwinnr("terminal") != -1
		exe bufwinnr("terminal") . "wincmd c"
		return 1
	else
		return 0
	endif
endfunction

function! ToggleTerminal()
	if bufnr("terminal") != -1
		if ShowTerminal() == 0
			call HideTerminal()
		endif
	endif
endfunction

command! -nargs=* Build :call term_sendkeys("terminal", g:build_command . " <args>\<CR>") | call ShowTerminal()
command! BuildR :call term_sendkeys("terminal", g:build_release_command . "\<CR>") | call ShowTerminal()
command! -nargs=* -complete=file Run :call term_sendkeys("terminal", g:run_command . " <args>\<CR>")
command! Debug :call term_sendkeys("terminal", g:debug_command . "\<CR>")

command! RunToCursor :call term_sendkeys("terminal", 'remedybg.exe run-to-cursor ' . expand('%:p') . ' ' . line('.') . "\<CR>")

cnoreabbrev b Build
cnoreabbrev br BuildR
cnoreabbrev r Run
cnoreabbrev wb write \| Build
cnoreabbrev d Debug

nnoremap <silent> <F10> :call ToggleTerminal()<CR>

" Windows Terminal
if &term =~ "xterm"
	let &t_SI = "\<Esc>[6 q"
	let &t_SR = "\<Esc>[7 q"
	let &t_EI = "\<Esc>[7 q"
endif

" Copy to Windows
let s:clip = '/mnt/c/Windows/System32/clip.exe'
autocmd TextYankPost * if v:event.operator ==# 'y' && v:event.regname ==# 'W' | call system(s:clip, @0) | endif

