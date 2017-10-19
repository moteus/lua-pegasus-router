package = 'pegasus-router'
version = 'scm-0'

source = {
  url = "https://github.com/moteus/lua-pegasus-router/archive/master.zip",
  dir = "lua-pegasus-router-master",
}

description = {
  summary = 'Router plugin for Pegasus http server',
  homepage = 'https://github.com/moteus/lua-pegasus-router',
  license = 'MIT'
}

dependencies = {
  "lua >= 5.1, < 5.4",
  "router",
  "pegasus",
}

build = {
  type = "builtin",
  modules = {
    ['pegasus.plugins.router'] = 'src/pegasus/plugins/router.lua',
  }
}
