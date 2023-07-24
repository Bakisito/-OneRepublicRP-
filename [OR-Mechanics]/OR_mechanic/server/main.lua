

local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function ()
    while GetResourceState('mysql-async') ~= 'started' do Citizen.Wait(0) end
    while GetResourceState(GetCurrentResourceName()) ~= 'started' do Citizen.Wait(0) end
    if GetResourceState(GetCurrentResourceName()) == 'started' then InitializeMechanicShops() end
end)

local mechanicShops = {}
function InitializeMechanicShops()
	Citizen.Wait(1000)
	MySQL.Async.fetchAll('SELECT * FROM t1ger_mechanic', {}, function(results)
		if next(results) then
			for i = 1, #results do
				local data = {
					identifier = results[i].identifier,
					id = results[i].id,
					name = results[i].name,
					storage = nil or json.decode(results[i].storage)
				}
				mechanicShops[results[i].id] = data
				Config.MechanicShops[results[i].id].owned = true
				Config.MechanicShops[results[i].id].data = data
				Citizen.Wait(5)
			end
		end
	end)
	RconPrint('One Republic Mechanic Job Initialized\n')
    RconPrint('by OR Devs\n')
end

RegisterServerEvent('t1ger_mechanicjob:debugSV')
AddEventHandler('t1ger_mechanicjob:debugSV', function()
    SetupMechanicShops(source)
end)

RegisterServerEvent('t1ger_mechanicjob:setupMechanicShops')
AddEventHandler('t1ger_mechanicjob:setupMechanicShops', function(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
	while not xPlayer do Citizen.Wait(100) end
    SetupMechanicShops(xPlayer.PlayerData.source)
end)

function SetupMechanicShops(src)
    local xPlayer = QBCore.Functions.GetPlayer(src)
	while not xPlayer do Citizen.Wait(100) end
    local isOwner, mechID = false, 0
    if next(mechanicShops) then
        for k,v in pairs(mechanicShops) do

            -- is owner?
            if xPlayer.PlayerData.citizenid == v.identifier then
                isOwner = true
            end

            -- is employee?
            local currentJob = xPlayer.PlayerData.job
            if currentJob.name == Config.Society[Config.MechanicShops[v.id].society].name then
                mechID = v.id
            end
        end
    end
	TriggerClientEvent('t1ger_mechanicjob:loadShops', xPlayer.PlayerData.source, mechanicShops, Config.MechanicShops, isOwner, mechID)
end

-- Update Mechanic Shop Data:
RegisterServerEvent('t1ger_mechanicjob:updateShopDataSV')
AddEventHandler('t1ger_mechanicjob:updateShopDataSV', function(id, data)
	Config.MechanicShops[id].data = data
	TriggerClientEvent('t1ger_mechanicjob:updateShopDataCL', -1, id, Config.MechanicShops[id].data)
end)

-- Callback to check money & purchase tow service:
QBCore.Functions.CreateCallback('t1ger_mechanicjob:buyMechanicShop',function(source, cb, id, val, name)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local money = 0
    if Config.BuyWithBank then money = xPlayer.PlayerData.money.bank else money = xPlayer.PlayerData.money.cash end
	if money >= val.price then
		if Config.BuyWithBank then xPlayer.Functions.RemoveMoney('bank', val.price) else xPlayer.Functions.RemoveMoney('cash', val.price) end
        MySQL.Async.execute('INSERT INTO t1ger_mechanic (id, identifier, name) VALUES (@id, @identifier, @name)', {
            ['id'] = id,
			['identifier'] = xPlayer.PlayerData.citizenid,
            ['name'] = name
        })
		xPlayer.Functions.SetJob(Config.Society[val.society].name, Config.Society[val.society].bossGrade)
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('t1ger_mechanicjob:sellMechanicShop')
AddEventHandler('t1ger_mechanicjob:sellMechanicShop', function(id, val, amount)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    MySQL.Async.execute('DELETE FROM t1ger_mechanic WHERE id = @id', {['@id'] = id})
    if Config.BuyWithBank then xPlayer.Functions.AddMoney('bank', amount) else xPlayer.Functions.AddMoney('cash', amount) end
	xPlayer.Functions.SetJob('unemployed', 0)
end)

-- Event to update selected tow service:
RegisterServerEvent('t1ger_mechanicjob:updateMechanicShops')
AddEventHandler('t1ger_mechanicjob:updateMechanicShops', function(num, val, state, name)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if state ~= nil then
        -- add/remove service to/from table:
        if state then
            table.insert(mechanicShops, { identifier = xPlayer.PlayerData.citizenid, id = num, name = name } )
        else
			for i = 1, #mechanicShops do
				if mechanicShops[i].id == num then
					mechanicShops[i] = nil
					break
				end
			end
        end
        Config.MechanicShops[num].owned = state
    else
        if name ~= nil then
            for k,v in pairs(mechanicShops) do
                if v.id == num then
                    v.name = name
                    MySQL.Async.execute('UPDATE t1ger_mechanic SET name = @name WHERE id = @id', {
                        ['@name'] = name,
                        ['@id'] = num
                    })
                    break
                end
            end
        end
    end
    TriggerClientEvent('t1ger_mechanicjob:syncMechanicShops', -1, mechanicShops, Config.MechanicShops)
end)

-- Get inventory item:
QBCore.Functions.CreateCallback('t1ger_mechanicjob:getInventoryItem',function(source, cb, item)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local hasItem = xPlayer.Functions.GetItemByName(item)
    if hasItem then cb(true) else cb(false) end
end)

Citizen.CreateThread(function()
	for k,v in pairs(Config.BodyParts) do
		QBCore.Functions.CreateUseableItem(v.item, function(source)
			local xPlayer = QBCore.Functions.GetPlayer(source)
			TriggerClientEvent('t1ger_mechanicjob:installBodyPartCL', xPlayer.PlayerData.source, k, v)
		end)
	end
end)

-- Remove item event:
RegisterServerEvent('t1ger_mechanicjob:removeItem')
AddEventHandler('t1ger_mechanicjob:removeItem', function(item, amount)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.RemoveItem(item, amount)
end)

-- Sync Vehicle Body:
RegisterServerEvent('t1ger_mechanicjob:syncVehicleBodySV')
AddEventHandler('t1ger_mechanicjob:syncVehicleBodySV', function(plate)
    TriggerClientEvent('t1ger_mechanicjob:syncVehicleBodyCL', -1, plate)
end)

-- Lift Features:
RegisterServerEvent('t1ger_mechanicjob:liftStateSV')
AddEventHandler('t1ger_mechanicjob:liftStateSV', function(k, id, val, state)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local identifier = xPlayer.PlayerData.citizenid
    Config.MechanicShops[k].lifts[id] = val
    Config.MechanicShops[k].lifts[id].inUse = state
    Citizen.Wait(100)
    TriggerClientEvent('t1ger_mechanicjob:liftStateCL', -1, k, id, val, state)
end)

QBCore.Functions.CreateCallback('t1ger_mechanicjob:isVehicleOwned',function(source, cb, plate)
    local xPlayer = QBCore.Functions.GetPlayer(source)
	MySQL.Async.fetchAll('SELECT * FROM player_vehicles WHERE (plate = @plate or plate = @plate2)', {
		['@plate'] = plate,
		['@plate2'] = T1GER_Trim(plate)
	}, function(result)
		if result[1] then
            cb(true)
		else
			cb(false)
		end
	end)
end)

QBCore.Functions.CreateCallback('t1ger_mechanicjob:getVehicleHealth',function(source, cb, plate)
    local xPlayer = QBCore.Functions.GetPlayer(source)
	MySQL.Async.fetchAll('SELECT * FROM player_vehicles WHERE (plate = @plate or plate = @plate2)', {
		['@plate'] = plate,
		['@plate2'] = T1GER_Trim(plate)
	}, function(result)
		if result[1] then
            local decoded = json.decode(result[1].health)
            if decoded ~= nil then
                cb(decoded)
            else
                local healthParts = AddDefaultHealthData(result[1].plate)
                cb(healthParts)
            end
		else
			cb(nil)
		end
	end)
end)

-- Degrade Vehicle Health Parts:
RegisterServerEvent('t1ger_mechanicjob:degradeVehicleHealth')
AddEventHandler('t1ger_mechanicjob:degradeVehicleHealth', function(plate, damageArray)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    MySQL.Async.fetchAll('SELECT health, plate FROM player_vehicles WHERE (plate = @plate or plate = @plate2)', {
        ['@plate'] = plate,
        ['@plate2'] = T1GER_Trim(plate)
    }, function(result)
        if result[1] then
            healthParts = {}
            if result[1].health ~= nil then
                healthParts = json.decode(result[1].health)
            else
                healthParts = AddDefaultHealthData(result[1].plate)
            end
            for k,v in pairs(healthParts) do
                if damageArray[v.part] ~= nil and damageArray[v.part].degName == v.part then
                    v.value = (v.value - damageArray[v.part].degValue)
                    if v.value < 0 then
                        v.value = 0
                    end
                    local message = damageArray[v.part].label.." took damage. Degradation by: "..round(damageArray[v.part].degValue/10,2)..". New Value: "..round(v.value/10,2)
                    TriggerClientEvent('t1ger_mechanicjob:notify', xPlayer.PlayerData.source, message)
                end
            end
            MySQL.Sync.execute('UPDATE player_vehicles SET health = @health WHERE plate = @plate', {
                ['@health'] = json.encode(healthParts),
                ['@plate'] = result[1].plate
            })
        end
    end)
end)

-- Get Materials for Health Part Repair:
QBCore.Functions.CreateCallback('t1ger_mechanicjob:getMaterialsForHealthRep',function(source, cb, materials, addValue)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    -- Get & Remove materials:
    local removeItems = {}
    local loopDone = false
    local hasMaterials = false
    for k,v in ipairs(materials) do
        local items = Config.Materials[v.id]
        local multiplier = math.floor(addValue)
        local reqAmount = (v.qty * multiplier)
        if xPlayer.Functions.GetItemByName(items.item) then
            if xPlayer.Functions.GetItemByName(items.item).amount >= reqAmount then
                removeItems[#removeItems+1] = {item = items.item, amount = reqAmount}
            else
                loopDone = true
                hasMaterials = false
                break
            end
        else
            loopDone = true
            hasMaterials = false
            break
        end
        if k == #materials then
            loopDone = true
            hasMaterials = true
        end
    end
    while not loopDone do
        Citizen.Wait(1)
    end
    if hasMaterials then
        for k,v in pairs(removeItems) do
            xPlayer.Functions.RemoveItem(v.item, v.amount)
        end
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('t1ger_mechanicjob:setHealthPartValue')
AddEventHandler('t1ger_mechanicjob:setHealthPartValue', function(plate, part, value)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    SetSelectedHealthPart(plate, part, value)
end)

function SetSelectedHealthPart(plate, part, value)
    MySQL.Async.fetchAll('SELECT health, plate FROM player_vehicles WHERE (plate = @plate or plate = @plate2)', {
        ['@plate'] = plate,
        ['@plate2'] = T1GER_Trim(plate)
    }, function(result)
        if result[1] then
            healthParts = {}
            if result[1].health ~= nil then
                healthParts = json.decode(result[1].health)
            else
                healthParts = AddDefaultHealthData(result[1].plate)
            end
            for k,v in pairs(healthParts) do
                if part == v.part then
                    v.value = value
                    MySQL.Sync.execute('UPDATE player_vehicles SET health = @health WHERE plate = @plate', {
                        ['@health'] = json.encode(healthParts),
                        ['@plate'] = result[1].plate
                    })
                    break
                end
            end
        end
    end)
end

RegisterServerEvent('t1ger_mechanicjob:resetVehicleHealthParts')
AddEventHandler('t1ger_mechanicjob:resetVehicleHealthParts', function(plate)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    MySQL.Async.fetchAll('SELECT * FROM player_vehicles WHERE owner = @owner AND (plate = @plate or plate = @plate2)', {
		['@owner'] = xPlayer.PlayerData.citizenid,
		['@plate'] = plate,
		['@plate2'] = T1GER_Trim(plate)
	}, function(result)
		if result[1] then
            AddDefaultHealthData(result[1].plate)
		end
	end)
end)

function AddDefaultHealthData(plate)
    local t = {}
    local updated = false
    for k,v in ipairs(Config.HealthParts) do
        table.insert(t, {type = k, part = v.degName, value = v.value})
    end
    MySQL.Sync.execute('UPDATE player_vehicles SET health = @health WHERE plate = @plate', {
        ['@health'] = json.encode(t),
        ['@plate'] = plate
    }, function(healthUpdated)
        if healthUpdated then
            updated = true
        end
    end)
    while not updated do
        Citizen.Wait(100)
    end
    Citizen.Wait(1000)
    return t
end

-- Get User Inventory:
QBCore.Functions.CreateCallback('t1ger_mechanicjob:getUserInventory', function(source, cb)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local inventoryItems = xPlayer.PlayerData.items
    cb(inventoryItems)
end)

RegisterServerEvent('t1ger_mechanicjob:depositItem')
AddEventHandler('t1ger_mechanicjob:depositItem', function(item, label, amount, id)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local invItem = xPlayer.Functions.GetItemByName(item)
    if invItem ~= nil then
		if invItem.count >= amount then
            MySQL.Async.fetchAll('SELECT storage FROM t1ger_mechanic WHERE id = @id', {['@id'] = id}, function(result)
                if result[1] then
                    if result[1].storage ~= nil then
                        local decoded = json.decode(result[1].storage)
                        if next(decoded) then
                            for k,v in pairs(decoded) do
                                if v.item == item then
                                    v.count = (v.count + amount)
                                    Citizen.Wait(100)
                                    MySQL.Sync.execute('UPDATE t1ger_mechanic SET storage = @storage WHERE id = @id', {
                                        ['@storage'] = json.encode(decoded),
                                        ['@id'] = id
                                    })
                                    xPlayer.Functions.RemoveItem(item, amount)
                                    TriggerClientEvent('t1ger_mechanicjob:notify', xPlayer.PlayerData.source, Lang['storage_deposited_x']:format(amount, label))
                                    break
                                else
                                    if k == #decoded then
                                        table.insert(decoded, {label = label, item = item, count = amount})
                                        MySQL.Sync.execute('UPDATE t1ger_mechanic SET storage = @storage WHERE id = @id', {
                                            ['@storage'] = json.encode(decoded),
                                            ['@id'] = id
                                        })
                                        xPlayer.Functions.RemoveItem(item, amount)
                                        TriggerClientEvent('t1ger_mechanicjob:notify', xPlayer.PlayerData.source, Lang['storage_deposited_x']:format(amount, label))
                                        break
                                    end
                                end
                            end
                        end
                    else
                        local storageInv = {}
                        table.insert(storageInv, {label = label, item = item, count = amount})
                        MySQL.Sync.execute('UPDATE t1ger_mechanic SET storage = @storage WHERE id = @id', {
                            ['@storage'] = json.encode(storageInv),
                            ['@id'] = id
                        })
                        xPlayer.Functions.RemoveItem(item, amount)
                        TriggerClientEvent('t1ger_mechanicjob:notify', xPlayer.PlayerData.source, Lang['storage_deposited_x']:format(amount, label))
                    end
                end
            end)
        else
            TriggerClientEvent('t1ger_mechanicjob:notify', xPlayer.PlayerData.source, Lang['not_enough_items'])
        end
    else
        return print('ITEM '..data.item..' DOES NOT EXIST IN DATABASE')
    end
end)

-- Get Storage Inventory:
QBCore.Functions.CreateCallback('t1ger_mechanicjob:getStorageInventory', function(source, cb, id)
    MySQL.Async.fetchAll('SELECT storage FROM t1ger_mechanic WHERE id = @id', {['@id'] = id}, function(result)
        if result[1] then
            if result[1].storage ~= nil then
                local decoded = json.decode(result[1].storage)
                if next(decoded) then
                    cb(decoded)
                else
                    cb(nil)
                end
            else
                cb(nil)
            end
        else
            cb(nil)
        end
    end)
end)

-- Withdraw Items from Storage:
RegisterServerEvent('t1ger_mechanicjob:withdrawItem')
AddEventHandler('t1ger_mechanicjob:withdrawItem', function(item, label, amount, id)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    MySQL.Async.fetchAll('SELECT storage FROM t1ger_mechanic WHERE id = @id', {['@id'] = id}, function(result)
        if result[1] then
            if result[1].storage ~= nil then
                local decoded = json.decode(result[1].storage)
                if next(decoded) then
                    for k,v in pairs(decoded) do
                        if item == v.item then
                            v.count = (v.count - amount)
                            if v.count <= 0 then
                                table.remove(decoded, k)
                            end
                            MySQL.Sync.execute('UPDATE t1ger_mechanic SET storage = @storage WHERE id = @id', {
                                ['@storage'] = json.encode(decoded),
                                ['@id'] = id
                            })
                            xPlayer.Functions.AddItem(item, amount)
                            TriggerClientEvent('t1ger_mechanicjob:notify', xPlayer.PlayerData.source, Lang['storage_withdrew_x']:format(amount, label))
                            break
                        end
                    end
                end
            end
        end
    end)
end)

-- Craft Items:
RegisterServerEvent('t1ger_mechanicjob:craftItem')
AddEventHandler('t1ger_mechanicjob:craftItem', function(item_label, item_name, item_recipe, id, val)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local removeItems = {}
    local loopDone = false
    local hasRecipeItems = false
    for k,v in ipairs(item_recipe) do
		local material = Config.Materials[v.id]
        if xPlayer.Functions.GetItemByName(material.item) then
            if xPlayer.Functions.GetItemByName(material.item).amount >= v.qty then
                removeItems[#removeItems+1] = {item = material.item, amount = v.qty}
            else
                loopDone = true
                hasRecipeItems = false
                break
            end
            if k == #item_recipe then
                loopDone = true
                hasRecipeItems = true
            end
        else
            loopDone = true
            hasRecipeItems = false
            break
        end
    end
    while not loopDone do
        Citizen.Wait(1)
    end
    if hasRecipeItems then
        for k,v in pairs(removeItems) do
            xPlayer.Functions.RemoveItem(v.item, v.amount)
        end
        xPlayer.Functions.AddItem(item_name, 1)
        TriggerClientEvent('t1ger_mechanicjob:notify', xPlayer.PlayerData.source, Lang['you_crafted_x_item']:format(item_label))
    else
        TriggerClientEvent('t1ger_mechanicjob:notify', xPlayer.PlayerData.source, Lang['not_enough_materials'])
    end
end)

Citizen.CreateThread(function()
	for k,v in pairs(Config.RepairKits) do
		QBCore.Functions.CreateUseableItem(v.item, function(source)
			local xPlayer = QBCore.Functions.GetPlayer(source)
			TriggerClientEvent('t1ger_mechanicjob:useRepairKit', xPlayer.PlayerData.source, k, v)
		end)
	end
end)

-- Force Delete Object:
RegisterServerEvent('t1ger_mechanicjob:forceDelete')
AddEventHandler('t1ger_mechanicjob:forceDelete', function(ObjNet)
    TriggerClientEvent('t1ger_mechanicjob:forceDeleteCL', -1, ObjNet)
end)

RegisterServerEvent('t1ger_mechanicjob:JobReward')
AddEventHandler('t1ger_mechanicjob:JobReward',function(payout)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local cash = math.random(payout.min,payout.max)
    xPlayer.Functions.AddMoney('cash', cash)
    TriggerClientEvent('t1ger_mechanicjob:notify', xPlayer.PlayerData.source, Lang['npc_job_cash_reward']:format(cash))
end)

-- Sync Job Data:
RegisterServerEvent('t1ger_mechanicjob:JobDataSV')
AddEventHandler('t1ger_mechanicjob:JobDataSV',function(data)
    TriggerClientEvent('t1ger_mechanicjob:JobDataCL', -1, data)
end)


-- Function to trim plates:
function T1GER_Trim(value)
	return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
end

function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- Billing

RegisterServerEvent('t1ger_mechanicjob:billing')
AddEventHandler('t1ger_mechanicjob:billing',function(playerId, sharedAccountName, label, amount)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local xTarget = QBCore.Functions.GetPlayer(playerId)
    amount = QBCore.Shared.Round(amount)
    if amount > 0 and xTarget then
		MySQL.Async.insert('INSERT INTO phone_invoices (citizenid, amount, society, sender, sendercitizenid) VALUES (?, ?, ?, ?, ?)', {
			xTarget.PlayerData.citizenid,
			amount,
			sharedAccountName,
			xPlayer.PlayerData.charinfo.firstname,
			xPlayer.PlayerData.citizenid
		})
        TriggerClientEvent('qb-phone:RefreshPhone', xTarget.PlayerData.source)
        TriggerClientEvent('QBCore:Notify', xPlayer.PlayerData.source, 'Invoice Successfully Sent', 'success')
        TriggerClientEvent('QBCore:Notify', xTarget.PlayerData.source, 'New Invoice Received')
    end
end)
