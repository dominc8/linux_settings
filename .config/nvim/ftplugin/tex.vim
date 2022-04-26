"  _                   _           
" | |_ _____  ____   _(_)_ __ ___  
" | __/ _ \ \/ /\ \ / / | '_ ` _ \ 
" | ||  __/>  < _\ V /| | | | | | |
"  \__\___/_/\_(_)\_/ |_|_| |_| |_|
"                               
" This file belongs to ~/.vim/ftplugin
                                      
function! InsertFrame()
    exe "normal! O\\begin{frame}\\frametitle{}\n\\end{frame}\<ESC>k$"
endfunction


:cnoremap <buffer> W                            w<CR>:!pdflatex %<CR>
:cnoremap <buffer> S                            w<CR>:!pdflatex praca.tex<CR>
:cnoremap <buffer> B                            !bibtex %:t:r<CR>

:nnoremap <buffer> <leader>f                    :call InsertFrame()<CR>
:nnoremap <buffer> <leader><leader>i            i\textit{}<ESC>i
:inoremap <buffer> <leader><leader>i            \textit{}<Left>
:nnoremap <buffer> <leader><leader>b            i\textbf{}<ESC>i
:inoremap <buffer> <leader><leader>b            \textbf{}<Left>

