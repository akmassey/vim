set nocompatible

" you should probably examine spacevim for plugins:
" https://github.com/SpaceVim/SpaceVim/blob/dev/autoload/SpaceVim/plugins.vim

" initialize vim-plug
call plug#begin('~/.vim/plugged')

" Baseline Plugins {{{
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround' " to manage surrounding parens, brackets, quotes, etc...
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'  " Press crs (coerce to snake_case). MixedCase (crm), camelCase (crc), snake_case (crs), and UPPER_CASE (cru).
" Plug 'jdelkins/vim-correction'  " automatic spelling correction based on vim-abolish
Plug 'tpope/vim-repeat'   " to repeat Plugin-mapped commands
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-dispatch' " for asyncrhonous Make
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-rsi'
" Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
if !has('nvim')
  Plug 'tpope/vim-sensible'
endif
Plug 'wellle/targets.vim'
Plug 'machakann/vim-textobj-delimited'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'duggiefresh/vim-easydir'
" Plug 'wincent/terminus'  " enhanced terminal support
" Plug 'neomake/neomake'  " could replace vim-dispatch and syntastic
Plug 'sbdchd/neoformat'
Plug 'akmassey/vim-cheat' " personal vim cheatsheet
" Plug 'b4winckler/vim-angry'
" Plug 'gorkunov/smartpairs.vim'
" }}}

" Slightly less baseline plugins {{{
" Plug 'scrooloose/syntastic'
" let g:syntastic_mode_map = { "mode": "active", "passive_filetypes": ["python"] }
" Plug 'akmassey/syntastic_proselint'
Plug 'w0rp/ale'
nmap <silent> [w <Plug>(ale_previous_wrap)
nmap <silent> ]w <Plug>(ale_next_wrap)
let g:ale_sign_error = 'EE'
let g:ale_sign_warning = 'WW'
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/zoom.vim'
" Plug 'severin-lemaignan/vim-minimap'  " <Leader>mm to see the minimap
Plug 'ntpeters/vim-better-whitespace'  " highlight unnecessary whitespace
Plug 'AndrewRadev/splitjoin.vim'  " gS to split and gJ to join
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
" Plug 'mbadran/headlights'
Plug 'myusuf3/numbers.vim'
Plug 'ktonga/vim-follow-my-lead'
Plug 'Keithbsmiley/investigate.vim'
Plug 'powerman/vim-plugin-viewdoc'
" }}}

" " SuperTab {{{
Plug 'ervandew/supertab'
" let g:SuperTabDefaultCompletionType = 'context'
" autocmd FileType *
"       \ if &omnifunc != '' |
"       \   call SuperTabChain(&omnifunc, "<c-p>") |
"       \ endif
" " Don't complete at the start of a line or after whitespace
" let g:SuperTabNoCompleteAfter = ['^', ',', ';', '\s']
" " }}}

" YouCompleteMe {{{
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
let g:ycm_min_num_identifier_candidate_chars = 2
" }}}

" UltiSnips {{{
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'

" Force Python2 for YCM compatibility
let g:UltiSnipsUsePythonVersion = 3

let g:UltiSnipsExpandTrigger="<Leader>j"
let g:UltiSnipsJumpForwardTrigger="<Leader>j"
let g:UltiSnipsJumpBackwardTrigger="<Leader>k"

function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
au BufEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

let g:UltiSnipsSnippetsDir=$HOME.".vim/UltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "plugged/vim-snippets/UltiSnips/"]
let g:UltiSnipsEnableSnipMate=0
let g:UltiSnipsEditSplit="vertical"

" vim-snippets variables:
let g:snips_author = "Aaron Massey"
let g:snips_email = "akmassey@umbc.edu"
let g:snips_github = "https://github.com/akmassey"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" }}}

" " nvim-completion-manager {{{
" Plug 'roxma/nvim-completion-manager'
" Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}

" " Requires vim8 with has('python') or has('python3')
" " Requires the installation of msgpack-python. (pip install msgpack-python)
" if !has('nvim')
"     Plug 'roxma/vim-hug-neovim-rpc'
" endif

" " To manage required python3 modules
" Plug 'roxma/python-support.nvim'

" " for python completions
" let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'jedi')
" " language specific completions on markdown file
" let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'mistune')

" " utils, optional
" let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'psutil')
" let g:python_support_python3_requirements = add(get(g:,'python_support_python3_requirements',[]),'setproctitle')

" " Ensure UltiSnips is recognized
" let g:cm_completed_snippet_engine = "ultisnips"

" " tab completion, replaces SuperTab
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" " " to complete snippets with <Enter> in the popup menu
" " inoremap <expr> <silent> <CR>  (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<C-g>u<CR>")
" " inoremap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-U>":"\<CR>")

" " inoremap <expr> <silent> <cr> pumvisible() ? "<c-y>" : "<c-g>u<cr>"
" " }}}

" " completer.vim {{{
" Plug 'maralla/completor.vim'
" let g:completer_python_binary = '/usr/local/bin/python3'
" let g:completer_node_binary = '/Users/masseya/.nvm/versions/node/v6.3.0/bin/node'
" let g:completer_min_chars = 4
" " }}}

" Search-related plugins {{{
" Commenting this out in favor of sneak
" Plug 'Lokaltog/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'nelstrom/vim-visual-star-search'

Plug 'junegunn/fzf.vim'

" Configure fzf using Homebrew
set rtp+=/usr/local/opt/fzf

" Replace ctrlP
nnoremap <C-p> :Files<CR>

" Search for any file in the home directory
nnoremap <C-e> :Files ~<CR>

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

Plug 'junegunn/vim-slash'
Plug 'wincent/scalpel'  " for improved search/replace for words under the cursor
Plug 'mileszs/ack.vim'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

if executable('rg')
  let g:ackprg = 'rg --vimgrep'
  set grepprg=rg\ --vimgrep

  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif
" }}}

" Random Language or Markup related plugins {{{
Plug 'tpope/vim-haml'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-ragtag'
Plug 'vim-scripts/paredit.vim'
Plug 'sukima/xmledit'
" }}}

" Email-related plugins {{{
Plug 'vim-scripts/CheckAttach.vim'
" }}}

" epub plugins
" Plug 'etnadji/vim-epub'

" Dash plugins {{{
Plug 'rizzatti/funcoo.vim'
Plug 'rizzatti/dash.vim'
" }}}

" deoplete and neosnippet for Completion {{{
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

" Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'

" "Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" " Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
" " Use deoplete.
" let g:deoplete#enable_at_startup = 1
" " Use smartcase.
" let g:deoplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
" let g:deoplete#auto_complete_start_length = 4
" " Add a bit more delay before completion
" let g:deoplete#auto_complete_delay = 100

" inoremap <expr><C-g>     deoplete#undo_completion()
" " inoremap <expr><C-l>     deoplete#complete_common_string()

" " <CR>: close popup and save indent.
" " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" " inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
" " <Space>: close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? "\<C-y>\<Space>" : "\<Space>"
" " <TAB>: completion.
" " inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

" " SuperTab like snippets behavior.
" " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" inoremap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" snoremap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" inoremap <expr><C-y> neosnippet#expandable_or_jumpable() ? 
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<Enter>"

" " Enable heavy omni completion.
" if !exists('g:deoplete#sources#omni#input_patterns')
"   let g:deoplete#sources#omni#input_patterns = {}
" endif
" "let g:deoplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" "let g:deoplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
" "let g:deoplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" " For perlomni.vim setting.
" " https://github.com/c9s/perlomni.vim
" let g:deoplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" " Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
" }}}

" Folding plugins
" Plug 'bimbalaszlo/vim-eightheader'

" LaTeX related plugins {{{
" Plug 'lervag/vimtex'
Plug 'LaTeX-Box-Team/LaTeX-Box'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" }}}

" Writing related plugins {{{
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'reedes/vim-textobj-quote'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-pencil'
" }}}

" Movement / file browsing plugins {{{
Plug 'scrooloose/nerdtree'
" Plug 'tpope/vim-vinegar'
" Plug 'vim-scripts/bufexplorer.zip'
Plug 'majutsushi/tagbar'
Plug 'justinmk/vim-dirvish'
" Plug 'vim-scripts/VOoM'
" }}}

" Terminal or tmux vim plugins
if has('nvim')
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175
endif
" Plug 'sjl/vitality.vim'
let g:vitality_fix_focus=0  " don't enable focus events
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
if has('nvim')
  nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
endif
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>
if !has('gui_running')
  if !has('nvim')
    set term=xterm-256color
  endif
endif

" Git related plugins plugins
Plug 'tpope/vim-fugitive' | Plug 'junegunn/gv.vim'
" Plug 'mhinz/vim-signify'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Ruby related plugins {{{
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
" Plug 'thoughtbot/vim-rspec'
Plug 'vim-scripts/ruby-matchit'
Plug 'nelstrom/vim-textobj-rubyblock'
" }}}

" JavaScript related plugins {{{
Plug 'moll/vim-node'
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
" }}}

" Python related plugins {{{
Plug 'python-mode/python-mode'
let g:pymode_lint_cwindow=0  " don't automatically open the cwindow
" Plug 'davidhalter/jedi-vim'
" Plug 'nvie/vim-flake8'
" }}}

" Markdown related plugins {{{
Plug 'tpope/vim-markdown'
Plug 'junegunn/goyo.vim'
let g:goyo_width=85
function! s:goyo_enter()
  set nonumber
  set norelativenumber
  NumbersDisable
endfunction
function! s:goyo_leave()
  set number
  set relativenumber
  NumbersEnable
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}

" TOML syntax
Plug 'cespare/vim-toml'

" Google Go support
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Rust support
Plug 'rust-lang/rust.vim'

" Testing support
" Plug 'botandrose/vim-testkey'
Plug 'janko-m/vim-test'

" Colorschemes {{{
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'therubymug/vim-pyte'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-vividchalk'
Plug 'dsolstad/vim-wombat256i'
Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'
Plug 'akmassey/vim-codeschool'
Plug 'twerth/ir_black'
Plug 'jnurmine/Zenburn'
Plug 'rainux/vim-desert-warm-256'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jacoborus/tender.vim'
" }}}

" we want this one to load last
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Enable the builtin matchit plugin, requires vim version > 8.0
if !has('nvim')
  packadd! matchit
endif

" AKM Reminder -- You can use :scriptnames to see which scripts are executed
" when loading vim.

" Map the leader to something more reasonable.  Also, keep the reverse
" motion command available by mapping it to the old leader key.
let mapleader=","
let maplocalleader=","
noremap \ ,

" Timeout Settings {{{
set timeout
set timeoutlen=500
" }}}

" Basic Settings {{{
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

" Show partially typed command sequences.
set showcmd

" Minimal number of lines to always show above/below the caret.
set scrolloff=3

" Set the title when you're in terminal mode
set title

" Alternative to escape
inoremap jk <Esc>
" }}}

" Folding Settings {{{
" Toggle folds more easily
nnoremap <Leader><Space> za

set foldlevelstart=4
" }}}

" Neovim miscellaneousness {{{
" Don't forget to pip install --upgrade neovim and do the same for pip3
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
" }}}

" Finding files {{{
set path +=**  " Recursive search into subfolders enables tab completion for many file-related tasks.
set wildmenu   " Display all matching files when tab completing
" }}}

" Airline Settings {{{
"     More info: https://github.com/bling/vim-airline
let g:airline_powerline_fonts = 1

" Set airline colorscheme
let g:airline_theme = 'jellybeans'

" Let airline clean up the tabline as well
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" }}}

" Ensure line numbers are not shown in these file types.
let g:numbers_exclude = ['unite', 'tagbar', 'startify', 'vimshell', 'w3m', 'nerdtree']
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" User <Leader>fml to open leader mappings
" Show leaders for plugins as well as ~/.vimrc
let g:fml_all_sources = 1

" Mappings to edit and source vim configuration
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}

" Custom Whitespace Modifiers {{{
set textwidth=78
set backspace=indent,eol,start    " backspace through everything in insert mode
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
" }}}

" Statusline settings {{{
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
" }}}

" non-GUI colorschemes
" set background=dark
" colorscheme solarized
" colorscheme darkerdesert
" colorscheme wombat
" colorscheme tomorrow-night-bright
colorscheme jellybeans
" colorscheme tender
if has("termguicolors")
  set termguicolors
endif

" GUI Settings {{{
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

  " Setup keybindings for tpope's vim-commentary
  map <D-/> gcc
  map <Leader>c gcc

  " Stop the annoying bell
  set vb

  source ~/.gvimrc
endif
" }}}

" Scalpel settings {{{
" Use <Leader>s instead of default <Leader>e:
nmap <Leader>s <Plug>(Scalpel)
" }}}

" Sneak settings {{{
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
" }}}

" Open files in directory of current file with Leader mappings
cnoremap <expr> %% expand('%:h').'/'
map <Leader>e :edit %%
map <Leader>v :view %%

" AutoCommand Settings {{{
if has("autocmd")
  " make and python use real tabs
  au FileType make set noexpandtab
  au FileType python set ts=8 et sw=4 sts=4
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

  " Settings for composing email {{{
  au FileType mail setlocal formatoptions+=aw
  au FileType mail setlocal textwidth=72 foldmethod=manual
  au FileType mail set spell
  au FileType mail set colorcolumn=78
  au FileType mail call goyo#execute(0, 85)
  au BufNewFile,BufRead ~/.mutt/temp/mutt-* execute 'normal gg}'
  " }}}

  " Ensure spell checking is enabled for LaTeX and Markdown
  au FileType plaintex,context,tex,latex,markdown set spell

  " Word count macro for LaTeX
  au FileType plaintex,context,tex,latex nmap <Leader>w :!texcount %<CR>

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
" }}}

" Center the screen more easily {{{
nmap <Space> zz

" Center the screen on searches
nmap n nzz
nmap N Nzz
" }}}

" Mappings for Spelling {{{
set spelllang=en_us

" Some spelling-related stuff from here:
" https://vi.stackexchange.com/questions/68/autocorrect-spelling-mistakes
"
" Go back to last misspelled word and pick first suggestion.
inoremap <C-L> <C-G>u<Esc>[s1z=`]a<C-G>u

" Select last misspelled word (typing will edit).
nnoremap <C-K> <Esc>[sve<C-G>
inoremap <C-K> <Esc>[sve<C-G>
snoremap <C-K> <Esc>b[sviw<C-G>

" Replace a misspelled word with the first suggestion.
nnoremap <C-S> [s1z=
inoremap <C-S> [s1z=
snoremap <C-S> [s1z=
"}}}

" Toggle Undotree {{{
nnoremap <Leader>u :UndotreeToggle<CR>
" }}}

" vim-test mappings {{{
" make test commands execute using dispatch.vim
let test#strategy = "dispatch"
let test#ruby#rspec#options = "--format progress --require ~/src/ruby/rspec-formatter/quickfix_formatter.rb --format QuickfixFormatter --out quickfix.out"
nnoremap <silent> <Leader>t :TestNearest<CR>
nnoremap <silent> <Leader>T :TestFile<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>g :TestVisit<CR>
" }}}

" Invisibles Settings {{{
" Shortcut to toggle invisibles
nmap <Leader>i :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=nbsp:·,tab:▸\ ,trail:·,eol:¬
set list!

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
" }}}

" LatexBox settings {{{
" Currently, there's a bug in vimtex that doesn't let SuperTab work
" let g:vimtex_complete_enabled=0
let g:LatexBox_Folding=1
let g:LatexBox_latexmk_options = "-bibtex -pdf"
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_quickfix=2
" let g:LatexBox_quickfix=4 " only open errors in the quickfix list
" let g:LatexBox_show_warnings=0 " don't show warnings as errors

" Set FastFold options
let g:tex_fold_enabled=1
let g:vimsyn_folding='af'
let g:xml_syntax_folding = 1

" Toggle the display of the LaTeX Table of Contents window
nnoremap <LocalLeader>lt :LatexTOCToggle<CR>
" Other LaTeX mappings:
"
"<LocalLeader>ll                                                     |:Latexmk|
"        Compile with latexmk.
"<LocalLeader>lL                                                    |:Latexmk!|
"        Force compilation with latexmk.
"<LocalLeader>lc                                                |:LatexmkClean|
"        Clean temporary output from LaTeX.
"<LocalLeader>lC                                               |:LatexmkClean!|
"        Clean all output from LaTeX.
"<LocalLeader>lk                                                 |:LatexmkStop|
"        Stop latexmk if it is running.
"<LocalLeader>lg                                               |:LatexmkStatus|
"        Show the running status of latexmk for the current buffer.
"<LocalLeader>lG                                              |:LatexmkStatus!|
"        Show the running status of latexmk for all buffers with process group
"        ID's.
"<LocalLeader>le                                                 |:LatexErrors|
"        Load the log file for the current document and jump to the first error.
" }}}

" EasyAlign Settings {{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
"
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" Allow easy opening of files in Marked
:nnoremap <Leader>m :silent !open -a "Marked 2.app" '%:p'<cr>:redraw!<cr>

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

" Clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

" Enter a blank line above and below without entering insert mode
nnoremap <S-Enter> O<Esc>jo<Esc>
" Same as above, but reflow the line
nnoremap <C-Enter> O<Esc>jo<Esc>kgqap

" Preserve Commands {{{
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
nnoremap <Leader>$ :call Preserve("%s/\\s\\+$//e")<CR>

" Reformat a program or structured document
nnoremap <Leader>= :call Preserve("normal gg=G")<CR>

" Reformat a plain text document to use hard wrapping and uniform spacing
"   Note: This uses the BSD `fmt` program.  The GNU coreutils version takes
"   different options.
nnoremap <Leader>f :call Preserve("%!fmt -s -78")<CR>
vnoremap <Leader>f :call Preserve("'<,'>!fmt -s -78")<CR>

" Filter Markdown
map <Leader>7 :call Preserve("%!poppins")<CR>
let g:vim_markdown_frontmatter=1

" Don't use Ex mode, use Q for formatting
" map Q gqap
nnoremap Q :call Preserve("normal gqap")<CR>
nnoremap <Leader>Q :call Preserve("normal vapJgqap")<CR>
" }}}

" Toggle NERDTree and Tagbar
map <Leader>8 :NERDTreeToggle<CR>
map <Leader>9 :TagbarToggle<CR>

" Function to rename current file {{{
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
" }}}

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

" Searching options
set incsearch  " search while you're typing the search string
set hlsearch   " highlight search results
set ignorecase " ignore case when searching
set smartcase  " but if we search for big letters, make search case sensitive again

" Correct for common command typos and mis-keys {{{
command! W w
command! Wa wall
command! Q q
command! Qall qall
command! Qq qall
command! Wqq wqall
command! WQa wqall
" }}}

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

" Send last yanked text to system pasteboard
nnoremap <Leader>y :call system('nc localhost 8377', @0)<CR>

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
" TODO: Doesn't currently handle ?, !, or sentences ending in a quotation.
map <Leader>6 :call Preserve("%s/\\.\\s\\([A-Z]\\)/\\.  \\1/g")<CR>

" Squeeze newlines.
map <Leader>4 :call Preserve("%s/\\n\\n\\+/\\r\\r/g")<CR>

" " Split hash arguments into separate lines
" map <Leader>h :s/\s*,\s\+/,\r/g<CR>

" " Split statements into separate lines
" map <Leader>, :s/\s*;\s*/\r/g<CR>

" Convert DOS-style carriage returns to UNIX-style
map <Leader>d :call Preserve("%s/\\r/\\r/g")<CR>

" Configure a different default test key
"   Hit <Leader><Enter> in any test file to save and run it.
"   Hit <Leader><Enter> in any other file to save it and rerun the last test.
let g:TestKey = { 'testkey': '<Leader><Enter>' }

" viewdoc settings {{{
let g:viewdoc_open = 'new'
" }}}

" NERDTree Settings {{{
" Start NERDTree when opening vim
" if (has("autocmd") && !(&ft=='mail'))
"   autocmd VimEnter * NERDTree
"   autocmd BufEnter * NERDTreeMirror
"   autocmd VimEnter * wincmd w
" endif

" Ignore some LaTeX things in NERDTree
let NERDTreeIgnore = ['\.acn$', '\.acr$', '\.alg$', '\.aux$', '\.bbl$', '\.blg$', '\.dvi$', '\.fdb_latexmk$', '\.glg$', '\.glo$', '\.gls$', '\.idx$', '\.ilg$', '\.ind$', '\.ist$', '\.lof$', '\.log$', '\.lot$', '\.maf$', '\.mtc$', '\.mtc0$', '\.nav$', '\.nlo$', '\.out$', '\.pdfsync$', '\.ps$', '\.snm$', '\.synctex.gz$', '\.toc$', '\.vrb$', '\.xdy$', '\.tdo$', '\.make$', '\.temp$', '\.d$', '\.fls$', '\.run\.xml$', '\.bcf$', '\.orig$' ]

" Disable display of '?' text and 'Bookmarks' label.
let g:NERDTreeMinimalUI=1

" Let <Leader><Leader> (^#) return from NERDTree window.
let g:NERDTreeCreatePrefix='silent keepalt keepjumps'

" Single-click to toggle directory nodes, double-click to open non-directory
" nodes.
let g:NERDTreeMouseMode=2

" Would be useful mappings, but they interfe with my default window movement
" bindings (<C-j> and <C-k>).
let g:NERDTreeMapJumpPrevSibling='<Nop>'
let g:NERDTreeMapJumpNextSibling='<Nop>'
" }}}

" TODO: Add functionality from Wincent here:
" https://www.youtube.com/watch?v=OgQW07saWb0
" if has('autocmd')
  " augroup akmNERDTree
    " autocmd!
    " autocmd User NERDTreeInit call autocmds#attempt_select_last_file()
  " augroup END
" endif

" function! autocmds#attempt_select_last_file()
  " let l:previous=expand('#:t')
  " if l:previous != ''
    " call search('\v<' . l:previous . '>')
  " endif
" endfunction

" " Move up a directory using "-" like vim-vinegar (usually "u" does this).
" nmap <buffer> <expr> - g:NERDTreeMapUpdir

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

" investigate.vim configuration {{{
let g:investigate_use_dash=1
nnoremap <leader>K :call investigate#Investigate('n')<CR>
vnoremap <leader>K :call investigate#Investigate('v')<CR>
" }}}

" Running one-off scripts...  {{{
" TODO: Add Go and Rust mappings
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
      \'python3': 'python3',
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
" }}}

" Commands to convert spaces to tabs and vice versa.  {{{
" Added from: http://vim.wikia.com/wiki/Super_retab#Script
"
" These commands are provided:
"
" Space2Tab – Convert spaces to tabs, only in indents.
" Tab2Space – Convert tabs to spaces, only in indents.
" RetabIndent – Execute Space2Tab (if 'expandtab' is set), or Tab2Space
" (otherwise).
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
" }}}

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

" vim:fdm=marker:foldlevel=0
