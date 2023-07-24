function isUserPartOfRole(targetRoleName)
    if #userRoles == 0 then return false end
    for i, roleName in pairs(userRoles) do
        if roleName == targetRoleName then
            return true
        end
    end
    return false
end

function checkPermission()
    if Config.EnableDiscordAPI then
        for k, v in pairs(Config.DiscordRolesWithPermission) do
            if isUserPartOfRole(v) then
                return true
            end
        end
        return false
    else
        return true -- Edit this code block for custom permissions.
    end
end

function PlaySound(pos, vol)
    SendNUIMessage({
        submissionType     = 'ARS',
        submissionFile     = ActiveSoundFile, 
        submissionVolume   = vol,
        submissionPos      = pos
    })
end

function StopSound(vol)
    SendNUIMessage({
        submissionType     = 'STOPARS',
        submissionVolume   = vol,
   })
end

function notify(notificationText, notificationDuration, notificationPosition, notificationType)
    if Config.NativeMessages then
        SetNotificationTextEntry("STRING")
        AddTextComponentString(notificationText)
        DrawNotification(true, true)
    else
        -- Example
        exports.bulletin:Send({
            message = notificationText,
            timeout = notificationDuration,
            position = notificationPosition,
            progress = true,
            theme = notificationType,
            flash = false
        })
    end
end

function DrawTxt(text, x, y, scale, size)
	SetTextFont(0)
	SetTextProportional(1)
	SetTextScale(scale, size)
	SetTextDropshadow(1, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end