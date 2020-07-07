"  _                        _           
" | |_ _____  __     __   _(_)_ __ ___  
" | __/ _ \ \/ /     \ \ / / | '_ ` _ \ 
" | ||  __/>  <   _   \ V /| | | | | | |
"  \__\___/_/\_\ (_)   \_/ |_|_| |_| |_|
"                               
" This file belongs to ~/.vim/ftplugin
                                      
function! InsertFrame()
    exe "normal! O\\begin{frame}\\frametitle{}\n\\end{frame}\<ESC>k$"
endfunction


:cnoremap <buffer> W                            w<CR>:!pdflatex %<CR>
:cnoremap <buffer> B                            !bibtex %:t:r<CR>

:nnoremap <buffer> <leader>f                    :call InsertFrame()<CR>
:nnoremap <buffer> <leader><leader>i            i\textit{}<ESC>i
:inoremap <buffer> <leader><leader>i            \textit{}<Left>
:nnoremap <buffer> <leader><leader>b            i\textbf{}<ESC>i
:inoremap <buffer> <leader><leader>b            \textbf{}<Left>


function! CommentNLines(...)
    let isFirstLineCommented = match(getline('.'), '^\s*%\s*')
    let isFirstLineCommented = isFirstLineCommented + 0
    if a:1 == ''
        let nLines = 1
    else
        let nLines = a:1
    endif
    if isFirstLineCommented < 0
        let iter = 0
        while iter < nLines
            let isLineCommented = match(getline('.'), '^\s*%\s*') + 0
            if isLineCommented < 0
                exe "normal! 0i% \<ESC>j"
            else
                exe "normal! j"
            endif
            let iter += 1
        endwhile
    else
        let iter = 0
        while iter < nLines
            let isLineCommented = match(getline('.'), '^\s*%\s*') + 0
            if isLineCommented < 0
                exe "normal! j"
            else
                exe "normal! :s/%\\s\\{0,1\\}//\<ENTER>j"
            endif
            let iter += 1
        endwhile
    endif
endfunction




:nnoremap <buffer> <leader>k          :call CommentNLines(input(''))<CR>

