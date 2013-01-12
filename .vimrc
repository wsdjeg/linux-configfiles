" settings
" functionality
" run in nocompatible, giving us more options. This should be the first command
set nocompatible

" load plugins
call pathogen#infect()
Helptags

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
let mapleader=","

" messages and info
set showcmd
set showmode
set noerrorbells
set novisualbell

set wildmenu
set wildmode=list:longest
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

set hlsearch
set incsearch


" gui options
set guioptions=emg

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
" AutoComplPop
" make it case sensitive
let g:acp_ignorecaseOption=0

" minibufexpl
" open at 1 buffer
let g:miniBufExplorerMoreThanOne=1

" vimpager
let vimpager_use_gvim=1

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" javascript indent
let g:SimpleJsIndenter_BriefMode=1

" taglist
"let('Tlist_Ctags_Cmd', '"/usr/local/bin/ctags"')
"let('Tlist_Use_Right_Window', '1')
"let('Tlist_File_Fold_Auto_Close', '1')
"let('Tlist_Enable_Fold_Column', '0')
"let('Tlist_Show_One_File', '1')
"let('Tlist_Auto_Open', '0')

" ctrlp
let g:ctrlp_working_path_mode=0


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

" switch buffers
map <tab> :bn<cr>
map <S-tab> :bp<cr>

" move through splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" run coffeescript files
map <F5> :!coffee %<cr>
map <F6> :!grunt<cr>

" open and reload .vimrc
map <leader>v :vsplit ~/.vimrc<cr>
map <leader>V :bufdo :source ~/.vimrc<cr>:bufdo :filetype detect<cr>

" NERDTree
map <leader>[ :NERDTreeToggle<cr>
map <leader>] :TlistToggle<cr>

" resync syntax
map <leader>sy :syntax sync fromstart<cr>

" improved buffer delete
map <leader>d :SmartBd<cr>
map <leader>c :SmartBw<cr>

" Toggle background color
"map <f12> :call l:ToggleColorschemeBackground()<cr>
