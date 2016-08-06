" Alexander Frazer vimrc
"
" 8/29/15
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'

call plug#end()
filetype plugin indent on

" Tells vim to source .vimrc if present in working directory
" secure blocks commands that write to file or execute shell
" commands in this local .vimrc
set exrc
set secure

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Recommended newbie options for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" Turn off syntastic on file open because it's annoying
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { "mode": "passive" }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> VIM User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show current position
set ruler

" Show line numbers
" Setting number with relativenumber causes the current line to have absolute
" line number while all other numbers are relative
set number
set relativenumber

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" Ignore case when searching
set smartcase

" Highlight search results
set hlsearch

" Turns on global line substitution by default
set gdefault

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound of errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set background=dark
if has("gui_running")
  colorscheme slate
else
  colorscheme delek
endif

set guifont=Inconsolata\ 12
"set guifont=InputMono-Medium\ 12

" Set utf8 as standard encoding and en_US as standard language
set encoding=utf-8

" Use unix as the standard file type
set ffs=unix,dos,mac

" highlight current line
" set cursorline


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since we use git
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2

" For python/julia use 4 spaces
autocmd Filetype python setlocal ts=4 sw=4 expandtab
autocmd Filetype julia setlocal ts=4 sw=4 expandtab

" Linebreak on 500 characters
set lbr
"set tw=500

set ai      " Auto indent
set si      " Smart indent
set nowrap  " wrap lines


" Enable folding
"set foldenable

" Foled based on indent level
"set foldmethod=indent

" Open most folds by default
"set foldlevelstart=10

" 10 nested fold max
"set foldnestmax=10


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Visual mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<cr>
vnoremap <silent> # :call VisualSelection('b')<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
noremap <space> /
noremap <c-space> ?

"Disable highlight
nnoremap <leader><space> :noh<cr>

" Fix Vim regex
nnoremap / /\v
vnoremap / /\v

" Selects last pasted text
nnoremap <leader>v V`]

" Get rid of help
inoremap <f1> <esc>
nnoremap <f1> <esc>
vnoremap <f1> <esc>

" Smart way to move between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,100 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,uestab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (This is nice)
"autocmd BufReadPost *
"     \ if line("'\"") > 0 && line("'\"") <= line("$") |
"     \   exe "normal! g'\"" |
"     \ endif

" Remember info about open buffers on close
set viminfo^=%

" Toggle Syntactic Check
map <C-m> :SyntasticToggleMode<cr>

" Opens a NERDTree
map <C-n> :NERDTreeToggle<cr>

" Stuff for EasyMotion
" Disable default mappings
let g:EasyMotion_do_mapping = 0

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes
nmap s <Plug>(easymotion-s)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Search forward
map <leader>z <Plug>(easymotion-w)

" Map Enter to do nothing because it's annoying otherwise
map <enter> <nop>

" Toggle spelling
map <silent> <leader>m :call SpellToggle()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Remappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
nnoremap Q @q

nnoremap K i<cr><esc>==


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap jk <esc>

"autocmd BufNewFile,BufReadPost,FilterReadPost,FileReadPost * :call SyntasticToggleMode()

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()
autocmd BufWrite *.hpp :call DeleteTrailingWS()
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.h :call DeleteTrailingWS()
autocmd BufWrite Makefile :call DeleteTrailingWS()
autocmd BufWrite *.scala :call DeleteTrailingWS()


" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  en
  return ''
endfunction


" Toggles spelling
let s:is_spell_active = 0
function! SpellToggle()
  let s:is_spell_active = !s:is_spell_active
  setlocal spell! spelllang=en
  if s:is_spell_active
    echo "spell check enabled"
  else
    echo "spell check disabled"
  endif
endfunction


" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction




