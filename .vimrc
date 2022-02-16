" colors {{{
syntax enable  " enable syntax processing
colorscheme badwolf  " badwolf.vim required in ~/.vim/colors
" set lazyredraw  " redraw only when we need it
set termguicolors
" }}}

" Spaces and Tabs {{{
set tabstop=4  " number of visual spaces per TAB
set softtabstop=4  " number of spaces in tab when editing
set expandtab  " tabs are spaces
set wildmenu  " visual autocomplete for command menu
" }}}

" layout {{{
set cursorline  " highlight current line
set showcmd  " show command in bottom bat
set showmode
set showmatch  " highlight braces [{()}]
set scrolloff=7
filetype indent on  " load filetype-specific indent files
" }}}

" search {{{
set incsearch  " search as characters are entered
set hlsearch  " highlight matches
" }}}

" Folding {{{
set foldmethod=marker   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " enable folding
set foldlevelstart=0   " open most folds by default"
nnoremap <space> za

" }}}

" Remapping {{{
" highlight last inserted text 
nnoremap gV `[v`] 
set number relativenumber  " show line numbers, relatively to current line, but current line number is absolute
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
" }}}

" Custom functions {{{
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
 endif


" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
" }}}

" Leader shortcuts {{{

let mapleader=","  " leader is comma

nnoremap <leader><space> :nohlsearch<CR>
" turn off permanent highlighting for search results
nnoremap <leader>l :call ToggleNumber()<CR>
nnoremap <leader>u :GundoToggle<CR>

" }}}

" Backup {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

" " STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=1

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" " }}}

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" Section Name {{{
" set number "This will be folded
" }}}
