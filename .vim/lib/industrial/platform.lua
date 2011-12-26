module(..., package.seeall)

local platform
if vim.eval('has("win32")') ~= 0 then
  platform = 'win32'
elseif vim.eval('has("macunix")') ~= 0 then
  platform = 'macunix'
else
  platform = 'unix'
end

_M.getPlatform = function()
  return platform
end

