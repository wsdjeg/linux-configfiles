" settings
" functionality
" run in nocompatible, giving us more options. This should be the first command
set nocompatible

" for Vundle
filetype off

" Vundle
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" github plugins
" TODO: Order by type


" Dependencies
" for Rykka/colorv.vim
Bundle 'mattn/webapi-vim'
" for aut othree/vim-autocomplpop
Bundle 'vim-scripts/L9'


" Buffers / Files
Bundle 'fholgado/minibufexpl.vim'
  " open at 1 buffer
  let g:miniBufExplorerMoreThanOne=1

Bundle 'kien/ctrlp.vim'
  let g:ctrlp_working_path_mode=0

Bundle 'scrooloose/nerdtree'
  map <leader>[ :NERDTreeToggle<cr>
  map <leader>] :TlistToggle<cr>

Bundle 'scratch.vim'

Bundle 'Industrial/vim-smartbd'
Bundle 'Industrial/vim-smartbw'


" Movement
Bundle 'Lokaltog/vim-easymotion'

  " switch buffers
  map <tab> :bn<cr>
  map <S-tab> :bp<cr>

  " move through splits
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l


" Finding / Searching
" TODO: this one screws up
"Bundle 'ervandew/ag'
Bundle 'Spaceghost/vim-matchit'
Bundle 'vim-scripts/IndexedSearch'

" Cut, Copy and Paste
Bundle 'maxbrunsfeld/vim-yankstack'

" Syntax
Bundle 'scrooloose/syntastic'
  let g:syntastic_check_on_open=1
  let g:syntastic_auto_loc_list=1


" Completion
Bundle 'othree/vim-autocomplpop'
Bundle 'ervandew/supertab'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'msanders/snipmate.vim'


" Version Control
Bundle 'tpope/vim-fugitive'

Bundle 'mattn/gist-vim'
  " If you want to detect filetype from the filename:
  let g:gist_detect_filetype = 1
  " If you want your gist to be private by default:
  let g:gist_post_private = 1
  " If you want to manipulate multiple files in a gist:
  let g:gist_get_multiplefile = 1

Bundle 'gregsexton/gitv'

"Bundle 'svndiff'


" File Types
Bundle 'othree/html5.vim'
Bundle 'leshill/vim-json'
Bundle 'pangloss/vim-javascript'
Bundle 'wavded/vim-stylus'
Bundle 'digitaltoad/vim-jade'
Bundle 'tpope/vim-git'


" Colors
Bundle 'Rykka/colorv.vim'
Bundle 'nathanaelkane/vim-indent-guides'


" Color Schemes
Bundle 'w0ng/vim-hybrid'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'


" load filetype plugins, indentation and turn syntax highlighting on
filetype plugin indent on
syntax on

" set up file type detection
autocmd BufEnter *.coffee set ft=coffee
autocmd BufEnter *.json   set ft=javascript

" make movement keys wrap to the next/previous line
set whichwrap=b,s,h,l,<,>,[,]

" don't wrap lines
set nowrap

" make it possible to have buffers in the background
set hidden

" reload changes from disk
set autoread

" indentation
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

" backups
set writebackup
set backup
set swapfile
set backupcopy=auto
set backupdir=~/.vim/backup
set directory=~/.vim/temp


" display
" show "invisible" characters
set list
if has('gui')
  set listchars=tab:·\ ,trail:+,extends:»,precedes:«
else
  set listchars=tab:.\ ,trail:+
endif

" don't show chars on split and fold lines
set fillchars=vert:\ ,fold:\ 

" turn on line numbers
set number

" turn on a fold column of 1
set foldcolumn=1

" mapping settings
let mapleader=','

" messages and info
set showcmd
set showmode
set noerrorbells
set novisualbell

set wildmenu
set wildmode=list:longest
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*/node_modules/*

set hlsearch
set incsearch


" gui options
set guioptions=

" colorscheme
function l:ToggleColorschemeBackground()
  if !exists('g:lucius_style')
    " set to light by default, making it dark on the first invocation
    let g:lucius_style='light'
  endif

  if has('gui')
    if g:lucius_style=='dark'
      let g:lucius_style='light'
    else
      let g:lucius_style='dark'
    endif

    colorscheme lucius
  else
    colorscheme desert
  endif
endfunction

" Initialize by calling
"call l:ToggleColorschemeBackground()
if has('gui')
  colo skittles_berry
else
  color slate
endif

" font
if has('macunix')
  "set guifont=Menlo:h14
  set guifont=Monaco:h9
else
  " assume linux
  set guifont=Terminus\ 9
endif

" plugins
" Ack.vim
" use ag instead of ack in the background
"let g:ackprg = 'ag --nogroup --nocolor --column'


" maps
" make the alt key behave as alt on osx
if has('macunix')
  set macmeta
endif

" normal mode maps
" quick insert of newline
nmap <cr> o<esc>

" insert mode maps
" remap escape to jj
inoremap jj <esc>

" all mode maps
" ease of use / typos
map :Q :q
map :W :w
map :E :e

" OS register copy pasting
map <leader>d "+d
map <leader>p "+p
map <leader>y "+y

" mouse selection register copy pasting
map <leader>dd '"*d'
map <leader>pp '"*p'
map <leader>yy '"*y'

" open and reload .vimrc
map <leader>v :vsplit ~/.vimrc<cr>
map <leader>V :bufdo :source ~/.vimrc<cr>:bufdo :filetype detect<cr>

" resync syntax
map <leader>sy :syntax sync fromstart<cr>

" improved buffer delete
map <leader>d :SmartBd<cr>
map <leader>c :SmartBw<cr>

" Toggle background color
"map <f12> :call l:ToggleColorschemeBackground()<cr>

