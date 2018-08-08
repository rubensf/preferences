set nocompatible
set runtimepath+=~/.local/share/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.local/share/nvim/dein')
  call dein#begin('~/.local/share/nvim/dein')

  " Dein path
  call dein#add('~/.local/share/nvim/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('BurningEther/iron.nvim')          " Automatic REPL setup.
  call dein#add('Shougo/deoplete.nvim')            " Autocomplete. ** Exclusive to neovim.
  call dein#add('mhartington/nvim-typescript')     " Deoplete integration for typescript.
  call dein#add('zchee/deoplete-clang')            " Clang completeion for deoplete.
  call dein#add('Shougo/neoinclude.vim')           " Some help to read stuff from includes for deoplete.
  call dein#add('easymotion/vim-easymotion')       " \\w to move around the file efficiently.
  call dein#add('airblade/vim-gitgutter')          " Git changes highlighter.
  call dein#add('dag/vim-fish')                    " Fish syntax.
  call dein#add('jez/vim-better-sml')              " SML syntax.
  call dein#add('Harenome/vim-mipssyntax')         " Mips syntax.
  call dein#add('tpope/vim-surround')              " Matches!
  call dein#add('guns/vim-clojure-static')         " Clojure Syntax.
  call dein#add('clojure-vim/async-clj-highlight') " Clojure highlight.
  call dein#add('clojure-vim/async-clj-omni')      " Clojure Async Completion for Deoplete.
  call dein#add('tpope/vim-fireplace')             " Clojure help stuff.
  call dein#add('fuadsaud/vim-midje')              " Clojure Midje syntax.
  call dein#add('kovisoft/paredit')                " Pair checker for parenthesis and such.
  call dein#add('vim-airline/vim-airline')         " Status bar for vim.
  call dein#add('vim-airline/vim-airline-themes')  " Themes for airline.
  call dein#add('Shougo/denite.nvim')              " Some cool integration plugin?
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
  call dein#add('othree/yajs.vim')                 " Js syntax.
  call dein#add('HerringtonDarkholme/yats.vim')    " Ts syntax.
  call dein#add('peitalin/vim-jsx-typescript')     " Jsx pretty.
  call dein#add('w0rp/ale')                        " Linter
  call dein#add('tpope/vim-eunuch')                " Unix utilities
  call dein#add('tpope/vim-salve')                 " Sattic support for leiningen and boot.
  call dein#add('majutsushi/tagbar')               " Tagbar
  call dein#add('Yggdroot/indentLine')             " Coz lines are cool
  call dein#add('Kuniwak/vint')                    " Vim linter
  call dein#add('junegunn/vader.vim')              " Vim Test Framework
  call dein#add('morhetz/gruvbox')                 " Better colorscheme
  call dein#add('junegunn/gv.vim')                 " Commit Visualization
  call dein#add('tpope/vim-repeat')                " Make repeats better
  call dein#add('tpope/vim-rhubarb')               " Github support for vim.
  call dein#add('simnalamburt/vim-mundo')          " Undo visualization tree.
  call dein#add('fatih/vim-go')                    " Go!!!
  call dein#add('wsdjeg/dein-ui.vim')              " Finally a UI for dein.
  call dein#add('direnv/direnv.vim')               " Coz nvim doesn't get direnv vars.

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" Clean autocommands
autocmd!

filetype plugin indent on
syntax on

augroup filetypedetect
  au BufRead,BufNewFile *.json.base set filetype=json
augroup END

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
let g:airline#extensions#ale#enabled = 1

" Use AG Silversearch
let g:ackprg = 'ag --nogroup --nocolor --column'

" Nerd commenter settings.
let g:NERDTrimTrailingWhitespace = 1
let g:NERDSpaceDelims = 1

" Have Deople (autocomplete) work at startup.
let g:deoplete#enable_at_startup = 1

" Deople Config for clojure
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

" Supertab go from top to bottom.
let g:SuperTabDefaultCompletionType = "<c-n>"

" Better easymotion
map \ <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1

" Fzf stuff
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:fzf_tags_command = 'ag -l | ctags --links=no -L-'
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>aG :Ag! <C-R><C-W><CR>

" Shortcut for NERDTree
nnoremap <silent> <Leader>o :NERDTreeToggle<CR>

" Shortcut for Mundo
nnoremap <Leader>u :MundoToggle<CR>

" And others for fzf
nnoremap <silent> <Leader>p :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" Some nice tab shortcuts.
nnoremap <silent> <C-t>      :tabnew<CR>
nnoremap <silent> <M-t><M-t> :tabnew<CR>
nnoremap <silent> <M-t>n     :tabnext<CR>
nnoremap <silent> <M-t>l     :tabnext<CR>
nnoremap <silent> <M-t>h     :tabprev<CR>
nnoremap <silent> <M-t>d     :tabclose<CR>
tnoremap <silent> <M-t>n     <C-\><C-n>:tabnext<CR>
tnoremap <silent> <M-t>l     <C-\><C-n>:tabnext<CR>
tnoremap <silent> <M-t>h     <C-\><C-n>:tabprev<CR>
tnoremap <silent> <M-t>d     <C-\><C-n>:tabclose<CR>

" Nicer alternating between buffers.
nnoremap <M-l>     <C-w>l
nnoremap <M-k>     <C-w>k
nnoremap <M-j>     <C-w>j
nnoremap <M-h>     <C-w>h
inoremap <M-l>     <Esc><C-w>l
inoremap <M-k>     <Esc><C-w>k
inoremap <M-j>     <Esc><C-w>j
inoremap <M-h>     <Esc><C-w>h
tnoremap <M-l>     <C-\><C-n><C-w>l
tnoremap <M-k>     <C-\><C-n><C-w>k
tnoremap <M-j>     <C-\><C-n><C-w>j
tnoremap <M-h>     <C-\><C-n><C-w>h

" No wasting time holding shift to press commands.
nnoremap ; :
vnoremap ; :

" Please, <C-\><C-n> to escape terminal mode? gez.
tnoremap <Esc> <C-\><C-n>

" Delete trailing spaces.
autocmd BufWritePost * :%s/\s\+$//e
autocmd BufWritePost * :%s/\($\n\s*\)\+\%$//e

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

" Unmap arrow keys.
nnoremap <Up> <NOP>
nnoremap <Right> <NOP>
nnoremap <Left> <NOP>
nnoremap <Down> <NOP>

" Ale Goto
nnoremap <silent> <F2> :ALEGoToDefinition<CR>
nnoremap <silent> <F3> :ALEGoToDefinitionInTab<CR>
nnoremap <silent> <F4> :ALEGoToDefinitionInSplit<CR>
nnoremap <silent> <F5> :ALEGoToDefinitionInVSplit<CR>

let g:ale_completion_enabled = 1

" More natural splits
set splitbelow
set splitright

" Tagbar
nnoremap <F8> :TagbarToggle<CR>

" Copy to clipboard
vnoremap <Leader>y  "+y
nnoremap <Leader>Y  "+yg_
nnoremap <Leader>y  "+y

" Paste from clipboard
nnoremap <M-v> "+P
vnoremap <M-v> "+P

set background=dark
set termguicolors
