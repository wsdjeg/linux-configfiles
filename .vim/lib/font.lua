module(..., package.seeall)

local platform = require('lib.platform')

-- fonts
local font_size = 'small'
local fonts = {
  win32 = {
    big   = 'Droid_Sans_Mono:h12',
    small = 'Droid_Sans_Mono:h8'
  },
  macunix = {
    big   = 'Droid\\ Sans\\ Mono:h12',
    small = 'Droid\\ Sans\\ Mono:h9'
  },
  unix = {
    big   = 'Monospace\\ 12',
    small = 'Monospace\\ 9'
  }
}

local getFont = function(font_size)
  return fonts[platform.getPlatform()][font_size]
end

local setFont = function(font_size)
  c('set guifont=' .. getFont(font_size))
end

local switchFont = function()
  font_size = font_size == 'small' and 'big' or 'small'
  setFont(font_size)
end

_M.getFont = getFont
_M.setFont = setFont
_M.switchFont = switchFont
