
local gears = {
    [1] = {0.90},--1
    [2] = {3.33, 0.90},--2
    [3] = {3.33, 1.57, 0.90},--3
    [4] = {3.33, 1.83, 1.22, 0.90},--4
    [5] = {3.33, 1.92, 1.36, 1.05, 0.90},--5
    [6] = {3.33, 1.95, 1.39, 1.09, 0.95, 0.90},--6
    [7] = {4.00, 2.34, 1.67, 1.31, 1.14, 1.08, 0.90},--7
    [8] = {5.31, 3.11, 2.22, 1.74, 1.51, 1.43, 1.20, 0.90},--8
    [9] = {7.70, 4.51, 3.22, 2.52, 2.20, 2.08, 1.73, 1.31, 0.90}--9
}

modifyGears = nil

local vehicle = nil
local numgears = nil
local topspeedGTA = nil
local topspeedms = nil
local acc = nil
local hash = nil
local selectedgear = 0 
local hbrake = nil

local manualon = true

local incar = false

local currspeedlimit = nil
local ready = false
local realistic = true


function SetupManual()

        manualon = true
        local ped = PlayerPedId()
        local newveh = GetVehiclePedIsIn(ped,false)
        local class = GetVehicleClass(newveh)

                     vehicle = newveh
                    hash = GetEntityModel(newveh)
                   
                    
                    if GetVehicleMod(vehicle,13) < 0 then
                        numgears = GetVehicleHandlingInt(newveh, "CHandlingData", "nInitialDriveGears")
                    else
                        numgears = GetVehicleHandlingInt(newveh, "CHandlingData", "nInitialDriveGears") + 1
                    end
                    
                    

                    hbrake = GetVehicleHandlingFloat(newveh, "CHandlingData", "fHandBrakeForce")
                    
                    topspeedGTA = GetVehicleHandlingFloat(newveh, "CHandlingData", "fInitialDriveMaxFlatVel")
                    topspeedms = (topspeedGTA * 1.32)/3.6



                    acc = GetVehicleHandlingFloat(newveh, "CHandlingData", "fInitialDriveForce") 
                    --SetVehicleMaxSpeed(newveh,topspeedms)
                    selectedgear = 0
                    Citizen.Wait(50)
                    ready = true




end



function ResetManual()
    SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveForce", acc)
    SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel",topspeedGTA)
    SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
    SetVehicleHighGear(vehicle, numgears)
    ModifyVehicleTopSpeed(vehicle,1)
    --SetVehicleMaxSpeed(vehicle,topspeedms)
    SetVehicleHandbrake(vehicle, false)

    modifyGears = nil
    
    vehicle = nil
    numgears = nil
    topspeedGTA = nil
    topspeedms = nil
    acc = nil
    hash = nil
    hbrake = nil
    selectedgear = 0
    currspeedlimit = nil
    ready = false
    manualon = false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) 
        if manualon == true and vehicle ~= nil then
        DisableControlAction(0, 80, true)
        DisableControlAction(0, 21, true)
        end
    end

end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) 
        
        if manualon == true and vehicle ~= nil then

            if vehicle ~= nil then


            
            -- Shift up and down
                if ready == true then
                    if IsDisabledControlJustPressed(0, Keys[Config.ShiftUp]) then
                        if selectedgear <= numgears - 1 then 
                            DisableControlAction(0, 71, true)
                            Wait(300)
                            selectedgear = selectedgear + 1
                            DisableControlAction(0, 71, false)
                            SimulateGears()
                        end
                    elseif IsDisabledControlJustPressed(0, Keys[Config.ShiftDown]) then
                        if selectedgear > -1 then
                           
                            DisableControlAction(0, 71, true)
                            Wait(300)
                            selectedgear = selectedgear - 1
                            DisableControlAction(0, 71, false)
                            SimulateGears()
                        end
                    end
                end
            end

        end

    end
end)



function SimulateGears()

    local engineup = GetVehicleMod(vehicle,11)      

    if selectedgear > 0 then
        
        local ratio 
       
        if modifyGears ~= nil then
            if selectedgear ~= 0 and selectedgear ~= nil  then
                if numgears ~= nil and selectedgear ~= nil and modifyGears[numgears] ~= nil then
                    ratio = modifyGears[numgears][selectedgear] * (1/0.9)
                else
                    ratio = gears[numgears][selectedgear] * (1/0.9)
                end
            end
        
        else
            if selectedgear ~= 0 and selectedgear ~= nil then
                if numgears ~= nil and selectedgear ~= nil then
                    ratio = gears[numgears][selectedgear] * (1/0.9)
                else
                
                end
            
            end
        end
        

        if ratio ~= nil then
            

            SetVehicleHighGear(vehicle,1)
            newacc = ratio * acc * ((currentMulti or 0) + 1)
            newtopspeedGTA = topspeedGTA / ratio
            newtopspeedms = topspeedms / ratio

            --if GetEntitySpeed(vehicle) > newtopspeedms then
                --selectedgear = selectedgear + 1
            --else
        
            SetVehicleHandbrake(vehicle, false)
            SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveForce", newacc)
            SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel", newtopspeedGTA)
            SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
            ModifyVehicleTopSpeed(vehicle,1)
            --SetVehicleMaxSpeed(vehicle,newtopspeedms)
            currspeedlimit = newtopspeedms 
            --end

        end
    elseif selectedgear == 0 then
        --SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel", 0.0)
    elseif selectedgear == -1 then
        
        --if GetEntitySpeedVector(vehicle,true).y > 0.1 then
            --selectedgear = selectedgear + 1
        --else
            SetVehicleHandbrake(vehicle, false)
            SetVehicleHighGear(vehicle,numgears)    
            SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveForce", acc)
            SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel", topspeedGTA)
            SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
            ModifyVehicleTopSpeed(vehicle,1)
            
            --SetVehicleMaxSpeed(vehicle,topspeedms)
        --end
    
    end
SetVehicleMod(vehicle,11,engineup,false)
    
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if manualon == true and vehicle ~= nil then
            if selectedgear == -1 then
                if GetVehicleCurrentGear(vehicle) == 1 then
                    DisableControlAction(0, 71, true)
                end
            elseif selectedgear > 0 then
                if GetEntitySpeedVector(vehicle,true).y < 0.0 then   
                    DisableControlAction(0, 72, true)
                end
            elseif selectedgear == 0 then
                SetVehicleHandbrake(vehicle, true)
                if IsControlPressed(0, 76) == false then
                    SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", 0.0)
                else
                    SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
                end
            end
        else
            Citizen.Wait(100) 
        end
    end
end)







local disable = false
    
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if realistic == true then
            if manualon == true and vehicle ~= nil then
                if selectedgear > 1 then
                    if IsControlPressed(0,71) then
                        local speed = GetEntitySpeed(vehicle) 
                        local minspeed = currspeedlimit / 7 

                        if speed < minspeed then
                            if GetVehicleCurrentRpm(vehicle) < 0.4 then
                                disable = true
                            end
                        end
                    end
                end
            else
                Citizen.Wait(100) 
            end  
        else
            Citizen.Wait(100) 
        end
    end
end)





Citizen.CreateThread(function()
    while true do
            
        Citizen.Wait(0)
        if disable == true then
            SetVehicleEngineOn(vehicle,false,true,false)
            Citizen.Wait(1000)
                
            disable = false
        end   

    end
end)

Citizen.CreateThread(function()
    while true do
            
        Citizen.Wait(0)
        if vehicle ~= nil and selectedgear ~= 0 then 
            local speed = GetEntitySpeed(vehicle) 
            
            if currspeedlimit ~= nil then
                
                if speed >= currspeedlimit then
                    
                  
                        if speed / currspeedlimit > 1.1 then
                        --print('dead')
                        local hhhh = speed / currspeedlimit
                        SetVehicleCurrentRpm(vehicle,hhhh)
                        SetVehicleCheatPowerIncrease(vehicle,-100.0)
                        --SetVehicleBurnout(vehicle,true)
                        else
                        --SetVehicleBurnout(vehicle,false)
                        SetVehicleCheatPowerIncrease(vehicle,0.0)
                        end
                    
                    
                    
                    --SetVehicleHandbrake(vehicle, true)
                    --if IsControlPressed(0, 76) == false then
                        --SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", 0.0)
                   -- else
                        --SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
                    --end


                else  
                    --SetVehicleHandbrake(vehicle, false)
                    --if IsControlPressed(0, 76) == false then
                    
                    --else
                        --SetVehicleHandbrake(vehicle, true)
                        --SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
                    --end  
            
                end
            
            else
                
                if speed >= topspeedms then
                    SetVehicleCheatPowerIncrease(vehicle,0.0)
                    --SetVehicleHandbrake(vehicle, true)
                    --if IsControlPressed(0, 76) == false then
                        --SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", 0.0)
                    --else
                        --SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
                    --end
    
    
                else  
                    --SetVehicleHandbrake(vehicle, false)
                    --if IsControlPressed(0, 76) == false then
                        
                    --else
                        --SetVehicleHandbrake(vehicle, true)
                        --SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
                    --end 
    
                end


            end
        

            
        
        
        end

    end
end)




function getinfo(gea)
    if gea == 0 then
        return "N"
    elseif gea == -1 then
        return "R"
    else
        return gea
    end
end

function round(value, numDecimalPlaces)
    if numDecimalPlaces then
        local power = 10^numDecimalPlaces
        return math.floor((value * power) + 0.5) / (power)
    else
        return math.floor(value + 0.5)
    end
end


