"
"  _     _ _                 _           
" | |__ (_) |__       __   _(_)_ __ ___  
" | '_ \| | '_ \      \ \ / / | '_ ` _ \ 
" | |_) | | |_) |  _   \ V /| | | | | | |
" |_.__/|_|_.__/  (_)   \_/ |_|_| |_| |_|
"                               
" This file belongs to ~/.vim/ftplugin
                                      
:cnoremap <buffer> W                            w<CR>:exec '!bibtex ' .getline(1)<CR>

