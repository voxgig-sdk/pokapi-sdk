package = "voxgig-sdk-pokapi"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/pokapi-sdk.git"
}
description = {
  summary = "Pokapi SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["pokapi_sdk"] = "pokapi_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
