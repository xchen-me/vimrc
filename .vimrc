set nocompatible                " makes Vim work without being Vi-compatible, all improvements/features available to the user.

" set SPACE as the leader key
let g:mapleader = "\<Space>"

" let g:python3_host_prog = '/usr/local/bin/python3'
" let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.7/bin/python3'
" let g:python3_host_prog = '$HOME/Library/Python/3.7/bin/'
" let g:python3_host_prog = '$HOME/Library/Python/3.9/bin/'

set ruler              			 " Show the cursor position all the time
set iskeyword+=-             " treat dash separated words as a word text object"
set mouse=a                  " Enable your mouse
set splitbelow               " Horizontal splits will automatically be below
set splitright               " Vertical splits will automatically be to the right
set wrap                     " wrap lines 
set whichwrap+=b,h,l,<,>,[,]
set t_Co=256               " Support 256 colors
set termguicolors
set lazyredraw             " Improve speed dealing with large files
syntax enable              " Enables syntax highlighing
set hidden                 " Required to keep multiple buffers open multiple buffers
set backspace=indent,eol,start
set encoding=utf-8         " The encoding displayed
set pumheight=10           " Makes popup menu smaller
set fileencoding=utf-8     " The encoding written to file
" set shortmess=at
set shortmess+=c           " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes
set cmdheight=2            " More space for displaying messages
let g:indentLine_enabled = 0
set conceallevel=2         " So that I can see `` in markdown files
set concealcursor=v        " conceal and show up when cursor hovers at text
set tabstop=2              " Insert 2 spaces for a tab
set shiftwidth=2           " Change the number of space characters inserted for indentation
set softtabstop=2
set smarttab               " Makes tabbing smarter will realize you have 2 vs 4
set expandtab              " Converts tabs to spaces
set smartindent            " Makes indenting smart
set autoindent             " Good auto indent
set laststatus=2           " Always display the status line
set relativenumber         " Line numbers
" set cursorline             " Enable highlighting of the current line
" autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg
" autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg
" colorscheme torte
set background=dark        " tell vim what the background color looks like
set showtabline=2          " Always show tabs
set noshowmode             " We don't need to see things like -- INSERT -- anymore
set guioptions-=l          " remove scrollbar
set guioptions-=L          " remove scrollbar
set guioptions-=r          " remove scrollbar
set guioptions-=R          " remove scrollbar
set nobackup                 " This is recommended by coc
set nowritebackup            " This is recommended by coc
set noswapfile
if !isdirectory($HOME."/.vim")
  call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
  call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile
set history=100					     " Default = 8
set linebreak					       " Only wrap at sensible places
set updatetime=300           " Faster completion
set timeoutlen=500           " By default timeoutlen is 1000 ms
set formatoptions-=cro       " Stop newline continution of comments

set autoread
au CursorHold * checktime

" yank to system clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus  
  endif
endif

set ignorecase               " search ignores case 
set smartcase                " search uses smartcase
set incsearch
set hlsearch

" Update a buffer's contents on focus if it changed outside of Vim.
au FocusGained,BufEnter * :checktime

" set autowrite
set autowriteall
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

filetype plugin on
filetype plugin indent on

""""""""""""""""""""
" Keymaps
""""""""""""""""""""
" " Swap J with gJ. I mostly use gJ to join lines.
nnoremap J gJ
nnoremap gJ J
nnoremap j gj
" k is already mapped to gk in the pencil plugin 
nnoremap k gk

" paste the same text a second time
xnoremap <silent> p p:let @"=@0<CR>

" less stress on the right pinky
nnoremap <leader>; :
" nnoremap ; :

  " faster buffer closing
  nnoremap Q q
  " nnoremap q :Bclose<CR>
  " Alternate way to quit
  nnoremap <C-Q> :wq!<CR>
  nnoremap <leader>qq ZZ

  " Vim has long-felt issues with remapping the CR key
  " nnoremap <D-CR> ]<Space>
  " nnoremap <D-S-CR> [<Space>
  " inoremap <D-CR> <Esc>]<Space>i
  " inoremap <D-S-CR> <Esc>[<Space>i

  " {{{
  " buffer
  nnoremap <Leader>bD :Bclose<CR>
  nnoremap <Leader>bd :BufferClose<CR>
  nnoremap <Leader>bk :BufferClose<CR>
  " nnoremap <Leader>bc :BufferClose<CR>
  " nnoremap <D-w> :Bdelete<CR>
  nnoremap <D-w> :BufferClose<CR>
  " inoremap <D-w> <Esc>:Bdelete<CR>
  inoremap <D-w> <Esc>:BufferClose<CR>
  nnoremap <Leader>bn ]b<CR>
  nnoremap <Leader>bp [b<CR>
  nnoremap <Leader>bN :enew<CR>
  " }}}

  " {{{
  " Window 
  " navigation
  nnoremap <Leader>wd :close<CR>
  nnoremap <leader>wh <C-w>h
  nnoremap <leader>wj <C-w>j
  nnoremap <leader>wk <C-w>k
  nnoremap <leader>wl <C-w>l
  nnoremap <leader>wv <C-w>v
  nnoremap <leader>ws <C-w>s
  nnoremap <leader>ww <C-w>w
  nnoremap <leader>wr <C-w>r
  nnoremap <Leader>wo <C-w>o
  nnoremap <Leader>w= <C-w>=

  nnoremap <C-x>o <C-w>w
  inoremap <C-x>o <C-w>w


  " Use Cmd+alt+Shift+ hjkl to resize windows
  nnoremap <D-M-S-j> :resize -2<CR>
  nnoremap <D-M-S-k> :resize +2<CR>
  nnoremap <D-M-S-h> :vertical resize -2<CR>
  nnoremap <D-M-S-l> :vertical resize +2<CR>
  inoremap <D-M-S-j> <Esc>:resize -2<CR>
  inoremap <D-M-S-k> <Esc>:resize +2<CR>
  inoremap <D-M-S-h> <Esc>:vertical resize -2<CR>
  inoremap <D-M-S-l> <Esc>:vertical resize +2<CR>
  " }}}

  " Easier escape
  inoremap jk <Esc>
  " inoremap kj <Esc>
  " do it in command line too
  cnoremap jk <C-c>
  " but not in visual mode: xnoremap jk will mess up j motion in visual mode

  " tab movement
  " same function as [b and ]b
  nnoremap <C-TAB> :bnext<CR>
  nnoremap <C-S-TAB> :bprevious<CR>

  " Alternate way to save
  nnoremap <C-s> :w<CR>
  inoremap <C-s> <Esc>:w<CR>i
  nnoremap <D-s> :w<CR>
  nnoremap <leader>fs :w<CR>

  " new tab
  nnoremap <D-t> :tabnew<CR>
  nnoremap <leader>bN :tabnew<CR>

  " <TAB>: completion.
  inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing to indent in visual mode
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
vnoremap < <gv
vnoremap > >gv

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" when using change command, don't put contents before change to register
noremap c "_c
noremap C "_C

" move selected lines up and down
nmap <C-S-Up> [e
nmap <C-S-Down> ]e
vmap <C-S-Up> [egv
vmap <C-S-Down> ]egv

" Alt + j / k to move lines up and down 
nmap ∆ ]e
nmap ˚ [e
vmap ∆ ]egv
vmap ˚ [egv

" Go to the first non-blank character of a line
noremap 0 ^
noremap ^ 0
" nnoremap L $
" nnoremap H 0

" more natural yank to the end
nnoremap Y y$

" Clear search highlights.
nmap <Space>= :let @/=''<CR>

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" directory management {{{ 
" change to the directory of the currently open file (this sets the current directory for all windows in Vim)
" https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Open files located in the same dir in with the current file is edited
nnoremap \ew :e <C-R>=expand("%:.:h") . "/"<CR>
" }}}
nnoremap <leader>oo :!open .<CR>

" press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file
" note it must be Leader instead of leader for correct binding of \rc
" nnoremap <Leader>r :%s///gc<Left><Left>
nnoremap <Leader>r :%s///gc<Left><Left><Left>
" mac comand+r to replace and confirm
nnoremap <D-r> :%s///gc<left><left><left>
" same as above but acting strictly on visual selection
xnoremap <Leader>r :s///gc<Left><Left><Left>
" mac comand+r to replace and confirm
xnoremap <D-r> :s///gc<Left><Left><Left>
" type a replacement term and press . to repeat the replacement again. useful
" for replacing a few instances of the term.
nnoremap <silent> c* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> c* "sy:let @/=@s<CR>cgn

" better Emacs-style command line navigation
" --------------
" built in features:
" ctrl w backward deletes a word
" ctrl u backward deletes to the start of the line; 
" inoremap <C-u> <Esc>d0xi
" --------------
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-e> <End>
cnoremap <C-d> <Delete>
nnoremap <C-k> d$
" Meta b
cnoremap ∫ <S-Left>
" Meta f
cnoremap ƒ <S-Right>
" Meta d 
cnoremap ∂ <S-Right><C-w>
" Meta Backspace deletes backward a word
cnoremap <M-BS> <C-w>
" commandline paste
" https://medium.com/usevim/vim-101-pasting-into-command-line-mode-db5946a1e8a7 
cnoremap <C-y> <C-r>"

  "Movement in insert mode
  inoremap <C-a> <Home>
  inoremap <C-b> <Left>
  inoremap <C-f> <Right>
  inoremap <C-e> <End>
  inoremap <C-d> <Delete>
  inoremap <C-k> <Esc>ld$a
  " alt/Meta b
  inoremap ∫ <S-Left>
  " alt/Meta f
  inoremap ƒ <S-Right>
  " emacs style Alt-d to delete a word in forward direction
  inoremap ∂ <S-Right><C-w>
  inoremap <M-BS> <C-w>

  inoremap <M-left> <S-Left>
  inoremap <M-right> <S-Right>
  " alt h
  inoremap ˙ <S-Left>
  " alt l
  inoremap ¬ <S-Right>
  inoremap <C-n> <Down>
  inoremap <C-p> <Up>
  " emacs style ctrl k to delete to the end of the line
  " inoremap <C-k> <Esc>lDa
  " emacs style alt k to delete to the end of the line
  inoremap ˚ <Esc>lDa
  " paste
  inoremap <C-y> <C-r>"

  inoremap <D-left> <Home>
  inoremap <D-right> <End>
  " inoremap <D-h> <C-o>^
  " inoremap <D-l> <End>
  " shift is for selection
  inoremap <D-S-left> <C-o>v^
  inoremap <D-S-right> <C-o>v$
  inoremap <D-S-h> <C-o>v^
  inoremap <D-S-l> <C-o>v$
  inoremap <S-up> <C-o>h<C-o>vgk<C-o>l
  inoremap <S-down> <C-o>vgj
  inoremap <S-M-up> <C-o>h<C-o>vgk<C-o>l
  inoremap <S-M-down> <C-o>vgj
  inoremap <S-D-up> <C-o>h<C-o>vgk<C-o>l
  inoremap <S-D-down> <C-o>vgj
  inoremap <S-left> <C-o>h<C-o>v
  inoremap <S-right> <C-o>vl
  " option + shift + h/l to visual select word
  inoremap Ó <C-o>h<C-o>vb
  inoremap Ò <C-o>ve
  inoremap <S-M-left> <C-o>h<C-o>vb
  inoremap <S-M-right> <C-o>ve

" these are mapped in visual mode
vmap <S-left> h
vmap <S-right> l
vmap <S-Down> j
vmap <S-Up> k
vmap <S-M-Down> j
vmap <S-M-Up> k
vmap <S-D-down> j
vmap <S-D-up> k
vmap <S-D-j> j
vmap <M-l> e
vmap <M-h> b
vmap <S-D-k> k
vmap <S-M-right> e
vmap <S-M-left> b
vmap <S-D-right> $
vmap <S-D-left> ^
vmap <S-D-l> $
vmap <S-D-h> ^
vmap <S-l> $
vmap <S-h> ^
" option shift h/l
vmap Ó b
vmap Ò w
vmap <backspace> x

" Mapping <Shift>-Arrows to selecting characters/lines
" activate visual mode in normal mode
nmap <S-Up> vgk
nmap <S-Down> vgj
nmap <S-M-Up> vgk
nmap <S-M-Down> vgj
nmap <S-M-right> vl
nmap <S-M-left> vh

noremap <D-left> ^
noremap <D-right> $
noremap <C-a> ^
" noremap <C-e> $
noremap <D-S-left> v^
noremap <D-S-right> v$
noremap <D-S-h> v^
noremap <D-S-l> v$
"
" switching between recent buffers in insert mode
  " Scroll the window so that current line is in the middle of the window.
  inoremap <C-l> <C-o>M
  inoremap <C-^> <C-o><C-^>
  " inoremap <C-e> <C-o><C-^>
  inoremap <D-z> <C-o>:u
nnoremap <D-z> u

" go back to previous file in one hand instead of ctrl + 6
" nnoremap <leader>` :e#<CR>
nnoremap <leader>` <C-^>

"" ----------------------------------------------------------------------------
" Markdown headings
" ----------------------------------------------------------------------------
nnoremap <leader>1 m`yypVr=``
" mark current location with `, go to front of the line, insert headings, go
" back to the original location 
nnoremap <leader>2 m`^i## <esc>``3l
" nnoremap <leader>2 m`yypVr-``
nnoremap <leader>3 m`^i### <esc>``4l
nnoremap <leader>4 m`^i#### <esc>``5l
nnoremap <leader>5 m`^i##### <esc>``6l

" more consistent increment with my emacs
nnoremap g= <C-a>
nnoremap g- <C-x>

" " insert lines without entering insert mode
" same as [ Space and ] Space in vim-unimpaired
" depreciating soon
" nnoremap <Leader>o o<Esc>
" nnoremap <Leader>O O<Esc>

" orgmode specific
autocmd Filetype org imap <Enter> <C-CR>

" goto file folder after opening it
augroup cdpwd
    autocmd!
    autocmd VimEnter * cd $PWD
augroup END
