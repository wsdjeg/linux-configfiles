set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name="industrial"

hi Comment      guifg=#999999               gui=none
hi Constant     guifg=#446688               gui=none
hi Cursor       guifg=#222222 guibg=#cccccc gui=bold
hi CursorLine                 guibg=#444444 gui=none
hi CursorColumn               guibg=#444444 gui=none
hi Delimiter    guifg=#990000               gui=none
hi FoldColumn   guifg=#666666 guibg=#222222 gui=none
hi Folded       guifg=#999999 guibg=#222222 gui=none
hi Identifier   guifg=#aaaa00               gui=none
hi LineNr       guifg=#666666 guibg=#222222 gui=none
hi MatchParen   guifg=#cccccc guibg=#444444 gui=bold
hi ModeMsg      guifg=#aaaa00               gui=none
hi MoreMsg      guifg=#aaaa00               gui=none
hi NonText      guifg=#222222               gui=none
hi Normal       guifg=#cccccc guibg=#333333 gui=none
hi PreProc      guifg=#990000               gui=none
hi Search       guifg=#333333 guibg=#aaaa00 gui=none
hi Special      guifg=#cccccc guibg=#444444 gui=none
hi Statement    guifg=#669933               gui=none
hi StatusLine   guifg=#cccccc guibg=#222222 gui=bold
hi StatusLineNC guifg=#999999 guibg=#111111 gui=none
hi Todo         guifg=#aaaa00               gui=underline
hi Type         guifg=#666666               gui=none
hi Underlined   guifg=#cccccc               gui=underline
hi VertSplit    guifg=#cccccc guibg=#111111 gui=none
hi Visual       guifg=#222222 guibg=#666666 gui=none
hi WildMenu     guifg=#cccccc guibg=#444444 gui=none

