local BasePlugin = require "kong.plugins.base_plugin"
local TestRayHandler = BasePlugin:extend()


TestRayHandler.PRIORITY = 1000
TestRayHandler.VERSION = "2.0.0"

local function table_to_string(tbl)
  if type(tbl) == "table" then
    local result = ""
    for k, v in pairs(tbl) do
      result = result.."\""..k.."\""..":"..table_to_string(v)..","
    end
    if result ~= "" then
      result = result:sub(1, result:len()-1)
    end
    return "{"..result.."}"
  elseif type(tbl) == "boolean" or type(tbl) == "number" or type(tbl) == "nil" or type(tbl) == "string" then
    return "\""..tostring(tbl).."\""
  else
    return "<"..type(tbl)..">"
  end
end

function TestRayHandler:log(conf)
  ngx.log(ngx.ERR, "TEST: ", table_to_string(conf))
end

return TestRayHandler
