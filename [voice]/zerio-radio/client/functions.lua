Framework = exports["qb-core"]:GetCoreObject()

Animation = {
    OpenProp = GetHashKey('prop_cs_hand_radio'),
    OpenBone = 28422,
    OpenOffset = vector3(0.0, 0.0, 0.0),
    OpenRotation = vector3(0.0, 0.0, 0.0),

    -- TalkProp = GetHashKey('prop_cs_hand_radio'),
    -- TalkBone = 28422,
    -- TalkOffset = vector3(0.0, 0.0, 0.0),
    -- TalkRotation = vector3(0.0, 0.0, 0.0),

    OpenDictionary = {
        normal = "cellphone@",
        in_car = "cellphone@in_car@ds", 
    },
    OpenAnimation = {
        open = "cellphone_text_in",
        closed = "cellphone_text_out",
    },

    TalkDictionary = "random@arrests",
    TalkAnimation = "generic_radio_chatter"
}

function open()
    if isOpen == false then
        RequestModel(Animation.OpenProp)

        while not HasModelLoaded(Animation.OpenProp) do Wait(150) end

        Handle = CreateObject(Animation.OpenProp, 0.0, 0.0, 0.0, true, true, false)

        local bone = GetPedBoneIndex(PlayerPedId(), Animation.OpenBone)

        SetCurrentPedWeapon(PlayerPedId(), GetHashKey('weapon_unarmed'), true)
        AttachEntityToEntity(Handle, PlayerPedId(), bone, Animation.OpenOffset.x,
                             Animation.OpenOffset.y, Animation.OpenOffset.z,
                             Animation.OpenRotation.x, Animation.OpenRotation.y,
                             Animation.OpenRotation.z, true, false, false, false, 2,
                             true)

        SetModelAsNoLongerNeeded(Handle)

        isOpen = true
        if settingsLoaded ~= true then LoadSettings() end
        AddLog("action", "Opened radio")
        startDataLoop()
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "open",
            data = {
                ShowPlayerList = Config.ShowPlayerList,
                DisableAnonymous = Config.DisableAnonymous
            }
        })
    end
end

if Config.OpenType == "custom" or Config.OpenType == "item" then
    RegisterNetEvent("zerio-radio:client:open", function() open() end)
    exports("Open", function() open() end)
end
