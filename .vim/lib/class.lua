module(..., package.seeall)

--[[
  TODO:
    - Inheritance.
    - Generate getters and setters.
      - Take underscore_property and make it get/setUnderscoreProperty
      - Figure out what I meant with the above.
]]

local function new(c, ...)
  local o = setmetatable({}, c)

  if o.constructor then
    o:constructor(...)
  end

  return o
end

-- TODO: is_child, is_parent
local function is_a(self, c)
  return getmetatable(self) == c
end

local function parentSearch(parents, key)
  for i, parent in ipairs(parents) do
    local value = parent[key]
    if value then
      return value
    end
  end
end

local function parentSearchFactory(p)
  return function(t, k)
    return parentSearch(p, k)
  end
end

local function class(...)
  local p = {...}
  local c = {
    new = new,
    is_a = is_a
  }
  setmetatable(c, {
    __index = parentSearchFactory(p)
  })
  c.__index = c

  return c
end

Thing = class()
function Thing:constructor(name)
  self.name = name
end

function Thing:getName()
  return self.name
end

Animal = class(Thing)
function Animal:constructor(name, sound)
  self.name = name
  self.sound = sound
end

function Animal:getSound()
  return self.sound
end

Dog = class(Animal)
function Dog:constructor(name)
  self.name = name
  self.sound = 'Woof'
end

a = Dog:new('a')
print(a:getName() .. ' ' .. a:getSound())

_M.class = class
