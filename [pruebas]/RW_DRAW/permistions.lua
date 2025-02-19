PERMS = {}
PERMS.type = "license" ---[PERMISION FILE]
PERMS.data = {
    ['license'] = {
       ['c84ed32a4eedba18e35af5ec8ca513c0f46dc524'] = true,
    },
}
---------------------------------------------------
---[MAIN]
---------------------------------------------------
function perms(id) ---[ADD YOUR PERMISION SYSTEM]
    if PERMS.type == "custom" then         
        return perms_custom(id)
    elseif PERMS.type == "license" then
        return perms_license(id)
    else
        print('[RW DRAW] THIS PERMISTION TYPE DOES NOT EXIST')
        return false
    end
end
---------------------------------------------------
---[PERMISIONS]
---------------------------------------------------
---[CUSTOM]
function perms_custom(id)
    return true
end
---[license]
function perms_license(id)
    local perms = false
    local id = id
    local license  = nil
    for k,v in pairs(GetPlayerIdentifiers(id))do
        if string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
            license = string.sub(v, string.len("license:") + 1)
        end
    end
    if license ~= nil and PERMS.data['license'][license] then 
        perms = true
    end
    return perms
end