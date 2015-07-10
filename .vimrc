set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Baseline Plugins
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-characterize'
Plugin 'wellle/targets.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-sensible'
Plugin 'machakann/vim-textobj-delimited'
Plugin 'gorkunov/smartpairs.vim'
Plugin 'edsono/vim-matchit'
Plugin 'chrisbra/vim-diff-enhanced'

" Slightly less baseline plugins
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
" Plugin 'godlygeek/tabular'
Plugin 'junegunn/vim-easy-align'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/zoom.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'Keithbsmiley/investigate.vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'szw/vim-ctrlspace'

" Search-related
" Commenting this out in favor of sneak
" Plugin 'Lokaltog/vim-easymotion'
Plugin 'justinmk/vim-sneak'
Plugin 'nelstrom/vim-visual-star-search'

" epub
" Plugin 'etnadji/vim-epub'

" Dash
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'

" Snippets
" Plugin "MarcWeber/vim-addon-mw-utils"
" Plugin "tomtom/tlib_vim"
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'rbonvall/snipmate-snippets-bib'

" Folding plugins
Plugin 'bimbalaszlo/vim-eightheader'

" LaTeX related
Plugin 'LaTeX-Box-Team/LaTeX-Box'
" Plugin 'vim-pandoc/vim-pandoc'
" Plugin 'vim-pandoc/vim-pandoc-syntax'

" Writing related
Plugin 'kana/vim-textobj-user'
Plugin 'reedes/vim-textobj-quote'
Plugin 'reedes/vim-textobj-sentence'
Plugin 'reedes/vim-wordy'

" HTML / XML related
Plugin 'tpope/vim-jdaddy'
Plugin 'tpope/vim-ragtag'

" Movement / file browsing plugins
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-vinegar'
Plugin 'kien/ctrlp.vim'
Plugin 'thoughtbot/pick.vim'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'majutsushi/tagbar'
" Plugin 'vim-scripts/VOoM'

" Improved terminal vim
Plugin 'sjl/vitality.vim'

" Git related plugins
Plugin 'tpope/vim-fugitive'
" Plugin 'airblade/vim-gitgutter'

" Ruby related plugins
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
" Plugin 'thoughtbot/vim-rspec'
Plugin 'vim-scripts/ruby-matchit'

" JavaScript related plugins
Plugin 'pangloss/vim-javascript'

" Python related plugins
Plugin 'klen/python-mode'

" Markdown related plugins
" Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-markdown'

" Google Go support
" Plugin 'jnwhiteh/vim-golang'
Plugin 'fatih/vim-go'

" Rust support
Plugin 'rust-lang/rust.vim'

" Testing support
" Plugin 'botandrose/vim-testkey'
Plugin 'janko-m/vim-test'

" Plugin colorschemes
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'therubymug/vim-pyte'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-vividchalk'
Plugin 'dsolstad/vim-wombat256i'
Plugin 'tomasr/molokai'
Plugin 'nanotech/jellybeans.vim'
Plugin 'akmassey/vim-codeschool'
Plugin 'twerth/ir_black'
Plugin 'jnurmine/Zenburn'
Plugin 'rainux/vim-desert-warm-256'
Plugin 'NLKNguyen/papercolor-theme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" AKM Reminder -- You can use :scriptnames to see which scripts are executed
" when loading vim.

" Map the leader to something more reasonable.  Also, keep the reverse
" motion command available by mapping it to the old leader key.
let mapleader=","
noremap \ ,

" Basic Settings
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

" Use a single location for temporary files and swap files.
set backupdir=~/.vim-backup,/tmp
set directory=~/.vim-swapfiles,/tmp

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
"
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
"
" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
"
" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" Set hidden so that all buffers are available to Vim-CtrlSpace
set hidden
" Hide the tabline and rely only on Vim-CtrlSpace
set showtabline=0

" Ensure airline fonts are loaded properly.  More info:
"     https://github.com/bling/vim-airline
let g:airline_powerline_fonts = 1

" Let airline clean up the tabline as well
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Custom Whitespace Modifiers
set textwidth=78
set backspace=indent,eol,start    " backspace through everything in insert mode
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs

" Show partially typed command sequences.
set showcmd

" Minimal number of lines to always show above/below the caret.
set scrolloff=3

" Set the title when you're in terminal mode
set title

" Statusline.
" %< truncation point
" \ space
" %f relative path to file
" %m modified flag [+] (modified), [-] (unmodifiable) or nothing
" %r readonly flag [RO]
" %y filetype [ruby]
" %= split point for left and right justification
" %-14.( %) block of fixed width 14 characters
" %l current line
" %c current column
" %V current virtual column as -{num} if different from %c
" %P percentage through buffer
set statusline=%#warningmsg#%*%<\ %f\ %m%r%y\ %=%-14.(%l,%c%V%)\ %P\

" non-GUI colorschemes
" set background=dark
" colorscheme solarized
" colorscheme darkerdesert
" colorscheme wombat
" colorscheme tomorrow-night-bright
colorscheme jellybeans

" GUI Settings {
if has("gui_macvim")
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

  source ~/.gvimrc
endif

" replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
" replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T
" manually specify a SneakNext and SneakPrevious
map ]z <Plug>SneakNext
map [z <Plug>SneakPrevious

" TODO: Figure out why this isn't working
if !has("gui_macvim")
  " Pick Configuration.  More info: https://github.com/thoughtbot/pick.vim/
  nnoremap <Leader>pf :call PickFile()<CR>
  nnoremap <Leader>pb :call PickBuffer()<CR>
endif


if has("autocmd")
  " make and python use real tabs
  au FileType make set noexpandtab
  au FileType python set ts=8 et sw=4 sts=4

  " disable syntastic for python in favor of using python-mode
  au FileType python let g:syntastic_ignore_files = ['\.py$']

  au FileType python set omnifunc=pythoncomplete#Complete
  au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  au FileType html set omnifunc=htmlcomplete#CompleteTags
  au FileType css set omnifunc=csscomplete#CompleteCSS
  au FileType xml set omnifunc=xmlcomplete#CompleteTags
  au FileType php set omnifunc=phpcomplete#CompletePHP
  au FileType c set omnifunc=ccomplete#Complete

  " These files are also Ruby.
  au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,Vagrantfile,Guardfile,config.ru} set ft=ruby

  " These files are also Markdown.
  au BufRead,BufNewFile *.{md,mdown,mkd,mkdn} set ft=markdown

  " These files are also muttrc files.
  au BufRead,BufNewFile *.muttrc set ft=muttrc

  " Ruby completions
  au FileType ruby,eruby set omnifunc=rubycomplete#Complete
  au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  au FileType ruby,eruby let g:rubycomplete_rails = 1
  au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

  " Go syntax highlighting and formatting
  au BufRead,BufNewFile *.go set filetype=go
  au FileType go nmap <Leader>s <Plug>(go-implements)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <Leader>gd <Plug>(go-doc)
  au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
  au FileType go nmap <Leader>r <Plug>(go-run)
  au FileType go nmap <Leader>b <Plug>(go-build)
  au FileType go nmap <Leader>t <Plug>(go-test)
  au FileType go nmap <Leader>c <Plug>(go-coverage)
  au FileType go nmap <Leader>ds <Plug>(go-def-split)
  au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dt <Plug>(go-def-tab)
  au FileType go nmap <Leader>e <Plug>(go-rename)

  " Unbreak 'crontab -e' with Vim:
  " http://drawohara.com/post/6344279/crontab-temp-file-must-be-edited-in-place
  au FileType crontab set nobackup nowritebackup

  " Use flowed text in email
  au FileType mail setlocal fo+=aw
  au FileType mail set spell
  au BufRead ~/.mutt/temp/mutt-* execute 'normal gg}'

  " Ensure spell checking is enabled for LaTeX
  au FileType plaintex,context,tex,latex set spell

endif

" Automatically convert things to smartquotes for these filetypes
augroup textobj_quote
  autocmd!
  autocmd FileType plaintex,context,tex,latex call textobj#quote#init()
  autocmd FileType markdown call textobj#quote#init()
  autocmd FileType textile call textobj#quote#init()
  autocmd FileType mail call textobj#quote#init()
  autocmd FileType text call textobj#quote#init({'educate': 0})
augroup END

" Center the screen more easily
nmap <space> zz

" Center the screen on searches
nmap n nzz
nmap N Nzz

set spelllang=en_us

" NERDCommenter for non-gui setup
map <Leader>/ <plug>NERDCommenterToggle<CR>
let NERDSpaceDelims=1

" Create a default build mapping
map <Leader>b :w<CR>:!./build<CR>

" vim-rspec mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" let g:rspec_command="!rspec -fp {spec}"

" Shortcut to toggle invisibles
nmap <Leader>i :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=nbsp:·,tab:▸\ ,trail:·,eol:¬
set list!

" Use context-based completion in SuperTab
if has("autocmd")
  autocmd FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>") |
    \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
    \ endif
endif
" Don't compelete at the start of a line or after whitespace
let g:SuperTabNoCompleteAfter = ['^', ',', ';', '\s']

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
"
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Allow easy opening of files in Marked
:nnoremap <Leader>m :silent !open -a "Marked 2.app" '%:p'<cr>:redraw!<cr>
" command! Marked :silent !open -a "Marked.app" expand("%:p")
" :nnoremap <Leader>m :silent !open -a "Marked.app" expand("%:p")

" Allow easy opening of files in Hemingway
" :nnoremap <Leader>h :silent !open -a 'Hemingway Editor.app' expand("%:p")<cr>
" command! Hemingway :silent open -a "Hemingway Editor.app" expand("%:p")<cr>

" OS X only due to use of `open`. Adapted from
" http://vim.wikia.com/wiki/Open_a_web-browser_with_the_URL_in_the_current_line
" Uses John Gruber's URL regexp: http://daringfireball.net/2010/07/improved_regex_for_matching_urls
" ruby << EOF
"   def open_uri
"     re = %r{(?i)\b((?:[a-z][\w-]+:(?:/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\((?:[^\s()<>]+|(?:\([^\s()<>]+\)))*\))+(?:\((?:[^\s()<>]+|(?:\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))}
"
"     line = VIM::Buffer.current.line
"     urls = line.scan(re).flatten
"
"     if urls.empty?
"       VIM::message("No URI found in line.")
"     else
"       system("open", *urls)
"       VIM::message(urls.join(" and "))
"     end
"   end
" EOF
"
" function! OpenURI()
"   ruby open_uri
" endfunction

" Open URL from this line (OS X only).
" map <Leader>w :call OpenURI()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BEGIN stuff from https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
" set t_ti= t_te=

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Since we just remapped the defaults for UltiSnips...
let g:UltiSnipsJumpForwardTrigger="]u"
let g:UltiSnipsJumpBackwardTrigger="[u"

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

" Enter a blank line above and below without entering insert mode
nnoremap <S-Enter> O<Esc>jo<Esc>
" Same as above, but reflow the line
nnoremap <C-Enter> O<Esc>jo<Esc>kgqap

" A command to preserve last search and cursor position after running another
" command.  See: http://vimcasts.org/episodes/tidying-whitespace/
function! Preserve(command) range
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
" Strip trailing whitespace
nmap <Leader>$ :call Preserve("%s/\\s\\+$//e")<CR>

" Reformat a program or structured document
nmap <Leader>= :call Preserve("normal gg=G")<CR>

" Reformat a plain text document to use hard wrapping and uniform spacing
"   Note: This uses the BSD `fmt` program.  The GNU coreutils version takes
"   different options.
nmap <Leader>f :call Preserve("%!fmt -s -78")<CR>
vnoremap <Leader>f :call Preserve("'<,'>!fmt -s -78")<CR>

" Filter Markdown
map <Leader>7 :call Preserve("%!poppins")<CR>

" Don't use Ex mode, use Q for formatting
" map Q gqap
map Q :call Preserve("normal gqap")<CR>

" Toggle NERDTree and Tagbar
map <Leader>8 :NERDTreeToggle<CR>
map <Leader>9 :TagbarToggle<CR>

" Rename current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('Rename this file as: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <Leader>n :call RenameFile()<cr>

" Promote variable to let for RSpec
" function! PromoteToLet()
"   :normal! dd
"   " :exec '?^\s*it\>'
"   :normal! P
"   :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
"   :normal ==
" endfunction
" :command! PromoteToLet :call PromoteToLet()
" :map <leader>p :PromoteToLet<cr>

" Switch Between Test and Production code
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

" Shortcut to writing a file as root from non-root vim
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" Flush CtrlP Cachce
nnoremap <silent> <leader>P :ClearCtrlPCache<cr>\|:CtrlP<cr>

" Searching options
set incsearch  " search while you're typing the search string
set hlsearch   " highlight search results
set ignorecase " ignore case when searching
set smartcase  " but if we search for big letters, make search case sensitive again

" Correct for common typos and mis-keys
command! Q q       " bind :Q to :q
command! W w       " bind :W to :w
command! Qall qall " bind :Qall to :qall
command! Qq qall   " bind :qq to :qall
command! Wqq wqall " bind :wqq to :qall

" Move based on screen-viewable lines
nnoremap <Up> gk
nnoremap <Down> gj

" Move visual block
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Repeat last substitution with &
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Setup indentation for Visual mode
xnoremap < <gv
xnoremap > >gv

" Saner way to copy / paste from the OS X system pasteboard
" TODO: turn these into functions that won't override these keyboard shortcuts
" vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
" nmap <C-v> :call setreg("\"", system("pbpaste"))<CR>p

" Use very magic for searches by default
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Wrap lines using BSD-style fmt command
vnoremap <Leader>f :call Preserve("'<,'>!fmt -s -78")<CR>

" TODO: add a mapping that allows you to automatically underline with '=' or
" '-' since that's very useful in markdown files.

" TODO: determine if you want to use these...
" " Fix space around equal signs
" map <Leader>= :s/\%V\(\w\)\s*=\s*\(\w\)/\1 = \2/g<CR>

" " Squeeze whitespace (while preserving indentation)
" map <Leader>s :s/\%V\(\S\)\s\+/\1 /g<CR>

" Delete blank lines
nnoremap <Leader>3 :call Preserve("g/^$/d")<CR>
vnoremap <Leader>3 :call Preserve("g/^$/d")<CR>

" Convert single spaces after a sentence to double spaces.
map <Leader>6 :call Preserve("%s/\\.\\s\\([A-Z]\\)/\\.  \\1/g")<CR>

" Squeeze newlines.
map <Leader>4 :call Preserve("%s/\\n\\n\\+/\\r\\r/g")<CR>

" " Split hash arguments into separate lines
" map <Leader>h :s/\s*,\s\+/,\r/g<CR>

" " Split statements into separate lines
" map <Leader>, :s/\s*;\s*/\r/g<CR>

" start NERDTree when opening vim
if (has("autocmd") && !(&ft=='mail'))
  autocmd VimEnter * NERDTree
  autocmd BufEnter * NERDTreeMirror
  autocmd VimEnter * wincmd w
endif

" Convert DOS-style carriage returns to UNIX-style
map <Leader>d :call Preserve("%s/\\r/\\r/g")<CR>

" Configure a different default test key
"   Hit <Leader><Enter> in any test file to save and run it.
"   Hit <Leader><Enter> in any other file to save it and rerun the last test.
let g:TestKey = { 'testkey': '<Leader><Enter>' }

" Use Silver Searcher instead of grep
set grepprg=ag

" Enable folding for LatexBox
" TODO: This does not currently seem to work.
let g:LatexBox_Folding = 1

" Ignore some LaTeX things in NERDTree
let NERDTreeIgnore = ['\.acn$', '\.acr$', '\.alg$', '\.aux$', '\.bbl$', '\.blg$', '\.dvi$', '\.fdb_latexmk$', '\.glg$', '\.glo$', '\.gls$', '\.idx$', '\.ilg$', '\.ind$', '\.ist$', '\.lof$', '\.log$', '\.lot$', '\.maf$', '\.mtc$', '\.mtc0$', '\.nav$', '\.nlo$', '\.out$', '\.pdfsync$', '\.ps$', '\.snm$', '\.synctex.gz$', '\.toc$', '\.vrb$', '\.xdy$', '\.tdo$', '\.make$', '\.temp$', '\.d$', '\.fls$', '\.run\.xml$', '\.bcf$' ]


" gotags configuration for Tagbar
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


" investigate.vim configuration
let g:investigate_use_dash=1
nnoremap <leader>K :call investigate#Investigate()<CR>

" Running one-off scripts...
"
" See this post for more information: http://www.oinksoft.com/blog/view/6/
let ft_stdout_mappings = {
      \'applescript': 'osascript',
      \'bash': 'bash',
      \'bc': 'bc',
      \'haskell': 'runghc',
      \'javascript': 'node',
      \'lisp': 'sbcl',
      \'nodejs': 'node',
      \'ocaml': 'ocaml',
      \'perl': 'perl',
      \'php': 'php',
      \'python': 'python',
      \'ruby': 'ruby',
      \'scheme': 'scheme',
      \'sh': 'sh',
      \'sml': 'sml',
      \'spice': 'ngspice'
      \}

for ft_name in keys(ft_stdout_mappings)
  execute 'autocmd Filetype ' . ft_name . ' nnoremap <buffer> <Leader>y :write !'
        \. ft_stdout_mappings[ft_name] . '<CR>'
endfor

let ft_execute_mappings = {
      \'c': 'gcc -o %:r -Wall -std=c99 % && ./%:r',
      \'erlang': 'escript %',
      \'pascal': 'fpc % && ./%:r'
      \}

for ft_name in keys(ft_execute_mappings)
  execute 'autocmd FileType ' . ft_name
        \. ' nnoremap <buffer> <Leader>y :write \| !'
        \. ft_execute_mappings[ft_name] . '<CR>'
endfor

" Added from: http://vim.wikia.com/wiki/Super_retab#Script
"
" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endfunction
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)
