Config = {}

Config.DefaultKey = 'K'
Config.Command = 'vehiclemenu'
Config.CommandHelpText = 'Open Vehicle Menu'

Config.ShowWindows = true
Config.ShowInsideLight = true
Config.FirstPersonLightOnly = true


function ToggleEngine(vehicle)
    --TriggerEvent('qb-vehiclekeys:client:ToggleEngine') -- For qb-vehiclekeys checks if you have keys (You dont need the bottom code)
    SetVehicleEngineOn(vehicle, (not GetIsVehicleEngineRunning(vehicle)), false, true)
end

function ToggleDoor(vehicle, doorID)
	if GetVehicleDoorAngleRatio(vehicle, doorID) > 0.0 then
        SetVehicleDoorShut(vehicle, doorID, false)
    else
        SetVehicleDoorOpen(vehicle, doorID, false)
    end
end

function ToggleWindow(vehicle, windowID)
    if Windows[windowID] then
        RollUpWindow(vehicle, windowID)
        Windows[windowID] = nil
    else
        RollDownWindow(vehicle, windowID)
        Windows[windowID] = true   
    end
end

function ChangeSeat(ped, vehicle, SeatID)
    SetPedIntoVehicle(ped, vehicle, SeatID)
end