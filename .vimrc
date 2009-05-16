" functionality
	" load filetype plugins, indentation and turn syntax highlighting on
	filetype plugin indent on
	syntax on

	" run in nocompatible, giving us more options
	set nocompatible
	if has('win32')
		let &runtimepath = substitute(&runtimepath, '\(\~\|'.$USER.'\)/vimfiles\>', '\1/.vim', 'g')
	endif

	" make movement keys wrap to the next/previous line
	set whichwrap=b,s,h,l,<,>,[,]
	set backspace=indent,eol,start

	" don't wrap lines
	set nowrap

	" make it possible to have buffers in the background
	set hidden

	" indentation
	set autoindent
	set preserveindent
	set smartindent
	set smarttab
	set tabstop=2
	set softtabstop=2
	set shiftwidth=2
	" do not use spaces!
	set noexpandtab

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
	set listchars=tab:>\ ,trail:+

	" turn on line numbers
	set number

	" colorscheme
	colorscheme slate

	" messages and info
	set showcmd
	set showmode
	set noerrorbells
	set novisualbell
	set wildmenu
	set hlsearch
	set incsearch

	" gui
		" gui options
		set guioptions=crb

		" font
		if has('win32')
			set guifont=Sheldon_Narrow:h9
		elseif has('macunix')
			set guifont=Andale\ Mono:h14
		else
			set guifont=Monospace:h9
		endif


" maps
	" normal mode maps
		" ease of use / typos
		map :Q :q
		map :W :w
		map :E :e

		" OS register copy pasting
		map <A-d> "+d
		map <A-p> "+p
		map <A-y> "+y

		" switch buffers
		map <tab> :bn<cr>
		map <S-tab> :bp<cr>

