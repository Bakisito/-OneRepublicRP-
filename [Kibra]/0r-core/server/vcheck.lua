R.VersionCheck = function(name, ver)
    if not ver then ver = GetResourceMetadata(name, "version") end
end