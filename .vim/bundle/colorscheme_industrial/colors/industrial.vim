set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let g:colors_name="industrial"

hi Normal         guifg=#cccccc guibg=#333333
hi LineNr         guifg=#666666 guibg=#222222
hi NonText        guifg=#336699 guibg=#222222
hi Cursor                       guibg=#cccccc
hi Comment        guifg=#666666
hi Delimiter      guifg=#666666

hi Constant       guifg=#6699cc
hi Identifier     guifg=#cc3333
hi Statement      guifg=#cccc33
hi Type           guifg=#33cc33
"
"	*Special	any special symbol
"	 SpecialChar	special character in a constant
"	 Tag		you can use CTRL-] on this
"	 Delimiter	character that needs attention
"	 SpecialComment	special things inside a comment
"	 Debug		debugging statements
"
"	*Underlined	text that stands out, HTML links
"
"	*Ignore		left blank, hidden
"
hi Error          guifg=#ffffff guibg=#ff0000
hi Todo           guifg=#ffffff guibg=#3333ff

