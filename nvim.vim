filetype plugin indent on

call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete. ** Exclusive to neovim.
Plug 'tweekmonster/deoplete-clang2'     " Clang completeion for deoplete.
Plug 'kien/ctrlp.vim'                   " Uses Ctrl+P to search the files on folders.
Plug 'easymotion/vim-easymotion'        " \\w to move around the file efficiently.
Plug 'airblade/vim-gitgutter'           " Git changes highlighter.
Plug 'neomake/neomake'                  " A syntax checker. Neovim only.
Plug 'dojoteef/neomake-autolint'        " Lint for neomake.
Plug 'artur-shaik/vim-javacomplete2'    " Super java autocomplete.
Plug 'dag/vim-fish'                     " Fish syntax.
Plug 'jez/vim-better-sml'               " SML syntax.
Plug 'Harenome/vim-mipssyntax'          " Mips syntax.
Plug 'gisphm/vim-gradle'                " Gradle syntax and utils.
Plug 'solarnz/thrift.vim'               " Thrift syntax.
Plug 'vim-ruby/vim-ruby'                " Ruby syntax and utils.
Plug 'vim-airline/vim-airline'          " Status bar for vim.
Plug 'vim-airline/vim-airline-themes'   " Themes for airline.
Plug 'Shougo/denite.nvim'               " Some cool integration plugin?
Plug 'scrooloose/nerdtree'              " Tree file manager.
Plug 'scrooloose/nerdcommenter'         " Easy commenting.
Plug 'ervandew/supertab'                " Tab autocompletion.
Plug 'tpope/vim-fugitive'               " Git wrapping for vim.
Plug 'mhinz/vim-janah'                  " ColorScheme.

call plug#end()

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

" No limit for ctrl P
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40

" Ctrp p ignore .gitignore files.
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Neomake options.
au! BufWritePost,BufEnter * Neomake!
let g:neomake_autolint_sign_column_always = 1
let g:neomake_logfile = '/tmp/neomake.log'

" Delete trailing spaces on write.
au BufWritePost * :%s/\s\+$//e
   
" Nerd commenter settings.
let g:NERDTrimTrailingWhitespace = 1

" Have Deople (autocomplete) work at startup.
let g:deoplete#enable_at_startup = 1

" Supertab go from top to bottom.
let g:SuperTabDefaultCompletionType = "<c-n>"

" Shortcut for NERDTree
nnoremap <Leader>o :NERDTree<CR>

" Some nice tab shortcuts.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" No wasting time holding shift to press commands.
nnoremap ; :
vnoremap ; :

" Delete trailing spaces.
autocmd BufWritePost * :%s/\s\+$//e

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

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
