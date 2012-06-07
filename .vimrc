" Basic options {{{
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set ai                  " auto indenting
set history=100         " keep 100 lines of history
set ruler               " show the cursor position
syntax on               " syntax highlighting
set hlsearch            " highlight the last searched term
filetype plugin on      " use the file type plugins
set runtimepath+=~/.vim/indent

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set backupdir=~/.Trash
set directory=~/.Trash

set incsearch
set switchbuf=usetab
set hidden
" set foldlevelstart=0
let mapleader = ","
let maplocalleader = "\\"
set number
noremap - ddp
noremap _ ddkP
inoremap <c-u> <esc>viwUea
nnoremap <c-O> <c-O>zz
nnoremap <c-I> <c-I>zz
nnoremap <c-u> viwU
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" bi"<esc>lea"<esc>
nnoremap <leader>' bi'<esc>lea'<esc>
vnoremap <leader>" di""<esc>hp
vnoremap <leader>' di''<esc>hp
nnoremap H 0
nnoremap L $
inoremap jk <esc>
nnoremap <leader>w :write<cr>
nnoremap <leader>q :quit<cr>

nnoremap <leader>bs :buffers<cr>
nnoremap <leader><leader> :b#<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>noh :noh<cr>

" map blockwise visual mode to leader-v, ctrl is hard to hit
nnoremap <leader>v 0<c-V>


" replace word with last yanked text
"
" 'mf' sets a mark,
" A<space><esc> appends a space at the end of the line
" `f jumps back to the word
" _diwP deletes it into the black hole buffer and pastes the new word
" A<backspace><esc> removes the blank space from the end of the line
" `f jumps back to the word
" :delm<space>f<cr> removes the mark
"
" it's necessary to add a space on the end because otherwise the script
" is inconsistent depending on whether the word to be replaced is at
" the end of the line or not
nnoremap <leader>R mfA<space><esc>`f"_diwPA<backspace><esc>`f:delm<space>f<cr>

" Set pwd to directory of current file and print it
nnoremap <leader>cd :lcd %:p:h<cr>:pwd<cr>

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>
map <leader>bl :CommandTFlush<cr>\|:CommandTBuffer<cr>
" }}}

" Vimscript file settings {{{
augroup filetyp_vim
    autocmd!

    " Folding
    autocmd FileType vim setlocal foldmethod=marker

    " Comment abbreviations
    autocmd FileType vim        :nnoremap <buffer> <localleader>c I"<space><esc>
augroup END
" }}}

" Python file settings {{{
augroup filetype_python
    au!

    " line length
    setlocal textwidth=79

    " Comment/Uncomment lines from visual mode
    "   :nohl is needed or else comments get highlighted
    vnoremap <leader>c I#<esc>:nohl<cr>
    vnoremap <leader>u :s/^#/<cr>:nohl<cr>

    " Abbreviations
    "autocmd FileType python     :iabbrev <buffer> ret return
    "autocmd FileType python     :iabbrev <buffer> return NOPENOPENOPE

    " Replacements
    " autocmd FileType python     :nnoremap <buffer> <localleader>c 0i#<esc>
augroup END
" }}}
    
" Javascript file settings {{{
augroup filetype_javasript
    autocmd!

    " Return abbreviations
    autocmd FileType javascript :iabbrev <buffer> ret return;
    autocmd FileType javascript :iabbrev <buffer> return; NOPENOPENOPE
    
augroup END
" }}}

" Predefined stuff {{{
augroup cursor_position
    autocmd!

    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if ! exists("g:leave_my_cursor_position_alone") |
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \ exe "normal g'\"" |
    \ endif |
    \ endif
augroup END

" call pathogen#infect() 
" }}}
