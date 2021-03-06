" Vundle (needs to be before everything else)

" Setup Vundle          -> git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Run                   -> :PluginInstall or vim +PluginInstall +qall
" Setup Powerline fonts -> git clone https://github.com/powerline/fonts.git

" see :h vundle for more details or wiki for FAQ
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

set nocompatible                  " don't try to be compatible with legacy vi
set modelines=5
filetype off
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()

" Plugin 'L9' " Example of loading a plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'gmarik/Vundle.vim'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
Plugin 'https://github.com/ervandew/supertab.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'https://github.com/Shougo/unite.vim.git'
Plugin 'https://github.com/kchmck/vim-coffee-script.git'
Plugin 'https://github.com/tpope/vim-commentary.git'
Plugin 'https://github.com/tpope/vim-cucumber.git'
Plugin 'https://github.com/tpope/vim-endwise.git'
Plugin 'https://github.com/dag/vim-fish.git'
Plugin 'https://github.com/tpope/vim-haml.git'
Plugin 'https://github.com/pangloss/vim-javascript.git'
Plugin 'https://github.com/tpope/vim-markdown.git'
Plugin 'https://github.com/bling/vim-airline'
Plugin 'https://github.com/tpope/vim-repeat.git'
Plugin 'https://github.com/skwp/vim-rspec.git'
Plugin 'https://github.com/vim-ruby/vim-ruby.git'
Plugin 'https://github.com/tpope/vim-surround.git'
Plugin 'https://github.com/nelstrom/vim-textobj-rubyblock.git'
Plugin 'https://github.com/kana/vim-textobj-user.git'
Plugin 'https://github.com/fatih/vim-go.git'
Plugin 'https://github.com/wting/rust.vim'
Plugin 'https://github.com/tpope/vim-rails.git'
Plugin 'airblade/vim-gitgutter'
Plugin 'mxw/vim-jsx'
Plugin 'isRuslan/vim-es6'
Plugin 'janko-m/vim-test'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/vim-easy-align'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Auto-Pairs'
Plugin 'https://github.com/digitaltoad/vim-pug.git'
Plugin 'rizzatti/dash.vim'

" DevOps
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'https://github.com/hashivim/vim-terraform.git'

" Plugins that help with ctags integration
Plugin 'https://github.com/tpope/vim-fugitive.git'
Plugin 'https://github.com/tpope/vim-bundler.git'

" Clojure syntax highlighting, syntax
Plugin 'tpope/vim-fireplace'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'

" Elixir support
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'

" Swift support
Plugin 'keith/swift.vim'

" Color Schemes
Plugin 'whatyouhide/vim-gotham'

call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8

"" Configure Plugins
set laststatus=2                  " Always show the statusline


"" Configure word boundary
" set iskeyword-=_

" Configure Airline
let g:airline_enable_branch=1
let g:airline_powerline_fonts=1   " automatic population of g:airline_symbols dictionary with powerline symbols.
let g:airline_detect_modified=1   " marks when the file has changed
let g:airline_detect_paste=1      " enable paste detection (set paste) ie I'm not typing, I'm pasting
let g:airline_detect_iminsert=0   " I have no idea
let g:airline_inactive_collapse=1 " inactive windows should have the left section collapsed to only the filename of that buffer.
" let g:airline_solarized_bg='dark' " Use Solarized Dark theme
" let g:airline_theme='dark'        " Dark airline theme

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"ctrlP plugin - To install:
" cd ~/.vim
" git clone https://github.com/ctrlpvim/ctrlp.vim.git bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim

runtime macros/matchit.vim                   " vim-textobj-rubyblock

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " close vim if NERDTree is the only open buffer

let mapleader = ","

"" Autostart the NERDTree
autocmd vimenter * NERDTree

"" Easymotion
" bind ',w' for easymotion move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" bind ',L' for easymotion move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" bind ',sp' for pasting from clipboard
nmap <leader>sp :set paste<cr>
nmap <leader>snp :set nopaste<cr>

" Bind ',ne' to toggle NERDTree
nmap <leader>ne :NERDTreeToggle<cr>

"" janko-m/vim-test mappings
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

"" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Autopairs

"" The silver searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " ignored dirs can be added to agignore
endif

" Bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Define a Ag command to search for the provided text
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" Bind '\' to grep shortcut
nnoremap \ :Ag<SPACE>

let g:jsx_ext_required = 0      " Allow JSX in normal JS files

"" Basic editor behaviour
filetype plugin indent on       " load file type plugins + indentation
syntax enable                   " highlighting
set cursorcolumn                " colours the column the cursor is on
set cursorline                  " colours the line the cursor is on
set scrolloff=4                 " adds top/bottom buffer between cursor and window
set number                      " line numbers
set showcmd                     " display incomplete commands
set autoread                    " auto-reload buffers when file changed on disk
set shell=sh                    " So VIM can execute 'system' function in fish
set splitbelow                  " open new split panes to bottom
set splitright                  " open new split panes to right
set ruler                       " not sure but sounds cool
set smartindent                 " does the right thing (mostly)
set autoindent                  " we will see
set fillchars+=vert:\           " remove the dashes in split window divider line
set re=1                        " for vim > 7.3 make vim use older regex engine to prevent massive lag"

"" Golang - set tab width to 4 spaces
autocmd Filetype go setlocal tabstop=4

"" Appearance
colorscheme gotham

" Load with ruler for 80 chars
:set colorcolumn=80
" :highlight colorcolumn ctermbg=160
" :highlight cursorcolumn ctermbg=green
" :highlight cursorline cterm=NONE ctermbg=green

" In Visual mode, customize the highlight background color
" :highlight Visual cterm=NONE ctermbg=016

" Line numbers
" :highlight LineNr ctermfg=grey
" :highlight LineNr ctermbg=black

" Blank line tilde to make invisible
" hi NonText ctermfg=235
hi NonText ctermfg=black

" Search hits highlighting
hi Search cterm=NONE ctermfg=46 ctermbg=0

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
   let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
   let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" Relative or absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set number
    set relativenumber
  endif
endfunction

nnoremap <C-n> :call NumberToggle()<CR>

"" Whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()      " strip trailing whitespace on save
set nowrap                                                       " don't wrap lines
set tabstop=2 shiftwidth=2                                       " default tab is two spaces
set expandtab                                                    " use spaces, not tabs (optional)
autocmd Filetype html setlocal ts=2 sw=2 expandtab               " for html, 2 spaces
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab               " for ruby, 2 spaces
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab   " for javascript, 2 spaces

set backspace=indent,eol,start                                   " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " case insensitive pattern matching
set smartcase                   " overrides ignorecase if pattern contains upcase
nmap <leader>h :nohlsearch<cr>

"" Vim, Imma edit the same file multiple times, okay? deal with it
set nobackup                             " no backup files
set nowritebackup                        " don't backup file while editing
set noswapfile                           " don't create swapfiles for new buffers
set updatecount=0                        " Don't try to write swapfiles after some number of updates
set backupskip=/tmp/*,/private/tmp/*"    " can edit crontab files

"" Convenience
map <C-a> <esc>ggVG<CR>
nmap <Leader>p orequire "pry"; binding.pry;
nmap <Leader>f i# frozen_string_literal: true
vnoremap . :norm.<CR>;
nnoremap <Leader>v :set paste<CR>"*p<CR>:set nopaste<CR>; " paste without being stupid ("*p means to paste on next line (p) from the register (") that represents the clipboard (*))

" replaces %/ with current directory, and %% with current file
cmap %/ <C-R>=expand("%:p:h")."/"<CR>
cmap %% <C-R>=expand("%")<CR>

"" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"" swapping words
nnoremap <Leader>sf "xdiwdwep"xpbb

"" Emacs/Readline keybindings for commandline mode
"  http://tiswww.case.edu/php/chet/readline/readline.html#SEC4
"  many of these taken from vimacs http://www.vim.org/scripts/script.php?script_id=300
"  navigation
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <Esc>b <S-Left> " commenting out b/c makes it pause
cnoremap <Esc>f <S-Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
" editing
cnoremap <M-p> <Up>
cnoremap <M-n> <Down>
cnoremap <C-k> <C-f>d$<C-c><End>
cnoremap <C-y> <C-r><C-o>"
cnoremap <C-d> <Right><C-h>

"" MacVim options
if has("gui_running")

  " Show ruler for 80 chars
  :set colorcolumn=80

  " Solarized theme config
  " let g:solarized_termcolors=256
  set background=dark
  let g:solarized_contrast = "high"
  colorscheme solarized

  " Load with cursor column enabled
  :set cursorcolumn

  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
  endif
endif

" Toggle the cursor column highlighting
function! CursorColumnToggle()
  if &cursorcolumn
    set nocursorcolumn
  else
    set cursorcolumn
  endif
endfunction

" Bind ',cc' to toggle cursorcolumn
let mapleader = ","
nmap <leader>cc :call CursorColumnToggle()<cr>

" Turn off the left / right scrollbars
:set guioptions-=L
:set guioptions-=R
:set guioptions-=r
:set guioptions-=l

"" filetypes
au BufRead,BufNewFile *.elm setfiletype haskell
au BufRead,BufNewFile *.dump setfiletype sql
au BufRead,BufNewFile *.conf setfiletype conf

let g:ruby_path = system('rmv current')
