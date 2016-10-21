" Basic options {{{

" set ai                  " auto indenting
set shell=/bin/bash     " fish shell screws up stuff like go integration
set history=100         " keep 100 lines of history
set ruler               " show the cursor position
set wildmenu            " show options when autocompleting a path
syntax on               " syntax highlighting
set hlsearch            " highlight the last searched term
set runtimepath+=~/.vim/indent

" For go
set rtp+=$GOROOT/misc/vim

" Keep the cursor at least 10 characters from the edge of the screen
set scrolloff=10

" only do case-sensitive searches when searching for uppercase characters
set smartcase

" make grep always search recursively
set grepprg=grep\ -rnIi

" For some reason Y grabs the whole line
nnoremap Y y$

" Don't move the cursor to the beginning of the line when switching between
" buffers
set nostartofline

" don't wrap lines
set nowrap

" Filetypes to ignore
set wildignore+=*/.git/*,*/env/*,*/node_modules/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/.class,*/target

" Tab-completion bash style for filenames
set wildmode=longest,list

set incsearch
set switchbuf=usetab
set hidden

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set nobackup
set noswapfile

let mapleader = " "
let maplocalleader = "\\"
set number
nnoremap H ^
nnoremap L $
inoremap jk <esc>
inoremap Jk <esc>
inoremap JK <esc>
nnoremap <leader>s :update<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>x :x<cr>

" nnoremap <leader>bs :buffers<cr>
nnoremap <leader><leader> :b#<cr>
" see plugin/bclose.vim
nmap <leader>ad <Plug>Kwbd
noremap - ddp
noremap _ ddkP
inoremap <c-u> <esc>viwUea
" nnoremap <c-O> <c-O>zz
" nnoremap <c-I> <c-I>zz
" nnoremap <c-u> viwU
nnoremap <leader>ev :e $MYVIMRC<cr>
" nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" bi"<esc>lea"<esc>
nnoremap <leader>' bi'<esc>lea'<esc>
vnoremap <leader>" di""<esc>hp
vnoremap <leader>' di''<esc>hp
nnoremap <leader>noh :noh<cr>
" faster double ctrl-w
" nnoremap <leader>ss <c-w><c-w>

" quick navigation between vim panes
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" map blockwise visual mode to leader-v, ctrl is hard to hit
nnoremap <leader>v 0<c-V>

" toggle showing column numbers
nnoremap <c-n><c-n> :set invnumber<CR>

" split windows
nnoremap <leader>vs <c-w>v
nnoremap <leader>hs <c-w>s

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

" quickly jump to a file's directory
nnoremap <leader>ls :e <C-R>=expand('%:h').'/'<cr><cr>


au FileType python set colorcolumn=80
au FileType java set colorcolumn=100
au FileType scala set colorcolumn=100

" }}}

" {{{ Vundle Setup

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'Lokaltog/vim-powerline'
Plugin 'kien/ctrlp.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'jdevera/vim-protobuf-syntax'
Plugin 'tmalloy/nerdcommenter'
Plugin 'dag/vim2hs'
Plugin 'derekwyatt/vim-scala'
Plugin 'easymotion/vim-easymotion'
Plugin 'rust-lang/rust.vim'

call vundle#end()

"filetype plugin on      " use the file type plugins
filetype plugin indent on

" }}}

" {{{ MacVim settings

if has("gui_running")
    set guioptions=-t
endif

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
    
" HTML file settings {{{
augroup filetype_html
    autocmd!

    " Return abbreviations
    autocmd Filetype html setlocal ts=2 sw=2 expandtab
    
augroup END
" }}}
    
" Javascript file settings {{{
augroup filetype_javascript
    autocmd!

    " Return abbreviations
    autocmd FileType javascript :iabbrev <buffer> ret return;
    autocmd FileType javascript :iabbrev <buffer> return; NOPENOPENOPE
    autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
    
augroup END
" }}}

" Predefined stuff {{{
augroup cursor_position
    autocmd!

    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if ! exists("g:leave_my_cursor_position_alone") |
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \ if expand('%:t') != "COMMIT_EDITMSG" |
    \ exe "normal g'\"" |
    \ endif |
    \ endif |
    \ endif
augroup END

" }}}

" Custom functions {{{

function! GrepForCurrentWord()
    ccl
    " call setqflist([])
    call inputsave()
    let b:tm_grep_folder = input('Folder: ', "", "file")
    call inputrestore()

    if b:tm_grep_folder == ""
        let b:tm_grep_folder = "."
    endif

    execute "grep! " . shellescape(expand("<cword>")) . " " . b:tm_grep_folder
    cw
endfunction

nnoremap <leader>gr :call GrepForCurrentWord()<cr>



" }}}

" Git stuff {{{

 
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gb :Gbrowse<cr>
nnoremap <leader>gc :Gcommit<cr>


" }}}

" Syntastic settings {{{

let g:syntastic_check_on_open=1
let g:syntastic_auto_jump=1
let g:syntastic_quiet_warnings=1
let g:syntastic_auto_loc_list=1


" }}}

" ctrlp settings {{{

map <leader>f :CtrlP<cr>
map <leader>F :CtrlP %:p:h<cr>
map <leader>al :CtrlPBuffer<cr>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|pyc|o|d)$',
  \ }

" }}}

" TagBar settings {{{

"nmap <leader><leader>t :TagbarToggle<CR>

" }}}

" {{{ gitgutter settings

" For gitgutter, make sign column clear
augroup gitguttergroup 
    au!

    autocmd BufRead * :highlight clear SignColumn

augroup END    

" }}}

" {{{ Go file settings
let g:go_fmt_autosave = 0

" }}}

" {{{ easymotion settings

let g:EasyMotion_startofline = 0 " maintain column position

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-s)
 
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions

map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

map <leader>w <Plug>(easymotion-w)
map <leader>b <Plug>(easymotion-b)


" }}}
