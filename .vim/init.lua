-- available Lua API
-- table
-- string
-- math
-- package
-- os
--   date()
--   clock()
--   time()
--   difftime()
--   getenv()
--
-- print()

package.path = '/home/tom/.vim/?.lua;' .. package.path
package.path = '/home/tom/.vim/?/init.lua;' .. package.path
package.path = './?/init.lua;' .. package.path

-- plumbing
local commands = {}
-- queue a command
function c(x)
  table.insert(commands, x)
end

function runCommands()
  for i, command in ipairs(commands) do
    vim.command(command)
  end
end

-- functions

-- TODO: fix
-- c 'map <f11> :lua switchFont()<cr>'

-- settings
-- functionality
-- run in nocompatible, giving us more options. This should be the first command
c 'set nocompatible'

-- load plugins
c 'call pathogen#runtime_append_all_bundles()'
c 'call pathogen#helptags()'

-- load filetype plugins, indentation and turn syntax highlighting on
c 'filetype plugin indent on'
c 'syntax on'

-- set up file type detection
c 'autocmd BufEnter *.coffee set ft=coffee'
c 'autocmd BufEnter *.json   set ft=javascript'

-- make movement keys wrap to the next/previous line
c 'set whichwrap=b,s,h,l,<,>,[,]'

-- don't wrap lines
c 'set nowrap'

-- make it possible to have buffers in the background
c 'set hidden'

-- indentation
c 'set autoindent'
c 'set tabstop=2'
c 'set shiftwidth=2'
c 'set expandtab'

-- backups
c 'set writebackup'
c 'set backup'
c 'set swapfile'
c 'set backupcopy=auto'
c 'set backupdir=~/.vim/backup'
c 'set directory=~/.vim/temp'


-- display
-- show "invisible" characters
c 'set list'
c 'set listchars=tab:·\\ ,trail:+,extends:»,precedes:«'

-- don't show chars on split and fold lines
c 'set fillchars=vert:\\ ,fold:\\ '

-- turn on line numbers
c 'set number'

-- turn on a fold column of 1
c 'set foldcolumn=1'

-- mapping settings
c 'let mapleader=","'

-- messages and info
c 'set showcmd'
c 'set showmode'
c 'set noerrorbells'
c 'set novisualbell'
c 'set wildmenu'
c 'set wildmode=list:longest'
c 'set hlsearch'
c 'set incsearch'


-- gui options
c 'set guioptions=emg'

-- colorscheme
c 'colorscheme solarized'
c 'set background=light'

-- font
require('fonts')

-- plugins
-- AutoComplPop
-- make it case sensitive
c 'let g:acp_ignorecaseOption = 0'

-- minibufexpl
-- open at 1 buffer
c 'let g:miniBufExplorerMoreThanOne = 1'

-- vimpager
c 'let vimpager_use_gvim = 1'

-- syntastic
c 'let g:syntastic_enable_signs = 1'
c 'let g:syntastic_auto_loc_list = 1'

-- javascript indent
c 'let g:SimpleJsIndenter_BriefMode = 1'

-- taglist
c 'let Tlist_Ctags_Cmd="/usr/local/bin/ctags"'
c 'let Tlist_Use_Right_Window = 1'
c 'let Tlist_File_Fold_Auto_Close = 1'
c 'let Tlist_Enable_Fold_Column = 0'
c 'let Tlist_Show_One_File = 1'
c 'let Tlist_Auto_Open = 0'


-- maps
-- make the alt key behave as alt on osx
if vim.eval('has("macunix")') == 1 then
  c 'set macmeta'
end

-- normal mode maps
-- quick insert of newline
c 'nmap <cr> o<esc>'

-- insert mode maps
-- remap escape to jj
c 'inoremap jj <esc>'

-- all mode maps
-- ease of use / typos
c 'map :Q :q'
c 'map :W :w'
c 'map :E :e'

-- OS register copy pasting
c 'map <leader>d "+d'
c 'map <leader>p "+p'
c 'map <leader>y "+y'

-- mouse selection register copy pasting
c 'map <leader>dd "*d'
c 'map <leader>pp "*p'
c 'map <leader>yy "*y'

-- switch buffers
c 'map <tab> :tabnext<cr>'
c 'map <S-tab> :tabprevious<cr>'

if vim.eval('has("macunix")') == 1 then
  -- free up keymaps
  c 'macmenu File.New\\ Tab key=<nop>'
  c 'macmenu File.Close    key=<nop>'

  c 'map <D-t> :tabedit %<cr>'
  c 'map <D-w> :SmartBw :tabclose<cr>'
else
  c 'map <S-t> :tabedit %<cr>'
  c 'map <S-w> :bw %, tabclose<cr>'
end

-- move through splits
c 'map <C-h> <C-w>h'
c 'map <C-j> <C-w>j'
c 'map <C-k> <C-w>y'
c 'map <C-l> <C-w>l'

-- open and reload .vimrc
c 'map <leader>v :vsplit ~/.vimrc<cr>'
c 'map <leader>V :bufdo :source ~/.vimrc<cr>:bufdo :filetype detect<cr>'

-- NERDTree
c 'map <leader>[ :NERDTreeToggle<cr>'
c 'map <leader>] :TlistToggle<cr>'

-- resync syntax
c 'map <leader>sy :syntax sync fromstart<cr>'

-- improved buffer delete
c 'map <leader>d :SmartBd<cr>'
c 'map <leader>c :SmartBw<cr>'

-- Toggle background color
c 'map <f12> :let &background = (&background == "dark" ? "light" : "dark")<cr>'

runCommands()

