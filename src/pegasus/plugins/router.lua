local Router = require "router"

local RouterPlugin = {} do
RouterPlugin.__index = RouterPlugin

function RouterPlugin:new(r)
  local o = setmetatable({}, self)
  o._r = Router.new()
  return o
end

-- Pegasus plugin API
function RouterPlugin:newRequestResponse(request, response)
  return self:execute(request, response)
end

-- Overwrite execute method to use Pegasus request/response
function RouterPlugin:execute(request, response)
  local method, err = request:method()
  if not method then return nil, err end
  local path = request:path()

  local handler, params = self._r:resolve(method, path)
  if not handler then return false end

  return true, handler(request, response, params)
end

-- Implement rest router API
local ROUTER_METHODS = {
  'match', 'resolve',
  'get', 'post', 'put', 'patch', 'delete', 'trace', 'connect', 'options', 'head',
}

for _, name in ipairs(ROUTER_METHODS) do

RouterPlugin[name] = function(self, ...)
  return self._r[name](self._r, ...)
end

end

end

return RouterPlugin