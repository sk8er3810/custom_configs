" Default vim settings for both command line and GUI
filetype indent on
filetype plugin on
set smartindent
set tabstop=4
set shiftwidth=4
" highlight current line of cursor
"set cursorline

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

" ctag settings
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
map <F8> :!/usr/bin/ctags -R --c++-kinds=+lp --fields=+iaS --extra=+q .<CR>

":au BufWritePost * make

" Convert slashes to backslashes for Windows.
if has('win32')
    nmap ,cs :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
    nmap ,cl :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>

    " This will copy the path in 8.3 short format, for DOS and Windows 9x
    nmap ,c8 :let @*=substitute(expand("%:p:8"), "/", "\\", "g")<CR>
else
    " nmap ,cs :let @*=expand("%")<CR>
    " nmap ,cl :let @*=expand("%:p")<CR>

    " Gnome Clipboard
    nmap ,cs :let @+=expand("%")<CR>
    nmap ,cl :let @+=expand("%:p")<CR>
endif

"fun! ack (term) {
"    let files = system("ack-grep " + search)
"    inputlist (files);
"}
"
"execute pathogen#infect()
