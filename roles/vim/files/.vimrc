call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'vim-airline/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'elixir-editors/vim-elixir'
Plug 'mattn/vim-goimports'
Plug 'cohama/lexima.vim'
call plug#end()

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

nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

"============ FZF Setting ======================
let g:fzf_layout = { 'down': '~20%' }

"============ Navigation Setting  ===============

let NERDTreeShowHidden = 1
let g:nerdtree_tabs_open_on_console_startup=1
map <C-n> :NERDTreeTabsToggle<CR>


if (empty($TMUX))
	if (has("nvim"))
		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif
	if (has("termguicolors"))
		set termguicolors
	endif
endif


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

autocmd ColorScheme * highlight Normal ctermbg=234
autocmd ColorScheme * highlight LineNr ctermbg=234
colorscheme onedark

set completeopt=menuone,noinsert
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"

