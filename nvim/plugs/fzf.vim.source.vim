let g:fzf_tags_command = 'ag -l | ctags --links=no -L-'
let g:fzf_layout = {'down': '40%'}

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 ' --hidden --ignore .git ',
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
