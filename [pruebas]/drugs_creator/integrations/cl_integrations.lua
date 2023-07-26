EXTERNAL_EVENTS_NAMES = {
    ["esx:getSharedObject"] = nil, -- This is nil because it will be found automatically, change it to your one ONLY in the case it can't be found
}

-- Ped models that WON'T be used for NPC selling
BLACKLISTED_PEDS_MODELS = {
    --[[
        Some examples:
        
        [ GetHashKey("a_m_o_tramp_01") ] = true,
        [ GetHashKey("csb_rashcosvki") ] = true,
        [ GetHashKey("csb_stripper_02") ] = true,
    ]]
}

--[[
    You can edit this function if you want to add second jobs or anything like that (editing this function is down to you)
    If you edit this, you WILL have also to edit the function in sv_integrations.lua file
]]
function isJobAllowed(allowedJobs)
    if(not allowedJobs) then return true end

    local playerJob = Framework.getPlayerJob()

    if(allowedJobs[playerJob] == true) then
        return true
    elseif(allowedJobs[playerJob]) then
        local playerJobGrade = tostring( Framework.getPlayerJobGrade() )

        return allowedJobs[playerJob] and allowedJobs[playerJob][playerJobGrade]
    else
        return false
    end
end

-- Set to true if you want players to be able to sell to gangster ped models
CAN_SELL_TO_GANGSTERS = false

-- How many seconds the blip for police alerts will remain in the map
BLIP_TIME_AFTER_POLICE_ALERT = 120

-- Punish players who try to cancel the exit animation of drugs fields by ragdolling them and making them to waste more time
PUNISH_PLAYERS_TRYING_TO_ESCAPE_ANIMATION = true

--[[
    Default progressbar color (must be a hex code). Examples:
    "#0fffef" - Light blue
    "#ff0f0f" - Red
    "#0f0fff" - Blue
]]
DEFAULT_PROGRESSBAR_COLOR = "#47ff33"

--  RegisterNetEvent("drugs_creator:framework:ready", function() 
--     -- Disables the default script notification (otherwise there would be 2 notifications)
--     exports["drugs_creator"]:disableScriptEvent("drugs_creator:notify")
-- end)

-- RegisterNetEvent("drugs_creator:notify", function(message, uncoloredMessage)
--     exports['okokNotify']:Alert('Title', uncoloredMessage, 5, 'info', playSound)
-- end)

-- -- In drugs_creator/integrations/cl_integrations.lua
-- RegisterNetEvent("drugs_creator:framework:ready", function() 
--     -- Disables the default script progress bar (otherwise there would be 2 progress bars)
--     exports["drugs_creator"]:disableScriptEvent("drugs_creator:internalProgressBar")
-- end)

-- -- Example to replace the script progress bar with an external one
-- RegisterNetEvent("drugs_creator:internalProgressBar", function(time, text)
--     -- The event to activate your external progress bar
--     TriggerEvent("external_progressbar:start", time, text)
--     QBCore.Functions.Progressbar("external_progressbar:start", time, text, false, false, {
--         disableMovement = true,
--         disableCarMovement = true,
--         disableMouse = false,
--         disableCombat = true,
--     })
-- end)