module('inspector', package.seeall)

local function isEmptyTable(t)
  return next(t) == nil
end

local function printSimpleValue(x)
  if type(x) == 'string' then
    return '"' .. x .. '"'
  else
    return tostring(x)
  end
end

_M.inspect = function(t, name, indent)
  local cart    -- a container
  local autoref -- for self references

  local function addtocart (value, name, indent, saved, field)
    indent = indent or ''

    saved = saved or {}
    field = field or name

    cart = cart .. indent .. field

    if type(value) ~= 'table' then
      cart = ('%s = %s,\n'):format(cart, printSimpleValue(value))
    else
      if saved[value] then
        cart = ('%s = {}, -- %s (self reference)\n'):format(cart ,saved[value])
        autoref = ('%s%s = %s,\n'):format(autoref, name, saved[value])
      else
        saved[value] = name
        --if tablecount(value) == 0 then
        if isEmptyTable(value) then
          cart = cart .. ' = {},\n'
        else
          cart = cart .. ' = {\n'
          for k, v in pairs(value) do
            k = tostring(k)
            local fname = string.format('%s[%s]', name, k)
            field = string.format('%s', k)
            -- three spaces between levels
            addtocart(v, fname, indent .. '  ', saved, field)
          end
          cart = cart .. indent .. '}\n'
        end
      end
    end
  end

  name = name or '__unnamed__'
  if type(t) ~= 'table' then
    return ('%s = %s,'):format(name, printSimpleValue(t))
  end

  cart = ''
  autoref = ''
  addtocart(t, name, indent)

  print(cart .. autoref)
end
