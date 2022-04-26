"            _           
"  _____   _(_)_ __ ___  
" / __\ \ / / | '_ ` _ \ 
"| (__ \ V /| | | | | | |
" \___(_)_/ |_|_| |_| |_|
"                        
" This file belongs to ~/.config/nvim/ftplugin

function! InsertIncludeGuards()
    let fileext = toupper(expand("%:e"))
    let headerguard = join([toupper(expand("%:t:r")), fileext], '_')
    exe "normal" "1GO#ifndef" headerguard "\<BS>\n#define" headerguard "\<BS>\n\<ESC>"
    exe "normal" "Go\n#endif /*" headerguard "*/\n\<ESC>"
endfunction

:nnoremap <buffer> <leader>i          :call InsertIncludeGuards()<CR>

