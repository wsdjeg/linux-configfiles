" load filetype plugins, indentation and turn syntax highlighting on
filetype plugin indent on
syntax on

" functionality
" run in nocompatible, giving us more options
set nocompatible

" make movement keys wrap to the next/previous line
set whichwrap=b,s,h,l,<,>,[,]

" don't wrap lines
set nowrap

" display
" show "invisible" characters
set list
set listchars=tab:>\ ,trail:·

" turn on line numbers
set number
