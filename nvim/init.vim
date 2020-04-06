if &compatible
  set nocompatible
endif

" Clean autocommands
autocmd!

" Map the leader key to SPACE
let mapleader="\<SPACE>"

source ~/.config/nvim/base.vim
source ~/.config/nvim/mappings.vim

let s:rcdir    = expand('%:p:h') . '/'
let s:plugsdir = s:rcdir . 'plugs/'
let s:vimrcs = glob(s:rcdir    . '*.vim', v:false, v:true)
           \ + glob(s:plugsdir . '*.vim', v:false, v:true)

set runtimepath+=~/.local/share/nvim/dein/repos/github.com/Shougo/dein.vim

let g:dein#auto_recache = 1
if dein#load_state('~/.local/share/nvim/dein')
  call dein#begin('~/.local/share/nvim/dein', s:vimrcs)

  " Let Dein manage itself
  call dein#add('~/.local/share/nvim/dein/repos/github.com/Shougo/dein.vim')
  " UI For updating Dein
  call dein#add('wsdjeg/dein-ui.vim', {'on_cmd': 'DeinUpdate'})
  " LSP
  call dein#add('neoclide/coc.nvim', {'merged': 0, 'rev': 'release'})

  " Git Utilities
  call dein#add('tpope/vim-fugitive', {'on_cmd': [ 'Git', 'Gstatus', 'Gwrite', 'Glog', 'Gcommit', 'Gblame', 'Ggrep', 'Gdiff', ]})
  " Linux Utilities
  call dein#add('tpope/vim-eunuch', {'on_cmd': ['Delete', 'Unlink', 'Move', 'Rename', 'Chmod', 'Mkdir', 'Cfind', 'Clocate', 'Lfind', 'Llocate', 'Wall', 'SudoWrite', 'SudoEdit']})

  " More efficient repeats
  call dein#add('tpope/vim-repeat', {'on_map' : '.'})
  " \w to move around the file efficiently.
  call dein#add('easymotion/vim-easymotion', {'on_map': ['<Plug>(easymotion-prefix)']})

  " Fzf - Requires installing fzf at the shown path beforehand.
  call dein#add('~/.fzf', {'name': 'fzf'})
  " Fzf shortcuts for Vim.
  call dein#add('junegunn/fzf.vim', {'depends': 'fzf', 'on_cmd': ['Files', 'GFiles', 'GFiles?', 'Buffers', 'Colors', 'Ag', 'Rg', 'Lines', 'BLines', 'Tags', 'BTags', 'Marks', 'Windows', 'Locate', 'History', 'History:', 'History/', 'Snippets', 'Commits', 'BCommits', 'Commands', 'Maps', 'Helptags', 'Filetypes']})
  " File Tree Visualization.
  call dein#add('preservim/nerdtree', {'on_cmd': 'NERDTreeToggle'})
  " Easy commenting
  call dein#add('preservim/nerdcommenter', {'on_cmd': ['NERDCommenterComment', 'NERDCommenterUncomment']})

  " Status Bar & Themes
  call dein#add('vim-airline/vim-airline')
  " call dein#add('vim-airline/vim-airline-themes')
  call dein#add('morhetz/gruvbox')

  " Smooth scrolling is important
  call dein#add('psliwka/vim-smoothie')
  " Signs for line indentation
  call dein#add('Yggdroot/indentLine')

  " Undo visualization tree
  call dein#add('simnalamburt/vim-mundo', {'on_cmd': 'MundoToggle'})

  " Per language utilities!
  call dein#add('dag/vim-fish',                 {'on_ft': 'fish'})
  call dein#add('fatih/vim-go',                 {'on_ft': 'go', 'hook_post_update': 'GoUpdateBinaries'})
  call dein#add('jez/vim-better-sml',           {'on_ft': 'sml'})
  call dein#add('Harenome/vim-mipssyntax',      {'on_ft': 'mips'})
  call dein#add('guns/vim-clojure-static',      {'on_ft': 'clojure'})
  call dein#add('othree/yajs.vim',              {'on_ft': 'javascript'})
  call dein#add('HerringtonDarkholme/yats.vim', {'on_ft': 'typescript'})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax on

function s:make_hook(name, type)
  let l:plg_cfg = s:plugsdir . a:name . '.' . a:type . '.vim'

  if filereadable(l:plg_cfg)
    call dein#set_hook(a:name, 'hook_' . a:type, 'source ' . l:plg_cfg)
  endif
endfunction

for [name, opts] in items(dein#get())
  call s:make_hook(name, 'add')
  call s:make_hook(name, 'source')
endfor

if has('vim_starting') && dein#check_install()
  call dein#install()
endif
