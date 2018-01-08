set nocompatible
set runtimepath+=~/.local/share/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.local/share/nvim/dein')
  call dein#begin('~/.local/share/nvim/dein')

  call dein#add('neomake/neomake')                 " Making things, I guess.
  call dein#add('Shougo/deoplete.nvim',
               \{'on_i': 1})                       " Autocomplete. ** Exclusive to neovim.
  call dein#add('zchee/deoplete-clang')            " Clang completeion for deoplete.
  call dein#add('Shougo/neoinclude.vim')           " Some help to read stuff from includes for deoplete.
  call dein#add('easymotion/vim-easymotion')       " \\w to move around the file efficiently.
  call dein#add('airblade/vim-gitgutter')          " Git changes highlighter.
  call dein#add('dag/vim-fish')                    " Fish syntax.
  call dein#add('jez/vim-better-sml')              " SML syntax.
  call dein#add('Harenome/vim-mipssyntax')         " Mips syntax.
  call dein#add('guns/vim-clojure-static')         " Clojure Syntax.
  call dein#add('tpope/vim-fireplace')             " Clojure REPL.
  call dein#add('vim-scripts/paredit.vim')         " Pair checker for parenthesis and such.
  call dein#add('vim-airline/vim-airline')         " Status bar for vim.
  call dein#add('vim-airline/vim-airline-themes')  " Themes for airline.
  call dein#add('Shougo/denite.nvim')              " Some cool integration plugin?
  call dein#add('Shougo/deol.nvim')                " Some cool terminal plugin?
  call dein#add('scrooloose/nerdtree',
               \{'on_cmd': 'NERDTreeToggle'})      " File explorer.
  call dein#add('scrooloose/nerdcommenter')        " Easy commenting.
  call dein#add('ervandew/supertab')               " Tab autocompletion.
  call dein#add('tpope/vim-fugitive')              " Git wrapping for vim.
  call dein#add('junegunn/fzf',
               \{'build': './install -all',
               \ 'merged': 0})                     " FZF!
  call dein#add('junegunn/fzf.vim',
               \{'depends': 'fzf'})                " FZF on vim!

  call dein#add('tweekmonster/startuptime.vim')    " To understand why do some plugins suck lol.

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Denite to use ag
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Airline extensions
let g:airline_symbols_ascii = 1   " WSL isn't really great with normal chars.
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme= 'wombat'

" Use AG Silversearch
let g:ackprg = 'ag --nogroup --nocolor --column'

" Nerd commenter settings.
let g:NERDTrimTrailingWhitespace = 1

" Have Deople (autocomplete) work at startup.
let g:deoplete#enable_at_startup = 1

" Supertab go from top to bottom.
let g:SuperTabDefaultCompletionType = "<c-n>"

" Shortcut for NERDTree
nnoremap <Leader>o :NERDTreeToggle<CR>

" And others for fzf
nnoremap <Leader>p :Files<CR>
cabbrev ls Buffers

" Some nice tab shortcuts.
nnoremap <C-t>     :tabnew<CR>
nnoremap <A-t>n    :tabnext<CR>
nnoremap <A-t>l    :tabnext<CR>
nnoremap <A-t>h    :tabprev<CR>
nnoremap <A-t>d    :tabclose<CR>
tnoremap <A-t>n    <C-\><C-n>:tabnext<CR>
tnoremap <A-t>l    <C-\><C-n>:tabnext<CR>
tnoremap <A-t>h    <C-\><C-n>:tabprev<CR>
tnoremap <A-t>d    <C-\><C-n>:tabclose<CR>

" Nicer alternating between buffers.
nnoremap <A-l>     <C-w>l
nnoremap <A-k>     <C-w>k
nnoremap <A-j>     <C-w>j
nnoremap <A-h>     <C-w>h
inoremap <A-l>     <Esc><C-w>l
inoremap <A-k>     <Esc><C-w>k
inoremap <A-j>     <Esc><C-w>j
inoremap <A-h>     <Esc><C-w>h
tnoremap <A-l>     <C-\><C-n><C-w>l
tnoremap <A-k>     <C-\><C-n><C-w>k
tnoremap <A-j>     <C-\><C-n><C-w>j
tnoremap <A-h>     <C-\><C-n><C-w>h

" No wasting time holding shift to press commands.
nnoremap ; :
vnoremap ; :

" Please, <C-\><C-n> to escape terminal mode? gez.
tnoremap <Esc> <C-\><C-n>

" Delete trailing spaces.
autocmd BufWritePost * :%s/\s\+$//e

" Neomake configs
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'Warnings',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'Errors',
  \ }
let g:neomake_c_enabled_makers = ['clang']
let g:neomake_c_clang_maker = {
  \ 'args': ['--std=c++11', '-Wall', '-Wextra', '-pedantic'],
  \ }
let g:neomake_cpp_enabled_makers = ['clang']
let g:neomake_cpp_clang_maker = {
  \ 'exe': 'clang++',
  \ 'args': ['--std=c++11', '-Wall', '-Wextra', '-pedantic', '-Wno-sign-conversion'],
  \ }

" Javacomplete2 config with deoplete.
set omnifunc=syntaxcomplete#Complete

set mouse=              " Disable weird no rightclick windows paste.
set hidden              " Yay buffers.
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set nowrap              " No wrapping lines.
set number              " Show the line numbers on the left side.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
set backspace=indent,eol,start "Let backspaces be useful (ie delete newline).
set autoindent          " Self explanatory.

set history=1000        " Much much history.
set undolevels=1000     " Also much much undos.
set title               " Change terminal title.
set visualbell          " No beep.
set noerrorbells        " No beep.

set nobackup            " Screw those backups.
set noswapfile          " Scre those backups.

set updatetime=500      " No need for 4 second waits, gez.

if !&scrolloff
  set scrolloff=5       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif

" Tell Vim which characters to show for expanded TABs,
" " trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set incsearch           " Search as you type.
set hlsearch            " Highlight search.
set ignorecase          " Make searching case insensitive.
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/
set magic               " Use 'magic' patterns (extended regular expressions).

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endi

set termguicolors

" Unmap arrow keys.
nnoremap <Up> <NOP>
nnoremap <Right> <NOP>
nnoremap <Left> <NOP>
nnoremap <Down> <NOP>
