"          _                           
" __   __ (_)  _ __ ___    _ __    ___ 
" \ \ / / | | | '_ ` _ \  | '__|  / __|
"  \ V /  | | | | | | | | | |    | (__ 
"   \_/   |_| |_| |_| |_| |_|     \___|
"
"
"
"
set nocompatible 
filetype plugin indent on
syntax on

" Allows you to re-use the same window and switch from an unsaved buffer without saving it first. 
" Also allows you to keep an undo history for multiple files when re-using the same window
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches 
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Make visualbell do nothing
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left with offset for other lines in respect to current line
set number relativenumber

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Splitting vim creates new window on the right/bottom
set splitbelow splitright

" Indentation settings for using 4 spaces instead of tabs.
set shiftwidth=4
set softtabstop=4
set expandtab


"------------------------------------------------------------
" Mappings
"------------------------------------------------------------

" Map Y to yank until EOL
map Y y$

" Better moving between splitted windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L>

"------------------------------------------------------------
" FileType Mappings
"------------------------------------------------------------
" **** Moved to files in ~/.vim/ftplugin/<filetype>.vim ****


"------------------------------------------------------------
" Plugins
"------------------------------------------------------------

"                          NERDTREE
set runtimepath+=~/.vim/bundle/nerdtree

"                          CLANG_COMPLETE
set runtimepath+=~/.vim/bundle/clang_complete
let g:clang_library_path='/usr/lib/libclang.so'
let g:clang_auto_select=1
let g:clang_complete_auto=1
let g:clang_complete_copen=1
let g_clang_hl_errors=1
let g:clang_periodic_quickfix=1
let g:clang_snippets=1
let g:clang_snippets_engine="clang_complete"
let g:clang_conceal_snippets=1
let g:clang_complete_optional_args_in_snippets=1
let g:clang_trailing_placeholder=1
let g:clang_close_preview=1
let g_clang_complete_macros=1
let g:clang_complete_patterns=1

"                         COLOR SCHEMES
set runtimepath+=~/.vim/bundle/colorschemes
colorscheme badwolf

"------------------------------------------------------------
" Macros
"------------------------------------------------------------

" Macro to search in file for lines that don't contain passed word
let @f = "/^\\(\\(.*.*\\)\\@!.\\)*$\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>"



"------------------------------------------------------------
