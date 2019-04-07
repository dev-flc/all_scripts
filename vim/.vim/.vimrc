"set nocompatible              " be iMproved, required

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

 set history=50		" keep 50 lines of command line history
" set ruler		" show the cursor position all the time
" set showcmd		" display incomplete commands
" set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" inoremap <C-U> <C-G>u<C-U>

syntax on
set cpo+=J
" set term=screen-256color " It is set by tmux a

set number
 "set background=black
 colors monokai
" let g:badwolf_html_link_underline = 0
" colorscheme badwolf
colorscheme molokai

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set autowrite
" set autochdir
set linebreak " 
set nobackup
set noswapfile " 

" set ttyfast
" set matchpairs+=<:>
" set hidden
" set ignorecase
" set smartcase
set wildignore+=*.aux,*.acn,*.acr,*.alg,*.glg,*.glo,*.gls,*.ist,*.log,*.out,*.toc,*.pdf,*.bbl,*.blg
set notimeout
set ttimeout
set timeoutlen=50

set gdefault " global replacement by default ':%s/s/S/g'
set wildmode=longest,list " autocompletion with Tab
set encoding=utf-8 " default utf-8 coding

" set laststatus=2 " The value of this option influences when the last window will have a status line:

" set spelllang=es

" easier navigation between split windows
" set winminheight=2 " 0 Allow windows to get fully squashed; 1 default

" Switch between windows, maximizing the currend window
nnoremap <C-J> <C-W>j<C-W>_
nnoremap <C-K> <C-W>k<C-W>_

" nnoremap <C-J> <C-W>j
" nnoremap <C-K> <C-W>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap Y y$ " Yank from cursor to eol

let mapleader=","
map <leader>n :tabnext<cr>
map <leader>p :tabprevious<cr>
map <leader>d :tabclose<cr>
map <leader>x :q!<cr>
map <leader>X :qa!<cr>
map <leader>f :CtrlP<cr>
map <leader>e :ccl<cr>
map <leader>t :CtrlPTag<cr>
map <leader>b :TagbarToggle<cr><c-w>l
map _ <cr>

"Faster shortcut for commenting. Requires T-Comment plugin
map <leader>c <c-_><c-_>

vmap <C-c> :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!xclip -selection c<CR>u

let xml_syntax_folding=1

" Customizing searches
set nohlsearch  " turn off highligh searches, but:
                " turn hlsearch off/on with C-N
nnoremap <silent> <C-N> :se invhlsearch<CR>
" set relativenumber
map <F5> :NERDTreeToggle<cr>

autocmd bufenter * if (winnr("$") == 1 && exists("<F5>:NERDTreeToggle") && b:NERDTreeToggle == "primary") | q | endif
