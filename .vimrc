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

Mdmode

set smartindent
set tabstop=4
set shiftwidth=4

"" use spaces instead of tabs
set expandtab

set history=500
syntax on
"set number
set ruler
"set textwidth=72

""compatible mode
set nocp

"" backspacing so that I can backspace over tabs and newlines
set bs=2

"" shortcut for edit in hex mode
"nnoremap <C-H> :Hexmode<CR>
"inoremap <C-H> <ESC>:Hexmode<CR>
"vnoremap <C-H> :<C-U>Hexmode<CR>
vmap <leader>cc :s/^/#/<cr>
vmap <leader>co :s/^#//<cr>

set showtabline=2               " File tabs allways visible
:nmap <C-S-tab> :tabprevious<cr>
:nmap <C-tab> :tabnext<cr>
:nmap <C-t> :tabnew<cr>
:map <C-t> :tabnew<cr>
:map <C-S-tab> :tabprevious<cr>
:map <C-tab> :tabnext<cr>
:map <C-w> :tabclose<cr>
:imap <C-S-tab> <ESC>:tabprevious<cr>i
:imap <C-tab> <ESC>:tabnext<cr>i
:imap <C-t> <ESC>:tabnew<cr>
