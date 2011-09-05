" functionality
"
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

  " autocommands
  if !exists('autocommands_loaded')
    let autocommands_loaded = 1
    " .coffee files should be sourced as coffeescript
    autocmd BufEnter *.coffee set ft=coffee
  endif

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
  set noexpandtab

  " backups
  set writebackup
  set backup
  set swapfile
  set backupcopy=auto
  set backupdir=~/.vim/backup
  set directory=~/.vim/temp

" display
  " Don't load the matchparen plugin that's included with vim.
  "let loaded_matchparen = 1

  " show "invisible" characters
  set list
  "set listchars=tab:·\ ,trail:+,extends:»,precedes:«
  "set listchars=tab:\|\ ,trail:·,extends:»,precedes:«
  set listchars=tab:»\ ,trail:·

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
  set hlsearch
  set incsearch

  " gui
  if has('gui_running')
    " gui options
    set guioptions=c

    " colorscheme
    colorscheme Tomorrow

    " font
    if has('win32')
      set guifont=Droid_Sans_Mono:h8
    elseif has('macunix')
      set guifont=ProFont:h9
      set noantialias
    else
      set guifont=Droid\ Sans\ Mono\ 10
    endif
  else
    " colorscheme
    colorscheme slate
  endif

" plugins
  " vimpager
  let vimpager_use_gvim = 1

  " syntastic
  let g:syntastic_enable_signs = 1
  let g:syntastic_auto_jump = 1
  let g:syntastic_auto_loc_list = 1

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
    map <leader>dd "*d
    map <leader>pp "*p
    map <leader>yy "*y

    " switch buffers
    map <tab> :bn<cr>
    map <S-tab> :bp<cr>

    " open and reload .vimrc
    map <leader>v :vsplit ~/.vimrc<cr>
    map <leader>V :bufdo :source ~/.vimrc<cr>:bufdo :filetype detect<cr>:echo 'reloaded .vimrc'<cr>

    " NERDTree
    map <leader>[ :NERDTreeToggle<cr>

    " resync syntax
    map <leader>sy :syntax sync fromstart<cr>

    " improved buffer delete
    map <leader>d :SmartBd<cr>
    map <leader>c :SmartBw<cr>

    " F keys for quick access to 'stuff'
    map <f11> :colo pyte<cr>
    map <f12> :colo molokai<cr>

