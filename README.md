# lua-pegasus-router
Router plugin for Pegasus server


### Usage

```Lua
local Pegasus = require "pegasus"
local Router  = require "pegasus.plugins.router"

local r = Router:new()

local server = Pegasus:new{ plugins = { r } }

-- define routes
r:get('/get/:id', function(request, response, params)
  local id = params.id
  ....
end)

server:start(function(request, response)
  -- called only if no route found
end)
```
