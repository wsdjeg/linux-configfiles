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

local function parentSearchFactory(parent)
  return function(table, key)
    return parentSearch(parent, key)
  end
end

local function class(...)
  local parents = {...}
  local klass = {
    new = new,
    is_a = is_a
  }
  setmetatable(klass, {
    __index = parentSearchFactory(parents)
  })
  klass.__index = klass

  return klass
end

_M.class = class
