" Promptline sync
let g:promptline_theme = 'airline'
let g:promptline_preset = {
      \'a' : [ '$(fish --command="hostname -s")' ],
      \'b' : [ '$(fish --command="whoami")' ],
      \'c' : [ '$(fish --command="prompt_pwd")' ],
      \'x' : [ '$(fish --command="get_cached_cl")' ],
      \'y' : [ '$(fish --command="get_citc_client")' ],
      \'z' : [ '$(fish --command="get_citc_switch")' ],
      \'warn' : [ promptline#slices#last_exit_code() ],
      \'options': {
          \'left_sections' : [ 'a', 'b', 'c' ],
          \'right_sections' : [ 'warn', 'x', 'y', 'z' ],
          \'left_only_sections' : [ 'a', 'b', 'z', 'y', 'x', 'c' ]}}

let g:promptline_symbols = {
      \ 'left'       : '▶',
      \ 'left_alt'   : '»',
      \ 'right'      : '◀',
      \ 'right_alt'  : '«',
      \ 'dir_sep'    : '☰',
      \ 'truncation' : '⋯',
      \ 'vcs_branch' : '',
      \ }
