" Initialize
" load filetype plugins, indentation and turn syntax highlighting on
filetype plugin indent on
syntax on

" load vundle
call plug#begin()

" Support for python plugins
let g:python_host_prog='/usr/bin/python2.7'

" Set the map leader key
let mapleader=','

" resync syntax
map <leader>sy :syntax sync fromstart<cr>

" open and reload init.vim
map <leader>v :edit ~/.config/nvim/init.vim<cr>
map <leader>V :bufdo :source ~/.config/nvim/init.vim<cr>:bufdo :filetype detect<cr>

function SetIndentation()
  set autoindent
  set tabstop=2
  set shiftwidth=2
  set expandtab
endfunction

function SetBackups()
  set writebackup
  set backup
  set noswapfile
  set backupcopy=auto
  set backupdir=~/.config/nvim/backup
  set directory=~/.config/nvim/temp
endfunction

function SetBuffersAndFiles()
  Plug 'Industrial/vim-smartbd'
  Plug 'Industrial/vim-smartbw'

  Plug 'kien/ctrlp.vim'
    let g:ctrlp_use_caching=1
    let g:ctrlp_custom_ignore={
      \ 'dir': '\v[\/](\.git|\.svn|\.hg|node_modules|bower_components|build|docs)'
      \ }

  Plug 'scrooloose/nerdtree'
    let g:NERDTreeCascadeOpenSingleChildDir=0
    let g:NERDTreeCaseSensitiveSort=1
    let g:NERDTreeShowHidden=1
    let g:NERDTreeShowFiles=1
    let g:NERDTreeShowHidden=1
    let g:NERDTreeCascadeSingleChildDir=0
    let g:NERDTreeCascadeOpenSingleChildDir=1
    let g:NERDTreeAutoDeleteBuffer=1
    map <leader>[ :NERDTreeToggle<cr>

    function! ToggleNerdTree()
      normal :NERDTreeToggle()<cr>
    endfunction

  Plug 'majutsushi/tagbar'
    let g:tagbar_compact=1
    map <leader>] :TagbarToggle<cr>


  " Display signs for the quickfix window
  Plug 'tomtom/quickfixsigns_vim'

  " Color the prompt like airline.
  Plug 'edkolev/promptline.vim'

  " Color the tmux line like airline
  Plug 'edkolev/tmuxline.vim'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
    "let g:airline_left_sep='>'
    "let g:airline_right_sep='<'
    let g:airline_detect_modified=1
    let g:airline_detect_paste=1
    let g:airline_detect_iminsert=1
    let g:airline_inactive_collapse=1
    "let g:airline_theme=
    let g:airline_powerline_fonts=1
    "let g:airline_mode_map={
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
      let g:airline_symbols={}
    endif

    " unicode symbols
    "let g:airline_left_sep='»'
    "let g:airline_right_sep='«'
    "let g:airline_symbols.linenr='¶'
    "let g:airline_symbols.branch='B'
    "let g:airline_symbols.paste='∥'
    "let g:airline_symbols.whitespace='Ξ'

    let g:airline#extensions#branch#enabled=1
    let g:airline#extensions#hunks#enabled=0
    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#whitespace#enabled=1
    let g:airline#extensions#syntastic#enabled=1
    "let g:airline#extensions#tagbar#enabled=1
    let g:airline#extensions#csv#enabled=1

  " make it possible to have buffers in the background
  set hidden

  " reload changes from disk
  set autoread
endfunction

function SetMovement()
  " # Movement
  " make movement keys wrap to the next/previous line
  set whichwrap=b,s,h,l,<,>,[,]

  " Fix backspace behaviour
  set backspace=indent,eol,start

  " don't wrap lines
  set nowrap

  Plug 'Lokaltog/vim-easymotion'
  let g:EasyMotion_leader_key='<leader>'

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

  " TODO: Disables the grep.vim enter functionality.
  " Solution: Do not do it for quickfix windows?
  "nmap <cr> o<esc>
endfunction

function SetFindingSearchingReplacing()
  set noignorecase

  Plug 'wincent/loupe'
    " Don't set up a mapping to clean searhc highlighting.
    let g:LoupeClearHighlightMap=1

  " TODO: this one screws up
  "Plug 'ervandew/ag'
  Plug 'Spaceghost/vim-matchit'
  Plug 'vim-scripts/IndexedSearch'
  Plug 'vim-scripts/grep.vim'
    let g:Grep_Default_Options="--exclude-dir=node_modules"
    map <C-f> :Rgrep<cr>

  map <leader>s :sort<cr>

  " # Cut, Copy and Paste
  "Plug 'maxbrunsfeld/vim-yankstack'

  map <leader>d "+d
  map <leader>y "+y
  map <leader>p "+p

  map <leader>D "*d
  map <leader>Y "*y
  map <leader>P "*p

  " # Save, Close, Quit
  map <c-s> :write<cr>
  "map <c-w> :SmartBw<cr>
  map <c-q> :qa!<cr>

  imap <c-s> <esc>:write<cr>a
  "imap <c-w> <esc>:SmartBw<cr>a
  imap <c-q> <esc>:qa!<cr>
endfunction

function SetSyntax()
  Plug 'scrooloose/syntastic'
    let g:syntastic_check_on_open=1
    let g:syntastic_auto_jump=0
    let g:syntastic_auto_loc_list=0
    let g:syntastic_error_symbol='!'
    let g:syntastic_warning_symbol='?'
    "let g:syntastic_error_symbol='✗'
    "let g:syntastic_warning_symbol='⚠'
    let g:syntastic_javascript_checkers=['eslint']
endfunction

function SetCompletion()
  " # Completion
  "Plug 'vim-scripts/AutoComplPop'
  "  let g:acp_ignorecaseOption=1
  "  let g:acp_behaviorKeywordCommand="\<C-p>"

  " complete brackets / pairs
  Plug 'Raimondi/delimitMate'

  " if you use Vundle, load plugins:
  Plug 'ervandew/supertab'
  Plug 'honza/vim-snippets'

  Plug 'Shougo/neco-syntax'
  Plug 'Shougo/neco-vim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup=1
    let g:deoplete#enable_smart_case=1
    let g:deoplete#auto_complete_start_length=1
    let g:deoplete#max_menu_width=0
    let g:deoplete#auto_complete_delay=10
    let g:deoplete#auto_refresh_delay=10

  Plug 'SirVer/ultisnips'
    " better key bindings for UltiSnipsExpandTrigger
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    "let g:UltiSnipsUsePythonVersion=2

  " http://vim.wikia.com/wiki/Regex-based_text_alignment
  command! -nargs=? -range Align <line1>,<line2>call AlignSection('<args>')
  function! AlignSection(regex) range
    let extra=1
    let sep=empty(a:regex) ? '=' : a:regex
    let maxpos=0
    let section=getline(a:firstline, a:lastline)
    for line in section
      let pos=match(line, ' *'.sep)
      if maxpos < pos
        let maxpos=pos
      endif
    endfor
    call map(section, 'AlignLine(v:val, sep, maxpos, extra)')
    call setline(a:firstline, section)
  endfunction

  function! AlignLine(line, sep, maxpos, extra)
    let m=matchlist(a:line, '\(.\{-}\) \{-}\('.a:sep.'.*\)')
    if empty(m)
      return a:line
    endif
    let spaces=repeat(' ', a:maxpos - strlen(m[1]) + a:extra)
    return m[1] . spaces . m[2]
  endfunction

  vnoremap <silent> <leader>a :Align<cr>
  vnoremap <silent> <leader>A :'<,'>sort<cr>:'<,'>Align<cr>
endfunction

function SetVersionControl()
  " # Version Control
  Plug 'tpope/vim-fugitive'

  Plug 'mattn/webapi-vim'
  Plug 'mattn/gist-vim'
    " If you want to detect filetype from the filename:
    let g:gist_detect_filetype=1
    " If you want your gist to be private by default:
    let g:gist_post_private=1
    " If you want to manipulate multiple files in a gist:
    let g:gist_get_multiplefile=1

  Plug 'vim-scripts/vim-signify'

  " Visualize the undo history as a tree.
  Plug 'sjl/gundo.vim'
    map <leader>u :GundoToggle<cr>
endfunction

function SetFileTypes()
  " Many languages
  Plug 'sheerun/vim-polyglot'

  " Livescript
  Plug 'gkz/vim-ls'

  " JavaScript
  Plug 'othree/yajs.vim'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'othree/es.next.syntax.vim'
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

  " JSX
  "Plug 'mxw/vim-jsx'
    let g:jsx_ext_required=0

  " Nomad
  Plug 'buztard/vim-nomad'

  " Go
  Plug 'fatih/vim-go'
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_types = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
endfunction

function SetVisualInformation()
  "Plug 'nathanaelkane/vim-indent-guides'

  " Show the command being executed
  set showcmd

  " Show the mode you are in
  set showmode

  " No annoying things.
  set noerrorbells
  set novisualbell

  " No wildmenu.
  set wildmenu
  set wildmode=list:longest
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
  set wildignore+=*/node_modules/*

  " Highlight searches as you type.
  set hlsearch
  set incsearch

  " No "matchparen" plugin.
  let loaded_matchparen=1

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

  " TODO: Document what this does.
  Plug 'w0rp/ale'
    let g:ale_linters = {
    \   'javascript': ['eslint'],
    \}

  " Folds
  set foldenable
  set foldcolumn=1

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
    if &foldmethod=='indent'
      call SetDefaultFoldMode()
    else
      call SetClassFoldMode()
    endif
  endfunction

  function! ToggleFunctionFoldMode()
    if &foldmethod=='indent'
      call SetDefaultFoldMode()
    else
      call SetFunctionFoldMode()
    endif
  endfunction

  " - Maps
    " Toggle fold mode
    map <f8> :call ToggleClassFoldMode()<cr>
    map <f9> :call ToggleFunctionFoldMode()<cr>
endfunction

function SetFont()
  function! ToggleFontSize()
    if w:font_size=='small'
      if has('macunix')
        set guifont=Menlo:h14
      else
        " assume linux
        "set guifont=Ubuntu\ Mono\ 12
        "set guifont=Droid\ Sans\ Mono\ 12
        set guifont=Inconsolata\ Medium\ 12
      endif

      let w:font_size='large'

    else
      if has('macunix')
        set guifont=Monaco:h9
      else
        " assume linux
        set guifont=Terminus\ 9
        "set guifont=Ubuntu\ Mono\ 12
      endif

      let w:font_size='small'

    endif
  endfunction

  " prepare the first call (set values to what we don't want)
  let w:font_size='small'

  " then call

  " - Maps
    " Toggle font size
    map <f11> :call ToggleFontSize()<cr>
endfunction

function SetColorSchemes()
  Plug 'chriskempson/base16-vim'
  Plug 'altercation/vim-colors-solarized'

  " Make colorschemes work in the terminal
  Plug 'CSApprox'
  set t_Co=256

  let w:lightscheme='base16-google-light'
  let w:darkscheme='base16-atelier-dune'

  function! ToggleColorschemeBackground()
    if &background=='light'
      execute 'colorscheme' w:darkscheme
      set background=dark
    else
      execute 'colorscheme' w:lightscheme
      set background=light
    endif
  endfunction

  " prepare the first call (set values to what we don't want)
  set background=light

  " - Maps
    " Toggle background color
    map <f12> :call ToggleColorschemeBackground()<cr>
endfunction

call SetIndentation()
call SetBackups()
call SetBuffersAndFiles()
call SetMovement()
call SetFindingSearchingReplacing()
call SetSyntax()
call SetCompletion()
call SetVersionControl()
call SetFileTypes()
call SetVisualInformation()
call SetFont()
call SetColorSchemes()

" Finalize
call plug#end()

call SetDefaultFoldMode()
call ToggleFontSize()
call ToggleColorschemeBackground()

" Open NERDTree and move the cursor to the right split, the file buffer.
autocmd VimEnter * NERDTree | wincmd l
