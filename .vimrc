set nocompatible

" initialize vim-plug
call plug#begin('~/.vim/plugged')

" Baseline Plugins {{{
Plug 'tpope/vim-endwise'               " to end certain structures automatically  (adding 'end' in Ruby, etc...)
Plug 'tpope/vim-surround'              " to manage surrounding parens, brackets, quotes, etc...
Plug 'tpope/vim-unimpaired'            " mappings for [ and ], including toggles for options and encodings
Plug 'tpope/vim-abolish'               " press crs (coerce to snake_case). MixedCase (crm), camelCase (crc), snake_case (crs), and UPPER_CASE (cru).
Plug 'tpope/vim-repeat'                " to repeat Plugin-mapped commands
Plug 'tpope/vim-characterize'          " update `ga' for modern text encodings like emoji
Plug 'tpope/vim-dispatch'              " for asyncrhonous Make
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-rsi'                   " for readline style insertion shortcuts
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-eunuch'                " for UNIX commands like :Mkdir, :Cfind, and :Wall
Plug 'tpope/vim-commentary'            " to comment things in or out
Plug 'tpope/vim-speeddating'           " to increment / decrement dates
if !has('nvim')
  Plug 'tpope/vim-sensible'            " more sensible defaults that are built into nvim
endif
Plug 'wellle/targets.vim'              " better text objects for selections (e.g., `vi)' and the like)
Plug 'machakann/vim-textobj-delimited' " better repeated selections of text objects (e.g., `vi)i)' and the like)
Plug 'gorkunov/smartpairs.vim'         " to progressively select larger scopes using 'v' again
Plug 'sbdchd/neoformat'                " for simple code formatting
Plug 'ConradIrwin/vim-bracketed-paste' " to automatically set paste when pasting in Insert mode
Plug 'akmassey/vim-cheat'              " personal vim cheatsheet  (:h cheat)
" }}}

" Reminder -- You can use :scriptnames to see which scripts are executed when
" loading vim.

" Map the leader to something more reasonable.  Also, keep the reverse  {{{
" motion command available by mapping it to the old leader key.
let mapleader=","
let maplocalleader=","
noremap \ ,
" }}}

" Enable the mouse, not that you use it much {{{
if has('mouse')
  set mouse=a
endif
" }}}

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
set backupdir=~/.vim/backup,/tmp
set directory=~/.vim/swapfiles,/tmp

" Setup a permanent undo file to ensure you can just re-launch and undo
" changes.
set undodir=~/.vim/undos
set undofile

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

" Prefer vertical splits for diffs
set diffopt+=vertical

" Alternatives to escape
inoremap jk <Esc>
map <F1> <Esc>
imap <F1> <Esc>
" }}}

" Folding Settings {{{
nnoremap <Leader><Space> za
set foldlevelstart=4
" }}}

" TODO: Maybe put some checks around this to ensure the file exists?
let g:ruby_path='/usr/local/opt/rbenv/shims/ruby'
let g:ruby_host_prog = '/usr/local/opt/rbenv/shims/neovim-ruby-host'

" Asynchronous Linting Engine configuration {{{
Plug 'dense-analysis/ale'
nmap <silent> [w <Plug>(ale_previous_wrap)
nmap <silent> ]w <Plug>(ale_next_wrap)
let g:ale_sign_error = 'EE'
let g:ale_sign_warning = 'WW'
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" I would like to disable ale entirely for the 'mail' filetype, but this seems
" good enough for now.
let g:ale_linters = {
\   'mail': [],
\   'javascript': ['prettier', 'eslint'],
\   'tex': ['chktex', 'proselint', 'textlint', 'vale'],
\   'go': ['gopls'],
\   'markdown' : ['prettier', 'textlint', 'vale', 'proselint', 'mdl'],
\   'python' : ['flake8', 'pylint'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'python': ['autopep8', 'yapf'],
\   'bib': ['bibclean'],
\}

let g:ale_fix_on_save = 1
" }}}

" Slightly less baseline plugins {{{
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'chrisbra/vim-diff-enhanced'      " to use the patience diff algorithm
Plug 'AndrewRadev/splitjoin.vim'  " gS to do multi-line split and gJ to do multi-line join
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
let g:undotree_WindowLayout = 1
nnoremap <Leader>u :UndotreeToggle<CR>
Plug 'myusuf3/numbers.vim' " for smarter line numbers
Plug 'mattn/emmet-vim'
Plug 'romainl/vim-qf'
" }}}

" Strip Trailing Whitespace {{{
Plug 'ntpeters/vim-better-whitespace'  " highlight unnecessary whitespace, also :StripWhitespace
let g:show_spaces_that_precede_tabs = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitelines_at_eof = 1
" }}}

" User <Leader>fml to open leader mappings {{{
Plug 'ktonga/vim-follow-my-lead'
" Show leaders for plugins as well as ~/.vimrc
let g:fml_all_sources = 1
" }}}

" Startify settings {{{
Plug 'mhinz/vim-startify'
let g:startify_custom_header =
      \ map(split(system('fortune /Users/masseya/Documents/Fortunes/akm-quotes'), '\n'), '"   ". v:val')

let g:startify_fortune_use_unicode = 1
let g:startify_files_number = 5
let g:startify_bookmarks = [ {'f': '~/.fortune'},
      \ {'m': '~/.mutt/muttrc'},
      \ {'v': '~/dotfiles/vim/.vimrc'},
      \ {'w': '~/Dropbox/wiki/index.wiki'},
      \ {'z': '~/dotfiles/zsh/.zshrc'},
      \ ]

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Most Recent Files']            },
      \ { 'type': 'dir',       'header': ['   Most Recent Files from '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
" }}}

" Conqurer of Completion {{{
"     https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-bibtex',
  \ 'coc-css',
  \ 'coc-dictionary',
  \ 'coc-eslint',
  \ 'coc-git',
  \ 'coc-go',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-marketplace',
  \ 'coc-omni',
  \ 'coc-pyright',
  \ 'coc-rls',
  \ 'coc-solargraph',
  \ 'coc-tag',
  \ 'coc-prettier',
  \ 'coc-tsserver',
  \ 'coc-texlab',
  \ 'coc-vimtex',
  \ 'coc-yaml',
  \ 'coc-gocode',
  \ 'coc-lists',
  \ 'coc-word',
  \ 'coc-fzf-preview',
  \ ]

" if hidden is not set, TextEdit might fail.
set hidden

" " Some servers have issues with backup files, see #649
" set nobackup
" set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Conqurer of Completion has a separate configuration file, so let's create a
" shortcut to edit it.
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Use C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')
call SetupCommandAbbrs('EditSnippets', 'CocCommand snippets.editSnippets')
call SetupCommandAbbrs('OpenSnippets', 'CocCommand snippets.openSnippetFiles')

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:coc_snippet_next = '<Leader>j'
let g:coc_snippet_prev = '<Leader>k'

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" prefer coc.nvim's definition features
let g:go_def_mapping_enable = 0

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <Leader>rn <Plug>(coc-rename)

" " Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <Leader>a  <Plug>(coc-codeaction-selected)
nmap <Leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <Leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <Leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> ;a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> ;e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> ;c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> ;o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> ;s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> ;j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> ;k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> ;p  :<C-u>CocListResume<CR>

" Setup shortcuts for the coc-snippets plugin {{{
" Use <C-;> for trigger snippet expand.
imap <C-;> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <Leader>j <Plug>(coc-snippets-select)

" Use <Leader>j for jump to next placeholder
let g:coc_snippet_next = '<Leader>j'

" Use <Leader>k for jump to previous placeholder
let g:coc_snippet_prev = '<Leader>k'

" Use <Leader>j for both expand and jump (make expand higher priority.)
imap <Leader>j <Plug>(coc-snippets-expand-jump)
"}}}
" }}}

" Snippets
Plug 'honza/vim-snippets' " for snippets to be used with coc-snippets plugin

" Search-related plugins and configuration {{{
Plug 'justinmk/vim-sneak'
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

Plug 'nelstrom/vim-visual-star-search'

Plug 'junegunn/fzf.vim'

" Configure fzf using Homebrew
set rtp+=/usr/local/opt/fzf

" I'm using a coc.nvim plugin called coc-fzf-preview
"
" fzf command default options
let g:fzf_preview_default_fzf_options = { '--preview-window': 'wrap' }

" Use vim-devicons
let g:fzf_preview_use_dev_icons = 1

" nmap <Leader>f [fzf-p]
" xmap <Leader>f [fzf-p]

" nnoremap <silent> <C-p>          :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
" nnoremap <silent> <C-e>          :<C-u>CocCommand fzf-preview.DirectoryFiles<CR>
nnoremap <silent> <Leader>fgs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> <Leader>fga    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> <Leader>b      :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> <Leader>bl     :<C-u>CocCommand fzf-preview.BufferLines<CR>
nnoremap <silent> <Leader>bt     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> <Leader>vt     :<C-u>CocCommand fzf-preview.VistaCtags<CR>
nnoremap <silent> <Leader>ba     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> <Leader>fo     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> <Leader>f<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> <Leader>fg;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> <Leader>f/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> <Leader>f*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          <Leader>fgr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          <Leader>fgr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> <Leader>fq     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> <Leader>fl     :<C-u>CocCommand fzf-preview.LocationList<CR>

" " Replace ctrlP
nnoremap <C-p> :call FzfOmniFiles()<CR>

" " Search for any file in the home directory
" nnoremap <C-e> :Files ~<CR>

" " Search for an open buffer
" nnoremap <Leader>b :Buffers<CR>

" " Search for a tag in the current file
" nnoremap <Leader>gt :BTags<CR>

" " Search for lines in the current file
" nnoremap // :Blines!<CR>
nnoremap <silent> //     :<C-u>CocCommand fzf-preview.BufferLines<CR>

" " Search the entire project
nnoremap <silent> ??     :Rg!<CR>

" Search for commands
nnoremap cc :Commands!<CR>

" Run FZF based on the cwd & git detection
" 1. Runs :Files, If cwd is not a git repository
" 2. Runs :GitFiles <cwd> If root is a git repository
fun! FzfOmniFiles()
  " Throws v:shell_error if is not a git directory
  let git_status = system('git status')
  if v:shell_error != 0
    CocCommand fzf-preview.DirectoryFiles
  else
    CocCommand fzf-preview.FromResources project_mru git
  endif
endfun

" " Run FZF based on the cwd & git detection
" " 1. Runs :Files, If cwd is not a git repository
" " 2. Runs :GitFiles <cwd> If root is a git repository
" fun! FzfOmniFiles()
"   " Throws v:shell_error if is not a git directory
"   let git_status = system('git status')
"   if v:shell_error != 0
"     :Files
"   else
"     " Reference examples which made this happen:
"     " https://github.com/junegunn/fzf.vim/blob/master/doc/fzf-vim.txt#L209
"     " https://github.com/junegunn/fzf.vim/blob/master/doc/fzf-vim.txt#L290
"     " --exclude-standard - Respect gitignore
"     " --others - Show untracked git files
"     " dir: getcwd() - Shows file names relative to cwd
"     let git_files_cmd = ":GitFiles --exclude-standard --cached --others"
"     call fzf#vim#gitfiles('--exclude-standard --cached --others', {'dir': getcwd()})
"   endif
" endfun

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" make the FZF window a little more central
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

Plug 'junegunn/vim-slash'  " for improved searches using '/' from normal mode
noremap <Plug>(slash-after) zz

Plug 'wincent/scalpel'  " for improved search/replace for words under the cursor
" Use <Leader>s for Scalpel instead of default <Leader>e:
nmap <Leader>s <Plug>(Scalpel)
Plug 'mileszs/ack.vim'

" " prefer the silver searcher for vim, if it is available
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif

" prefer ripgrep and fzf for vim, if it is available
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
  set grepprg=rg\ --vimgrep

  " Search for a word and then narrow it down with ripgrep using :Find
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif
" }}}

" Use <Leader>ww to mark a window, then move to the target window, and  {{{
" finally use <Leader>ww to swap windows
Plug 'wesQ3/vim-windowswap'
" }}}

" Email-related plugins {{{
Plug 'vim-scripts/CheckAttach.vim'
" }}}

" LaTeX related plugins {{{
Plug 'lervag/vimtex'
let g:vimtex_syntax_enabled=0

" Set FastFold options
let g:tex_fold_enabled=1
let g:vimsyn_folding='af'
let g:xml_syntax_folding = 1

Plug 'Konfekt/vim-latexencode'  " requires pylatexenc to be separately installed
" }}}

" Writing related plugins {{{
Plug 'kana/vim-textobj-user'
Plug 'reedes/vim-textobj-quote'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-pencil'
let g:pencil#joinspaces = 1  " join with two spaces at the end of a sentence
let g:pencil#textwidth = 78  " use 78 characters per line
Plug 'christoomey/vim-titlecase'
Plug 'itspriddle/vim-marked'  " to open things in Marked or Marked 2
nnoremap <Leader>m :MarkedOpen
let g:marked_filetypes = ["markdown", "mkd", "md", "ghmarkdown", "vimwiki"]
Plug 'JamshedVesuna/vim-markdown-preview'
let vim_markdown_preview_hotkey='<C-g>'
let vim_markdown_preview_temp_file=1
let vim_markdown_preview_pandoc=1

Plug 'dhruvasagar/vim-table-mode'
let g:table_mode_corner='|' " markdown-compatible corners

" ReST compatible tables
" let g:table_mode_corner_corner='+'
" let g:table_mode_header_fillchar='='

" Quickly enable Table Mode with `||` at the start of the line.
" Disable with `__`.
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
" }}}

" Vimwiki Configuration {{{
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
" open the Vimwiki Index
nnoremap <Leader>11 <Plug>VimwikiIndex
" select an item from the Vimwiki Index
nnoremap <Leader>1s <Plug>VimwikiUISelect
" open your Vimwiki diary
nnoremap <Leader>1d <Plug>VimwikiDiaryIndex
" create a new entry in your Vimwiki diary
nnoremap <Leader>1n <Plug>VimwikiTabMakeDiaryNote
" create a note in your Vimwiki diary for yesterday
nnoremap <Leader>1y <Plug>VimwikiMakeYesterdayDiaryNote
let g:vimwiki_table_mappins = 0
let g:vimwiki_list = [{'path': '~/Dropbox/wiki/', 'syntax': 'markdown'}]
command! Diary VimwikiDiaryIndex
command! DiaryNew VimwikiMakeDiaryNote
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end
" }}}

" Movement / file browsing plugins {{{
Plug 'scrooloose/nerdtree'
Plug 'liuchengxu/vista.vim'
Plug 'justinmk/vim-dirvish'
" }}}

" Terminal or tmux vim plugins {{{
if has('nvim')
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175
endif
" Plug 'sjl/vitality.vim'
" let g:vitality_fix_focus=0  " don't enable focus events
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
if has('nvim')
  nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
endif
let g:VimuxHeight = "30"
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

" " Open an nvim terminal just to run lazygit
" nnoremap <Leader>g :tab term ++close lazygit<CR>

" " Terminal movement commands to change tabs
" tmap <C-h> <C-w>:tabp<CR>
" tmap <C-l> <C-w>:tabn<CR>
" }}}

" Git related plugins plugins {{{
Plug 'tpope/vim-fugitive' | Plug 'junegunn/gv.vim' | Plug 'christoomey/vim-conflicted'
" NOTE: use `dgu` to diffget upstream changes and `dgl` to diffget local
" changes
Plug 'junegunn/gv.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-CountJump' | Plug 'inkarkat/vim-ConflictMotions'
Plug 'airblade/vim-gitgutter'
" }}}

" Ruby related plugins {{{
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
" Plug 'thoughtbot/vim-rspec'
Plug 'vim-scripts/ruby-matchit'
Plug 'nelstrom/vim-textobj-rubyblock'
" }}}

" Go related plugins {{{
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'darrikonn/vim-gofmt'

" Configure gopls: https://github.com/golang/go/wiki/gopls
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" }}}

" Python related plugins {{{
" Plug 'python-mode/python-mode', { 'branch': 'develop' }
" let g:pymode_lint_cwindow=0  " don't automatically open the cwindow
" " Plug 'davidhalter/jedi-vim'
" " Plug 'nvie/vim-flake8'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'jmcantrell/vim-virtualenv'
Plug 'PieterjanMontens/vim-pipenv'
" " }}}

" Nim related configuration {{{
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
" " }}}

" Markdown related plugins {{{
" By default, Vim includes Tim Pope's Markdown syntax file.  You can find more
" information about this file here:
"     https://github.com/tpope/vim-markdown
"
" That said, let's customize some of those settings.
"
" These are the languages we may want to embed.
let g:markdown_fenced_languages = ['html', 'ruby', 'python', 'javascript',  'rust', 'bash=sh']
" Disable concealing syntax.
let g:markdown_syntax_conceal = 0

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

" Typing :Fo foo immediately places a Markdown extension footnote [^foo] after the current character and drops the footnote reference at the bottom of the text buffer.
function! s:MdFootnote(note)
  let s:footnote = "[^".a:note."]"
  let @m = s:footnote
  norm "mpmm
  $put = s:footnote.':'
  norm `m
endfunction

command! -nargs=1 Footnote call s:MdFootnote("<args>")

" For previewing with livedown.
Plug 'shime/vim-livedown'
" }}}

" Polyglot, a collection of language packs for vim {{{
"     https://github.com/sheerun/vim-polyglot
let g:polyglot_disabled = ['ruby', 'latex', 'go']
Plug 'sheerun/vim-polyglot'

let g:rustfmt_autosave = 1

Plug 'jiangmiao/auto-pairs'
" }}}

" Colorschemes {{{
Plug 'chriskempson/vim-tomorrow-theme'
" Plug 'therubymug/vim-pyte'
Plug 'altercation/vim-colors-solarized'
" Plug 'tpope/vim-vividchalk'
" Plug 'dsolstad/vim-wombat256i'
" Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'
" Plug 'akmassey/vim-codeschool'
" Plug 'twerth/ir_black'
" Plug 'jnurmine/Zenburn'
" Plug 'rainux/vim-desert-warm-256'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'jacoborus/tender.vim'
Plug 'ayu-theme/ayu-vim'
" Plug 'gruvbox-community/gruvbox'
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'hzchirs/vim-material'
" Plug 'humanoid-colors/vim-humanoid-colorscheme'
" }}}

" Load devicons last {{{
Plug 'ryanoasis/vim-devicons'
" }}}

call plug#end()

" Enable the builtin matchit plugin, requires vim version > 8.0
if !has('nvim')
  packadd! matchit
endif

" Neovim miscellaneousness {{{
" Don't forget to pip install --upgrade neovim and do the same for pip3
let g:python_host_prog = '/usr/local/bin/python2'
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
let g:airline_theme = 'material'
" let g:airline_theme = 'dracula'
" let g:airline_theme = 'jellybeans'
" let g:airline_theme = 'papercolor'

" Let airline clean up the tabline as well
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" set a theme for tmuxline as well
let g:tmuxline_theme = 'dracula'
" let g:tmuxline_theme = 'jellybeans'
" }}}

" Ensure line numbers are not shown in these file types.
let g:numbers_exclude = ['unite', 'startify', 'vimshell', 'w3m', 'nerdtree']
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

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

" non-GUI colorschemes {{{
if has("termguicolors")
  set termguicolors

  let g:material_style='oceanic'
  set background=dark
  colorscheme vim-material
endif
" }}}

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

" Open files in directory of current file with Leader mappings
cnoremap <expr> %% expand('%:h').'/'
map <Leader>e :edit %%
map <Leader>v :view %%

" Settings for editing prose {{{
function! Prose()
  " call pencil#init()
  call textobj#quote#init()
  call textobj#sentence#init()

  " replace common punctuation
  iabbrev <buffer> -- –
  iabbrev <buffer> --- —
  " iabbrev <buffer> << «
  " iabbrev <buffer> >> »

  " open most folds
  setlocal foldlevel=6

  " replace typographical quotes (reedes/vim-textobj-quote)
  map <silent> <buffer> <leader>qc <Plug>ReplaceWithCurly
  map <silent> <buffer> <leader>qs <Plug>ReplaceWithStraight

  " highlight words (reedes/vim-wordy)
  noremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  xnoremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  inoremap <silent> <buffer> <F8> <C-o>:NextWordy<cr>

  set spell
endfunction

" automatically initialize buffer by file type
autocmd FileType markdown,mkd,textile,text,mail,plaintex,context,tex,latex call Prose()

" disable automatic replacement of quotes with smart quotes in plaintext
autocmd FileType text call textobj#quote#init({'educate': 0})

" invoke manually by command for other file types
command! -nargs=0 Prose call Prose()
" }}}

" Mappings for Spelling {{{
set spelllang=en_us

" Some spelling-related stuff from here:
" https://vi.stackexchange.com/questions/68/autocorrect-spelling-mistakes
"
" Move to the next misspelled word and center the screen.
nnoremap ]s ]szz
nnoremap [s [szz

" Correct the last misspelled word using the first suggestion and return.
inoremap <C-L> <C-G>u<Esc>[s1z=`]a<C-G>u

" Select last misspelled word (typing will edit).
"   Mnemonic: 'spell last'
nnoremap <Leader>sl <Esc>[sve<C-G>
inoremap <Leader>sl <Esc>[sve<C-G>
snoremap <Leader>sl <Esc>b[sviw<C-G>

" Move to the next misspelled word and replace it with the first suggestion.
"   Mnemonic: 'spell next'
nnoremap <Leader>sn ]s1z=
inoremap <Leader>sn ]s1z=
snoremap <Leader>sn ]s1z=

" Correct the current next using the first suggestion.
"   Mnemonic: 'spell current'
nnoremap <Leader>sc 1z=
inoremap <Leader>sc <Esc>1z=ea
"}}}

" Useful Remaps {{{
" Mimic the functionality of C and D but in Y.  Note that we only want the
" last non-blank character to be included.
nnoremap Y yg_
" }}}

" AutoCommand Settings {{{
if has("autocmd")
  " make and python use real tabs
  au FileType make set noexpandtab
  au FileType python set ts=8 et sw=4 sts=4
  au FileType python set omnifunc=pythoncomplete#Complete
  au FileType python nnoremap <buffer> <Leader>q :exec '!python3' shellescape(@%, 1)<cr>
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
  au BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

  " Unbreak 'crontab -e' with Vim:
  " http://drawohara.com/post/6344279/crontab-temp-file-must-be-edited-in-place
  au FileType crontab set nobackup nowritebackup

  " Settings for composing email {{{
  au FileType mail setlocal formatoptions+=aw
  au FileType mail setlocal textwidth=72 foldmethod=manual
  au FileType mail let g:pencil#textwidth=72
  au FileType mail set colorcolumn=72
  au FileType mail call goyo#execute(0, 85)
  " au FileType mail call ale#ale_disable()
  au FileType mail execute 'normal gg}'
  " }}}

  " vimtex would otherwise hide things like boldface and italics commands
  " au FileType plaintex,context,tex,latex,markdown set conceallevel=0
  " au FileType plaintex,context,tex,latex,markdown set concealcursor=""

  " Word count macro for LaTeX
  au FileType plaintex,context,tex,latex nmap <Leader>w :!texcount %<CR>

  " Use docx2txt.pl to view the text content of a .docx file as read only
  autocmd BufReadPre *.docx set ro
  autocmd BufReadPost *.docx %!docx2txt.pl
endif

augroup fzfbibtex
  autocmd!
  autocmd FileType plaintex,context,tex,latex,markdown source $HOME/.vim/ftplugin/fzf-bibtex.vim
augroup END

augroup helpfiles
  au!
  au BufRead,BufEnter */doc/* wincmd H
augroup END

" Center the screen more easily {{{
nnoremap <Space> zz

" Center the screen on searches and joins
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
" }}}

" Undo Break Points {{{
" These make entering larger amounts of things in insert mode a little saner
" to undo when you've made mistakes.
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
" }}}

" Populate the Jumplist {{{
" The goal here is to add any movement of more than a few lines to the
" jumplist.
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
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

" EasyAlign Settings {{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
"
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BEGIN stuff from https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Swap window positions
nnoremap <c-x> <c-w>x

" Clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

" Add space above and below the current line
nnoremap <Leader>o O<Esc>jo<Esc>k
vnoremap <Leader>o c<Esc>o<Esc>P

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

" Reformat a program or structured document
nnoremap <Leader>= :call Preserve("normal gg=G")<CR>

" Reformat a plain text document to use hard wrapping and uniform spacing
"   Note: This uses the BSD `fmt` program.  The GNU coreutils version takes
"   different options.
nnoremap <Leader>g :call Preserve("%!fmt -s -78")<CR>
vnoremap <Leader>g :call Preserve("'<,'>!fmt -s -78")<CR>

" Filter Markdown
map <Leader>7 :call Preserve("%!poppins")<CR>
let g:vim_markdown_frontmatter=1

" Don't use Ex mode, use Q for formatting
" map Q gqap
nnoremap Q :call Preserve("normal gqap")<CR>
nnoremap <Leader>Q :call Preserve("normal vapJgqap")<CR>
" }}}

" Toggle NERDTree
map <Leader>8 :NERDTreeToggle<CR>

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

" Shortcut to writing a file as root from non-root vim
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" Searching options
set incsearch  " search while you're typing the search string
set hlsearch   " highlight bearch results
set ignorecase " ignore casb when searching
set smartcase  " but if we search for big letters, make search case sensitive again

" Correct for common command typos and mis-keys {{{
command! W w
command! Wq wq
command! WQ wq
command! Wa wall
command! WA wall
command! Wqa wqall
command! WQa wqall
command! WQA wqall
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
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <C-v> :call setreg("\"", system("pbpaste"))<CR>p

" Use very magic for searches by default
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

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

" Convert DOS-style carriage returns to UNIX-style
map <Leader>d :call Preserve("%s/\\r/\\r/g")<CR>

" Configure a different default test key
"   Hit <Leader><Enter> in any test file to save and run it.
"   Hit <Leader><Enter> in any other file to save it and rerun the last test.
let g:TestKey = { 'testkey': '<Leader><Enter>' }

" Highlight specific lines and clear them {{{
"    See: https://vimtricks.com/p/highlight-specific-lines/
" define line highlight color as the vim-material oceanic selection color
highlight LineHighlight ctermbg=60 guibg='#1f2233'

" highlight the current line
nnoremap <silent> <Leader>h :call matchadd('LineHighlight', '\%'.line('.').'l')<CR>

" clear all the highlighted lines
nnoremap <silent> <Leader>c :call clearmatches()<CR>
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
      \'cpp': 'xcrun g++ % -o %:r && ./%:r',
      \'java': 'javac % && java %:r',
      \'coffee': 'coffee %',
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

" Find non-printable characters {{{
function! NonPrintable()
   if search('[^\x00-\xff]') != 0
     call matchadd('Error', '[^\x00-\xff]')
     echo 'Non printable characters in text'
   else
     echo 'All characters are printable'
   endif
 endfunction
" }}}

" Find non-ASCII characters {{{
function! NonASCII()
   if search('[^\x00-\x7F]') != 0
     call matchadd('Error', '[^\x00-\x7F]')
     echo 'Non-ASCII characters in text'
   else
     echo 'All characters are ASCII'
   endif
 endfunction
" }}}

" Make working with the arglist a little easier {{{
"
" Much of this is pulled from this excellent blogpost by Chris Toomey:
"    https://ctoomey.com/writing/using-vims-arglist-as-a-todo-list/
"
" The basic idea is that if you need to operate on multiple files, you do the
" following:
"
" 1.  Open Vim with the desired files, e.g., vim $(ag -l "from 'react'")
"
" 2.  Edit the current file as needed using all the flexibility of Vim
"     (macros, plugins, brute force edits all welcome here)
"
" 3.  When the edits for the current file are done, run the :ThankYouNext
"     command (see below for the bit of Vimscript that makes that work) to
"     move on to the next file.
"
" 4.  Repeat from step 2 until all files are edited and you’re left with an
"     empty Vim session.
"
" # Files matching a search
" ❯ ag -l "from 'react-dom'" | xargs -o vim
"
" # Files w/ names matching a pattern
" ❯ fd '_spec.rb$' spec/ | xargs -o vim
"
" # Files selected from fuzzy finding w/ fzf
" ❯ fzf --multi | xargs -o vim
"
" # Files with uncommitted changes
" ❯ git diff --name-only | xargs -o vim
"
" # Files modified on this branch
" ❯ git diff master --name-only | xargs -o vim
"
" # Files w/ failing specs (using RSpec's persisted failure file)
" ❯ grep 'failed' spec/examples.txt | awk '{print $1}' | sed 's/\[.*$//' | sort | uniq | xargs -o vim
"
" # Conflicted files in git
" ❯ git ls-files -u | awk '{print $4}' | sort -u | xargs -o vim
"
" # A list of files copied to our clipboard
" ❯ pbpaste | xargs -o vim
function! s:ThankYouNext() abort
  update
  argdelete %
  bdelete
  if !empty(argv())
    argument
  endif
endfunction

command! ThankYouNext call <sid>ThankYouNext()
" }}}

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

" vim:fdm=marker:foldlevel=0
