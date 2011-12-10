module(..., package.seeall)

--[[
  TODO:
    - Inheritance.
    - Generate getters and setters.
      - Take underscore_property and make it get/setUnderscoreProperty
      - Figure out what I meant with the above.
]]

local function new(class_mt, ...)
  local o = setmetatable({}, class_mt)

  if o.constructor then
    o:constructor(...)
  end

  return o
end

-- TODO: is_child, is_parent
local function is_a(self, c)
  return getmetatable(self) == c
end

local function class()
  local class_mt = {
    new = new,
    is_a = is_a,
  }
  class_mt.__index = class_mt

  return class_mt
end

A = class()
function A:constructor(name)
  self.name = name
end

function A:getName()
  return self.name
end

a = A:new('Yomomma')

print('Knock, knock. Who\'s there? ' .. a:getName())

_M.class = class
