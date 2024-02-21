-- Font
vim.opt.guifont = "mononoki_NF:h10:cANSI:qDRAFT"

vim.opt.encoding = "utf8"

-- File find paths
vim.opt.path:append "~/source/repos/*"

-- No delay for <Esc>O
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true

-- Line numbers
vim.opt.number = true

-- Formatting
vim.opt.formatoptions = "tcqj"
vim.opt.textwidth = 100

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.api.nvim_set_keymap("n", "<C-L>", ":nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>", { noremap=true, silent=true })
-- Search for visually selected
vim.api.nvim_set_keymap("v", "//", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>", {})

-- Show whitespaces
vim.opt.list = true
vim.opt.listchars = "tab: ,space:·"

-- Other settings
--filetype off
vim.opt.lazyredraw = true

-- REMAPS
-- Resize with arrow keys
vim.api.nvim_set_keymap("n", "<Up>", "<C-w>+", { noremap=true })
vim.api.nvim_set_keymap("n", "<Down>", "<C-w>-", { noremap=true })
vim.api.nvim_set_keymap("n", "<Left>", "<C-w><", { noremap=true })
vim.api.nvim_set_keymap("n", "<Right>", "<C-w>>", { noremap=true })
vim.api.nvim_set_keymap("n", "<C-Up>", "5<C-w>+", { noremap=true })
vim.api.nvim_set_keymap("n", "<C-Down>", "5<C-w>-", { noremap=true })
vim.api.nvim_set_keymap("n", "<C-Left>", "5<C-w><", { noremap=true })
vim.api.nvim_set_keymap("n", "<C-Right>", "5<C-w>>", { noremap=true })

-- Switch source <-> header
vim.cmd([[
function! SwitchSourceHeader()
	if match(expand("%"), '\.c') > 0
		let path = substitute(expand("%"), '\.c\(pp\)\?', '.h', "")
	elseif match(expand("%"), '\.h') > 0
		let path = substitute(expand("%"), '\.h\(pp\)\?', '.c', "")
	else
		return 0
	endif
	if filereadable(path)
		exe "e " . path
	elseif filereadable(path . "pp")
		exe "e " . path . "pp"
	endif
endfunction
]])
vim.api.nvim_set_keymap("n", "<C-H>", ":silent! call SwitchSourceHeader()<CR>", { noremap=true, silent=true })

-- Consistent Y
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap=true })

-- Sensible ~
vim.api.nvim_set_keymap("", "`", "~", { noremap=true })
vim.api.nvim_set_keymap("", "~", "`", { noremap=true })

-- Sensible :
vim.api.nvim_set_keymap("", ";", ":", { noremap=true })
vim.api.nvim_set_keymap("", ":", ";", { noremap=true })

-- Move lines up and down
vim.api.nvim_set_keymap("", "<M-Up>",		":m .-2<CR>", { noremap=true, silent=true })
vim.api.nvim_set_keymap("", "<M-Down>",	":m .+1<CR>", { noremap=true, silent=true })

-- I PRESS THIS BY ACCIDENT
vim.api.nvim_set_keymap("n", "K", "k", { noremap=true })

-- lazy.nvim
if false then
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)

	require("lazy").setup({})
end

vim.cmd([[

set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin('~/vimfiles/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'NLKNguyen/papercolor-theme' " Colorscheme
Plugin 'NLKNguyen/c-syntax.vim' " Few more highlight groups
Plugin 'haya14busa/vim-asterisk' " Better * and #
Plugin 'justinmk/vim-dirvish' " Browse current buffer's directory with - and open another file
Plugin 'markonm/traces.vim' " Realtime :s preview
Plugin 'tpope/vim-fugitive' " Git
Plugin 'jansedivy/jai.vim' " Jai syntax
Plugin 'mhinz/vim-startify' " Fancy splash screen

call vundle#end()

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
let g:lightline = {
	\ 'colorscheme': 'PaperColor',
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '', 'right': '' },
	\ 'active': {
		\ 'left': [ ['mode', 'paste'],
				\ ['readonly', 'filename', 'modified'] ],
		\ 'right': [ ['lineinfo'] ]
	\ },
	\ 'component': {
		\ 'lineinfo': ' %3l:%-2v',
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
colorscheme PaperColor " Gvim hack, change colorscheme so highlights take effect.

" My silly tags
au BufRead,BufNewFile *.cpp syn match myTag "@\w\+"
au BufRead,BufNewFile *.h   syn match myTag "@\w\+"
hi myTag ctermfg=magenta

au BufRead,BufNewFile *.fab set syntax=jai

" No background
highlight Normal ctermbg=none

highlight Visual cterm=reverse ctermbg=black

" Context menu colors
highlight Pmenu ctermbg=darkgray ctermfg=lightgray
highlight PmenuSel ctermbg=yellow ctermfg=black

highlight VertSplit ctermbg=yellow ctermfg=black

highlight Search ctermbg=yellow ctermfg=black

" Bindings to make/remove C scopes blocks
" Close scope on new line and indent inside
:nnoremap <Leader>] o}<Esc>vi{>''
" Remove current scope and de-indent
:nnoremap <Leader>[ <i{Va{<Esc>'<dd'>dd
" Indent selected and close scope in new line
:vnoremap <Leader>] >'>o}<Esc>
" Put selection in new scope
:vnoremap <Leader>} >'<O{<Esc>'>o}<Esc>

" Startify
let g:startify_bookmarks = [
	\'~/source/repos/sparkus',
	\'~/source/repos/survival',
	\'~/source/repos/compiler',
	\'~/source/repos/3dvania',
	\'~/source/repos/physics']
let g:startify_change_cmd = 'cd'
let g:startify_lists = [ { 'type': 'bookmarks', 'header': ['	Projects'] } ]
let g:startify_custom_header = [
\'      ____     ____  ____  _____     _____',
\'      \   \\  /   // |  || |    \\  /    ||',
\'       \   \\/   //  |  || |     \\/     ||',
\'        \   V   //   |  || |  |\  V  /|  ||',
\'         \     //    |  || |  ||\   //|  ||',
\'          \___//     |__|| |__|| \_// |__||']
autocmd User StartifyBufferOpened so .vimrc

cnoreabbrev b Build
cnoreabbrev br BuildR
cnoreabbrev r Run
cnoreabbrev wb write \| Build
cnoreabbrev d Debug

" No Windows remaps
silent! vunmap <C-X>
silent! vunmap <C-C>
silent! vunmap <C-V>
]])
