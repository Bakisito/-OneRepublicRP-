local DoorStates = {}
local ScriptLoaded = false 
ServerCallbacks = {}
KEYSLIST = {}

function CreateCallback(name, cb)
    ServerCallbacks[name] = cb
end

function TriggerCallback(name, source, cb, ...)
    if not ServerCallbacks[name] then return end
    ServerCallbacks[name](source, cb, ...)
end

RegisterNetEvent('Server:TriggerCallback', function(name, ...)
    local src = source
    TriggerCallback(name, src, function(...)
        TriggerClientEvent('Client:TriggerCallback', src, name, ...)
    end, ...)
end)

Framework = nil
TriggerEvent('0r-core:getSharedObject', function(obj) Framework = obj end)

CreateCallback('Kibra:Motels:V2:Server:DoorDataLoad', function(source, cb)
    cb(DoorStates)
end)

RegisterNetEvent('Kibra:Motels:V2:Server:LoadMotelsRooms', function()
	local src = source
	LoadMotelsRooms()
	UploadMotels()
	TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotels', src, Config.Motels)

	local xPlayer = Framework.xPlayer(src)
	if not xPlayer then return end
	while not xPlayer do 
		xPlayer = Framework.xPlayer(source)
		Citizen.Wait(1)
	end

	cache = {}
	cache = MySQL.Sync.fetchAll("SELECT * FROM `kibra-motels-cache` WHERE citizenid = '"..xPlayer.identifier.."'  ")
	if #cache ~= 0 then
		mid,rid = MotelIdFind(cache[1].rid)
		TriggerClientEvent("Kibra:Motels:V2:Client:CacheMotels", src, tonumber(mid), tonumber(rid))
	end
end)

function GetItemBySlot(source, slot)
    local Player = Framework.xPlayer(source)
    slot = tonumber(slot)
    return Player.PlayerData.items[slot]
end

RegisterNetEvent('Kibra:Motels:V2:AutoPayment', function()
	local Motels = MySQL.query.await('SELECT * FROM `kibra-motels`')
	if #Motels > 0 then
		for k,v in pairs(Motels) do

			if v.owner ~= "" or v.owner ~= nil then
				local owner = Framework.GetByIdentifier(v.owner)
				if owner ~= nil then
					local Motel, Room = MotelIdFind(v.roomid) 
					if MotelCheckPayment(owner, Config.Motels[Motel].RoomRentPrice) then
						Config.ServerNotify(owner.source, Config.Lang["AutoSuccess"],"success")

						MySQL.Async.execute('UPDATE `kibra-motels-business` SET money = @mny WHERE id = @id',{["@mny"] = Config.Motels[Motel].SocietyMoney+Config.Motels[Motel].RoomRentPrice, ["@id"] = Motel})
						Config.Motels[Motel].SocietyMoney = Config.Motels[Motel].SocietyMoney+Config.Motels[Motel].RoomRentPrice

					else
						Config.ServerNotify(owner.source, Config.Lang["BankandaParaYokMal"], "error")
						MySQL.Async.execute('UPDATE `kibra-motels` SET owner = @owner, pdata = @pdata, date = @date, password = @password, invoiceseen = @invseen WHERE roomid = @roomid', {
							["@owner"] = "",
							["@password"] = "",
							["@date"] = "",
							["@pdata"] = "",
							["@invseen"] = 0,
							["@roomid"] = v.roomid
						})	
						Config.Motels[Motel].Rooms[Room].Owner = ""
						Config.Motels[Motel].Rooms[Room].Password = ""
						Config.Motels[Motel].Rooms[Room].pData = ""
						Config.Motels[Motel].Rooms[Room].Date = ""
						TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotels', -1, Config.Motels)
					end
				else

				end
			end
		end
	end
end)

LeaveMotelRoom = function(odaID)
	local Motel, Room = MotelIdFind(odaID) 
	local V = MySQL.Sync.fetchAll('SELECT * FROM `kibra-motels` WHERE roomid = @r', {["@r"] = odaID})
	if #V >= 1 then
		MySQL.Async.execute('UPDATE `kibra-motels` SET owner = @owner, pdata = @pdata, date = @date, password = @password, invoiceseen = @invseen WHERE roomid = @roomid', {
			["@owner"] = "",
			["@password"] = "",
			["@date"] = "",
			["@pdata"] = "",
			["@invseen"] = 0,
			["@roomid"] = odaID
		})		
		Config.Motels[Motel].Rooms[Room].Owner = ""
		Config.Motels[Motel].Rooms[Room].Password = ""
		Config.Motels[Motel].Rooms[Room].pData = ""
		Config.Motels[Motel].Rooms[Room].Date = ""
		TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotels', -1, Config.Motels)
	end
end

MotelCheckPayment = function(xPlayer, money)
	local OwnerMoney = xPlayer.GetAccountData(Config.MotelRoomRentPayment)
	if OwnerMoney >= money then
		xPlayer.RemoveMoney(Config.MotelRoomRentPayment, money)
		return true 
	else
		return false
	end
end

RegisterNetEvent('Kibra:Motels:V2:Server:Outbucket', function()
	local src = source
	local xPlayer = Framework.xPlayer(src)
	if not xPlayer then return end
	while not xPlayer do 
		xPlayer = Framework.xPlayer(source)
		Citizen.Wait(1)
	end
  
	MySQL.Async.execute("DELETE FROM `kibra-motels-cache` WHERE citizenid = '"..xPlayer.identifier.."' ")
	SetPlayerRoutingBucket(source, 0)
end)

RegisterNetEvent("Kibra:Motels:V2:Server:SetBucket" ,function(mid,rid)
   	if not Config.Motels[mid].Rooms[rid].bucket_id then 
		motelid = 1000*mid
		ahmetsonuc = motelid+rid
		Config.Motels[mid].Rooms[rid].bucket_id = ahmetsonuc
   	end
	local PlayerIdentifier = Framework.xPlayer(source).identifier
	while not Player do 
		Player = Framework.xPlayer(source)
		Citizen.Wait(1)
	end

   	SetPlayerRoutingBucket(source, Config.Motels[mid].bucket_id)

	cache = {}
	id = mid..'_'..rid
	cache = MySQL.Sync.fetchAll("SELECT * FROM `kibra-motels-cache` WHERE citizenid = '"..PlayerIdentifier.."'  ")
	if #cache == 0 then
		MySQL.Async.execute("INSERT INTO `kibra-motels-cache` (rid, citizenid) VALUES ('"..id.."', '"..PlayerIdentifier.."')")
	else 
		MySQL.Async.execute("UPDATE `kibra-motels-cache` SET rid = '"..id.."' WHERE citizenid = '"..PlayerIdentifier.."'  ")
	end
end)

RegisterNetEvent('Kibra:Motels:V2:Server:UploadRooms', function()
	local src = source
	dataSex = MySQL.Sync.fetchAll('SELECT * FROM `kibra-motels`')
	if #dataSex > 0 then
		for k,v in pairs(dataSex) do
			local o,c = MotelIdFind(v.roomid)
			Config.Motels[o].Rooms[c].Owner = v.owner 
			Config.Motels[o].Rooms[c].Password = v.password
			Config.Motels[o].Rooms[c].pData = json.decode(v.pdata)
			Config.Motels[o].Rooms[c].Date = v.date
		end
		TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotels', src, Config.Motels)
	end
end)

CreateCallback('Kibra:Motels:V2:Server:PlayerMotels', function(source, cb)
	PlayerMotels = MySQL.Sync.fetchAll('SELECT * FROM `kibra-motels` WHERE owner = ?',{Framework.xPlayer(source).identifier})
	if #PlayerMotels >= 1 then
		cb(PlayerMotels)
	else
		cb(false)
	end
end)

CreateCallback('Kibra:Motels:V2:Server:GetPlayerMotels', function(source, cb, mid)
	local xPlayer = Framework.xPlayer(source)
	local playerMotels = MySQL.Sync.fetchAll('SELECT * FROM `kibra-motels` WHERE motelid = ? AND owner = ?', {mid, xPlayer.identifier})
	if #playerMotels > 0 then
		cb(playerMotels)
	else
		cb(false)
	end
end)

CreateCallback('getProfile', function(source, cb)
	local xPlayer = Framework.xPlayer(source)
	cb(xPlayer.identifier)
end)

if Config.MetadataItem then 
	if Config.Inventory == "QBCore" then
		
		QBCore = exports["qb-core"]:GetCoreObject()

		QBCore.Functions.CreateUseableItem(Config.MotelKeyItem, function(source, item)
			local Player = Framework.xPlayer(source)
			if Player then
				if GetItemBySlot(source, item.slot) ~= nil then
					local Motel, Room = MotelIdFind(item.info.RealRoomNo) 
					local kibV = {Motel = Motel, Room = Room, Pass = item.info.Password}
					TriggerClientEvent('Kibra:Motels:V2:Client:MotelKeyUsed', source, kibV)
				end
			end
		end)
	end
end

CreateCallback('Kibra:Motels:V2:Server:BuyBusinessMotel', function(source, cb, id)
	local GetMotel = MySQL.Sync.fetchAll('SELECT * FROM `kibra-motels-business` WHERE id = ?', {id})
	local xPlayer = Framework.xPlayer(source)
	if #GetMotel == 1 then
		if GetMotel[1].owner == "" then
			if xPlayer.GetAccountData(Config.MotelBuyPayment) >= Config.Motels[id].SalePrice then
				if Config.MotelBuyPayment == "bank" then 
					xPlayer.RemoveMoney("bank", Config.Motels[id].SalePrice)
				else
					xPlayer.RemoveMoney("cash", Config.Motels[id].SalePrice)
				end
				MySQL.Async.execute('UPDATE `kibra-motels-business` SET owner = @o WHERE id = @id', {["@o"] = xPlayer.identifier, ["@id"] = id})
				Config.Motels[tonumber(id)].Owner = xPlayer.identifier
				TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotels', -1, Config.Motels)
				TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotels', source, Config.Motels)
				cb(1)
			else
				cb(2)
			end
		else
			cb(3)
		end
	end
end)

CreateCallback('Kibra:Motels:V2:Server:SellMotel', function(source, cb, mid)
	local pData = Framework.xPlayer(source)
	MySQL.Async.execute('UPDATE `kibra-motels-business` SET owner = @o, roomprice = @rp WHERE id = @id', {["@o"] = "", ["@rp"] = Config.DefaultRoomRental, ["@id"] = mid})
	Config.Motels[mid].Owner = ""
	TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotels', source, Config.Motels)
	TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotels', -1, Config.Motels)
	pData.GiveAccountMoney("bank", Config.Motels[mid].SalePrice/Config.MotelSalePriceRatio)
	cb(true)
end)

CreateCallback('Kibra:Motels:V2:Server:BuyMotelRoom', function(source, cb, id)
	local MotelRoom = MySQL.Sync.fetchAll("SELECT * FROM `kibra-motels` WHERE roomid = ?",{id})
	local xPlayer = Framework.xPlayer(source)
	if #MotelRoom > 0 and MotelRoom[1].owner == "" then
		local pMotel = MySQL.Sync.fetchAll("SELECT * FROM `kibra-motels` WHERE owner = ?",{xPlayer.identifier})
		if Config.MultiMotel then 
			if BuyMotelRoom(source, id) then
				cb(1)
			else
				cb(2)
			end
		else
			if #pMotel == 0 then
				if BuyMotelRoom(source, id) then
					cb(1)
				else
					cb(2)
				end
			else
				Config.ServerNotify(source, Config.Lang["Youalreadyhaveamotelroom"],"warning")
			end
		end
	else
		Config.ServerNotify(source, 'Propiedad de la habitación',"warning")
	end
end)

BuyMotelRoom = function(source, id)
	local xPlayer = Framework.xPlayer(source)
	local pData = {pName = xPlayer.GetProfile("name"), pPhone = xPlayer.GetProfile("phone")}
	local Motel, Room = MotelIdFind(id)		
	local RandomKey = "K1"..math.random(1111,9999)..'BRA'..math.random(1111,9999)
	local time = os.date("%x")
	if CheckPayment(xPlayer.source, Motel) then
		MySQL.Async.execute('UPDATE `kibra-motels` SET owner = @o, password = @pas, pdata = @datap, date = @deyt WHERE roomid = @odd',{["@o"] = xPlayer.identifier, ["@pas"] = RandomKey, ["@datap"] = json.encode(pData), ["@deyt"] = time , ["@odd"] = id})
		MySQL.Async.execute('UPDATE `kibra-motels-business` SET money = @mny WHERE id = @id',{["@mny"] = Config.Motels[Motel].SocietyMoney+Config.Motels[Motel].RoomRentPrice, ["@id"] = Motel})
		Config.Motels[Motel].SocietyMoney = Config.Motels[Motel].SocietyMoney+Config.Motels[Motel].RoomRentPrice
		Config.Motels[Motel].Rooms[Room].Owner = xPlayer.identifier 
		Config.Motels[Motel].Rooms[Room].Password = RandomKey 
		Config.Motels[Motel].Rooms[Room].pData = pData
		Config.Motels[Motel].Rooms[Room].Date = time
		if Config.MetadataItem then
			if Config.Inventory == "ox" then
				if exports.ox_inventory:CanCarryItem(source, Config.MotelKeyItem, 1) then
					exports.ox_inventory:AddItem(source, Config.MotelKeyItem, 1, {Password = RandomKey, description = "Motel: "..Config.Motels[Motel].MotelName..' || Room No: '..Room})
				end
			elseif Config.Inventory == "QBCore" then
				xPlayer.AddItem(Config.MotelKeyItem, 1, nil, {MotelName = Config.Motels[Motel].MotelName, UnRealMotelRoom = Room, Password = RandomKey, RealRoomNo = id})
			elseif Config.Inventory == "core" then
				xPlayer.AddItem(Config.MotelKeyItem, 1, {MotelName = Config.Motels[Motel].MotelName, UnRealMotelRoom = Room, Password = RandomKey, RealRoomNo = id})
			else
				Config.ServerNotify(source, 'You entered an invalid inventory. You should only type "ox" or "qbtoesx" inventory.', "error")
			end

		else
			EditMotelKeys(source, id, true)
		end
		Config.ServerNotify(source, Config.Lang["SuccessRentMotelRoom"],"success")
		TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotels', -1, Config.Motels)
		return true
	else 
		Config.ServerNotify(source, Config.Lang["Youdonthaveenoughmoneytorentthisroom"],"error")
		return false
	end
end

CheckPayment = function(source, id)
	local xPlayer = Framework.xPlayer(source)
	local PlayerMoney = xPlayer.GetAccountData(Config.MotelBuyPayment)
	if PlayerMoney >= Config.Motels[id].RoomRentPrice then
		xPlayer.RemoveMoney(Config.MotelBuyPayment, Config.Motels[id].RoomRentPrice)
		return true
	else
		return false
	end
end

CreateCallback('Kibra:Motels:V2:Server:LeaveMotelRoom', function(source, cb, id)
	Motel, Room = MotelIdFind(id) 
	LeaveMotelRoom(id)
	Config.Motels[Motel].Rooms[Room].Owner = ""
	Config.Motels[Motel].Rooms[Room].Password = ""
	Config.Motels[Motel].Rooms[Room].pData = ""
	Config.Motels[Motel].Rooms[Room].Date = ""
	TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotels', -1, Config.Motels)
	if not Config.MetadataItem then
		EditMotelKeys(source, id)
	end
	cb(true)
end)

CreateCallback('Kibra:Motels:V2:Server:TargetKickMotelRoom', function(source, cb, mid, rid)
	local id = mid..'_'..rid
	Motel, Room = MotelIdFind(id) 
	MySQL.Async.execute('UPDATE `kibra-motels` SET owner = @owner, pdata = @pdata, date = @date, password = @password, invoiceseen = @invseen WHERE roomid = @roomid', {
		["@owner"] = "",
		["@password"] = "",
		["@date"] = "",
		["@pdata"] = "",
		["@invseen"] = 0,
		["@roomid"] = id
	})	Config.Motels[Motel].Rooms[Room].Owner = ""
	Config.Motels[Motel].Rooms[Room].Password = ""
	Config.Motels[Motel].Rooms[Room].pData = ""
	Config.Motels[Motel].Rooms[Room].Date = ""
	if not Config.MetadataItem then
		EditMotelKeys(source, id)
	end
	TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotels', -1, Config.Motels)
	cb(true)
end)

CreateCallback('Kibra:Motels:V2:Server:CopyMotelRoomKey', function(source, cb, id)
	Motel, Room = MotelIdFind(id) 
	local Player = Framework.xPlayer(source)
	local getMotel = MySQL.Sync.fetchAll('SELECT * FROM `kibra-motels` WHERE roomid = ?', {id})
	if Player.GetAccountData(Config.MotelRoomKeyDuplicatePayment) >= Config.MotelRoomKeyDuplicateFee then
		Player.RemoveMoney(Config.MotelRoomKeyDuplicatePayment, Config.MotelRoomKeyDuplicateFee)
		if Config.Inventory == "ox" then
			if exports.ox_inventory:CanCarryItem(source, Config.MotelKeyItem, 1) then
				exports.ox_inventory:AddItem(source, Config.MotelKeyItem, 1, {Password = getMotel[1].password, description = "Motel: "..Config.Motels[Motel].MotelName..' || Room No: '..Room})
			end
		elseif Config.Inventory == "QBCore" then
			Player.AddItem(Config.MotelKeyItem, 1, nil, {MotelName = Config.Motels[Motel].MotelName, UnRealMotelRoom = Room, Password = getMotel[1].password, RealRoomNo = id})
		elseif Config.Inventory == "core" then
			Player.AddItem(Config.MotelKeyItem, 1, {MotelName = Config.Motels[Motel].MotelName, UnRealMotelRoom = Room, Password = getMotel[1].password, RealRoomNo = id})
		else
			Config.ServerNotify(source, 'You entered an invalid inventory. You should only type "ox" or "qbtoesx" inventory.',"error")
		end	
		cb(true)
	else
		cb(false)
	end
end)

RegisterCommand(Config.GiveMotelKeyCommandName, function(source, args)
	if args[1] == nil and args[2] == nil and args[3] == nil then return end 
	local xPlayerV = source
	local vPlayer = Framework.xPlayer(xPlayerV)
	local motelNo = tonumber(args[1])
	local odaNo = tonumber(args[2])
	local src = tonumber(args[3])
	local getMotels = MySQL.Sync.fetchAll('SELECT * FROM `kibra-motels` WHERE roomid = ? AND owner = ?', {motelNo..'_'..odaNo, vPlayer.identifier})
	-- if #getMotels >= 1 then
		EditMotelKeys(src, motelNo..'_'..odaNo, true)
		TriggerClientEvent('Kibra:Core:Notify', xPlayerV, 'success', Config.Lang["SuccessGiveKey"])
	-- end
end)

CreateCallback('Kibra:Motels:V2:Server:NewMotelRoomKey', function(source, cb, id)
	local Motel, Room = MotelIdFind(id) 
	local RandomKey = "K1"..math.random(1111,9999)..'BRA'..math.random(1111,9999)
	local Player = Framework.xPlayer(source)
	if Player.GetAccountData(Config.MotelRoomKeyDuplicatePayment) >= Config.MotelRoomKeyDuplicateFee then
		Config.Motels[Motel].Rooms[Room].Password = RandomKey
		MySQL.Async.execute('UPDATE `kibra-motels` SET password = @pass WHERE roomid = @id', {["@pass"] = RandomKey, ["@id"] = id})
		TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotels', -1, Config.Motels)
		Player.RemoveMoney(Config.MotelRoomKeyDuplicatePayment, Config.MotelRoomKeyDuplicateFee)
		if Config.Inventory == "ox" then
			if exports.ox_inventory:CanCarryItem(source, Config.MotelKeyItem, 1) then
				exports.ox_inventory:AddItem(source, Config.MotelKeyItem, 1, {Password = RandomKey, description = "Motel: "..Config.Motels[Motel].MotelName..' || Room No: '..Room})
			end
		elseif Config.Inventory == "QBCore" then
			Player.AddItem(Config.MotelKeyItem, 1, nil, {MotelName = Config.Motels[Motel].MotelName, UnRealMotelRoom = Room, Password = RandomKey, RealRoomNo = id})
		elseif Config.Inventory == "core" then
			Player.AddItem(Config.MotelKeyItem, 1, {MotelName = Config.Motels[Motel].MotelName, UnRealMotelRoom = Room, Password = RandomKey, RealRoomNo = id})
		else
			Config.ServerNotify(source, 'You entered an invalid inventory. You should only type "ox" or "qbtoesx" inventory.',"error")
		end	
		cb(true)
	else
		cb(false)
	end
end)

CreateCallback('Kibra:Motels:V2:Server:DepositMoney', function(source, cb, id, money)
	local pData = Framework.xPlayer(source)
	if Config.Motels[id].Owner == pData.identifier then
		if pData.GetAccountData("cash") >= money then
			pData.RemoveMoney("cash", money) 
			MySQL.Async.execute('UPDATE `kibra-motels-business` SET money = @money WHERE id = @id',{["@money"] = Config.Motels[id].SocietyMoney+money, ["@id"] = id})
			Config.Motels[id].SocietyMoney = Config.Motels[id].SocietyMoney+money
			TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotels', -1, Config.Motels)
			cb(true)
		else
			cb(false)
		end
	end
end)

CreateCallback('Kibra:Motels:V2:Server:TransferOwnerMotels', function(source, cb, id, pId)
	local xTarget = Framework.xPlayer(pId)
	if xTarget then
		MySQL.Async.execute('UPDATE `kibra-motels-business` SET owner = @owner WHERE id = @id',{["@owner"] = xTarget.identifier, ["@id"] = id})
		Config.Motels[id].Owner = xTarget.identifier
		TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotels', -1, Config.Motels)
		cb(true)
	else
		cb(false)
	end
end)

CreateCallback('Kibra:Motels:V2:Server:UpdateRoomRentPrice', function(source, cb, id, pId)
	MySQL.Async.execute('UPDATE `kibra-motels-business` SET roomprice = @rp WHERE id = @id',{["@rp"] = pId, ["@id"] = id})
	Config.Motels[id].RoomRentPrice = pId
	TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotels', -1, Config.Motels)
	cb(true)
end)

CreateCallback('Kibra:Motels:V2:Server:RenameMotel', function(source, cb, id, newname)
	MySQL.Async.execute('UPDATE `kibra-motels-business` SET motel = @motel WHERE id = @id', {["@motel"] = newname, ["@id"] = id})
	Config.Motels[id].MotelName = newname
	TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotels', -1, Config.Motels)
	cb(true)
end)

CreateCallback('Kibra:Motels:V2:Server:WithdrawMoney', function(source, cb, id, money)
	local pData = Framework.xPlayer(source)
	if Config.Motels[id].SocietyMoney >= money then
		MySQL.Async.execute('UPDATE `kibra-motels-business` SET money = @money WHERE id = @id',{["@money"] = Config.Motels[id].SocietyMoney-money, ["@id"] = id})
		pData.GiveAccountMoney("cash", money)
		Config.Motels[id].SocietyMoney = Config.Motels[id].SocietyMoney-money
		TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotels', -1, Config.Motels)
		cb(true)
	else
		cb(false)
	end
end)

RegisterNetEvent('Kibra:Motels:V2:Server:DoorLockTeleport', function(MotelNo, MotelRoomId, State)
    Config.Motels[MotelNo].Rooms[MotelRoomId].DoorLock = State
    TriggerClientEvent('Kibra:Motels:V2:Client:DoorLockTeleport', -1, MotelNo, MotelRoomId, State)
    if State == not locked then
        Config.ServerNotify(source, Config.Lang["YouLockedDoor"],"success")
    else
        Config.ServerNotify(source, Config.Lang["UnlockedDoor"],"success")
    end
end)

RegisterNetEvent('Kibra:Motels:V2:Server:ReddiFatura', function(MotelX)
	local source = source
	local Motel, Room = MotelIdFind(MotelX)
	local GetData = MySQL.Sync.fetchAll('SELECT * FROM `kibra-motels` WHERE roomid = @roomid', {["@roomid"] = MotelX})
	if #GetData > 0 then
		Config.Motels[Motel].Rooms[Room].Owner = ""
		Config.Motels[Motel].Rooms[Room].Password = ""
		Config.Motels[Motel].Rooms[Room].pData = ""
		Config.Motels[Motel].Rooms[Room].Date = ""
		MySQL.Async.execute('UPDATE `kibra-motels` SET owner = @owner, date = @date, pdata = @pdata, password = @password, invoiceseen = @invseen WHERE roomid = @roomid', {
			["@owner"] = "",
			["@password"] = "",
			["@date"] = "",
			["@pdata"] = "",
			["@invseen"] = 0,
			["@roomid"] = MotelX
		})	
		TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotels', -1, Config.Motels)
		Config.ServerNotify(source, Config.Lang["ReddiFatura"],"warning")
	end
end)

RegisterNetEvent('Kibra:Motels:V2:Server:StashLock', function(MotelNo, MotelRoomId, State)
    Config.Motels[MotelNo].Rooms[MotelRoomId].StashLock = State
    TriggerClientEvent('Kibra:Motels:V2:Client:StashLock', -1, MotelNo, MotelRoomId, State)
    if State == not locked then
        Config.ServerNotify(source, Config.Lang["LockedStash"],"success")
    else
        Config.ServerNotify(source, Config.Lang["UnlockedStash"],"success")
    end
end)

RegisterNetEvent('Kibra:Motels:V2:Server:ChangeMotelDoorStatus', function(Room, State, No)
    DoorStates[Room] = {State = State}
	TriggerClientEvent("Kibra:Motels:V2:Client:ChangeDoorStatusEveryone", -1, Room, DoorStates[Room], No)
	if State == 1 then 
		DoorStates[Room] = nil
	end
end)

MotelIdFind = function(keyData)
    local s1 = keyData:find('_')
    local motelNo = keyData:sub(1, (s1 - 1))
    local roomNo = keyData:sub(s1 + 1, keyData:len())
    return tonumber(motelNo), tonumber(roomNo)
end

exports('MotelId', function(keyData)
    local s1 = keyData:find('_')
    local motelNo = keyData:sub(1, (s1 - 1))
    local roomNo = keyData:sub(s1 + 1, keyData:len())
    return tonumber(motelNo), tonumber(roomNo)
end)

CheckMotels = function()
	for k,v in pairs(Config.Motels) do
		local MData = MySQL.Sync.fetchAll("SELECT * FROM `kibra-motels-business` WHERE id = '"..k.."' ")
		if #MData == 0 then MySQL.Async.execute("INSERT INTO `kibra-motels-business` (id, motel, owner, roomprice, money) VALUES (@id,@mtlname,@owner,@roomprice,@mtldefaultmoney)",{
			["@id"] = k,
			["@mtlname"] = Config.Motels[k].MotelName,
			["@owner"] = "", 
			["@roomprice"] = Config.DefaultRoomRental, 
			["@mtldefaultmoney"] = Config.MotelDefaultMoney}) 
		end
		for a,x in pairs(Config.Motels[k].Rooms) do
			local RoomId = k..'_'..a 
			local RData = MySQL.Sync.fetchAll("SELECT * FROM `kibra-motels` WHERE roomid = @r",{["@r"] = RoomId})
			if #RData == 0 then MySQL.Async.execute("INSERT INTO `kibra-motels` (motelid, roomid, owner, password, date) VALUES (@m,@r,@o,@p,@d)",{["@m"] = k, ["@r"] = RoomId, ["@o"] = "", ["@p"] = "", ["@d"] = ""}) end
			Wait(100)
		end
		Wait(100)
	end
	LoadMotelsRooms() 
	UploadMotels() 
end

CreateCallback('GiveMeNewMotelData', function(_, cb, id) cb(Config.Motels[id]) end)

RegisterNetEvent('kibra:Motels:V2:LoadServerData', LoadMotelsRooms)

LoadMotelsRooms = function()
	local Mtl = MySQL.Sync.fetchAll('SELECT * FROM `kibra-motels`')
	if #Mtl >= 1 then
		for k,v in pairs(Mtl) do
			local o,c = MotelIdFind(v.roomid)
			Config.Motels[o].Rooms[c].Owner = v.owner 
			Config.Motels[o].Rooms[c].Password = v.password
			Config.Motels[o].Rooms[c].pData = json.decode(v.pdata)
			Config.Motels[o].Rooms[c].Date = v.date
			if Config.MetadataItem then
				if Config.Inventory == "ox" then
					if GetResourceState("ox_inventory") == "running" then
						exports.ox_inventory:RegisterStash("Motel_"..o..'_'..c, "Motel", Config.StashSlots, Config.StashMaxWeight, "Annen")
					end
				end
			end
		end
	end
	ScriptLoaded = true
end

UploadMotels = function()
	local mData = MySQL.Sync.fetchAll('SELECT * FROM `kibra-motels-business`')
	if #mData >= 1 then
		for k,v in pairs(mData) do
			Config.Motels[v.id].Owner = v.owner 
			Config.Motels[v.id].MotelName = v.motel 
			Config.Motels[v.id].SocietyMoney = v.money
			Config.Motels[v.id].RoomRentPrice = v.roomprice
		end
	end
	ScriptLoaded = true
end

local function ClientDataSend()
	local src = source
	TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotels', src, Config.Motels)
end

CreateCallback('kibra:Motels:V2:GetSourceMotels', function(source, cb, id)
	local src = source 
	local GetPlayer = Framework.xPlayer(src)
	local GetMySQLMotel = MySQL.Sync.fetchAll('SELECT * FROM `kibra-motels` WHERE motelid = ? AND owner = ?', {id, GetPlayer.identifier})
	if #GetMySQLMotel >= 1 then
		cb(GetMySQLMotel)	
	else
		cb(false)
	end	
end)



RegisterNetEvent('kibra:Motels:V2:LoadClientMotels', ClientDataSend)
Citizen.CreateThread(CheckMotels)
function GiveMotelKeys()
    local MYSQL = MySQL.Sync.fetchAll('SELECT * FROM `kibra-motels`')
    for k,v in pairs(MYSQL) do
        if v.owner ~= "" then
            if not KEYSLIST[v.roomid] then KEYSLIST[v.roomid] = {} end
            KEYSLIST[v.roomid][v.owner] = true
            TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotelKeys', -1, KEYSLIST)
        end
    end
end

function EditMotelKeys(id, room, bool)
	if bool == nil then bool = true end
    local Player = Framework.xPlayer(id)
    if not Player then return end 
    if not KEYSLIST[room] then KEYSLIST[id] = {} end
    KEYSLIST[id][Player.identifier] = bool
    TriggerClientEvent('Kibra:Motels:V2:Client:UpdateMotelKeys', -1, KEYSLIST)
end


RegisterNetEvent('Kibra:Acil', GiveMotelKeys)


Citizen.CreateThread(function()
    while Config.AutomaticPaymentInstruction == true do
        TriggerEvent('Kibra:Motels:V2:AutoPayment')
        Citizen.Wait(Config.BillingCheckTime*1000)
    end
end)