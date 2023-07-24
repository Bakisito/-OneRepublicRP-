RegisterNetEvent("0r-core:onPlayerJoined")
AddEventHandler('0r-core:onPlayerJoined', function()
    local source = source

    if not R.Players[source] then 
       info = {}
       identifier = R.GetIdentifier(source)
       query = "SELECT * FROM `users` WHERE identifier = '"..identifier.."' "
       query = ""

       local data = {}
       
       if #data ~= 0 then 
          info = R.xPlayer(source)
          info["firstname"] = info.PlayerData.charinfo.firstname
          info["lastname"] = info.PlayerData.charinfo.lastname
          info["phone"] = info.PlayerData.charinfo.phone
        
          R.Players[source] = info
       end
    end
    TriggerClientEvent('0r-core:onPlayerJoined', source, source)
end)

RegisterNetEvent("0r-core:playerDropped")
AddEventHandler('0r-core:playerDropped', function(source, reason)
    local source = source
    if R.Players[source] then 
       R.Players[source] = nil
    end
end)

RegisterNetEvent("0r-core:setJob")
AddEventHandler('0r-core:setJob', function(job)
    R.Players[source].job = job
end)

AddEventHandler('playerDropped', function(reason)
	local source = source
	TriggerEvent('0r-core:playerDropped', source, reason)
   TriggerClientEvent('0r-core:playerDropped', source, source, reason)
end)

R.PrimaryIdentifier = function(source)
   local identifier = Config.PrimaryIdentifier..':'
   for _, v in pairs(GetPlayerIdentifiers(source)) do
      if string.match(v, identifier) then
         identifier = string.gsub(v, identifier, '')
         return identifier
      end
   end
end

R.GetByIdentifier = function(identifier)
   zPlayer = QBCore.Functions.GetPlayerByCitizenId(identifier)
   if not zPlayer then return end
   zPlayer.identifier = zPlayer.PlayerData.citizenid
   zPlayer.source = zPlayer.PlayerData.source

   zPlayer = R.RemapPlayer(zPlayer)
   return zPlayer
end

R.xPlayer = function(source)
   local source = source

   rPlayer = QBCore.Functions.GetPlayer(source)
   if not rPlayer then return end
   rPlayer.identifier = rPlayer.PlayerData.citizenid
   rPlayer.source = rPlayer.PlayerData.source

   rPlayer = R.RemapPlayer(rPlayer)

   return rPlayer
end

R.UsableItem = function(item, cb)

   return QBCore.Functions.CreateUseableItem(item, cb)

end

R.GetItemBySlot = function(source, slot)

   local Player = QBCore.Functions.GetPlayer(source)
   slot = tonumber(slot)
   return Player.PlayerData.items[slot]

end

R.GetIdentifier = function(source)
   if Config.Framework == "QBCore" then 
      return QBCore.Functions.GetPlayer(source).PlayerData.citizenid
   else 
      return R.PrimaryIdentifier(source)
   end
end

R.GetPlayers = function()
	local sources = {}
	for k,v in pairs(R.Players) do
		sources[#sources + 1] = k
	end
	return sources
end

R.RemapPlayer = function(xPlayer)
   local self = {}
   
   self.GetAccountData = function(account)
      return xPlayer.PlayerData.money[account]
   end

   self.GetProfile = function(xx)
       if xx == "name" then return xPlayer.PlayerData.charinfo.firstname..' '..xPlayer.PlayerData.charinfo.lastname else return xPlayer.PlayerData.charinfo.phone end
   end

   self.AddItem = function(item, amount, slot, metadata)
      return xPlayer.Functions.AddItem(item, amount, slot, metadata)
   end

   self.GiveAccountMoney = function(account, money)
      xPlayer.Functions.AddMoney(account, money)
   end

   self.RemoveMoney = function(account, money)
      return xPlayer.Functions.RemoveMoney(account, money)
   end

   self.JobData = function()
      return xPlayer.PlayerData.job
   end

   self.GiveJob = function(name, grade)
      xPlayer.Functions.SetJob(name, grade)
   end

   self.GetItem = function(item)
      x = xPlayer.Functions.GetItemByName(item)
      x.count = x.amount
      return x
   end

   return R.MergeTable(self, xPlayer)
end

R.MergeTable = function(t1, t2)
   if not t2 then return end
   for k, v in pairs(t2) do
         if (type(v) == "table") and (type(t1[k] or false) == "table") then
            R.MergeTable(t1[k], t2[k])
         else
            t1[k] = v
         end
   end
   return t1
end

R.RegisterServerCallback = function(name, cb)
	R.ServerCallbacks[name] = cb
end

R.TriggerServerCallback = function(name, requestId, source, cb, ...)
	if R.ServerCallbacks[name] then
		R.ServerCallbacks[name](source, cb, ...)
	else
		print(('[^3WARNING^7] Server callback ^5"%s"^0 does not exist. ^1Please Check The Server File for Errors!'):format(name))
	end
end

RegisterServerEvent('0r-core:triggerServerCallback')
AddEventHandler('0r-core:triggerServerCallback', function(name, requestId, ...)
	local playerId = source

	R.TriggerServerCallback(name, requestId, playerId, function(...)
		TriggerClientEvent('0r-core:serverCallback', playerId, requestId, ...)
	end, ...)
end)


R.DumpTable = function(table, nb)
	if nb == nil then
		nb = 0
	end
	if type(table) == 'table' then
		local s = ''
		for i = 1, nb + 1, 1 do
			s = s .. "    "
		end
		s = s .. '{\n'
		for k,v in pairs(table) do
			if type(k) ~= 'number' then k = '"'..k..'"' end
			for i = 1, nb, 1 do
				s = s .. "    "
			end
			s = s .. '['..k..'] = ' .. R.DumpTable(v, nb + 1) .. ',\n'
		end
		for i = 1, nb, 1 do
			s = s .. "    "
		end
		return s .. '}'
	else
		return s..tostring(table)
	end
end