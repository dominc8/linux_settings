"  _     _ _          _           
" | |__ (_) |____   _(_)_ __ ___  
" | '_ \| | '_ \ \ / / | '_ ` _ \ 
" | |_) | | |_) \ V /| | | | | | |
" |_.__/|_|_.__(_)_/ |_|_| |_| |_|
"                                 
" This file belongs to ~/.config/nvim/ftplugin
                                      
:cnoremap <buffer> W                            w<CR>:exec '!bibtex ' .getline(1)<CR>

