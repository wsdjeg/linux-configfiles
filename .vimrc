" vim:foldmethod=marker:foldmarker=[[,]]:expandtab

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
  autocmd BufNewFile,BufRead *.json set filetype=javascript et ts=2 sts=2 sw=2
  autocmd BufNewFile,BufRead *.ejs  set filetype=html
  autocmd BufNewFile,BufRead *.hbs  set filetype=html
  autocmd BufNewFile,BufRead *.eex  set expandtab
" ]]
  " Indentation [[
    set autoindent
    set tabstop=2
    set shiftwidth=2
    set noexpandtab
  " ]]
  " Backups [[
    set writebackup
    set backup
    set noswapfile
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
    let g:ctrlp_use_caching=1
    let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](\.git|\.svn|\.hg|node_modules|bower_components|build|docs)'
      \ }

  Bundle 'scrooloose/nerdtree'
    "let g:NERDTreeWinPos='right'
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
    let g:airline_symbols.branch = 'B'
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
  "autocmd vimenter * NERDTree | wincmd l
  "autocmd vimenter * Tagbar
" ]]
" Movement [[
  " make movement keys wrap to the next/previous line
  set whichwrap=b,s,h,l,<,>,[,]

  " don't wrap lines
  set nowrap

  Bundle 'Lokaltog/vim-easymotion'
  let g:EasyMotion_leader_key = '<leader>'

  " switch buffers
  map <tab> :bn<cr>
  map <S-tab> :bp<cr>

  " move through splits
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l

  " keep a certain number of lines visible
  set scrolloff=50
" ]]
" Finding / Searching / Restructuring [[
  set noignorecase

  " TODO: this one screws up
  "Bundle 'ervandew/ag'
  Bundle 'Spaceghost/vim-matchit'
  Bundle 'vim-scripts/IndexedSearch'
  Bundle 'vim-scripts/grep.vim'

  map <C-f> :Rgrep<cr>

  map <leader>c :sort<cr>
" ]]
" Cut, Copy and Paste [[
  "Bundle 'maxbrunsfeld/vim-yankstack'
" ]]
" Syntax [[
  Bundle 'scrooloose/syntastic'
    let g:syntastic_check_on_open = 1
    let g:syntastic_auto_jump = 0
    let g:syntastic_auto_loc_list = 2
    "let g:syntastic_error_symbol = '!'
    let g:syntastic_error_symbol = '✗'
    let g:syntastic_warning_symbol = '⚠'
" ]]
" Completion [[
  "Bundle 'vim-scripts/L9'
  Bundle 'vim-scripts/AutoComplPop'
    let g:acp_ignorecaseOption = 1
    let g:acp_behaviorKeywordCommand = "\<C-p>"

  Bundle 'ervandew/supertab'

  "Bundle 'Valloric/YouCompleteMe'
  "Bundle 'Shougo/neocomplete.vim'
  "  let g:neocomplete#enable_at_startup = 1
  "  let g:neocomplete#enable_smart_case = 1
  "  let g:neocomplete#sources#syntax#min_keyword_length = 1

  " http://vim.wikia.com/wiki/Regex-based_text_alignment
  command! -nargs=? -range Align <line1>,<line2>call AlignSection('<args>')
  vnoremap <silent> <leader>a :Align<CR>
  function! AlignSection(regex) range
    let extra = 1
    let sep = empty(a:regex) ? '=' : a:regex
    let maxpos = 0
    let section = getline(a:firstline, a:lastline)
    for line in section
      let pos = match(line, ' *'.sep)
      if maxpos < pos
        let maxpos = pos
      endif
    endfor
    call map(section, 'AlignLine(v:val, sep, maxpos, extra)')
    call setline(a:firstline, section)
  endfunction

  function! AlignLine(line, sep, maxpos, extra)
    let m = matchlist(a:line, '\(.\{-}\) \{-}\('.a:sep.'.*\)')
    if empty(m)
      return a:line
    endif
    let spaces = repeat(' ', a:maxpos - strlen(m[1]) + a:extra)
    return m[1] . spaces . m[2]
  endfunction
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

  " Nice git integration.
  Bundle 'gregsexton/gitv'

  " Visualize the undo history as a tree.
  Bundle 'sjl/gundo.vim'
    map <leader>u :GundoToggle<cr>
" ]]
" File Types [[
  Bundle 'digitaltoad/vim-jade'
  Bundle 'gkz/vim-ls'
  Bundle 'groenewege/vim-less'
  Bundle 'kchmck/vim-coffee-script'
  Bundle 'leshill/vim-json'
  Bundle 'mintplant/vim-literate-coffeescript'
  Bundle 'othree/html5.vim'
  Bundle 'pangloss/vim-javascript'
  Bundle 'tpope/vim-git'
  Bundle 'tpope/vim-markdown'
  Bundle 'wavded/vim-stylus'
  Bundle 'elixir-lang/vim-elixir'
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
  "set listchars=tab:\|\ ,trail:-,extends:>,precedes:<,nbsp:%
  set listchars=tab:·\ ,trail:-,extends:>,precedes:<,nbsp:%

  " don't show chars on split and fold lines
  set fillchars=vert:\ ,fold:\ 

  " turn on line numbers
  set number

  " highlight the line the cursor is on
  set cursorline

  " Don't ignore anything (e.g. comments) when making folds
  set foldignore=

  function! ToggleFoldMode()
    if &foldmethod == 'indent'
      " set the fold method to indent
      setlocal foldmethod=manual

      " Remove all folds made by the other fold method.
      normal zE<cr>

      " Set the fold level to 0.
      setlocal foldlevel=0

      " But open all folds at level 1 when opening the file
      setlocal foldlevelstart=-1

      " And do not allow folds below this level
      setlocal foldnestmax=20

      " Allow one line folds.
      setlocal foldminlines=1

      " turn on a fold column of 1
      setlocal foldcolumn=1

    else
      " setlocal the fold method to indent
      setlocal foldmethod=indent

      " Set the fold level to 0
      setlocal foldlevel=0

      " But open all folds at level 1 when opening the file
      setlocal foldlevelstart=1

      " And do not allow folds below this level
      setlocal foldnestmax=2

      " Allow one line folds.
      setlocal foldminlines=0

      " turn on a fold column of 3
      setlocal foldcolumn=3
    endif
  endfunction

  " TODO: Can't get this to work. For now, just set the properties in the
  "       function to the default values that I want.
  setlocal foldmethod=manual
  normal zE<cr>
  setlocal foldlevel=0
  setlocal foldlevelstart=-1
  setlocal foldnestmax=20
  setlocal foldminlines=1
  setlocal foldcolumn=1

  "call ToggleFoldMode()

  " - Maps
    " Toggle fold mode
    map <f9> :call ToggleFoldMode()<cr>
" ]]
" Font [[
  function! ToggleFontSize()
    if w:font_size == 'small'
      if has('macunix')
        set guifont=Menlo:h14
      else
        " assume linux
        "set guifont=Ubuntu\ Mono\ 12
        set guifont=Droid\ Sans\ Mono\ 12
      endif

      let w:font_size = 'large'

    else
      if has('macunix')
        set guifont=Monaco:h9
      else
        " assume linux
        set guifont=Terminus\ 9
        "set guifont=Ubuntu\ Mono\ 12
      endif

      let w:font_size = 'small'

    endif
  endfunction

  " prepare the first call (set values to what we don't want)
  let w:font_size = 'large'

  " then call
  call ToggleFontSize()

  " - Maps
    " Toggle font size
    map <f11> :call ToggleFontSize()<cr>
" ]]
" Color Schemes [[
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'chriskempson/base16-vim'
  Bundle 'inkpot'
  Bundle 'jellybeans.vim'
  Bundle 'pyte'
  Bundle 'romainl/Apprentice'
  Bundle 'romainl/Disciple'
  Bundle 'tomasr/molokai'
  Bundle 'vim-scripts/github-theme'
  Bundle 'w0ng/vim-hybrid'
  Bundle 'xterm16.vim'

  if has('gui_running')
    let w:lightscheme = 'base16-solarized'
    "let w:lightscheme = 'disciple'
    "let w:darkscheme = 'base16-railscasts'
    let w:darkscheme = 'apprentice'
  else
    let w:lightscheme = 'desert'
    let w:darkscheme = 'slate'
  endif

  function! ToggleColorschemeBackground()
    if &background == 'light'
      execute 'colorscheme' w:darkscheme
      set background=dark
    else
      execute 'colorscheme' w:lightscheme
      set background=light
    endif
  endfunction

  " prepare the first call (set values to what we don't want)
  set background=light

  " then call
  call ToggleColorschemeBackground()

  " - Maps
    " Toggle background color
    map <f12> :call ToggleColorschemeBackground()<cr>
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

    " coffeescript folds
    "map <leader>ff :normal 

    " improved buffer delete
    map <leader>d :SmartBd<cr>
    map <leader>c :SmartBw<cr>
  " ]]
  " Normal Mode [[
    " quick insert of newline
    "nmap <cr> o<esc>

    " select word under cursor
    nmap <space> viw
  " ]]
  " Insert Mode [[
    " remap escape to jj
    inoremap jj <esc>
  " ]]
  " Select Mode [[
  " ]]
" ]]
" Finalization [[
filetype on
" ]]
