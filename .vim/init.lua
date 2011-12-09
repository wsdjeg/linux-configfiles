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
package.path = '/home/tom/.vim/lib/?.lua;' .. package.path
package.path = '/home/tom/.vim/lib/?/init.lua;' .. package.path
package.path = './?/init.lua;' .. package.path

local inspect = require('inspector').inspect

-- TODO: add LibStub
local config = require('industrial.config').config

config(function()
  -- settings
  -- functionality
  -- run in nocompatible, giving us more options. This should be the first command
  set('compatible', false)

  -- load plugins
  call('pathogen#runtime_append_all_bundles()')
  call('pathogen#helptags()')

  -- load filetype plugins, indentation and turn syntax highlighting on
  cmd 'filetype plugin indent on'
  cmd 'syntax on'

  -- set up file type detection
  autocmd('BufEnter *.coffee set ft=coffee')
  autocmd('BufEnter *.json   set ft=javascript')

  -- make movement keys wrap to the next/previous line
  set('whichwrap', 'b,s,h,l,<,>,[,]')

  -- don't wrap lines
  set('wrap', false)

  -- make it possible to have buffers in the background
  set('hidden', true)

  -- indentation
  set('autoindent', true)
  set('tabstop', 2)
  set('shiftwidth', 2)
  set('expandtab', true)

  -- backups
  set('writebackup', true)
  set('backup', true)
  set('swapfile', true)
  set('backupcopy', 'auto')
  set('backupdir', '~/.vim/backup')
  set('directory', '~/.vim/temp')


  -- display
  -- show "invisible" characters
  set('list', true)
  set('listchars', 'tab:·\\ ,trail:+,extends:»,precedes:«')

  -- don't show chars on split and fold lines
  set('fillchars', 'vert:\\ ,fold:\\ ')

  -- turn on line numbers
  set('number', true)

  -- turn on a fold column of 1
  set('foldcolumn', '1')

  -- mapping settings
  let('mapleader', '","')

  -- messages and info
  set('showcmd', true)
  set('showmode', true)
  set('errorbells', false)
  set('visualbell', false)
  set('wildmenu', true)
  set('wildmode', 'list:longest')
  set('hlsearch', true)
  set('incsearch', true)


  -- gui options
  set('guioptions', 'emg')

  -- colorscheme
  colorscheme('solarized')
  set('background', 'light')

  -- font
  --require('fonts')

  -- plugins
  -- AutoComplPop
  -- make it case sensitive
  let('g:acp_ignorecaseOption', '0')

  -- minibufexpl
  -- open at 1 buffer
  let('g:miniBufExplorerMoreThanOne', '1')

  -- vimpager
  let('vimpager_use_gvim', '1')

  -- syntastic
  let('g:syntastic_enable_signs', '1')
  let('g:syntastic_auto_loc_list', '1')

  -- javascript indent
  let('g:SimpleJsIndenter_BriefMode', '1')

  -- taglist
  let('Tlist_Ctags_Cmd', '"/usr/local/bin/ctags"')
  let('Tlist_Use_Right_Window', '1')
  let('Tlist_File_Fold_Auto_Close', '1')
  let('Tlist_Enable_Fold_Column', '0')
  let('Tlist_Show_One_File', '1')
  let('Tlist_Auto_Open', '0')


  -- maps
  -- make the alt key behave as alt on osx
  platform('macunix', function()
    set('macmeta')
  end)

  -- normal mode maps
  -- quick insert of newline
  nmap('<cr>', 'o<esc>')

  -- insert mode maps
  -- remap escape to jj
  inoremap('jj', '<esc>')

  -- all mode maps
  -- ease of use / typos
  map(':Q', ':q')
  map(':W', ':w')
  map(':E', ':e')

  -- OS register copy pasting
  map('<leader>d', '"+d')
  map('<leader>p', '"+p')
  map('<leader>y', '"+y')

  -- mouse selection register copy pasting
  map('<leader>dd', '"*d')
  map('<leader>pp', '"*p')
  map('<leader>yy', '"*y')

  -- switch buffers
  map('<tab>', ':tabnext<cr>')
  map('<S-tab>', ':tabprevious<cr>')

  platform('macunix', function()
    -- free up keymaps
    cmd('macmenu File.New\\ Tab key=<nop>')
    cmd('macmenu File.Close    key=<nop>')

    map('<D-t>', ':tabedit %<cr>')
    map('<D-w>', ':SmartBw :tabclose<cr>')
  end)

  platform('unix', function()
    map('<S-t>', ':tabedit %<cr>')
    map('<S-w>', ':bw %<cr>:tabclose<cr>')
  end)

  -- move through splits
  map('<C-h>', '<C-w>h')
  map('<C-j>', '<C-w>j')
  map('<C-k>', '<C-w>y')
  map('<C-l>', '<C-w>l')

  -- open and reload .vimrc
  map('<leader>v', ':vsplit ~/.vimrc<cr>')
  map('<leader>V', ':bufdo :source ~/.vimrc<cr>:bufdo :filetype detect<cr>')

  -- NERDTree
  map('<leader>[', ':NERDTreeToggle<cr>')
  map('<leader>]', ':TlistToggle<cr>')

  -- resync syntax
  map('<leader>sy', ':syntax sync fromstart<cr>')

  -- improved buffer delete
  map('<leader>d', ':SmartBd<cr>')
  map('<leader>c', ':SmartBw<cr>')

  -- Toggle background color
  map('<f12>', ':let &background = (&background == "dark" ? "light" : "dark")<cr>')
end)
