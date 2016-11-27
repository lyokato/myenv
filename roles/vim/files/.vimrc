execute pathogen#infect()
syntax on
filetype plugin indent on
set number
set expandtab
set tabstop=2
set shiftwidth=2
set hlsearch
set incsearch
set ignorecase
set smartcase
set title
set ruler
set wildmenu wildmode=list:full
set shell=/bin/bash
set rtp+=~/.fzf

let mapleader = ","
noremap \ ,
"noremap ; :

" airline
set laststatus=2

"============ FZF Setting ======================
let g:fzf_layout = { 'down': '~20%' }

"============ Navigation Setting  ===============

let NERDTreeShowHidden = 1
let g:nerdtree_tabs_open_on_console_startup=1
map <C-n> :NERDTreeTabsToggle<CR>

"============ Syntax  ===============

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"=========== Elixir Setting : Start =============

let g:syntastic_elixir_checkers = ['elixir']
let g:syntastic_enable_elixir_checker = 1
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': ['elixir']}

nnoremap <silent> <Leader>r :exec '!elixir ' . expand('%p') <CR>

"============ Color Setting : Color Schema  ======

if (empty($TMUX))
	if (has("nvim"))
		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif
	if (has("termguicolors"))
		set termguicolors
	endif
endif

colorscheme onedark

"============ Color Setting : Tabs  ======

hi TabLine     term=reverse cterm=reverse ctermfg=23 ctermbg=black
hi TabLineSel  term=bold cterm=bold,underline ctermfg=cyan
hi TabLineFill term=reverse cterm=reverse ctermfg=23 ctermbg=black


"============ Color Setting : Indent Guide ============
"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']
let g:indent_guides_auto_colors=0

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=237

"============ On Closing File, Automatically delete WhiteSpaces ======

autocmd BufWritePre * :FixWhitespace

"=========== Golang Setting : Start =============

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

"=========== C++ Setting : Start =============

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++ -D"WEBRTC_POSIX"'
