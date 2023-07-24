local ActiveFlashlights = {}

AddEventHandler('playerDropped', function ()
    if ActiveFlashlights[source] then 
        ActiveFlashlights[source] = nil 
    end
    TriggerClientEvent('pf:UpdateFlashLights', -1, ActiveFlashlights)
end)

RegisterServerEvent('pf:ToggleFlashLight')
AddEventHandler('pf:ToggleFlashLight', function(bool, flashlight, weapon)
    if bool then
        ActiveFlashlights[source] = {
            flashlight, 
            weapon
        }
    else
        ActiveFlashlights[source] = nil
    end
    TriggerClientEvent('pf:UpdateFlashLights', -1, ActiveFlashlights)
end)