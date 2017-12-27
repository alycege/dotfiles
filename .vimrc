"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version:
"       5.0 - 29/05/12 15:43:36
"
" Blog_post:
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version:
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

filetype off
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dracula/vim'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
" Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'
Plug 'kana/vim-operator-user'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rhysd/vim-clang-format'
Plug 'scrooloose/nerdtree'
Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'wellle/targets.vim'
Plug 'terryma/vim-expand-region'
Plug 'majutsushi/tagbar'
Plug 'raimondi/delimitmate'

" Plug 'ludovicchabant/vim-gutentags'

call plug#end()
filetype plugin indent on

set modelines=0

let mapleader = ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Easymotion
" ==========
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

map <leader> <Plug>(easymotion-prefix)

" Find
nmap s <Plug>(easymotion-overwin-f)
" " Bidirectional searching
 map <leader>z <Plug>(easymotion-bd-w)
nmap <leader>z <Plug>(easymotion-overwin-w)

" Airline
let g:airline_theme='badwolf'

" Python syntax
" =============
let python_highlight_builtins = 1
let python_highlight_builtin_funcs = 1
let python_highlight_builtin_objs = 1
let python_highlight_exceptions = 1
let python_highlight_string_format = 1
let python_highlight_string_formatting = 1

" NERDTree
nnoremap <C-n> :NERDTreeToggle<cr>

" Clang Format
" map <unique> <leader>ff <Plug>(operator-clang-format)
" nmap <unique> <leader>ff <Plug>(operator-clang-format)
autocmd FileType c,cpp nnoremap <buffer><leader>cf :<C-u>ClangFormat<cr>
autocmd FileType c,cpp vnoremap <buffer><leader>cf :ClangFormat<cr>
nmap <leader>C :ClangFormatAutoToggle<cr>

nmap <leader>t= :Tabularize /=<cr>
vmap <leader>t= :Tabularize /=<cr>
nmap <leader>t: :Tabularize /:\zs<cr>
vmap <leader>t: :Tabularize /:\zs<cr>
nmap <leader>t, :Tabularize /,\zs/l0r1<cr>
vmap <leader>t, :Tabularize /,\zs/l0r1<cr>
nmap <leader>t\  :Tabularize /\ \zs/l0r1<cr>
vmap <leader>t\  :Tabularize /\ \zs/l0r1<cr>

" GitGutter
let g:gitgutter_enabled = 0 " Disable by default
nnoremap <C-G> :GitGutterToggle<cr>
set updatetime=250

" YouCompleteMe
" Disable YouCompleteMe on startup - comment out to enable
" let g:loaded_youcompleteme = 1
nnoremap <F5> :YcmForceCompileAndDiagnostic<cr>
nnoremap <F6> :YcmShowDetailedDiagnostic<cr>
nnoremap <leader>fx :YcmCompleter FixIt<cr>
let g:ycm_warning_symbol = 'w'
let g:ycm_error_symbol = 'x'
let g:ycm_autoclose_preview_window_after_completion = 1

" ExpandRegion
" FIXME(afrazer): How should I fix this
" map K <Plug>(expand_region_expand)
" map J <Plug>(expand_region_shrink)

" Ack
if executable('ag')
    let g:ackprog = 'ag --vimgrep'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nnoremap <leader>w :w!<cr>

" I'll try this for a while to see if I like it
" Exit insert mode with a little roll
inoremap jk <esc>
" inoremap <esc> <nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Substitute globally on line
set gdefault

" Fix Vim regex
nnoremap / /\v
vnoremap / /\v

" Disable highlight
nnoremap <leader><space> :noh<cr>

" Use tab to jump around bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Show line numbers by default
set number
if exists('+relativenumber')
    set relativenumber
endif

" Fast terminal connection
set ttyfast


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" colorscheme delek
" set background=dark
color dracula

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set fileformats=unix,dos,mac

" Use Python syntax highlighting for .cfg files
autocmd BufRead,BufNewFile *.cfg set filetype=python

" C++ Syntax
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab syntax=cpp11
autocmd FileType c,cpp setlocal commentstring=//\ %s

" CMake Syntax
autocmd FileType cmake setlocal commentstring=#\ %s


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Reset the list chars
" Enter the right-angle-quote by pressing Ctrl-k then >>
" Enter the middle-dot by pressing Ctrl-k then .M
" Enter the Pilcrow mark by pressing Ctrl-k then PI
" Enter the large double quotes by pressing Ctrl-k then *> (or <*)
" NB- The command :dig displays other digraphs you can use.
" set listchars=tab:»·,trail:-,eol:√,precedes:≤,extends:≥
set  listchars=tab::?,trail:-,eol:$,precedes:<,extends:>
map <leader>ss :setlocal list!<cr>

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Use spaces instead of tabs
set expandtab

" Linebreak on 500 characters
set lbr
set tw=500

set autoindent
set smartindent
set nowrap

" Highlight invisble chars by default
"set list

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""

" Reselect text just pasted
nnoremap <leader>v V`]

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Just to make Vim useless for any n00bs
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" Get rid of help
inoremap <f1> <esc>
nnoremap <f1> <esc>
vnoremap <f1> <esc>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Create barrier
nnoremap <leader>l yypVr=

" Yank until end of line
nnoremap Y y$

" Playback macro in register q
nnoremap Q @q

" Fix Vim regex
nnoremap <leader>c :'<,'>!column -t<cr>

" This is like my Tmux
nnoremap <leader>- <c-w>s<c-w>k
nnoremap <leader><bar> <c-w>v<c-w>l

" Smart way to move between windows
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" nnoremap <c-h> <c-w>h
" nnoremap <c-l> <c-w>l

nnoremap <c-j> :bn<cr>
nnoremap <c-k> :bp<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Useful mappings for copying/pasting into/from windows clipboard
map <leader>y "+y
map <leader>yy "+yy
map <leader>p "+p
map <leader>P "+P

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
" set viminfo^=%
set viminfo+='1000,n/var/ctp/afrazer/tools/.viminfo
set clipboard=exclude:.*

nnoremap <leader>. :CtrlPTag<cr>


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ %l\ -\ %c\ %{fugitive#statusline()}
hi statusline ctermfg=6 ctermbg=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Split the line at the cursor
nnoremap K i<cr><esc>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.cfg :call DeleteTrailingWS()
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()
autocmd BufWrite *.hpp :call DeleteTrailingWS()

" Get rid of whitespace explicitly
nnoremap <leader>W :call DeleteTrailingWS()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
"map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
"map <leader>p :cp<cr>

" Now I can actually read the highlighting
hi Search cterm=NONE ctermfg=black ctermbg=white
hi Visual cterm=NONE ctermfg=black ctermbg=white

hi CursorLine   cterm=None ctermfg=black ctermbg=white
hi CursorColumn cterm=None ctermfg=black ctermbg=white
nnoremap \c :set cursorline!<cr>

" Change the highlighting for the current line number
" hi CursorLineNR cterm=None ctermfg=black ctermbg=white


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
" map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

augroup vimrc_todo
    au!
    au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX|FUXME)/
        \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
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

" I like to see what I'm saving sometimes
function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
command! DiffSaved call <SID>DiffWithSaved()

" XXX(afrazer): Should I use a snippts plugin for this??
let @n='OdummyjkgccwCXXX(afrazer): '


