"          _                           
" __   __ (_)  _ __ ___    _ __    ___ 
" \ \ / / | | | '_ ` _ \  | '__|  / __|
"  \ V /  | | | | | | | | | |    | (__ 
"   \_/   |_| |_| |_| |_| |_|     \___|
"
"

call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
call plug#end()

colorscheme gruvbox
set background=dark

syntax on

" Allows you to re-use the same window and switch from an unsaved buffer without saving it first. 
" Also allows you to keep an undo history for multiple files when re-using the same window
set hidden

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
" set nostartofline

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
" set pastetoggle=<F11>

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

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"------------------------------------------------------------
" FileType Mappings
"------------------------------------------------------------
" **** Moved to files in ~/.config//nvim/ftplugin/<filetype>.vim ****

"------------------------------------------------------------
" Macros
"------------------------------------------------------------

" Macro to search in file for lines that don't contain passed word
let @f = "/^\\(\\(.*.*\\)\\@!.\\)*$\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>\<Left>"


"------------------------------------------------------------

