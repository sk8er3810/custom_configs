let g:zenburn_high_Contrast = 1
let g:zenburn_old_Visual = 1
let g:zenburn_alternate_Visual = 1
colorscheme zenburn
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
