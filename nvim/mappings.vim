" No wasting time holding shift to press commands.
nnoremap ; :
vnoremap ; :

" Unmap arrow keys.
nnoremap <Up> <NOP>
nnoremap <Right> <NOP>
nnoremap <Left> <NOP>
nnoremap <Down> <NOP>

" Copy to clipboard
vnoremap <Leader>y "+y
nnoremap <Leader>Y "+yg_
nnoremap <Leader>y "+y

" Paste from clipboard
nnoremap <M-v> "+P
vnoremap <M-v> "+P

" Nicer alternating between buffers.
nnoremap <M-l> <C-w>l
nnoremap <M-k> <C-w>k
nnoremap <M-j> <C-w>j
nnoremap <M-h> <C-w>h
inoremap <M-l> <Esc><C-w>l
inoremap <M-k> <Esc><C-w>k
inoremap <M-j> <Esc><C-w>j
inoremap <M-h> <Esc><C-w>h
tnoremap <M-l> <C-\><C-n><C-w>l
tnoremap <M-k> <C-\><C-n><C-w>k
tnoremap <M-j> <C-\><C-n><C-w>j
tnoremap <M-h> <C-\><C-n><C-w>h

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

" Please, <C-\><C-n> to escape terminal mode? gez.
tnoremap <Esc> <C-\><C-n>

" Profiling helpers
nnoremap <silent> <leader>PI :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
nnoremap <silent> <leader>PP :exe ":profile pause"<cr>
nnoremap <silent> <leader>PC :exe ":profile continue"<cr>
nnoremap <silent> <leader>PQ :exe ":profile pause"<cr>:noautocmd qall!<cr>

" Single inserts
nnoremap ,i :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap ,a :exec "normal a".nr2char(getchar())."\e"<CR>
