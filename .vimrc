" Default vim settings for both command line and GUI
filetype indent on
filetype plugin on
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

set showtabline=2               " File tabs always visible

" for CSS, also have things in braces indented:
autocmd FileType css set smartindent
" for HTML, generally format text, but if a long line has been created
" leave it alone when editing:
autocmd FileType html set formatoptions+=tl
" for both CSS and HTML, use genuine tab characters for 
" indentation, to make files a few bytes smaller:
autocmd FileType html,css set noexpandtab tabstop=2

" F7 to toggle spell-checking
map <silent> <F7> :set nospell!<CR>:set nospell?<CR>

setlocal makeprg=tidy\ -quiet\ -errors\ %
setlocal errorformat=line\ %l\ column\ %v\ -\ %m

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
set hidden              "allow switching of buffers without saving
set confirm             "always ask to save a modified buffer
nnoremap <F5> :buffers<CR>:b
