" vim:foldmethod=marker:foldmarker=[[,]]

" Initialization [[
  " run in nocompatible, giving us more options. This should be the first command
  set nocompatible

  " load filetype plugins, indentation and turn syntax highlighting on
  filetype plugin indent on
  syntax on

  " load vundle
  filetype off
  set runtimepath+=~/.vim/bundle/vundle/
  call vundle#rc()
  Bundle 'gmarik/vundle'

  " set up file type detection
  " TODO: put with File Types
  autocmd BufNewFile,BufRead *.json set filetype=javascript
  autocmd BufNewFile,BufRead *.ejs  set filetype=html
  autocmd BufNewFile,BufRead *.hbs  set filetype=html
" ]]
  " Indentation [[
    set autoindent
    set tabstop=2
    set shiftwidth=2
    set expandtab
  " ]]
  " Backups [[
    set writebackup
    set backup
    set swapfile
    set backupcopy=auto
    set backupdir=~/.vim/backup
    set directory=~/.vim/temp
  " ]]
  " Mapping [[
    let mapleader=','
  " ]]
" Buffers / Files [[
  Bundle 'Industrial/vim-smartbd'
  Bundle 'Industrial/vim-smartbw'

  "Bundle 'fholgado/minibufexpl.vim'
  "  " open at 1 buffer
  "  let g:miniBufExplorerMoreThanOne=1

  Bundle 'kien/ctrlp.vim'
    let g:ctrlp_working_path_mode=0

  Bundle 'scrooloose/nerdtree'
    map <leader>[ :NERDTreeToggle<cr>

  Bundle 'majutsushi/tagbar'
    map <leader>] :TagbarToggle<cr>
    let g:tagbar_compact = 1

  "Bundle 'vim-scripts/taglist.vim'
  "  "let g:Tlist_Show_One_File=1
  "  let g:Tlist_Auto_Update=1
  "  let g:Tlist_Enable_Fold_Column=0
  "  let g:Tlist_File_Fold_Auto_Close=1
  "  let g:Tlist_Show_Menu=1
  "  let g:Tlist_Use_Right_Window=1
  "  autocmd vimenter * Tlist
  "  map <leader>] :TlistToggle<cr>

  " Display signs for the quickfix window
  "Bundle 'tomtom/quickfixsigns_vim'

  Bundle "bling/vim-airline"
    let g:airline_left_sep='>'
    let g:airline_right_sep='<'
    let g:airline_detect_modified=1
    let g:airline_detect_paste=1
    let g:airline_detect_iminsert=1
    let g:airline_inactive_collapse=1
    "let g:airline_theme=
    let g:airline_powerline_fonts=0
    "let g:airline_mode_map = {
    "    \ '__' : '-',
    "    \ 'n'  : 'N',
    "    \ 'i'  : 'I',
    "    \ 'R'  : 'R',
    "    \ 'c'  : 'C',
    "    \ 'v'  : 'V',
    "    \ 'V'  : 'V',
    "    \ '' : 'V',
    "    \ 's'  : 'S',
    "    \ 'S'  : 'S',
    "    \ '' : 'S',
    "    \ }

    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif

    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_right_sep = '«'
    let g:airline_symbols.linenr = '¶'
    "let g:airline_symbols.branch = 'B'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.whitespace = 'Ξ'


    let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#hunks#enabled = 0
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#whitespace#enabled = 1
    let g:airline#extensions#syntastic#enabled = 1
    "let g:airline#extensions#tagbar#enabled = 1
    let g:airline#extensions#csv#enabled = 1

  " make it possible to have buffers in the background
  set hidden

  " reload changes from disk
  set autoread

  " when vim opens, open NERDTree to the left, tagbar to the right and select
  " the file split on the right of NERDTree.
  autocmd vimenter * NERDTree | wincmd l
  autocmd vimenter * Tagbar
" ]]
" Movement [[
  " make movement keys wrap to the next/previous line
  set whichwrap=b,s,h,l,<,>,[,]

  " don't wrap lines
  set nowrap

  Bundle 'Lokaltog/vim-easymotion'
  let g:EasyMotion_leader_key = '<Leader>'

  " switch buffers
  map <tab> :bn<cr>
  map <S-tab> :bp<cr>

  " move through splits
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
" ]]
" Finding / Searching [[
  " TODO: this one screws up
  "Bundle 'ervandew/ag'
  Bundle 'Spaceghost/vim-matchit'
  Bundle 'vim-scripts/IndexedSearch'
  Bundle 'vim-scripts/grep.vim'
  map <C-f> :Rgrep<cr>
" ]]
" Cut, Copy and Paste [[
  Bundle 'maxbrunsfeld/vim-yankstack'
" ]]
" Syntax [[
  Bundle 'scrooloose/syntastic'
    let g:syntastic_check_on_open = 1
    let g:syntastic_auto_jump = 1
    let g:syntastic_auto_loc_list = 2
    let g:syntastic_error_symbol = '✗'
" ]]
" Completion [[
  "Bundle 'vim-scripts/L9'
  "  Bundle 'othree/vim-autocomplpop'
  "Bundle 'ervandew/supertab'
  "Bundle 'Valloric/YouCompleteMe'
  "Bundle 'Shougo/neocomplete.vim'
  "  let g:neocomplete#enable_at_startup = 1
  "  let g:neocomplete#enable_smart_case = 1
  "  let g:neocomplete#sources#syntax#min_keyword_length = 1
" ]]
" Version Control [[
  Bundle 'tpope/vim-fugitive'

  Bundle 'mattn/gist-vim'
    " If you want to detect filetype from the filename:
    let g:gist_detect_filetype = 1
    " If you want your gist to be private by default:
    let g:gist_post_private = 1
    " If you want to manipulate multiple files in a gist:
    let g:gist_get_multiplefile = 1

  "Bundle 'vim-scripts/vim-signify'

  Bundle 'gregsexton/gitv'
" ]]
" File Types [[
  Bundle 'digitaltoad/vim-jade'
  Bundle 'gkz/vim-ls'
  Bundle 'leshill/vim-json'
  Bundle 'othree/html5.vim'
  Bundle 'pangloss/vim-javascript'
  Bundle 'tpope/vim-git'
  Bundle 'wavded/vim-stylus'
" ]]
" Visual Information [[
  Bundle 'mattn/webapi-vim'
    Bundle 'Rykka/colorv.vim'
  Bundle 'nathanaelkane/vim-indent-guides'

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

  " show "invisible" characters
  set list
  set listchars=tab:·\ ,trail:+,extends:»,precedes:«

  " don't show chars on split and fold lines
  set fillchars=vert:\ ,fold:\ 

  " turn on line numbers
  set number

  " turn on a fold column of 1
  set foldcolumn=1
" ]]
" Font [[
  if has('macunix')
    "set guifont=Menlo:h14
    set guifont=Monaco:h9
  else
    " assume linux
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
    "set guifont=Terminess\ Powerline\ 9
  endif
" ]]
" Color Schemes [[
  Bundle 'w0ng/vim-hybrid'
  Bundle 'tomasr/molokai'
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'chriskempson/base16-vim'

  if has('gui_running')
    colorscheme base16-tomorrow
  else
    colorscheme slate
  endif

  function l:ToggleColorschemeBackground()
    if &background == 'light'
      set background=dark
    else
      set background=light
    endif
  endfunction

  " prepare the first call (set values to what we don't want)
  set background=light

  " then call
  call l:ToggleColorschemeBackground()

  " - Maps
    " Toggle background color
    map <f12> :call l:ToggleColorschemeBackground()<cr>
" ]]
" Maps [[
  " All Modes [[
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
    map <leader>v :edit ~/.vimrc<cr>
    map <leader>V :bufdo :source ~/.vimrc<cr>:bufdo :filetype detect<cr>

    " resync syntax
    map <leader>sy :syntax sync fromstart<cr>

    " improved buffer delete
    map <leader>d :SmartBd<cr>
    map <leader>c :SmartBw<cr>
  " ]]
  " Normal Mode [[
    " quick insert of newline
    "nmap <cr> o<esc>
  " ]]
  " Insert Mode [[
    " remap escape to jj
    inoremap jj <esc>
  " ]]
" ]]
" Finalization [[
filetype on
" ]]
