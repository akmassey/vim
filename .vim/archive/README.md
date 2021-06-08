# Aaron Massey’s vim Configuration Archive

Every vim configuration is a work in progress.  I suppose I should be simply
relying on my git commit history here, but there’s a lot of noise there.  I’m
hoping that I can save someone some time by making a more intentional archive
of the bits of configuration that I once found useful.

## Plugins

Here's a list of plugins that I tried out at one point or another and that I'm
no longer using.

```vim
Plug 'vim-scripts/zoom.vim'
Plug 'psliwka/vim-smoothie'  " for smooth scrolling on normal mode movement commands
Plug 'milkypostman/vim-togglelist' " to toggle the quickfix and location lists
```

## vim-test

I really want to find this useful, but it just hasn't fit in my development
workflows.

```vim
" Testing support with vim-test {{{
Plug 'janko-m/vim-test'

" make test commands execute using dispatch.vim
let test#strategy = "dispatch"
let test#ruby#rspec#options = "--format progress --require ~/src/ruby/rspec-formatter/quickfix_formatter.rb --format QuickfixFormatter --out quickfix.out"
nnoremap <silent> <Leader>tn :TestNearest<CR>
nnoremap <silent> <Leader>tf :TestFile<CR>
nnoremap <silent> <Leader>ta :TestSuite<CR>
nnoremap <silent> <Leader>tl :TestLast<CR>
nnoremap <silent> <Leader>tv :TestVisit<CR>
" }}}
```

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

## Gutentag

I'm just not using tags for this sort of thing anymore.  Language server
protocol rules.

```vim
" Gutentags configuration {{{
"
" Much of this configuration is designed to avoid starting Gutentags for
" filetypes or buffers that really shouldn't have tags generated for them.
" Please see this GitHub issue for more information:
"     https://github.com/ludovicchabant/vim-gutentags/issues/178
Plug 'ludovicchabant/vim-gutentags'  " to automatically re-generate tags in the background
let g:gutentags_cache_dir = expand('~/.gutentags')
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root  = ['package.json', '.git', '.hg', '.svn']
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git', 'mail', 'vimwiki']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = ['--tag-relative=yes', '--fields=+ailmnS']
let g:gutentags_ctags_exclude = [
\  '*.git', '*.svn', '*.hg',
\  'cache', 'build', 'dist', 'bin', 'node_modules', 'bower_components',
\  '*-lock.json',  '*.lock',
\  '*.min.*',
\  '*.bak',
\  '*.zip',
\  '*.pyc',
\  '*.class',
\  '*.sln',
\  '*.csproj', '*.csproj.user',
\  '*.tmp',
\  '*.cache',
\  '*.vscode',
\  '*.pdb',
\  '*.exe', '*.dll', '*.bin',
\  '*.mp3', '*.ogg', '*.flac',
\  '*.swp', '*.swo',
\  '.DS_Store', '*.plist',
\  '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.svg',
\  '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
\  '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls',
\  '.fortune', '~/.mutt/temp/mutt-*',
\]
" }}}
```

## investigate.vim

No longer using investigate for help because I'm getting that through coc.nvim
now.

```vim
" investigate.vim configuration {{{
Plug 'Keithbsmiley/investigate.vim'  " search for help using gK
let g:investigate_use_dash=1
nnoremap <leader>K :call investigate#Investigate('n')<CR>
vnoremap <leader>K :call investigate#Investigate('v')<CR>
" }}}
```

## viewdoc

No longer using viewdoc mostly because I wasn't seen that much benefit from
it.

```vim
" viewdoc settings {{{
Plug 'powerman/vim-plugin-viewdoc'
let g:viewdoc_open = 'vnew'
let g:no_viewdoc_maps = 1
" }}}
```

## SuperTab

This was one of the first vim plugins I ever used, and I'm unable to do
anything except preserve it here for eternity.

```vim
" SuperTab {{{
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = 'context'
autocmd FileType *
      \ if &omnifunc != '' |
      \   call SuperTabChain(&omnifunc, "<c-p>") |
      \ endif
" Don't complete at the start of a line or after whitespace
let g:SuperTabNoCompleteAfter = ['^', ',', ';', '\s']
" }}}
```
