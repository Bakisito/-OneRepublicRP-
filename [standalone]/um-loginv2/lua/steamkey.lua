-------------------------------------------------------------------------------
local UMLoadingScreenSteamKey = "7FA0979EF198E68632FCD220A68944A5" -- server.cfg steam_webApiKey
-- https://steamcommunity.com/dev/apikey
-------------------------------------------------------------------------------

AddEventHandler('playerConnecting', function(_, _, deferrals)
    local ids = ExtractIdentifiers(source)
    local source = source
    local steamID = ""
    if ids.steam ~= "" then
        steamID = ids.steam:gsub( "steam:", "")
    else
        steamID = ""
    end
    steamID = tonumber(steamID,16)
    PerformHttpRequest("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key="..UMLoadingScreenSteamKey.."&steamids="..steamID,
    function(err, text, headers)
        deferrals.handover({
            json = text,
            umloginscreen = "steam"
        })
    end)
end)
function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }
    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)
        if string.find(id, "steam") then
            identifiers.steam = id
        end
    end
    return identifiers
end