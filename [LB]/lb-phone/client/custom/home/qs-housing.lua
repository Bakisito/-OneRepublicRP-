CreateThread(function()
    if Config.HouseScript ~= "qs-housing" then
        return
    end

    local lib = exports.loaf_lib:GetLib()

    RegisterNUICallback("Home", function(data, cb)
        local action = data.action

        if action == "getHomes" then

        elseif action == "removeKeyholder" then

        elseif action == "addKeyholder" then

        elseif action == "toggleLocked" then

        elseif action == "setWaypoint" then

        end
    end)
end)