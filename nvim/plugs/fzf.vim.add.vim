nnoremap <silent> <Leader>p :Files<CR>
nnoremap <silent> <Leader>g :GFiles<CR>
nnoremap <silent> <Leader>s :GFiles?<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>w :Windows<CR>
nnoremap <silent> <Leader>m :Maps<CR>

nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>aG :Ag! <C-R><C-W><CR>
vnoremap <silent> ag "oy:Ag <C-R>o<CR>

# Shortcuts to complete items during typing.
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
