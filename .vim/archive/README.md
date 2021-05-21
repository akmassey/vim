# Aaron Massey’s vim Configuration Archive

Every vim configuration is a work in progress.  I suppose I should be simply
relying on my git commit history here, but there’s a lot of noise there.  I’m
hoping that I can save someone some time by making a more intentional archive
of the bits of configuration that I once found useful.

## Tagbar

I used to use Tagbar, but I’ve recently switched to Vista.

" Plug 'majutsushi/tagbar'

```vim
" LaTeX Configuration for TagBar {{{
let g:tagbar_type_plaintex = {
    \ 'ctagstype' : 'plaintex',
    \ 'kinds'     : [
        \ 's:sections',
        \ 'g:graphics:0:0',
        \ 'l:labels',
        \ 'r:refs:1:0',
        \ 'p:pagerefs:1:0'
    \ ],
    \ 'sort'    : 0,
\ }
" }}}
```

```vim
" gotags configuration for Tagbar {{{
let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
      \ },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
      \ }
" }}}

```

