if &compatible
  set nocompatible
endif

" Clean autocommands
autocmd!

" Map the leader key to SPACE
let mapleader="\<SPACE>"

source ~/.config/nvim/base.vim
source ~/.config/nvim/mappings.vim

let s:rcdir    = expand('<sfile>:h') . '/'
let s:plugsdir = s:rcdir . 'plugs/'
let s:vimrcs = glob(s:rcdir    . '*.vim', v:false, v:true)
           \ + glob(s:plugsdir . '*.vim', v:false, v:true)

let s:dein_plugs_path = '~/.local/share/nvim/dein'
let s:dein_self_plug_path = s:dein_plugs_path . '/repos/github.com/Shougo/dein.vim'
exec 'set runtimepath+=' . s:dein_self_plug_path

let g:dein#auto_recache = 1
if dein#load_state(s:dein_plugs_path)
  call dein#begin(s:dein_plugs_path, s:vimrcs)

  " Let Dein manage itself
  call dein#add(s:dein_self_plug_path)
  " LSP
  call dein#add('neoclide/coc.nvim', {'merged': 0, 'rev': 'release'})
  " UI For updating Dein
  call dein#add('wsdjeg/dein-ui.vim', {'on_cmd': 'DeinUpdate'})

  " Git Utilities
  call dein#add('tpope/vim-fugitive', {'on_cmd': ['G', 'Git', 'Ggrep', 'Glgrep', 'Gclog', 'Gllog', 'Gcd', 'Glcd', 'Gedit', 'Gsplit', 'Gvsplit', 'Gtabedit', 'Gpedit', 'Gread', 'Gwrite', 'Gwq', 'Gdiffsplit', 'Gvdiffsplit', 'Ghdiffsplit', 'GMove', 'GRename', 'GBrowse']})
  call dein#add('tpope/vim-rhubarb', {'depends': 'vim-fugitive'})
  call dein#add('junegunn/gv.vim', {'depends': 'vim-fugitive', 'on_cmd': ['GV']})
  call dein#add('airblade/vim-gitgutter')

  " Linux Utilities
  call dein#add('tpope/vim-eunuch', {'on_cmd': ['Delete', 'Unlink', 'Move', 'Rename', 'Chmod', 'Mkdir', 'Cfind', 'Clocate', 'Lfind', 'Llocate', 'Wall', 'SudoWrite', 'SudoEdit']})

  " Navigation and manipulation utilities
  call dein#add('tpope/vim-repeat', {'on_map' : '.'})
  call dein#add('tpope/vim-surround', {'on_map': {
  \    'i': ['<C-g>S', '<C-g>s', '<C-s>'],
  \    'n': ['cS', 'cs', 'ds', 'yS', 'ys'],
  \    'x': ['S', 'gS'],
  \}})
  call dein#add('easymotion/vim-easymotion', {'on_map': ['<Plug>(easymotion-prefix)']})

  " Fzf - Requires installing fzf at the shown path beforehand.
  call dein#add('junegunn/fzf', {'build': './install --all',  'merged': 0, 'on_cmd': 'FZF', 'on_func': 'fzf#run'})
  " Fzf shortcuts for Vim.
  call dein#add('junegunn/fzf.vim', {'depends': 'fzf', 'on_cmd': ['Files', 'GFiles', 'GFiles?', 'Buffers', 'Colors', 'Ag', 'Rg', 'Lines', 'BLines', 'Tags', 'BTags', 'Marks', 'Windows', 'Locate', 'History', 'History:', 'History/', 'Snippets', 'Commits', 'BCommits', 'Commands', 'Maps', 'Helptags', 'Filetypes']})
  " File Tree Visualization.
  call dein#add('preservim/nerdtree', {'on_cmd': 'NERDTreeToggle'})
  " Easy commenting
  call dein#add('preservim/nerdcommenter', {'on_map': ['<leader>cc', '<leader>cu']})

  " Status line and themes
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('edkolev/promptline.vim')
  call dein#add('morhetz/gruvbox')

  " Signs for indentation
  call dein#add('Yggdroot/indentLine')
  " Auto indent sizes
  call dein#add('tpope/vim-sleuth')
  " Smooth scroll is important
  call dein#add('psliwka/vim-smoothie')
  " Handle Direnv properly
  call dein#add('direnv/direnv.vim')
  " Extract character metadata.
  call dein#add('tpope/vim-characterize', {'on_map': ['ga']})

  " Undo visualization tree
  call dein#add('simnalamburt/vim-mundo', {'on_cmd': 'MundoToggle'})
  " Tagbar
  call dein#add('majutsushi/tagbar', {'on_cmd': 'TagbarToggle'})

  " Per language utilities!
  call dein#add('dag/vim-fish',                 {'on_ft': 'fish'})
  call dein#add('fatih/vim-go',                 {'on_ft': 'go', 'hook_post_update': 'GoUpdateBinaries'})
  call dein#add('jez/vim-better-sml',           {'on_ft': 'sml'})
  call dein#add('Harenome/vim-mipssyntax',      {'on_ft': 'mips'})
  call dein#add('guns/vim-clojure-static',      {'on_ft': 'clojure'})
  call dein#add('othree/yajs.vim',              {'on_ft': 'javascript'})
  call dein#add('HerringtonDarkholme/yats.vim', {'on_ft': 'typescript'})
  call dein#add('hashivim/vim-terraform',       {'on_ft': 'terraform'})
  call dein#add('preservim/vim-markdown',       {'on_ft': 'md'})


  call dein#end()
  call dein#save_state()
endif

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

filetype plugin indent on
syntax on
