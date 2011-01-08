" functionality
  " on windows ensure we load from ~/.vim
  if has('win32')
    let &runtimepath = substitute(&runtimepath, '\(\~\|'.$USER.'\)/vimfiles\>', '\1/.vim', 'g')
  endif

  " load bundles
  call pathogen#runtime_append_all_bundles()
  call pathogen#helptags()

  " load filetype plugins, indentation and turn syntax highlighting on
  filetype plugin indent on
  syntax on

  " run in nocompatible, giving us more options
  set nocompatible

  " make movement keys wrap to the next/previous line
  set whichwrap=b,s,h,l,<,>,[,]
  set backspace=indent,eol,start

  " don't wrap lines
  set nowrap

  " make it possible to have buffers in the background
  set hidden

  " indentation
  set autoindent
  set tabstop=4
  set shiftwidth=4
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
  set listchars=tab:\|\ ,trail:·,extends:»,precedes:«

  " don't show chars on split and fold lines
  set fillchars=vert:\ ,fold:\ 

  " turn on line numbers
  set number

  " turn on a fold column of 1
  set foldcolumn=1

  " messages and info
  set showcmd
  set showmode
  set noerrorbells
  set novisualbell
  set wildmenu
  set hlsearch
  set incsearch

  " gui
  if has('gui_running')
    " gui options
    set guioptions=

    " colorscheme
    colorscheme industrial

    " font
    if has('win32')
      set guifont=ProFontWindows:h8
    elseif has('macunix')
      set guifont=Monaco:h9
    else
      "set guifont=DejaVu\ Sans\ Mono\ 14
      "set guifont=Droid\ Sans\ Mono\ 8
      "set guifont=Terminus\ 8
      set guifont=ProFont\ 10
    endif
  else
    " colorscheme
    colorscheme slate
  endif

" plugins
  " taglist
  let Tlist_Auto_Open = 1
  let Tlist_Use_Right_Window = 1

" maps
  " normal mode maps
    " ease of use / typos
    map :Q         :q
    map :W         :w
    map :E         :e

    " OS register copy pasting
    map <A-d>      "+d
    map <A-p>      "+p
    map <A-y>      "+y

    " mouse selection register copy pasting
    map <A-S-d>    "*d
    map <A-S-p>    "*p
    map <A-S-y>    "*y

    " switch buffers
    map <tab>      :bn<cr>
    map <S-tab>    :bp<cr>

    " NERDTree
    map <leader>[  :NERDTreeToggle<cr>

    " taglist
    map <leader>]  :TlistToggle<cr>

    " resync syntax
    map <leader>sy :syntax sync fromstart<cr>

    " improved buffer delete
    map :bd        :SmartBd

    " F keys for quick access to 'stuff'
    map <f11>      :colo pyte<cr>
    map <f12>      :colo industrial<cr>

