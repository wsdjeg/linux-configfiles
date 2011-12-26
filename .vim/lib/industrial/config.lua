module(..., package.seeall)

local _platform = require('industrial.platform')

local env = {}

local cmd = function(c)
  vim.command(c)
end
env.cmd = cmd

local unaryCmd = function(c)
  return function(x)
    cmd(('%s %s'):format(c, x))
  end
end

local binaryCmd = function(c)
  return function(k, v)
    cmd(('%s %s %s'):format(c, k, v))
  end
end

local let = function(k, v)
  if type(v) == 'boolean' then
    if v == false then
      k = 'no' .. k
    end

    cmd('let ' .. k)
  else
    cmd(('let %s=%s'):format(k, v))
  end
end
env.let = let

local set = function(k, v)
  if type(v) == 'boolean' then
    if v == false then
      k = 'no' .. k
    end

    cmd('set ' .. k)
  else
    cmd(('set %s=%s'):format(k, v))
  end
end
env.set = set

local platform = function(p, cb)
  if _platform.getPlatform() == p then
    cb()
  end
end
env.platform = platform

local unaryCommands = {
  'autocmd',
  'colorscheme',
  'call',
}
for i, v in ipairs(unaryCommands) do
  env[v] = unaryCmd(v)
end

local binaryCommands = {
  'inoremap',
  'map',
  'nmap',
}
for i, v in ipairs(binaryCommands) do
  env[v] = binaryCmd(v)
end

local config = function(cb)
  setfenv(cb, env)
  cb()
end

_M.config = config
