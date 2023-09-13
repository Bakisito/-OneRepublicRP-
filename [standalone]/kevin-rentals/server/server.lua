local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('kevin-rentals:sendinfomation', function(data, payMethod, rentTime)
	local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)

    local Payment = data.price
    if Player.PlayerData.money[payMethod] >= Payment then
        Player.Functions.RemoveMoney(payMethod, Payment, 'Vehicle rental')
        TriggerClientEvent('kevin-rentals:createvehicle', PlayerID, data, rentTime)
    else
		TriggerClientEvent('QBCore:Notify', PlayerID, Lang:t('error.insufficent_funds'), 'error')
    end
end)

RegisterNetEvent('kevin-rentals:sendvehicledata', function(vehicle, plate, rentTime)
	local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
    if not vehicle then return end

    local Time = os.date('%I:%M %p')
    local Date = os.date('%A, %B %d')

    local currentTimestamp = os.time()
    local addTime = currentTimestamp + rentTime * 60 * 60
    local expireTime = os.date('%I:%M %p', addTime)
    
	local papersInfo = {
        firstname = Player.PlayerData.charinfo.firstname,
        lastname = Player.PlayerData.charinfo.lastname,
        model = vehicle,
        plate = plate,
        date = Date,
        rentedtime = Time,
        rentaltime = expireTime,
    }
    local keyInfo = {
        vehicle = vehicle,
        plate = plate
    }
	Player.Functions.AddItem('rentalpapers', 1, nil, papersInfo)
	Player.Functions.AddItem('rentalkeys', 1, nil, keyInfo)
	TriggerClientEvent('inventory:client:ItemBox', PlayerID,  QBCore.Shared.Items['rentalpapers'], 'add')
	TriggerClientEvent('inventory:client:ItemBox', PlayerID,  QBCore.Shared.Items['rentalkeys'], 'add')
end)

RegisterNetEvent('kevin-rentals:returnvehicle', function(price, vehicle)
    local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
    if not vehicle then return end
    local money = price * Config.MoneyReturn
    Player.Functions.AddMoney(Config.PaymentType, money, 'Vehicle return')
    TriggerClientEvent('QBCore:Notify', PlayerID, Lang:t('info.money_received', {money = money}), 'primary', 6000)
end)

QBCore.Functions.CreateUseableItem('rentalkeys', function(source, item)
    local PlayerId = source
    if not item.info.plate then return end
    TriggerClientEvent('kevin-rentals:client:givekeys', PlayerId, item.info.plate)
end)