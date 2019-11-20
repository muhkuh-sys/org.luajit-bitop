-- An emulation library for the "Lua Bit Operations Module" (http://bitop.luajit.org/).
-- Found here: https://github.com/moteus/lua-lluv-websocket/blob/master/src/lluv/websocket/bit.lua

local bit = {}

function bit.bnot(a)
  return ~a
end
function bit.bor(a, b, ...)
  a = a | b
  if ... then return bit.bor(a, ...) end
  return a
end
function bit.band(a, b, ...)
  a = a & b
  if ... then return bit.band(a, ...) end
  return a
end
function bit.bxor(a, b, ...)
  a = a ~ b
  if ... then return bit.bxor(a, ...) end
  return a
end
function bit.lshift(a, b)
  return a << b
end
function bit.rshift(a, b)
  return a >> b
end

return bit
