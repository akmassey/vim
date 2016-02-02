set guioptions-=T " hide toolbar
set lines=55 columns=120

set guifont=Hack:h14
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14
" set guifont=Liberation\ Mono\ for\ Powerline:h14
" set guifont=DejaVu\ Sans\ Mono:h14
" set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h14

" Emulate TextMate's shift left/right key commands (only works in MacVim)
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Emulate Firefox tab movement using the Command key
map <D-S-]> gt
map <D-S-[> gT
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>

" Setup keybindings for NERDCommenter
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <plug>NERDCommenterToggle<CR>i

" Stop the annoying bell
set vb

if has("autocmd")
  " Automatically resize splits when resizing MacVim window
  autocmd VimResized * wincmd =
endif

