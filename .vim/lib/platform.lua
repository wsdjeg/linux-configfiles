module(..., package.seeall)

local _G = _G
local platform

local _getPlatform = function()
  if not platform then
    if vim.eval('has("win32")') ~= 0 then
      platform = 'win32'
    elseif vim.eval('has("macunix")') ~= 0 then
      platform = 'macunix'
    else
      platform = 'unix'
    end
  end

  return platform
end

_G.getPlatForm = _getPlatform
