-- Pokapi SDK error

local PokapiError = {}
PokapiError.__index = PokapiError


function PokapiError.new(code, msg, ctx)
  local self = setmetatable({}, PokapiError)
  self.is_sdk_error = true
  self.sdk = "Pokapi"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function PokapiError:error()
  return self.msg
end


function PokapiError:__tostring()
  return self.msg
end


return PokapiError
