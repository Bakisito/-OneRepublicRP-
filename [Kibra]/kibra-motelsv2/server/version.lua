local resource  = GetInvokingResource() or GetCurrentResourceName()
local script    = GetResourceMetadata(resource, 'scriptname', 0)
local version   = GetResourceMetadata(resource, 'version', 0)
local newversion

SetTimeout(1000, function()
    checkversion()
end)

function checkversion()
  
end

