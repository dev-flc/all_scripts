" Vim filetype plugin file
" Language:	C++
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jan 15

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Behaves just like C
runtime! ftplugin/c.vim ftplugin/c_*.vim ftplugin/c/*.vim

setlocal cindent

if filereadable("Makefile")
  setlocal makeprg=make
else
  setlocal makeprg=clear\ &&\ g++\ -Wall\ -o\ %<\ %
endif

setlocal formatprg=astyle\ -s4pHA10YfU

set colorcolumn=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

map <F2> :make<CR><CR>
imap <F2> <Esc> :make<CR><CR>

