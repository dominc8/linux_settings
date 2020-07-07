"                   _           
"   ___      __   _(_)_ __ ___  
"  / __|     \ \ / / | '_ ` _ \ 
" | (__   _   \ V /| | | | | | |
"  \___| (_)   \_/ |_|_| |_| |_|
"                               
" This file belongs to ~/.vim/ftplugin


function! InsertIncludeGuards()
    let fileext = toupper(expand("%:e"))
    let headerguard = join([toupper(expand("%:t:r")), fileext], '_')
    exe "normal" "1GO#ifndef" headerguard "\<BS>\n#define" headerguard "\<BS>\n\<ESC>"
    exe "normal" "Go\n#endif /*" headerguard "*/\n\<ESC>"
endfunction

function! CommentNLines(...)
    let isFirstLineCommented = match(getline('.'), '^\s*//\s*')
    let isFirstLineCommented = isFirstLineCommented + 0
    if a:1 == ''
        let nLines = 1
    else
        let nLines = a:1
    endif
    if isFirstLineCommented < 0
        let iter = 0
        while iter < nLines
            let isLineCommented = match(getline('.'), '^\s*//\s*') + 0
            if isLineCommented < 0
                exe "normal! 0i// \<ESC>j"
            else
                exe "normal! j"
            endif
            let iter += 1
        endwhile
    else
        let iter = 0
        while iter < nLines
            let isLineCommented = match(getline('.'), '^\s*//\s*') + 0
            if isLineCommented < 0
                exe "normal! j"
            else
                exe "normal! :s/\\/\\/\\s\\{0,1\\}//\<ENTER>j"
            endif
            let iter += 1
        endwhile
    endif
endfunction

function! CommentBlockNLines(...)
    let isFirstLineCommented = match(getline('.'), '^\s*/\*\s*')
    let isFirstLineCommented = isFirstLineCommented + 0
    if a:1 == ''
        let nLines = 0
    else
        let nLines = a:1
    endif
    if isFirstLineCommented < 0
        if (nLines == 0) || (nLines == 1)
            exe "normal! 0i/* \<ESC>A */\<ESC>"
        else
            let nLines -= 1
            exe "normal! 0i/* \<ESC>" nLines . "jA */\<ESC>"
        endif
    else
        if (nLines == 0) || (nLines == 1)
            exe "normal! :s/\\/\\*\\s\\{0,1\\}//\<ENTER>:s/\\s\\{0,1\\}\\*\\///\<ENTER>"
        else
            let nLines -= 1
            exe "normal! :s/\\/\\*\\s\\{0,1\\}//\<ENTER>" nLines . "j:s/\\s\\{0,1\\}\\*\\///\<ENTER>"
        endif
    endif
endfunction

:nnoremap <buffer> <leader>i          :call InsertIncludeGuards()<CR>
:nnoremap <buffer> <leader>k          :call CommentNLines(input(''))<CR>
:nnoremap <buffer> <leader><C-k>      :call CommentBlockNLines(input(''))<CR>
:cnoremap <buffer> W w<CR>:!g++ % -o %:r<CR>
