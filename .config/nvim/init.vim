" vim: set foldmethod=marker foldmarker={{,}} :

" Initialization {{
  " load filetype plugins, indentation and turn syntax highlighting on
  filetype plugin indent on
  syntax on

  " load vundle
  call plug#begin()

  " Support for python plugins
  let g:python_host_prog = '/usr/bin/python2.7'

  " Set the map leader key
  let mapleader=','

  " ease of use / typos
  map :Q :q
  map :W :w
  map :E :e

  " resync syntax
  map <leader>sy :syntax sync fromstart<cr>

  " open and reload init.vim
  map <leader>v :edit ~/.config/nvim/init.vim<cr>
  map <leader>V :bufdo :source ~/.config/nvim/init.vim<cr>:bufdo :filetype detect<cr>
" }}
" Indentation {{
  set autoindent
  set tabstop=2
  set shiftwidth=2
  set expandtab
" }}
" Backups {{
  set writebackup
  set backup
  set noswapfile
  set backupcopy=auto
  set backupdir=~/.config/nvim/backup
  set directory=~/.config/nvim/temp
" }}
" Buffers / Files {{
  Plug 'Industrial/vim-smartbd'
  Plug 'Industrial/vim-smartbw'

  "Plug 'fholgado/minibufexpl.vim'
  "  " open at 1 buffer
  "  let g:miniBufExplorerMoreThanOne=1

  Plug 'kien/ctrlp.vim'
    let g:ctrlp_use_caching=1
    let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](\.git|\.svn|\.hg|node_modules|bower_components|build|docs)'
      \ }

  Plug 'scrooloose/nerdtree'
    "let g:NERDTreeWinPos='right'
    map <leader>[ :NERDTreeToggle<cr>

  Plug 'majutsushi/tagbar'
    map <leader>] :TagbarToggle<cr>
    let g:tagbar_compact = 1

  "Plug 'vim-scripts/taglist.vim'
  "  "let g:Tlist_Show_One_File=1
  "  let g:Tlist_Auto_Update=1
  "  let g:Tlist_Enable_Fold_Column=0
  "  let g:Tlist_File_Fold_Auto_Close=1
  "  let g:Tlist_Show_Menu=1
  "  let g:Tlist_Use_Right_Window=1
  "  autocmd vimenter * Tlist
  "  map <leader>] :TlistToggle<cr>

  " Display signs for the quickfix window
  "Plug 'tomtom/quickfixsigns_vim'

  Plug 'bling/vim-airline'
    "let g:airline_left_sep='>'
    "let g:airline_right_sep='<'
    let g:airline_detect_modified=1
    let g:airline_detect_paste=1
    let g:airline_detect_iminsert=1
    let g:airline_inactive_collapse=1
    "let g:airline_theme=
    let g:airline_powerline_fonts=1
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
    "let g:airline_left_sep = '»'
    "let g:airline_right_sep = '«'
    "let g:airline_symbols.linenr = '¶'
    "let g:airline_symbols.branch = 'B'
    "let g:airline_symbols.paste = '∥'
    "let g:airline_symbols.whitespace = 'Ξ'

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
" }}
" Movement {{
  " make movement keys wrap to the next/previous line
  set whichwrap=b,s,h,l,<,>,[,]

  " Fix backspace behaviour
  set backspace=indent,eol,start

  " don't wrap lines
  set nowrap

  Plug 'Lokaltog/vim-easymotion'
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

  " improved buffer delete
  map <leader>d :SmartBd<cr>
  map <leader>c :SmartBw<cr>

  " select word under cursor
  nmap <space> viw
" }}
" Finding / Searching / Restructuring {{
  set noignorecase

  " TODO: this one screws up
  "Plug 'ervandew/ag'
  Plug 'Spaceghost/vim-matchit'
  Plug 'vim-scripts/IndexedSearch'
  Plug 'vim-scripts/grep.vim'

  map <C-f> :Rgrep<cr>

  map <leader>s :sort<cr>
" }}
" Cut, Copy and Paste {{
  "Plug 'maxbrunsfeld/vim-yankstack'

  map <leader>d "+d
  map <leader>y "+y
  map <leader>p "+p

  map <leader>D "*d
  map <leader>Y "*y
  map <leader>P "*p
" }}
" Syntax {{
  Plug 'scrooloose/syntastic'
    let g:syntastic_check_on_open = 1
    let g:syntastic_auto_jump = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_error_symbol = '!'
    let g:syntastic_warning_symbol = '?'
    "let g:syntastic_error_symbol = '✗'
    "let g:syntastic_warning_symbol = '⚠'
    let g:syntastic_javascript_checkers = ['eslint']
" }}
" Completion {{
  "Plug 'vim-scripts/AutoComplPop'
  "  let g:acp_ignorecaseOption = 1
  "  let g:acp_behaviorKeywordCommand = "\<C-p>"

  " complete brackets / pairs
  Plug 'Raimondi/delimitMate'

  " if you use Vundle, load plugins:
  Plug 'ervandew/supertab'
  Plug 'Valloric/YouCompleteMe'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

    " make YCM compatible with UltiSnips (using supertab)
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    let g:SuperTabDefaultCompletionType = '<C-n>'

    " better key bindings for UltiSnipsExpandTrigger
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    let g:UltiSnipsUsePythonVersion = 2

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
" }}
" Version Control {{
  Plug 'tpope/vim-fugitive'

  Plug 'mattn/webapi-vim'
  Plug 'mattn/gist-vim'
    " If you want to detect filetype from the filename:
    let g:gist_detect_filetype = 1
    " If you want your gist to be private by default:
    let g:gist_post_private = 1
    " If you want to manipulate multiple files in a gist:
    let g:gist_get_multiplefile = 1

  "Plug 'vim-scripts/vim-signify'

  " Nice git integration.
  Plug 'gregsexton/gitv'

  " Visualize the undo history as a tree.
  Plug 'sjl/gundo.vim'
    map <leader>u :GundoToggle<cr>
" }}
" File Types {{
  Plug 'sheerun/vim-polyglot'
  Plug 'mxw/vim-jsx'
    let g:jsx_ext_required = 0
" }}
" Visual Information {{
  "Plug 'nathanaelkane/vim-indent-guides'

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

  " Indent guide
  Plug 'nathanaelkane/vim-indent-guides'

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
  "set cursorline

  " Don't ignore anything (e.g. comments) when making folds
  set foldignore=

  " Manual fold mode, the default.
  function! SetDefaultFoldMode()
    " set the fold method to manual
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
    " TODO: This does not apply correctly.
    setlocal foldcolumn=1
  endfunction

  " For files that have classes. Will fold all classes and their methods (2
  " levels).
  function! SetClassFoldMode()
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
    " TODO: This does not apply correctly.
    setlocal foldcolumn=3
  endfunction

  " For files that have functions directly in the file scope. Will fold all
  " level 1 functions.
  function! SetFunctionFoldMode()
    " setlocal the fold method to indent
    setlocal foldmethod=indent

    " Set the fold level to 0
    setlocal foldlevel=0

    " But open all folds at level 1 when opening the file
    setlocal foldlevelstart=1

    " And do not allow folds below this level
    setlocal foldnestmax=1

    " Allow one line folds.
    setlocal foldminlines=0

    " turn on a fold column of 3
    " TODO: This does not apply correctly.
    setlocal foldcolumn=1
  endfunction

  function! ToggleClassFoldMode()
    if &foldmethod == 'indent'
      call SetDefaultFoldMode()
    else
      call SetClassFoldMode()
    endif
  endfunction

  function! ToggleFunctionFoldMode()
    if &foldmethod == 'indent'
      call SetDefaultFoldMode()
    else
      call SetFunctionFoldMode()
    endif
  endfunction

  call SetDefaultFoldMode()

  " - Maps
    " Toggle fold mode
    map <f8> :call ToggleClassFoldMode()<cr>
    map <f9> :call ToggleFunctionFoldMode()<cr>
" }}
" Font {{
  function! ToggleFontSize()
    if w:font_size == 'small'
      if has('macunix')
        set guifont=Menlo:h14
      else
        " assume linux
        "set guifont=Ubuntu\ Mono\ 12
        "set guifont=Droid\ Sans\ Mono\ 12
        set guifont=Inconsolata\ Medium\ 12
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
  let w:font_size = 'small'

  " then call
  call ToggleFontSize()

  " - Maps
    " Toggle font size
    map <f11> :call ToggleFontSize()<cr>
" }}
" Color Schemes {{
  Plug 'chriskempson/base16-vim'
  Plug 'altercation/vim-colors-solarized'

  " Make colorschemes work in the terminal
  Plug 'CSApprox'
  "set t_Co=256

  if has('gui_running')
    let w:lightscheme = 'base16-atelierforest'
    let w:darkscheme = 'base16-atelierdune'
  else
    let w:lightscheme = 'slate'
    let w:darkscheme = 'slate'
    "let w:lightscheme = 'desert'
    "let w:darkscheme = 'desert'
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
" }}
" Finalization {{
  call plug#end()
" }}
