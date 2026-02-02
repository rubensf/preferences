set incsearch           " Search as you type.
set hlsearch            " Highlight search.
set ignorecase          " Make searching case insensitive.
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/
set magic               " Use 'magic' patterns (extended regular expressions).
set background=dark     " Dark better in the eyes

set splitbelow           " More natural splits
set splitright

set signcolumn=yes       " Always signcolumn
set updatetime=300       " Faster CursorHold
set cmdheight=2          " Better for displaying messages.
set mouse=               " Disable weird no rightclick windows paste.
set hidden               " Yay buffers.
set showcmd              " Show (partial) command in status line.
set showmatch            " Show matching brackets.
set showmode             " Show current mode.
set ruler                " Show the line and column numbers of the cursor.
set nowrap               " No wrapping lines.
set number               " Show the line numbers on the left side.
set expandtab            " Insert spaces when TAB is pressed.
set tabstop=2            " Render TABs using this many spaces.
set shiftwidth=2         " Indentation amount for < and > commands.
set backspace=indent,eol,start "Let backspaces be useful (ie delete newline).
set autoindent           " Self explanatory.

set history=1000        " Much much history.
set undolevels=1000     " Also much much undos.
set title               " Change terminal title.
set visualbell          " No beep.
set noerrorbells        " No beep.

set nobackup            " No backups. Awful stuff.
set nowritebackup
set noswapfile

set exrc "Allow per project rc."

if !&scrolloff
  set scrolloff=5       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Delete trailing spaces.
autocmd BufWritePost * :%s/\s\+$//e
autocmd BufWritePost * :%s/\($\n\s*\)\+\%$//e

" Starlark
autocmd BufRead,BufNewFile *.star set filetype=python

" Make sure nvim creates new tab
let $GIT_EDITOR = 'nvr -cc split --remote-wait'

" Bearable colors
let $LSCOLORS = "GxFxBxDxCxegedabagacad"

" GShow to check all the diffs
command -nargs=? -bar GShow call setqflist(map(systemlist("git show --pretty='' --name-only <args>"), '{"filename": v:val, "lnum": 1}')) | cw
