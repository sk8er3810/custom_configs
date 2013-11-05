" gvim specific settings

" Default gvim window size
:winsize 120 70

" Make tab switching more like firefox
:nmap <C-S-tab> :tabprevious<cr>
:nmap <C-tab> :tabnext<cr>
:nmap <C-t> :tabnew<cr>
:map <C-t> :tabnew<cr>
:map <C-S-tab> :tabprevious<cr>
:map <C-tab> :tabnext<cr>
":map <C-w> :tabclose<cr>
:imap <C-S-tab> <ESC>:tabprevious<cr>i
:imap <C-tab> <ESC>:tabnext<cr>i
:imap <C-t> <ESC>:tabnew<cr>

" Copy/paste OS clipboard shortcuts
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y

" Different view settings for when someone else is looking at the screen
fun! TimMode(size)
    colorscheme default
    execute ':set guifont=Droid\ Sans\ Mono\ ' . a:size
endfun

fun! MikeMode()
    let g:zenburn_high_Contrast = 1
    let g:zenburn_old_Visual = 1
    let g:zenburn_alternate_Visual = 1
    colorscheme zenburn
    set guifont=Droid\ Sans\ Mono\ 10
endfun

command! -nargs=0 Mdmode :call MikeMode()
command! -nargs=1 TSmode :call TimMode(<f-args>)

"Mdmode


