colorscheme badwolf  " badwolf.vim required in ~/.vim/colors

syntax enable  " enable syntax processing

set tabstop=4  " number of visual spaces per TAB

set softtabstop=4  " number of spaces in tab when editing

set expandtab  " tabs are spaces

set cursorline  " highlight current line

set incsearch  " search as characters are entered

set hlsearch  " highlight matches

set foldenable          " enable folding

set foldlevelstart=10   " open most folds by default

set foldnestmax=10      " 10 nested fold max

set foldmethod=indent   " fold based on indent level

" space open/closes folds
nnoremap <space> za


filetype on

filetype plugin on

filetype indent on

set rnu

set shiftwidth=4


set scrolloff=5

set nowrap

set incsearch

set smartcase

set showcmd

set showmode

set showmatch

set hlsearch

set history=2000

set wildmenu

set wildmode=list:longest

set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


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



" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}




" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')



  Plug 'dense-analysis/ale'

  Plug 'preservim/nerdtree'


call plug#end()

" }}}
