

local player, coords, plyVehicle = nil, {}, 0
Citizen.CreateThread(function()
    while true do
        player = PlayerPedId()
        coords = GetEntityCoords(player)
		plyVehicle = GetVehiclePedIsIn(player, -1)
        Citizen.Wait(500)
    end
end)

local mechanicShops = {}
local mechanicBlips = {}
local isOwner = false
local mechanicID = 0

-- Load Shops:
RegisterNetEvent('t1ger_mechanicjob:loadShops')
AddEventHandler('t1ger_mechanicjob:loadShops', function(results, cfg, state, id)
	Config.MechanicShops = cfg
	mechanicShops = results
	isOwner = state
	TriggerEvent('t1ger_mechanicjob:setMechanicID', id)
	Citizen.Wait(200)
	UpdateMechanicBlips()
end)

-- Update Shops:
RegisterNetEvent('t1ger_mechanicjob:syncMechanicShops')
AddEventHandler('t1ger_mechanicjob:syncMechanicShops', function(results, cfg)
	Config.MechanicShops = cfg
	mechanicShops = results
	Citizen.Wait(200)
	UpdateMechanicBlips()
end)

-- Update Mechanic Shop ID:
RegisterNetEvent('t1ger_mechanicjob:setMechanicID')
AddEventHandler('t1ger_mechanicjob:setMechanicID', function(id)
	mechanicID = id
end)

-- function to update blips on map:
function UpdateMechanicBlips()
	for k,v in pairs(mechanicBlips) do RemoveBlip(v) end
	for i = 1, #Config.MechanicShops do
		if Config.MechanicShops[i].owned then
            CreateMechanicBlip(Config.MechanicShops[i], mechanicShops[i])
		else
			CreateMechanicBlip(Config.MechanicShops[i], nil)
		end
	end
end

-- Create Map Blips for Tow Services:
function CreateMechanicBlip(cfg, data)
	local mk = Config.BlipSettings['shop']
	local bName = mk.name; if data ~= nil then bName = data.name end
	if mk.enable then
		local blip = AddBlipForCoord(cfg.menu.x, cfg.menu.y, cfg.menu.z)
		SetBlipSprite (blip, mk.sprite)
		SetBlipDisplay(blip, mk.display)
		SetBlipScale  (blip, mk.scale)
		SetBlipColour (blip, mk.color)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(bName)
		EndTextCommandSetBlipName(blip)
		table.insert(mechanicBlips, blip)
	end	
end

local currentMenu, storageMenu, workbenchMenu = nil
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
		local sleep = true
		for k,v in pairs(Config.MechanicShops) do
			-- boss menu:
			local distance = #(coords - v.menu)
			if distance <= 6.0 then
				sleep = false
				if currentMenu ~= nil then
					distance = #(coords - currentMenu.menu)
					while currentMenu ~= nil and distance > 1.5 do
						currentMenu = nil
						Citizen.Wait(1)
					end
					if currentMenu == nil then
						exports['qb-menu']:closeMenu()
					end
				else
					local mk = Config.MarkerSettings['manage_menu']
					if distance >= 2.0 then
						if mk.enable then
							DrawMarker(mk.type, v.menu.x, v.menu.y, v.menu.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, mk.scale.x, mk.scale.y, mk.scale.z, mk.color.r, mk.color.g, mk.color.b, mk.color.a, false, true, 2)
						end
					elseif distance < 2.0 then
						-- test:
						if v.owned == true then
							if (T1GER_isJob(Config.Society[v.society].name)) or (isOwner == true) then
								T1GER_DrawTxt(v.menu.x, v.menu.y, v.menu.z, Lang['draw_mechanic_menu'])
								if IsControlJustPressed(0, Config.KeyControls['manage_menu']) then
									currentMenu = v
									MechanicShopManageMenu(k,v)
								end
							else
								T1GER_DrawTxt(v.menu.x, v.menu.y, v.menu.z, Lang['draw_shop_owned'])
							end
						else
							if (T1GER_isJob(Config.Society[v.society].name) and PlayerData.job.isboss ~= true) or (isOwner == false) then
								T1GER_DrawTxt(v.menu.x, v.menu.y, v.menu.z, Lang['draw_buy_mech_shop']:format(comma_value(math.floor(v.price))))
								if IsControlJustPressed(0, Config.KeyControls['buy_shop']) then
									currentMenu = v
									PurchaseMechanicShop(k,v)
								end
							else
								T1GER_DrawTxt(v.menu.x, v.menu.y, v.menu.z, Lang['draw_shop_own_one'])
							end
						end
					end
				end
			end
			-- storage menu:
			local storageDist = #(coords - v.storage)
			if storageDist < 6.0 then
				sleep = false
				if storageMenu ~= nil then
					storageDist = #(coords - storageMenu.storage)
					while storageMenu ~= nil and storageDist > 1.5 do
						storageMenu = nil
						Citizen.Wait(1)
					end
					if storageMenu == nil then
						exports['qb-menu']:closeMenu()
					end
				else
					local mk = Config.MarkerSettings['storage_menu']
					if storageDist <= 6.0 and storageDist >= 2.0 then
						if mk.enable then
							DrawMarker(mk.type, v.storage.x, v.storage.y, v.storage.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, mk.scale.x, mk.scale.y, mk.scale.z, mk.color.r, mk.color.g, mk.color.b, mk.color.a, false, true, 2, false, false, false, false)
						end
					elseif storageDist <= 2.0 then
						T1GER_DrawTxt(v.storage.x, v.storage.y, v.storage.z, Lang['draw_open_storage'])
						if IsControlJustPressed(0, Config.KeyControls['storage_menu']) then
							if Config.MechanicShops[mechanicID] ~= nil then
								if T1GER_isJob(Config.Society[Config.MechanicShops[mechanicID].society].name) then
									storageMenu = v
									TriggerEvent("inventory:client:SetCurrentStash", v.society)
									TriggerServerEvent("inventory:server:OpenInventory", "stash", v.society, {
										maxweight = 4000000,
										slots = 500,
									})
									Citizen.Wait(100)
								end
							end
						end
					end
				end
			end
			-- workbench menu:
			local workbenchDist = #(coords - v.workbench)
			if workbenchDist < 6.0 then
				sleep = false
				if workbenchMenu ~= nil then
					workbenchDist = #(coords - workbenchMenu.workbench)
					while workbenchMenu ~= nil and workbenchDist > 1.5 do
						workbenchMenu = nil
						Citizen.Wait(1)
					end
					if workbenchMenu == nil then
						exports['qb-menu']:closeMenu()
					end
				else
					local mk = Config.MarkerSettings['workbench_menu']
					if workbenchDist <= 6.0 and workbenchDist >= 2.0 then
						if mk.enable then
							DrawMarker(mk.type, v.workbench.x, v.workbench.y, v.workbench.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, mk.scale.x, mk.scale.y, mk.scale.z, mk.color.r, mk.color.g, mk.color.b, mk.color.a, false, true, 2, false, false, false, false)
						end
					elseif workbenchDist <= 2.0 then
						T1GER_DrawTxt(v.workbench.x, v.workbench.y, v.workbench.z, Lang['draw_open_workbench'])
						if IsControlJustPressed(0, Config.KeyControls['workbench_menu']) then
							if Config.MechanicShops[mechanicID] ~= nil then
								if T1GER_isJob(Config.Society[Config.MechanicShops[mechanicID].society].name) then
									workbenchMenu = v
									MechanicWorkbenchMenu(k,v)
								end
							end
						end
					end
				end
			end
		end
		if sleep then
			Citizen.Wait(1500)
		end
    end
end)

function PurchaseMechanicShop(id, val)
	exports['qb-menu']:openMenu({
		{
			isMenuHeader = true,
			header = 'Purchase Shop?',
			txt = 'Price: $'..comma_value(math.floor(val.price)),
		},
		{
			header = 'Confirm',
			params = {
				event = 't1ger_mechanicshop:buyApprove',
				args = {
					shopId = id,
					shopVal = val
				}
			}
		},
		{
			header = 'Decline',
			params = {
				event = ''
			}
		}
	})
end

RegisterNetEvent('t1ger_mechanicshop:buyApprove', function(args)
	local dialog = exports['qb-input']:ShowInput({
		header = 'Enter Mechanic Shop Name',
		submitText = "Submit",
		inputs = {
			{
				type = 'text',
				isRequired = true,
				name = 'shopName',
				text = ''
			}
		}
	})
	if dialog then
		local name = tostring(dialog.shopName)
		if name == nil or name == '' then return TriggerEvent('t1ger_mechanicjob:notify', Lang['invalid_string']) end
		QBCore.Functions.TriggerCallback('t1ger_mechanicjob:buyMechanicShop', function(purchased)
			if purchased then
				isOwner = true
				TriggerEvent('t1ger_mechanicjob:notify', (Lang['mech_shop_purchased']):format(comma_value(math.floor(args.shopVal.price))))
				TriggerServerEvent('t1ger_mechanicjob:updateMechanicShops', args.shopId, args.shopVal, true, name)
			else
				TriggerEvent('t1ger_mechanicjob:notify', Lang['not_enough_money'])
			end
		end, args.shopId, args.shopVal, name)
	end
end)

function MechanicShopManageMenu(id, val)
	if (T1GER_isJob(Config.Society[val.society].name) and PlayerData.job.isboss == true) or isOwner == true then
		exports['qb-menu']:openMenu({
			{
				isMenuHeader = true,
				header = 'Shop Management',
				txt = 'Mechanic Shop ['..tostring(id)..']',
			},
			{
				header = 'Rename Mechanic Shop',
				params = {
					event = 't1ger_mechanicshop:renameShop',
					args = {
						shopId = id,
						shopVal = val
					}
				}
			},
			{
				header = 'Sell Mechanic Shop',
				params = {
					event = 't1ger_mechanicshop:sellShop',
					args = {
						shopId = id,
						shopVal = val
					}
				}
			},
			{
				header = 'Boss Menu',
				params = {
					event = 'qb-bossmenu:client:OpenMenu' --Cambio
				}
			},
		})
	else
		TriggerEvent('t1ger_mechanicjob:notify', 'You do not have access to boss menu')
	end
end

RegisterNetEvent('t1ger_mechanicshop:renameShop', function(args)
	local dialog = exports['qb-input']:ShowInput({
		header = 'Enter Mechanic Shop Name',
		submitText = "Submit",
		inputs = {
			{
				type = 'text',
				isRequired = true,
				name = 'shopName',
				text = ''
			}
		}
	})
	if dialog then
		local name = tostring(dialog.shopName)
		if name == nil or name == '' then return TriggerEvent('t1ger_mechanicjob:notify', Lang['invalid_string']) end
		TriggerServerEvent('t1ger_mechanicjob:updateMechanicShops', args.shopId, args.shopVal, nil, name)
		TriggerEvent('t1ger_mechanicjob:notify', Lang['mech_shop_renamed'])
		MechanicShopManageMenu(args.shopId, args.shopVal)
	end
end)

RegisterNetEvent('t1ger_mechanicshop:sellShop', function(args)
	local sellPrice = (args.shopVal.price * Config.SalePercentage)
	exports['qb-menu']:openMenu({
		{
			isMenuHeader = true,
			header = 'Sell Shop?',
			txt = 'Price: $'..comma_value(math.floor(sellPrice)),
		},
		{
			header = 'Confirm',
			params = {
				event = 't1ger_mechanicshop:sellApprove',
				args = {
					shopId = args.shopId,
					shopVal = args.shopVal
				}
			}
		},
		{
			header = 'Decline',
			params = {
				event = ''
			}
		}
	})
end)

RegisterNetEvent('t1ger_mechanicshop:sellApprove', function(args)
	local sellPrice = (args.shopVal.price * Config.SalePercentage)
	TriggerServerEvent('t1ger_mechanicjob:sellMechanicShop', args.shopId, args.shopVal, math.floor(sellPrice))
	TriggerServerEvent('t1ger_mechanicjob:updateMechanicShops', args.shopId, args.shopVal, false, nil)
	isOwner = false
	TriggerEvent('t1ger_mechanicjob:notify', (Lang['mech_shop_sold']):format(comma_value(math.floor(sellPrice))))
end)

local craftingItem = false
function MechanicWorkbenchMenu(id,val)
	if craftingItem == true then
		return TriggerEvent('t1ger_mechanicjob:notify', Lang['crafting_in_progress'])
	end
	local elements = {{isMenuHeader = true, header = 'Select Craftable'}}
	for k,v in ipairs(Config.Workbench) do
		elements[#elements+1] = {
			header = v.label,
			params = {
				event = 't1ger_mechanicjob:selectCraftItem',
				args = {
					label = v.label,
					item = v.item,
					recipe = v.recipe,
					id = id,
					val = val
				}
			}
		}
	end
	exports['qb-menu']:openMenu(elements)
end

RegisterNetEvent('t1ger_mechanicjob:selectCraftItem', function(data)
	exports['qb-menu']:openMenu({
		{
			header = 'Craft Item',
			params = {
				event = 't1ger_mechanicjob:client:craftItem',
				args = {
					label = data.label,
					item = data.item,
					recipe = data.recipe,
					id = data.id,
					val = data.val
				}
			}
		},
		{
			header = 'View Recipe',
			params = {
				event = 't1ger_mechanicjob:viewCraftingRecipe',
				args = {
					label = data.label,
					item = data.item,
					recipe = data.recipe,
					id = data.id,
					val = data.val
				}
			}
		}
	})
end)

RegisterNetEvent('t1ger_mechanicjob:client:craftItem', function(data)
	if craftingItem == true then
		return TriggerEvent('t1ger_mechanicjob:notify', Lang['crafting_in_progress'])
	end
	craftingItem = true
	if Config.ProgressBars then
		QBCore.Functions.Progressbar('craft_item', Lang['progb_crafting_item']:format(string.upper(data.label)), Config.CraftTime * 1000, false, false, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() end)
	end
	if not IsEntityPlayingAnim(player, 'mini@repair', 'fixing_a_player', 3) then
        T1GER_LoadAnim('mini@repair')
        TaskPlayAnim(player, 'mini@repair', 'fixing_a_player', 8.0, -8, -1, 49, 0, 0, 0, 0)
    end
	Citizen.Wait(Config.CraftTime * 1000)
	TriggerServerEvent('t1ger_mechanicjob:craftItem', data.label, data.item, data.recipe, data.id, data.val)
	craftingItem = false
	ClearPedSecondaryTask(player)
	workbenchMenu = nil
end)

RegisterNetEvent('t1ger_mechanicjob:viewCraftingRecipe', function(data)
	local elements = {{isMenuHeader = true, header = 'Recipe for: '..data.label}}
	for k,v in ipairs(data.recipe) do
		local material = Config.Materials[v.id]
		elements[#elements+1] = {isMenuHeader = true, header = material.label.." ["..v.qty.." pcs]", name = material.label, item = material.item, amount = v.qty}
	end
	elements[#elements+1] = {
		header = 'Return',
		params = {
			event = 't1ger_mechanicjob:craftingReturn',
			args = {
				id = id,
				val = val
			}
		}
	}
	exports['qb-menu']:openMenu(elements)
end)

RegisterNetEvent('t1ger_mechanicjob:craftingReturn', function(data)
	MechanicWorkbenchMenu(data.id, data.val)
end)

local quick_repairing = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local sleep = true
		for num,shop in pairs(Config.MechanicShops) do
			if shop.repair ~= nil then
				local distance = #(coords - vector3(shop.repair.x, shop.repair.y, shop.repair.z))
				local mk = Config.MarkerSettings['repair_marker']
				if distance < 7.5 and IsPedInAnyVehicle(player) and not quick_repairing then
					sleep = false
					if distance > 2.0 then
						DrawMarker(mk.type, shop.repair.x, shop.repair.y, shop.repair.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, mk.scale.x, mk.scale.y, mk.scale.z, mk.color.r, mk.color.g, mk.color.b, mk.color.a, false, true, 2, false, false, false, false)
					elseif distance <= 2.0 then
						T1GER_DrawTxt(shop.repair.x, shop.repair.y, shop.repair.z, Lang['draw_quick_repair'])
						if IsControlJustPressed(0, Config.KeyControls['quick_repair']) then
							QuickRepairVehicle()
						end
					end
				end
			end
		end
		if sleep then Citizen.Wait(1000) end
	end
end)

function QuickRepairVehicle()
	local vehicle = GetVehiclePedIsIn(player, false)
	if vehicle ~= nil or vehicle ~= 0 then
		local engine_health = GetVehicleEngineHealth(vehicle)
		local body_health = GetVehicleBodyHealth(vehicle)
		if engine_health < 1000.0 or body_health < 1000.0 then
			quick_repairing = true
			SetVehicleUndriveable(vehicle, true)
			SetVehicleEngineOn(vehicle, false, true, true)
			FreezeEntityPosition(vehicle, true)
			if Config.ProgressBars then
				QBCore.Functions.Progressbar('quick_repair', Lang['progb_reparing_veh'], 5000, false, false, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {}, {}, {}, function() end)
			end
			Citizen.Wait(5000)
			SetVehicleEngineHealth(vehicle, 1000.0)
			SetVehicleBodyHealth(vehicle, 1000.0)
			SetVehicleFixed(vehicle)
			SetVehicleUndriveable(vehicle, false)
			FreezeEntityPosition(vehicle, false)
			SetVehicleEngineOn(vehicle, true, true, true)
			quick_repairing = false
		else
			TriggerEvent('t1ger_mechanicjob:notify', Lang['veh_engine_functional'])
		end
	end
end

-- Mechanic Action Menu:

RegisterNetEvent('t1ger_mechanicjob:openMechMenu', function()
	if Config.MechanicShops[mechanicID] ~= nil then
		if T1GER_isJob(Config.Society[Config.MechanicShops[mechanicID].society].name) then



			
			OpenMechanicActionMenu() -- 



		end
	end
end)

RegisterCommand('mechmenu', function()



	if Config.MechanicShops[mechanicID] ~= nil then
		if T1GER_isJob(Config.Society[Config.MechanicShops[mechanicID].society].name) then
			OpenMechanicActionMenu()
		end
	end



end)

RegisterKeyMapping('mechmenu', 'Open Mechanic Menu', 'keyboard', Config.KeyControls['interaction_menu'])

local holdingObj, carryModel = false, 0

function OpenMechanicActionMenu()


	exports['qb-menu']:openMenu({
		{
			isMenuHeader = true,
			header = 'Mechanic Action Menu'
		},
		{
			header = 'Reparar Carroceria',
			params = {
				event = 't1ger_mechanicshop:mechanicActions',
				args = {
					value = 'veh_body_repair'
				}
			}
		},
		{
			header = 'Reparar Motor',
			params = {
				event = 't1ger_mechanicshop:mechanicActions',
				args = {
					value = 'veh_engine_repair'
				}
			}
		},
		{
			header = 'Prop Emotes',
			params = {
				event = 't1ger_mechanicshop:mechanicActions',
				args = {
					value = 'prop_emotes'
				}
			}
		},
		-- {
		-- 	header = 'NPC Jobs',
		-- 	params = {
		-- 		event = 't1ger_mechanicshop:mechanicActions',
		-- 		args = {
		-- 			value = 'npc_jobs'
		-- 		}
		-- 	}
		-- },
	})



	
end

RegisterNetEvent('t1ger_mechanicshop:mechanicActions', function(data)
	local action = data.value
	
	if action == 'use_car_jack' then
		if IsPlayerInsideVehicle() then
			TriggerEvent('t1ger_mechanicjob:notify', Lang['action_not_possible'])
		else
			UseCarJack('carjack')
		end
		

	elseif action == 'veh_body_repair' then
		if IsPlayerInsideVehicle() then
			TriggerEvent('t1ger_mechanicjob:notify', Lang['action_not_possible'])
		else
			UseCarJack('analyze')
		end

	elseif action == 'veh_engine_repair' then
		if IsPlayerInsideVehicle() then
			TriggerEvent('t1ger_mechanicjob:notify', Lang['action_not_possible'])
		else
			exports['qb-menu']:closeMenu()
			RepairVehicleEngine()
		end

	elseif action == 'prop_emotes' then
		if IsPlayerInsideVehicle() then
			TriggerEvent('t1ger_mechanicjob:notify', Lang['action_not_possible'])
		else
			exports['qb-menu']:closeMenu()
			if not holdingObj then
				CarryObjectsMainMenu()
			else
				TriggerEvent('t1ger_mechanicjob:notify', Lang['already_holding_obj'])
			end
		end
	elseif action == 'npc_jobs' then
		MechanicJobsNPC()
	end
end)

function CarryObjectsMainMenu()
	local elements = {}
	for k,v in pairs(Config.PropEmotes) do
		elements[#elements+1] = {
			header = v.label,
			params = {
				event = 't1ger_mechanicjob:spawnProp',
				args = {
					prop = v.model,
					bone = v.bone,
					pos = v.pos,
					rot = v.rot
				}
			}
		}
	end
	elements[#elements+1] = {header = 'Remove Obj', params = {event = 't1ger_mechanicjob:deleteProp'}}
	elements[#elements+1] = {header = 'Return', params = {event = 't1ger_mechanicjob:openMechMenu'}}
	exports['qb-menu']:openMenu(elements)
end

RegisterNetEvent('t1ger_mechanicjob:spawnProp', function(data)
	if not IsPedInAnyVehicle(PlayerPedId(), true) then
		local coords = GetEntityCoords(PlayerPedId())
		local selct = data
		carryModel = 0
		holdingObj = true
		if selct.prop == "prop_cs_trolley_01" or selct.prop == "prop_engine_hoist" then PlayPushObjAnim() end
		T1GER_SpawnObject(selct.prop, {x = coords.x, y = coords.y, z = coords.z}, function(spawnModel)
			carryModel = spawnModel
			local boneIndex = GetPedBoneIndex(PlayerPedId(), selct.bone)
			local pX, pY, pZ, rX, rY, rZ = round(selct.pos[1],2), round(selct.pos[2],2), round(selct.pos[3],2), round(selct.rot[1],2), round(selct.rot[2],2), round(selct.rot[3],2)
			AttachEntityToEntity(carryModel, PlayerPedId(), boneIndex, pX, pY, pZ, rX, rY, rZ, true, true, false, true, 2, 1)
		end)
	else
		TriggerEvent('t1ger_mechanicjob:notify', Lang['action_not_possible'])
	end
end)

RegisterNetEvent('t1ger_mechanicjob:deleteProp', function()
	if not IsPedInAnyVehicle(PlayerPedId(), true) then
		local coords = GetEntityCoords(PlayerPedId())
		ClearPedTasks(PlayerPedId())
		ClearPedSecondaryTask(PlayerPedId())
		Citizen.Wait(250)
		DetachEntity(carryModel)
		local allObjects = {"prop_roadcone02a", "prop_tool_box_04", "prop_cs_trolley_01", "prop_engine_hoist", "prop_carjack"}
		for i = 1, #allObjects, 1 do
			local object = GetClosestObjectOfType(coords, 1.0, GetHashKey(allObjects[i]), false, false, false)
			if object ~= 0 then
				SetEntityAsMissionEntity(object)
				TriggerServerEvent('t1ger_mechanicjob:forceDelete', ObjToNet(object))
				break
			end
		end
		holdingObj = false
	else
		TriggerEvent('t1ger_mechanicjob:notify', Lang['action_not_possible'])
	end
end)

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(4)
		if IsControlJustPressed(0, Config.KeyControls['push_pickup_objs']) and carryModel ~= 0 then
			if not IsPedInAnyVehicle(player, true) then
				if Config.MechanicShops[mechanicID] ~= nil then
					if T1GER_isJob(Config.Society[Config.MechanicShops[mechanicID].society].name) then
						local placedObjs = {"prop_roadcone02a", "prop_tool_box_04", "prop_cs_trolley_01", "prop_engine_hoist"}
						local coords, nearDist = GetEntityCoords(PlayerPedId()), -1
						carryModel = nil
						local objName, zk = nil, Config.PropEmotes
						for i = 1, #placedObjs, 1 do
							local object = GetClosestObjectOfType(coords, 1.5, GetHashKey(placedObjs[i]), false, false, false)
							if DoesEntityExist(object) then
								local objCoords = GetEntityCoords(object)
								local objDist  = GetDistanceBetweenCoords(coords, objCoords, true)
								if nearDist == -1 or nearDist > objDist then nearDist = objDist; carryModel = object; objName = placedObjs[i] end
							end
						end
						if holdingObj then
							holdingObj = false
							if (objName == 'prop_roadcone02a') or (objName == 'prop_tool_box_04') then PlayPickUpAnim() end
							Citizen.Wait(250)
							DetachEntity(carryModel)
							ClearPedTasks(PlayerPedId())
							ClearPedSecondaryTask(PlayerPedId())
						else
							local Dist = GetDistanceBetweenCoords(GetEntityCoords(carryModel), GetEntityCoords(PlayerPedId()), true)
							if Dist < 1.75 then
								holdingObj = true
								if (objName == 'prop_roadcone02a') or (objName == 'prop_tool_box_04') then PlayPickUpAnim() end
								Citizen.Wait(250)
								ClearPedTasks(PlayerPedId())
								ClearPedSecondaryTask(PlayerPedId())
								if (objName == 'prop_cs_trolley_01') or (objName == 'prop_engine_hoist') then
									PlayPushObjAnim()
								end
								Citizen.Wait(250)
								AttachEntityToEntity(carryModel, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), zk[objName].bone), zk[objName].pos[1], zk[objName].pos[2], zk[objName].pos[3], zk[objName].rot[1], zk[objName].rot[2], zk[objName].rot[3], true, true, false, true, 2, 1)

							end
						end
					end
				end
			end
		end
		if holdingObj then
			DisableControlAction(0, 23, true)
		end
	end
end)

function PlayPushObjAnim()
	T1GER_LoadAnim("anim@heists@box_carry@")
	TaskPlayAnim((PlayerPedId()), "anim@heists@box_carry@", "idle", 4.0, 1.0, -1, 49, 0, 0, 0, 0)
end

function PlayPickUpAnim()
	T1GER_LoadAnim("random@domestic")
	TaskPlayAnim(PlayerPedId(), "random@domestic", "pickup_low", 5.0, 1.0, 1.0, 48, 0.0, 0, 0, 0)
end

RegisterNetEvent('t1ger_mechanicjob:forceDeleteCL')
AddEventHandler('t1ger_mechanicjob:forceDeleteCL', function(objNet)
	if NetworkHasControlOfNetworkId(objNet) then
		DeleteObject(NetToObj(objNet))
	end
end)


local carJack = {inUse = false, raised = false, obj = nil}
local analysis = {done = false, wheels = {}, report = {}, entity = nil, plate = nil}

function UseCarJack(type)
	local vehicle = T1GER_GetClosestVehicle(coords, 2.5)
	if vehicle ~= 0 then
		-- is using car jack?
		if carJack.inUse == true then
			return
		end
		exports['qb-menu']:closeMenu()
		carJack.inUse = true
		-- Get Proper Control of Vehicle:
		T1GER_GetControlOfEntity(vehicle)
		SetEntityAsMissionEntity(vehicle, true, true)
		-- Get Jack Position:
		local d1,d2 = GetModelDimensions(GetEntityModel(vehicle))
		local jackCoords = GetOffsetFromEntityInWorldCoords(vehicle, d2.x+0.2,0.0,0.0)
		local vehCoords = GetEntityCoords(vehicle)
		-- Thread:
		while true do
			Citizen.Wait(1)
			local sleep = true
			local distance = #(vector3(coords.x, coords.y, coords.z) - vector3(jackCoords.x, jackCoords.y, jackCoords.z))
			if distance < 6.0 then
				sleep = false

			local findObj = GetClosestObjectOfType(vehCoords.x, vehCoords.y, vehCoords.z, 2.0, Config.CarHash , false, false, false)
			local findObj2 =GetClosestObjectOfType(vehCoords.x, vehCoords.y, vehCoords.z, 2.0, Config.CarHash2 , false, false, false)

				local label = Lang['draw_raise_jack']  
				if DoesEntityExist(findObj) or DoesEntityExist(findObj2) then
					carJack.raised = true
					
					label = Lang['draw_lower_jack']
					if type == 'analyze' then
						label = Lang['draw_analyze_veh_body']
					end
				else
					carJack.raised = false
					if type == 'analyze' then
						TriggerEvent('t1ger_mechanicjob:notify', Lang['analyze_not_possible'])
						break
					end
				end
			
				T1GER_DrawTxt(jackCoords.x, jackCoords.y, jackCoords.z, Lang['draw_car_jack']:format(label))
				if IsControlJustPressed(0, Config.KeyControls['car_jack']) and distance <= 1.0 then
					if type == 'carjack' then
						CarJackHandle(vehicle)
					elseif type == 'analyze' then
						print("AnalizaRuedas")
						local plate = tostring(GetVehicleNumberPlateText(vehicle))
						analysis[plate] = {done = false, wheels = {}, report = {}, entity = vehicle, plate = plate}
						for i = 0, GetVehicleNumberOfWheels(vehicle) - 1 do
							analysis[plate].wheels[i + 1] = {
								xOffset = GetVehicleWheelXOffset(vehicle, i),
								yRotation = GetVehicleWheelYRotation(vehicle, i)
							}
						end
						
						FetchVehicleBodyDamageReport(vehicle, plate)
					end
					break
				end
			end
			if distance > 6.0 then
				TriggerEvent('t1ger_mechanicjob:notify', Lang['too_far_from_carjack'])
				carJack.inUse = false
				break
			end
			if sleep then
				Citizen.Wait(1000)
			end
		end
	else
		TriggerEvent('t1ger_mechanicjob:notify', Lang['no_vehicle_nearby'])
	end
	carJack.inUse = false
end

function CarJackHandle(veh) --Poner Gato en carro
	local itemChecked = false

	QBCore.Functions.TriggerCallback('t1ger_mechanicjob:getInventoryItem', function(hasItem)
		if hasItem then
			itemChecked = true
		else
			carJack.inUse = false
			return TriggerEvent('t1ger_mechanicjob:notify', Lang['car_jack_carry'])
		end
	end, 'carjack')

	while not itemChecked do
		Citizen.Wait(10)
	end

	TaskTurnPedToFaceEntity(player, veh, 1.0)
	Citizen.Wait(1000)
	FreezeEntityPosition(veh, true)
	local vehCoords = GetEntityCoords(veh)

	if carJack.raised == false then
		-- Spawn Car Jack Prop:
		T1GER_LoadModel(Config.CarJackProp)
		carJack.obj = CreateObject(Config.CarHash, vehCoords.x, vehCoords.y, vehCoords.z-0.95, true, true, true)
		SetEntityHeading(carJack.obj, GetEntityHeading(veh))
		FreezeEntityPosition(carJack.obj, true)
		Citizen.Wait(250)
	else
		-- Get Closest Car Jack Prop:
		if DoesEntityExist(carJack.obj) then
			--T1GER_GetControlOfEntity(carJack.obj)
			SetEntityAsMissionEntity(carJack.obj, true, true)
		else
			carJack.obj = GetClosestObjectOfType(vehCoords.x, vehCoords.y, vehCoords.z, 1.0,Config.CarHash, false, false, false)
			--T1GER_GetControlOfEntity(carJack.obj)
			SetEntityAsMissionEntity(carJack.obj, true, true)
		end
	end
	
	local objCoords = GetEntityCoords(carJack.obj)
	-- Animation:
	local anim = {dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', lib = 'weed_crouch_checkingleaves_idle_02_inspector'}
	T1GER_LoadAnim(anim.dict)
	TaskPlayAnim(player, anim.dict, anim.lib, 2.0, -3.5, -1, 1, false, false, false, false)
	if Config.ProgressBars then
		if carJack.raised == true then
			QBCore.Functions.Progressbar('lower_jack', Lang['progb_lowering_jack'], 5000, false, false, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() end)
		else
			QBCore.Functions.Progressbar('raise_jack', Lang['progb_raising_jack'], 5000, false, false, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() end)
		end
	end
	--T1GER_GetControlOfEntity(veh)
	--SetEntityAsMissionEntity(veh, true, true)
	Citizen.Wait(1000)
	ClearPedTasks(player)
	-- Animation Loop:
	for i = 1, 5, 1 do
		local isVisible = IsEntityVisible(veh)
			Citizen.Trace("Entity IS Visible")
		if NetworkHasControlOfEntity(veh) then
			Citizen.Trace("Entity IS in my control")
		else
			Citizen.Trace("Entity IS NOT in my control")
		end
		vehCoords = GetEntityCoords(veh)
		objCoords = GetEntityCoords(carJack.obj)
		if i < 5 then
			TaskPlayAnim(player, anim.dict, anim.lib, 3.5, -3.5, -1, 1, false, false, false, false)
			Citizen.Wait(1000)
			ClearPedTasks(player)
			if carJack.raised == false then
				SetEntityCoordsNoOffset(veh, vehCoords.x, vehCoords.y, (vehCoords.z+0.10), true, false, false, true)
				SetEntityCoordsNoOffset(carJack.obj, objCoords.x, objCoords.y, (objCoords.z+0.10), true, false, false, true)
			else
				SetEntityCoordsNoOffset(veh, vehCoords.x, vehCoords.y, (vehCoords.z-0.10), true, false, false, true)
				SetEntityCoordsNoOffset(carJack.obj, objCoords.x, objCoords.y, (objCoords.z-0.10), true, false, false, true)
			end
			FreezeEntityPosition(veh, true)
			FreezeEntityPosition(carJack.obj, true)
		else
			ClearPedTasks(player)
			if carJack.raised == true then
				FreezeEntityPosition(veh, false)
				-- Get Closest Car Jack Prop:
				if DoesEntityExist(carJack.obj) == false then
					carJack.obj = GetClosestObjectOfType(vehCoords.x, vehCoords.y, vehCoords.z, 1.0, Config.CarHash, false, false, false)
				end
				--T1GER_GetControlOfEntity(carJack.obj)
				--SetEntityAsMissionEntity(carJack.obj)
				DeleteEntity(carJack.obj)
				DeleteObject(carJack.obj)
				carJack.obj = nil
				carJack.raised = false
			else
				carJack.raised = true
			end
			carJack.inUse = false
		end
	end
	ClearPedTasks(player)
end

function FetchVehicleBodyDamageReport(vehicle, plate)
	-- Interact To Veh Part:
	
	local d1,d2 = GetModelDimensions(GetEntityModel(vehicle))
	local spots = {
		
		[1] = {pos = GetOffsetFromEntityInWorldCoords(vehicle, d2.x+0.2,0.0,0.0), scenario = "WORLD_HUMAN_WELDING", done = false},
		[2] = {pos = GetOffsetFromEntityInWorldCoords(vehicle, 0.0,d2.y+0.2,0.0), scenario = "WORLD_HUMAN_VEHICLE_MECHANIC", done = false},
		[3] = {pos = GetOffsetFromEntityInWorldCoords(vehicle, d1.x-0.2,0.0,0.0), scenario = "WORLD_HUMAN_MAID_CLEAN", done = false},
		[4] = {pos = GetOffsetFromEntityInWorldCoords(vehicle, 0.0,d1.y-0.2,0.0), scenario = "WORLD_HUMAN_CLIPBOARD", done = false},

	}
	while true do
		Citizen.Wait(1)
		for k,v in pairs(spots) do
			local distance = #(coords - vector3(v.pos.x, v.pos.y, v.pos.z))
			if distance < 4.0 then
				if not v.done then
					
					T1GER_DrawTxt(v.pos.x, v.pos.y, v.pos.z, Lang['draw_analyze_here'])
					if IsControlJustPressed(0, Config.KeyControls['analyse_here']) and distance <= 1.0 then
						if k == 2 then
							SetEntityHeading(player, GetEntityHeading(vehicle))
							
							Citizen.Wait(500)
							
						else
					
							TaskTurnPedToFaceEntity(player, vehicle, 1.0)

							Citizen.Wait(1000)
						end
						TaskStartScenarioInPlace(player, v.scenario, 0, true)
						if Config.ProgressBars then
							QBCore.Functions.Progressbar('analyze_body', Lang['progb_analyzing_body'], 2500, false, false, {
								disableMovement = true,
								disableCarMovement = true,
								disableMouse = false,
								disableCombat = true,
							}, {}, {}, {}, function() end)
						end
						Citizen.Wait(2500)
						
						ClearPedTasks(player)
						v.done = true
					end
				end
			end
		end

		if spots[1].done and spots[2].done and spots[3].done and spots[4].done then
			break
		end
	end

	local damageReport = {doors = {}, wheels = {}, engine = nil, body = nil}
	-- Doors Report:
	local texts = {[0] = 'Front (L)', [1] = 'Front (R)', [2] = 'Rear (L)', [3] = 'Rear (R)', [4] = 'Hood', [5] = 'Trunk', [6] = 'Back', [7] = 'Back2'}
	for i = 0, 7 do
		if GetIsDoorValid(vehicle, i) then
			if IsVehicleDoorDamaged(vehicle, i) then
				damageReport.doors[i] = true
				local label, doorLabel = '', ''
				if i <= 3 then
					doorLabel = texts[i]
					label = "^*Door ^5[^6"..doorLabel.."^5] ^0» ^3 Damaged ^0» ^2Replace the Door"
				end
				if i == 4 then
					doorLabel = texts[i]
					label = "^*Door ^5[^6"..doorLabel.."^5] ^0» ^3 Damaged ^0» ^2Replace the Hood"
				end
				if i >= 5 then
					doorLabel = texts[i]
					label = "^*Door ^5[^6"..doorLabel.."^5] ^0» ^3 Damaged ^0» ^2Replace the Trunk/Back"
				end
				TriggerEvent('chat:addMessage', { args = { label } })
			else
				damageReport.doors[i] = false
			end
		end
	end
	-- Wheels Report:
	for i = 0, GetVehicleNumberOfWheels(vehicle) - 1 do
		if i == 0 or i == 1 then
			if IsVehicleTyreBurst(vehicle, i) or GetVehicleWheelXOffset(vehicle, i) == 9999.0 then
				damageReport.wheels[i + 1] = true
				local label = ''
				if i == 0 then
					label = "^*Wheel ^5[^6Left Front^5] ^0» ^3 Bursted ^0» ^2Replace the Wheel"
				elseif i == 1 then
					label = "^*Wheel ^5[^6Right Front^5] ^0» ^3 Bursted ^0» ^2Replace the Wheel"
				end
				TriggerEvent('chat:addMessage', { args = { label } })
			else
				damageReport.wheels[i + 1] = false
			end
		end
		if i == 2 then
			if IsVehicleTyreBurst(vehicle, 4) or GetVehicleWheelXOffset(vehicle, i) == 9999.0  then
				damageReport.wheels[i + 1] = true
				local label = "^*Wheel ^5[^6Back Left^5] ^0» ^3 Bursted ^0» ^2Replace the Wheel"
				TriggerEvent('chat:addMessage', { args = { label } })
			else
				damageReport.wheels[i + 1] = false
			end
		end
		if i == 3 then
			if IsVehicleTyreBurst(vehicle, 5) or GetVehicleWheelXOffset(vehicle, i) == 9999.0 then
				damageReport.wheels[i + 1] = true
				local label = "^*Wheel ^5[^6Back Right^5] ^0» ^3 Bursted ^0» ^2Replace the Wheel"
				TriggerEvent('chat:addMessage', { args = { label } })
			else
				damageReport.wheels[i + 1] = false
			end
		end
	end
	FreezeEntityPosition(vehicle, true)
	-- Engine Report
	damageReport.engine = GetVehicleEngineHealth(vehicle)
	-- Body Report
	damageReport.body = GetVehicleBodyHealth(vehicle)
	SetVehicleCanDeformWheels(vehicle, false)
	Wait(500)
	FreezeEntityPosition(vehicle, false)
	analysis[plate].entity = vehicle 
	analysis[plate].report = damageReport
	analysis[plate].done = true
	RefreshVehicleDamage(analysis[plate].entity, plate)
	if GetBodyRepairProgression(vehicle) >= 100 then 
		FreezeEntityPosition(vehicle, true)
		SetVehicleCanDeformWheels(vehicle, true)
		Wait(100)
		SetVehicleFixed(vehicle)
		SetVehicleBodyHealth(vehicle, 1000.0)
		SetVehicleEngineHealth(vehicle, analysis[plate].report.engine)
		analysis[plate].done = false
		analysis[plate] = nil
		TriggerEvent('t1ger_mechanicjob:notify', Lang['no_body_replace_needed'])
		FreezeEntityPosition(vehicle, false)
	end

end

local install = {obj = nil, inUse = false}

RegisterNetEvent('t1ger_mechanicjob:installBodyPartCL')
AddEventHandler('t1ger_mechanicjob:installBodyPartCL', function(id, val)
	local vehicle = T1GER_GetClosestVehicle(coords, 3.0)
	if vehicle ~= 0 then
		local plate = tostring(GetVehicleNumberPlateText(vehicle))
		if analysis[plate].done == false then
			return TriggerEvent('t1ger_mechanicjob:notify', Lang['analyze_to_inst_parts'])
		end
		T1GER_GetControlOfEntity(vehicle)
		local vehCoords = GetEntityCoords(vehicle)
		local distance = #(coords - vehCoords)

		if install.inUse == false then
			if not DoesEntityExist(install.obj) then
				local anim_dict = "anim@heists@box_carry@"
				T1GER_LoadAnim(anim_dict)
				TaskPlayAnim(player, anim_dict, "idle", 6.0, -2.0, -1, 50, 0, false, false, false)
				T1GER_SpawnObject(val.prop, {x = coords.x, y = coords.y, z = coords.z}, function(spawnObj)
					install.obj = spawnObj
					AttachEntityToEntity(spawnObj, player, GetPedBoneIndex(player, 28422), val.pos[1], val.pos[2], val.pos[3], val.rot[1], val.rot[2], val.rot[3], true, true, false, true, 1, true)
				end)
				while true do
					Citizen.Wait(1)
					local sleep = true
					distance = #(coords - vehCoords)
					if distance < 4.0 then --Distancia Carjack y vehicul

						
						local findObj = GetClosestObjectOfType(vehCoords.x, vehCoords.y, vehCoords.z, 1.0, Config.CarHash, false, false, false)
						
						local findObj2 = GetClosestObjectOfType(vehCoords.x, vehCoords.y, vehCoords.z, 1.0, Config.CarHash2, false, false, false)
						
						if DoesEntityExist(findObj) or DoesEntityExist(findObj2) then
							sleep = false
							T1GER_DrawTxt(vehCoords.x, vehCoords.y, vehCoords.z, Lang['draw_install_b_part'])
							if IsControlJustPressed(0, Config.KeyControls['install_b_part']) and distance < 1.5 then
								install.inUse = true
								if id == 1 then
									for i = 0, 3 do
										if GetIsDoorValid(vehicle, i) then
											if analysis[plate].report.doors[i] == true then
												analysis[plate].report.doors[i] = false
												TriggerServerEvent('t1ger_mechanicjob:syncVehicleBodySV', plate)
												TriggerServerEvent('t1ger_mechanicjob:removeItem', val.item, 1)
												break
											else
												if (tonumber(i) == 1 and GetIsDoorValid(vehicle, 3) == false) or tonumber(i) == 3 then 
													TriggerEvent('t1ger_mechanicjob:notify', Lang['all_doors_intact'])
													break
												end
											end
										end
									end
								end
								if id == 2 then
									if GetIsDoorValid(vehicle, 4) then
										if analysis[plate].report.doors[4] == true then
											analysis[plate].report.doors[4] = false
											TriggerServerEvent('t1ger_mechanicjob:syncVehicleBodySV', plate)
											TriggerServerEvent('t1ger_mechanicjob:removeItem', val.item, 1)
										else
											TriggerEvent('t1ger_mechanicjob:notify', Lang['hood_already_installed'])
										end
									else
										TriggerEvent('t1ger_mechanicjob:notify', Lang['hood_already_installed'])
									end
								end
								if id == 3 then
									for i = 5, 7 do
										if GetIsDoorValid(vehicle, i) then
											if analysis[plate].report.doors[i] == true then
												analysis[plate].report.doors[i] = false
												TriggerServerEvent('t1ger_mechanicjob:syncVehicleBodySV', plate)
												TriggerServerEvent('t1ger_mechanicjob:removeItem', val.item, 1)
												break
											else 
												TriggerEvent('t1ger_mechanicjob:notify', Lang['trunk_already_installed'])
												break
											end
										else
											if tonumber(i) == 7 then 
												TriggerEvent('t1ger_mechanicjob:notify', 'Trunk, Back or Back2 does not require any replacement')
												break
											end
										end
									end
								end
								if id == 4 then
									for i = 0, (GetVehicleNumberOfWheels(analysis[plate].entity) - 1) do
										if GetVehicleWheelXOffset(analysis[plate].entity, i) == 9999.0 then
											if analysis[plate].report.wheels[i + 1] == true then 
												analysis[plate].report.wheels[i + 1] = false
												TriggerServerEvent('t1ger_mechanicjob:syncVehicleBodySV', plate)
												TriggerServerEvent('t1ger_mechanicjob:removeItem', val.item, 1)
												break
											end
										else
											if tonumber(i + 1) == tonumber(GetVehicleNumberOfWheels(analysis[plate].entity) - 1) then
												TriggerEvent('t1ger_mechanicjob:notify', Lang['all_wheels_intact'])
												SetVehicleCanDeformWheels(vehicle, true)
											end
										end
									end
								end
								DetachEntity(install.obj, 1, 0)
								SetEntityAsMissionEntity(install.obj)
								DeleteObject(install.obj)
								install.obj = nil
								ClearPedTasks(player)
								Citizen.Wait(100)

								local progression = GetBodyRepairProgression(vehicle)
								TriggerEvent('t1ger_mechanicjob:notify', 'Progression: ['..progression..'/100]')
								if progression >= 100 then 
									SetVehicleCanDeformWheels(vehicle, true)
									Wait(100)
									SetVehicleFixed(vehicle)
									SetVehicleBodyHealth(vehicle, 1000.0)
									SetVehicleEngineHealth(vehicle, analysis[plate].report.engine)
									analysis[plate].done = false
									analysis[plate] = nil
									TriggerEvent('t1ger_mechanicjob:notify', Lang['all_body_repairs_done'])
								end

								install.inUse = false

								break
							end
						else
							TriggerEvent('t1ger_mechanicjob:notify', Lang['body_inst_not_possible'])
							break
						end
					end
					if distance > 6.0 then
						TriggerEvent('t1ger_mechanicjob:notify', Lang['too_far_from_vehicle'])
						break
					end
					if sleep then
						Citizen.Wait(1000)
					end
				end
			end
		else
			TriggerEvent('t1ger_mechanicjob:notify', Lang['body_install_ongoing'])
		end
	else
		TriggerEvent('t1ger_mechanicjob:notify', Lang['no_vehicle_nearby'])
	end
end)

RegisterNetEvent('t1ger_mechanicjob:syncVehicleBodyCL')
AddEventHandler('t1ger_mechanicjob:syncVehicleBodyCL', function(plate)
	if analysis[plate] ~= nil then 
		RefreshVehicleDamage(analysis[plate].entity, plate) --REVISAR DESPUES
	end 
end)

function RefreshVehicleDamage(vehicle, plate)
	SetVehicleFixed(vehicle)
	for i = 0, 7 do
		if GetIsDoorValid(vehicle, i) then
			if analysis[plate].report.doors[i] == true then
				SetVehicleDoorBroken(vehicle, i, true)
			end
		end
	end
	for i = 0, GetVehicleNumberOfWheels(vehicle) - 1 do
		if analysis[plate].report.wheels[i + 1] == true then
			SetVehicleWheelsCanBreak(vehicle, i, 0)
			SetVehicleWheelHealth(vehicle, i, 0.0)
			SetVehicleWheelXOffset(vehicle, i, 9999.0)
			SetVehicleWheelYRotation(vehicle, i, -90.0)
		else
			SetVehicleWheelsCanBreak(vehicle, i, false)
			SetVehicleWheelHealth(vehicle, i, 100.0)
			SetVehicleWheelXOffset(vehicle, i, analysis[plate].wheels[i + 1].xOffset)
			SetVehicleWheelYRotation(vehicle, i, analysis[plate].wheels[i + 1].yRotation)
		end
	end
	RemoveVehicleWindow(vehicle, 0)
	RemoveVehicleWindow(vehicle, 1)
	RemoveVehicleWindow(vehicle, 2)
	RemoveVehicleWindow(vehicle, 3)
	SetVehicleBodyHealth(vehicle, 1000.0)
	SetVehicleEngineHealth(vehicle, analysis[plate].report.engine)
end

function GetBodyRepairProgression(vehicleEntity)
	if DoesEntityExist(vehicleEntity) then
		local plate = tostring(GetVehicleNumberPlateText(vehicleEntity))
		local totalValue = 0
		local numDoors, numWheels = 0, 0
		for i = 0, 7 do
			if GetIsDoorValid(vehicleEntity, i) then
				totalValue = totalValue + 1
				if analysis[plate].report.doors[i] == false then 
					numDoors = numDoors + 1
				end
			end
		end
		for i = 0, GetVehicleNumberOfWheels(vehicleEntity) - 1 do
			totalValue = totalValue + 1
			if analysis[plate].report.wheels[i + 1] == false then 
				numWheels = numWheels + 1
			end
		end
		local newValue = numWheels + numDoors
		return (math.floor((newValue / totalValue) * 100))
	end
end



RegisterNetEvent('t1ger_mechanicjob:liftStateCL')
AddEventHandler('t1ger_mechanicjob:liftStateCL', function(k, id, val, state)
	Config.MechanicShops[k].lifts[id] = val
	Config.MechanicShops[k].lifts[id].inUse = state
end)

RegisterNetEvent('t1ger_mechanicjob:return', function()
	RepairHealthParts()
end)



function RepairVehicleEngine()
	local vehicle = T1GER_GetClosestVehicle(coords, 4.0)
	local plate = tostring(GetVehicleNumberPlateText(vehicle))
	while true do
		Citizen.Wait(1)
		local sleep = true
		if #(coords - GetEntityCoords(vehicle)) < 6.0 then
			local d1,d2 = GetModelDimensions(GetEntityModel(vehicle))
			local engineCoords = GetOffsetFromEntityInWorldCoords(vehicle, 0.0,d2.y+0.2,0.0)
			local distance = (GetDistanceBetweenCoords(coords, vector3(engineCoords.x, engineCoords.y, engineCoords.z), true))
			if distance < 4.0 then
				sleep = false
				T1GER_DrawTxt(engineCoords.x, engineCoords.y, engineCoords.z, Lang['draw_repair_engine'])
				if IsControlJustPressed(0, Config.KeyControls['repair_engine']) and distance < 1.0 then
					-- Inspect Animation:
					TaskTurnPedToFaceEntity(player, vehicle, 1.0)
					Citizen.Wait(1000)
					TaskStartScenarioInPlace(player, "WORLD_HUMAN_CLIPBOARD", 0, true)
					if Config.ProgressBars then
						QBCore.Functions.Progressbar('inspect_eng', "INSPECTING: ENGINE", 2000, false, false, {
							disableMovement = true,
							disableCarMovement = true,
							disableMouse = false,
							disableCombat = true,
						}, {}, {}, {}, function() end)
					end
					Citizen.Wait(2000)
					ClearPedTasks(player)
					Citizen.Wait(250)
					ClearAreaOfObjects(coords.x, coords.y, coords.z, 1.0, 0)
					--
					local engineHealth = GetVehicleEngineHealth(vehicle)
					if engineHealth < 1000.0 then
						SetEntityHeading(player, GetEntityHeading(vehicle))
						Citizen.Wait(500)
						TaskStartScenarioInPlace(player, "WORLD_HUMAN_VEHICLE_MECHANIC", 0, true)
						if Config.ProgressBars then
							QBCore.Functions.Progressbar('repair_eng', "REPAIRING: ENGINE", 3500, false, false, {
								disableMovement = true,
								disableCarMovement = true,
								disableMouse = false,
								disableCombat = true,
							}, {}, {}, {}, function() end)
						end
						Citizen.Wait(3500)
						SetVehicleEngineHealth(vehicle, 1000.0)
						ClearPedTasks(player)
						ClearAreaOfObjects(coords.x, coords.y, coords.z, 1.0, 0)
						TriggerEvent('t1ger_mechanicjob:notify', Lang['veh_engine_repaired'])
					else
						SetVehicleEngineHealth(vehicle, 1000.0)
						TriggerEvent('t1ger_mechanicjob:notify', Lang['veh_engine_no_repair'])
					end
					break
				end
			end
		end
		if sleep then
			Citizen.Wait(500)
		end
	end
end

-- Vehicle Value Saver:
Citizen.CreateThread(function()
	Citizen.Wait(1000)
	local count = 0
	local multiplier = 2.236936
	if Config.UseKMH then multiplier = 3.6 end
	while true do
		if plyVehicle ~= 0 then
			if (GetEntitySpeed(plyVehicle) * multiplier) > 2.0 then
				count = count + 1
				if count >= Config.HealthTimer then
					if player == GetPedInVehicleSeat(plyVehicle, -1) then
						local plate = tostring(GetVehicleNumberPlateText(plyVehicle))
						VehicleDegredationHandle(plyVehicle, plate)
					end
					count = 0
				end
			end
		end
		Citizen.Wait(1000)
	end
end)

function VehicleDegredationHandle(vehicle, plate)
	QBCore.Functions.TriggerCallback('t1ger_mechanicjob:getVehicleHealth', function(health)
		if health ~= nil then
			for k,v in pairs(health) do
				if v.value <= 40 then
					local cfg = Config.HealthParts[v.type]
					math.randomseed(GetGameTimer())
					local chance = math.random(1,100)
					-- Brakes:
					if v.part == 'brakes' or v.type == 1 then
						if v.value <= 40 and v.value >= 25 and chance > 85 then
							BrakesEffects(vehicle, 1000)
						end
						if v.value <= 24 and v.value >= 10 and chance > 70 then
							BrakesEffects(vehicle, 4000)
						end
						if v.value <= 9 and v.value >= 0 and chance > 50 then
							BrakesEffects(vehicle, 8000)
						end
					end
					-- Radiator:
					if v.part == 'radiator' or v.type == 2 then
						if v.value <= 40 and v.value >= 25 then
							RadiatorEffects(vehicle, chance, 1000)
						end
						if v.value <= 24 and v.value >= 10 then
							RadiatorEffects(vehicle, chance, 3000)
						end
						if v.value <= 9 and v.value >= 0 then
							RadiatorEffects(vehicle, chance, 5000)
						end
					end
					-- Clutch:
					if v.part == 'clutch' or v.type == 3 then
						if v.value <= 40 and v.value >= 25 and chance > 85 then
							ClutchEffects(vehicle, 1500, 75)
						end
						if v.value <= 24 and v.value >= 10 and chance > 70 then
							ClutchEffects(vehicle, 3000, 150)
						end
						if v.value <= 9 and v.value >= 0 and chance > 50 then
							ClutchEffects(vehicle, 6000, 300)
						end
					end
					-- Transmission:
					if v.part == 'transmission' or v.type == 4 then
						if v.value <= 40 and v.value >= 25 and chance > 85 then
							TransmissionEffects(vehicle, 5, 2)
						end
						if v.value <= 24 and v.value >= 10 and chance > 70 then
							TransmissionEffects(vehicle, 10, 4)
						end
						if v.value <= 9 and v.value >= 0 and chance > 50 then
							TransmissionEffects(vehicle, 20, 8)
						end
					end
					-- Electronics:
					if v.part == 'electronics' or v.type == 5 then
						if v.value <= 40 and v.value >= 25 and chance > 85 then
							for i = 0, 10 do
								Citizen.Wait(50)
								ElectronicsEffects(vehicle)
							end
						end
						if v.value <= 24 and v.value >= 10 and chance > 70 then
							for i = 0, 10 do
								Citizen.Wait(100)
								ElectronicsEffects(vehicle)
							end
						end
						if v.value <= 9 and v.value >= 0 and chance > 50 then
							for i = 0, 10 do
								Citizen.Wait(200)
								ElectronicsEffects(vehicle)
							end
						end
					end
					-- Drive Shaft:
					if v.part == 'driveshaft' or v.type == 6 then
						if v.value <= 40 and v.value >= 25 and chance > 85 then
							DriveShaftEffects(vehicle, 10)
						end
						if v.value <= 24 and v.value >= 10 and chance > 70 then
							DriveShaftEffects(vehicle, 20)
						end
						if v.value <= 9 and v.value >= 0 and chance > 50 then
							DriveShaftEffects(vehicle, 30)
						end
					end
					-- Fuel Injector:
					if v.part == 'fuelinjector' or v.type == 7 then
						if v.value <= 40 and v.value >= 25 and chance > 85 then
							FuelInjectorEffects(vehicle, 200)
						end
						if v.value <= 24 and v.value >= 10 and chance > 70 then
							FuelInjectorEffects(vehicle, 500)
						end
						if v.value <= 9 and v.value >= 0 and chance > 50 then
							FuelInjectorEffects(vehicle, 1000)
						end
					end

				end
			end
		else
			return
		end
	end, plate)
end

function BrakesEffects(entity, timer)
	SetVehicleHandbrake(entity, true)
	Citizen.Wait(timer)
	SetVehicleHandbrake(entity, false)
end

function RadiatorEffects(entity, chance, timer)
	local lastTemp = GetVehicleEngineTemperature(entity)
	local eh = GetVehicleEngineHealth(entity)
	SetVehicleEngineTemperature(entity, 500.0)
	Citizen.Wait(timer + 2000)
	if eh >= 900 then SetVehicleEngineHealth(entity, (eh-10)) end
	if eh >= 450 then SetVehicleEngineHealth(entity, (eh-15)) end
	if eh >= 250 then SetVehicleEngineHealth(entity, (eh-25)) end
	SetVehicleEngineTemperature(entity, lastTemp)
end

function ClutchEffects(entity, timer, fuelTimer)
	SetVehicleHandbrake(entity, true)
	FuelInjectorEffects(entity, fuelTimer)
	for i = 1, 360 do
		SetVehicleSteeringScale(entity ,i)
		Citizen.Wait(5)
	end
	Citizen.Wait(timer)
	SetVehicleHandbrake(entity, false)
end

function TransmissionEffects(entity, timer, count)
	for i = 0, count do
		Citizen.Wait(timer)
		SetVehicleHandbrake(entity, true)
		Citizen.Wait(1000)
		SetVehicleHandbrake(entity, false)
	end
end

function ElectronicsEffects(entity)
	local radios = {"RADIO_03_HIPHOP_NEW","RADIO_04_PUNK","RADIO_05_TALK_01","RADIO_14_DANCE_02","RADIO_20_THELAB","RADIO_17_FUNK","RADIO_18_90S_ROCK"}
	SetVehicleLights(entity, 1)
	SetVehRadioStation(entity, radios[math.random(1,#radios)])
	Citizen.Wait(500)
	SetVehicleLights(entity, 0)
end

function DriveShaftEffects(vehicle, timer)
	local steerBias = {-1.0,-0.9,-0.8,0.8,0.9,1.0}
	local value = steerBias[math.random(#steerBias)]
	local tick = 0
	while true do
		Citizen.Wait(timer)
		SetVehicleSteerBias(vehicle, value)
		tick = tick + 1
		if tick >= 20 then
			tick = 0
			break
		end
	end
end

function FuelInjectorEffects(entity, timer)
	SetVehicleEngineOn(entity, 0, 0, 1)
	SetVehicleUndriveable(entity, true)
	Citizen.Wait(timer)
	SetVehicleEngineOn(entity, 1, 0, 1)
	SetVehicleUndriveable(entity, false)
end

local using_repairkit = false
RegisterNetEvent('t1ger_mechanicjob:useRepairKit')
AddEventHandler('t1ger_mechanicjob:useRepairKit', function(type, val)
	local vehicle = T1GER_GetClosestVehicle(coords, 4.0)
	if vehicle ~= 0 then
		if using_repairkit then return end
		using_repairkit = true

		
		-- Get Control of Vehicle:
		T1GER_GetControlOfEntity(vehicle)

		-- Get Repair Veh Position:
		local d1,d2 = GetModelDimensions(GetEntityModel(vehicle))
		local hood = GetOffsetFromEntityInWorldCoords(vehicle, 0.0,d2.y+0.2,0.0)
		local distance = (GetDistanceBetweenCoords(GetEntityCoords(player, 1), vector3(hood.x, hood.y, hood.z), true))
		local vehRepaired = false

		-- Repair thread:
        while not vehRepaired do
            Citizen.Wait(1)
            distance = (GetDistanceBetweenCoords(GetEntityCoords(player, 1), vector3(hood.x, hood.y, hood.z), true))
			T1GER_DrawTxt(hood.x, hood.y, hood.z, Lang['draw_repair_kit'])
			if IsControlJustPressed(0, Config.KeyControls['use_repairkit']) then
				if distance < 1.0 then
					SetVehicleDoorOpen(vehicle, 4, 0, 0)
					TaskTurnPedToFaceEntity(player, vehicle, 1.0)
					Citizen.Wait(1000)
					local animDict = "mini@repair"
					T1GER_LoadAnim(animDict)
					if not IsEntityPlayingAnim(player, animDict, "fixing_a_player", 3) then
						TaskPlayAnim(player, animDict, "fixing_a_player", 5.0, -5, -1, 16, false, false, false, false)
					end
					-- repair options:
					RepairVehOptions(vehicle, type, val)
					-- Chance to destroy item:
					if math.random(100) > val.chanceToKeep then
						TriggerServerEvent('t1ger_mechanicjob:removeItem', val.item, 1)
						TriggerEvent('t1ger_mechanicjob:notify', Lang['repair_kit_broke'])
					end
					-- end:
					SetVehicleDoorShut(vehicle, 4, 1, 1)
					ClearPedTasks(player)
					TriggerEvent('t1ger_mechanicjob:notify', Lang['repairkit_veh_repaired'])
					vehRepaired = true
					using_repairkit = false
					break
				else
					distance = #(coords - vector3(hood.x, hood.y, hood.z))
				end
			end
        end
	end
	using_repairkit = false
end)

-- Choose repairs with repairkit:
function RepairVehOptions(veh, type, val)
	local repairDuration = (((3000-GetVehicleEngineHealth(vehicle)) - (GetVehicleBodyHealth(vehicle)/2))*2 + val.repairTime)
	if Config.ProgressBars then
		QBCore.Functions.Progressbar('repair_vehoptions', val.progbar, repairDuration, false, false, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() end)
	end
	Citizen.Wait(repairDuration)
	if type == 1 then
		if GetVehicleEngineHealth(veh) < val.engineValue then	SetVehicleEngineHealth(veh, val.engineValue) end
		--if GetVehicleBodyHealth(veh) < 910.0 then SetVehicleBodyHealth(veh, 910.0) end
		for i = 0, math.random(5) do SetVehicleTyreFixed(veh, i) end
	end
	if type == 2 then
		if GetVehicleEngineHealth(veh) < val.engineValue then	SetVehicleEngineHealth(veh, val.engineValue) end
		--if GetVehicleBodyHealth(veh) < 975.0 then SetVehicleBodyHealth(veh, 975.0) end
		for i = 0, 5 do SetVehicleTyreFixed(veh, i)  end
	end
end

function MechanicJobsNPC()
	exports['qb-menu']:openMenu({
		{
			isMenuHeader = true,
			header = 'NPC Job Menu'
		},
		{
			header = 'Find Job',
			params = {
				event = 't1ger_mechanicjob:findJob'
			}
		},
		{
			header = 'Cancel Job',
			params = {
				event = 't1ger_mechanicjob:cancelJob'
			}
		},
		{
			header = 'Return',
			params = {
				event = 't1ger_mechanicjob:openMechMenu'
			}
		}
	})
end

RegisterNetEvent('t1ger_mechanicjob:cancelJob', function()
	CancelCurrentJob()
end)

RegisterNetEvent('t1ger_mechanicjob:findJob', function()
	local num = math.random(1,#Config.NPC_RepairJobs)
	local distance_check = CheckDistance(num)
	local count = 0
	while not distance_check and count < 100 do
		count = count+1
		num = math.random(1,#Config.NPC_RepairJobs)
		while Config.NPC_RepairJobs[num].inUse and count < 100 do
			count = count+1
			num = math.random(1,#Config.NPC_RepairJobs)
		end
		distance_check = CheckDistance(num)
	end
	if count == 100 then
		TriggerEvent('t1ger_mechanicjob:notify', Lang['npc_no_calls_available'])
	else
		Config.NPC_RepairJobs[num].inUse = true
		Wait(200)
		TriggerServerEvent('t1ger_mechanicjob:JobDataSV', Config.NPC_RepairJobs)
		TriggerEvent('t1ger_mechanicjob:startJobWithNPC', num)
	end
end)

local CancelJob = false
local JobVeh = nil
local JobPed = nil
RegisterNetEvent('t1ger_mechanicjob:startJobWithNPC')
AddEventHandler('t1ger_mechanicjob:startJobWithNPC', function(num)
	local JobDone = false
	local job = Config.NPC_RepairJobs[num]
	local blip = CreateJobBlip(job.pos)
	local jobVehSpawned = false
	local vehicleRepaired = false
	local pedCreated = false
	local pedShouted = false
	local buttonClicked = false

	while not JobDone and not CancelJob do
		Citizen.Wait(0)

		if job.inUse then

			local coords = GetEntityCoords(PlayerPedId())
			local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, job.pos[1], job.pos[2], job.pos[3], false)

			if distance > 50.0 then
				if DoesEntityExist(JobVeh) then
					DeleteEntity(JobVeh)
					DeleteVehicle(JobVeh)
					SetEntityAsNoLongerNeeded(JobVeh)
					JobVeh = nil
					jobVehSpawned = false
				end
			end

			if distance < 50.0 and not jobVehSpawned then
				ClearAreaOfVehicles(job.pos[1], job.pos[2], job.pos[3], 5.0, false, false, false, false, false)
				jobVehSpawned = true
				Citizen.Wait(200)
				math.randomseed(GetGameTimer())
				local vehID = math.random(#Config.RepairVehicles)
				local jobVehicle = Config.RepairVehicles[vehID]
				QBCore.Functions.SpawnVehicle(jobVehicle, function(vehicle)
					SetEntityCoordsNoOffset(vehicle, job.pos[1], job.pos[2], job.pos[3])
					SetEntityHeading(vehicle, job.pos[4])
					SetVehicleOnGroundProperly(vehicle)
					SetEntityAsMissionEntity(JobVeh)
					JobVeh = vehicle
					SetVehicleEngineHealth(JobVeh, 100.0)
					SetVehicleDoorOpen(JobVeh, 4, 0, 0)
					SetPedIntoVehicle(ped, JobVeh, -1)
				end, {x = job.pos[1], y = job.pos[2], z = job.pos[3]}, true)
			end

			if distance < 10.0 then
				if not pedCreated then
					T1GER_LoadModel(job.ped)
					local NPC = CreatePedInsideVehicle(JobVeh, 1, job.ped, -1, true, true)
					NetworkRegisterEntityAsNetworked(NPC)
					SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(NPC), true)
					SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(NPC), true)
					SetPedKeepTask(NPC, true)
					SetPedDropsWeaponsWhenDead(NPC, false)
					SetEntityInvincible(NPC, false)
					SetEntityVisible(NPC, true)
					JobPed = NPC
					SetEntityAsMissionEntity(JobPed)
					pedCreated = true
				end
				if not pedShouted and distance < 6.0 then
					TriggerEvent('t1ger_mechanicjob:notify', Lang['npc_shout_msg'])
					pedShouted = true
				end
				local d1,d2 = GetModelDimensions(GetEntityModel(JobVeh))
				local enginePos = GetOffsetFromEntityInWorldCoords(JobVeh, 0.0,d2.y+0.2,0.0)
				local pedPos = GetEntityCoords(JobPed)
				local vehDistance = (GetDistanceBetweenCoords(coords, vector3(enginePos.x, enginePos.y, enginePos.z), true))
				local pedDistance = (GetDistanceBetweenCoords(coords, vector3(pedPos.x, pedPos.y, pedPos.z), false))

				if vehDistance < 5.0 and not vehicleRepaired then
					T1GER_DrawTxt(enginePos.x, enginePos.y, enginePos.z, Lang['draw_npc_repair_veh'])
					if IsControlJustPressed(0, Config.KeyControls['rep_npc_vehicle']) and vehDistance < 1.0 and not buttonClicked then
						buttonClicked = true
						QBCore.Functions.TriggerCallback('t1ger_mechanicjob:getInventoryItem', function(hasItem)
							if hasItem then
								SetVehicleDoorOpen(JobVeh, 4, 0, 0)
								TaskTurnPedToFaceEntity(PlayerPedId(), JobVeh, 1.0)
								Citizen.Wait(1000)
								local animDict = "mini@repair"
								T1GER_LoadAnim(animDict)
								if not IsEntityPlayingAnim(PlayerPedId(), animDict, "fixing_a_player", 3) then
									TaskPlayAnim(PlayerPedId(), animDict, "fixing_a_player", 5.0, -5, -1, 16, false, false, false, false)
								end
								if Config.ProgressBars then
									QBCore.Functions.Progressbar('npc_repair', Lang['progb_npc_veh_repair'], 4000, false, false, {
										disableMovement = true,
										disableCarMovement = true,
										disableMouse = false,
										disableCombat = true,
									}, {}, {}, {}, function() end)
								end
								Citizen.Wait(4000)
								SetVehicleEngineHealth(JobVeh, 1000.0)
								SetVehicleBodyHealth(JobVeh, 1000.0)
								SetVehicleFixed(JobVeh)
								for i = 0, 5 do SetVehicleTyreFixed(JobVeh, i) end
								if math.random(100) > 10 then
									TriggerServerEvent('t1ger_mechanicjob:removeItem', "repairkit", 1)
									TriggerEvent('t1ger_mechanicjob:notify', Lang['npc_kit_broke'])
								end
								SetVehicleDoorShut(vehicle, 4, 1, 1)
								ClearPedTasks(PlayerPedId())
								TriggerEvent('t1ger_mechanicjob:notify', Lang['npc_veh_repaired'])
								vehicleRepaired = true
								buttonClicked = false
							else
								TriggerEvent('t1ger_mechanicjob:notify', Lang['npc_need_repair_kit'])
								buttonClicked = false
							end
						end, "repairkit")
					end
				end

				if pedDistance < 5.0 and vehicleRepaired then
					T1GER_DrawTxt(pedPos.x, pedPos.y, pedPos.z, Lang['draw_npc_collect_cash'])
					if IsControlJustPressed(0, 38) and pedDistance < 1.5 then
						RollDownWindow(JobVeh, 0)
						SetVehicleCanBeUsedByFleeingPeds(JobVeh, true)
						T1GER_LoadAnim("mp_common")
						TaskTurnPedToFaceEntity(PlayerPedId(), JobVeh, 1.0)
						Citizen.Wait(1000)
						TaskPlayAnim(PlayerPedId(), "mp_common", "givetake2_a", 4.0, 4.0, -1, 0, 1, 0,0,0)
						if Config.ProgressBars then
							QBCore.Functions.Progressbar('npc_cash', Lang['progb_npc_collect_cash'], 2000, false, false, {
								disableMovement = true,
								disableCarMovement = true,
								disableMouse = false,
								disableCombat = true,
							}, {}, {}, {}, function() end)
						end
						Citizen.Wait(2000)
						ClearPedTasks(PlayerPedId())
						RollUpWindow(JobVeh, 0)
						TriggerEvent('t1ger_mechanicjob:notify', Lang['npc_thanking_msg'])
						TriggerServerEvent('t1ger_mechanicjob:JobReward', job.payout)
						Wait(500)
						if DoesBlipExist(blip) then RemoveBlip(blip) end
						TaskVehicleDriveWander(JobPed, JobVeh, 80.0, 786603)
						Wait(2500)
						TaskSmartFleePed(JobPed, PlayerPedId(), 40.0, 20000)
						Wait(2500)
						CancelJob = true
					end
				end
			end

			if CancelJob then
				if DoesEntityExist(JobVeh) then DeleteVehicle(JobVeh) end
				if DoesEntityExist(JobPed) then DeleteEntity(JobPed) end
				if DoesBlipExist(blip) then RemoveBlip(blip) end
				Config.NPC_RepairJobs[num].inUse = false
				Wait(200)
				TriggerServerEvent('t1ger_mechanicjob:JobDataSV', Config.NPC_RepairJobs)
				JobVeh = nil
				JobPed = nil
				CancelJob = false
				break
			end
		end
	end
end)

RegisterNetEvent('t1ger_mechanicjob:JobDataCL')
AddEventHandler('t1ger_mechanicjob:JobDataCL',function(data)
	Config.NPC_RepairJobs = data
end)

-- Function for job blip in progress:
function CreateJobBlip(pos)
	local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
	SetBlipSprite(blip, 1)
	SetBlipColour(blip, 5)
	AddTextEntry('MYBLIP', Lang['npc_repair_job'])
	BeginTextCommandSetBlipName('MYBLIP')
	AddTextComponentSubstringPlayerName(name)
	EndTextCommandSetBlipName(blip)
	SetBlipScale(blip, 0.7) -- set scale
	SetBlipAsShortRange(blip, true)
	SetBlipRoute(blip, true)
	SetBlipRouteColour(blip, 5)
	return blip
end

RegisterNetEvent('hospital:server:SetDeathStatus', function(bool)
	CancelJob = true
	if JobVeh ~= nil or JobPed ~= nil then
		TriggerEvent('t1ger_mechanicjob:notify', Lang['npc_cancel_job_death'])
	end
	Wait(300)
	CancelJob = false
end)

-- Function to distance check:
function CheckDistance(num)
	local check_pos = Config.NPC_RepairJobs[num].pos
	local travel_dist = CalculateTravelDistanceBetweenPoints(coords.x, coords.y, coords.z, check_pos[1], check_pos[2], check_pos[3])
	if travel_dist < Config.TravelDistance then
		return true
	else
		return false
	end
end

function CancelCurrentJob()
	CancelJob = true
	if JobVeh ~= nil or JobPed ~= nil then
		TriggerEvent('t1ger_mechanicjob:notify', Lang['npc_job_cancel_by_ply'])
	end
	Wait(300)
	CancelJob = false
end

-- Vehicle Collision / Damage --

Citizen.CreateThread(function()
	Citizen.Wait(1000)
	local lastVehSpeed = 0.0
	local lastVehBodyhealth = 0.0
	local multiplier = 2.236936
	if Config.UseKMH then multiplier = 3.6 end

	while true do
		Citizen.Wait(1)
		local sleep = true
		if Config.UseCollisionThread == true then
			if plyVehicle ~= nil and plyVehicle ~= 0 then
				if PlayerPedId() == GetPedInVehicleSeat(plyVehicle, -1) then
					if (GetEntitySpeed(plyVehicle) * multiplier) > 10.0 then
						sleep = false
						local curVehicleEngine = GetVehicleEngineHealth(plyVehicle)
						if curVehicleEngine <= 0.0 then
							SetVehicleEngineHealth(plyVehicle,0.0)
							SetVehicleEngineOn(plyVehicle, false, true, true)
						end
						local crashed = HasEntityCollidedWithAnything(plyVehicle)
						if crashed then
							Citizen.Wait(100)
							local newVehBodyHealth = GetVehicleBodyHealth(plyVehicle)
							local newVehSpeed = (GetEntitySpeed(plyVehicle) * multiplier)

							if curVehicleEngine > 0.0 and (lastVehBodyhealth - newVehBodyHealth) > 10 then
								if newVehSpeed < (lastVehSpeed * 0.5) and lastVehSpeed > Config.VehSpeed then
									if not Config.UsingOtherDamageScript then
										ApplyCrashDamage(plyVehicle)
									end
									Citizen.Wait(1000)
									lastVehSpeed = 0.0
									lastVehBodyhealth = newVehBodyHealth
								end
							else
								if curVehicleEngine > 10.0 and (curVehicleEngine < 199.0 or newVehBodyHealth < 100.0) then
									if not Config.UsingOtherDamageScript then
										ApplyCrashDamage(plyVehicle)
									end
									Citizen.Wait(1000)
								end
								lastVehSpeed = newVehSpeed
								lastVehBodyhealth = newVehBodyHealth
							end

						else
							lastVehSpeed = (GetEntitySpeed(plyVehicle) * multiplier)
							lastVehBodyhealth = GetVehicleBodyHealth(plyVehicle)
						end
					else
						sleep = true
					end
				end
			end
		else
			sleep = true
		end
		if sleep then
			Citizen.Wait(1000)
		end
	end
end)

function ApplyCrashDamage(vehicle)
	if Config.SlashTires then
		local tyres = {0,1,4,5}
		for i = 1, math.random(#tyres) do
			local num = math.random(#tyres)
			SetVehicleTyreBurst(vehicle, tyres[num], true, 1000)
			table.remove(tyres, num)
		end
	end
	if Config.EngineDisable then
		SetVehicleEngineHealth(vehicle, 0.0)
		SetVehicleEngineOn(vehicle, false, true, true)
	end
	local damageArray = {}
	local addedParts = {}

	for i = 1, Config.AmountPartsDamage do
		math.randomseed(GetGameTimer())
		local id = math.random(#Config.HealthParts)

		while addedParts[id] == id do
			id = math.random(#Config.HealthParts)
			if addedParts[id] == id then
				id = math.random(#Config.HealthParts)
			end
		end

		addedParts[id] = id

		local value = math.random(Config.DegradeValue.min,Config.DegradeValue.max)

		damageArray[Config.HealthParts[id].degName] = {label = Config.HealthParts[id].label, degName = Config.HealthParts[id].degName, degValue = value}
	end

	local plate = tostring(GetVehicleNumberPlateText(vehicle))
	if Config.Blacklisted['damage'] ~= nil then
		if not IsVehicleBlacklisted('damage') then
			TriggerServerEvent('t1ger_mechanicjob:degradeVehicleHealth', plate, damageArray)
		end
	else
		TriggerServerEvent('t1ger_mechanicjob:degradeVehicleHealth', plate, damageArray)
	end

	addedParts = {}
	damageArray = {}
    lastVehSpeed = 0.0
    lastVehBodyhealth = 0.0
end

function SetVehicleHealthPartValue(plate, part, value)
	TriggerServerEvent('t1ger_mechanicjob:setHealthPartValue', plate, part, value)
end

function ResetVehicleHealthParts(plate)
	TriggerServerEvent('t1ger_mechanicjob:resetVehicleHealthParts', plate)
end

-- Check if vehicle is inspected
function isVehicleInspected(table)
    for _,v in pairs(table) do
        if v.done == false then
			return false
		end
    end
    return true
end

function IsVehicleBlacklisted(type)
	for k,v in pairs(Config.Blacklisted[type]) do
		if GetEntityModel(GetVehiclePedIsIn(player, false)) == GetHashKey(v) then
			return true
		end
	end
	return false
end

function IsPlayerInsideVehicle()
	if IsPedInAnyVehicle(player, false) then
		local vehicle = GetVehiclePedIsIn(player, false)
		if vehicle ~= nil or vehicle ~= 0 then
			return true
		else
			return false
		end
	end
end

-- Function to get closest vehicle:
function T1GER_GetClosestVehicle(pos, radius)
    local closestVeh = StartShapeTestCapsule(pos.x, pos.y, pos.z, pos.x, pos.y, pos.z, radius, 10, player, 7)
    local a, b, c, d, entityHit = GetShapeTestResult(closestVeh)
	local tick = 15
	while entityHit == 0 and tick > 0 do
		tick = tick - 1
		closestVeh = StartShapeTestCapsule(pos.x, pos.y, pos.z, pos.x, pos.y, pos.z, radius, 10, player, 7)
		local a1, b1, c1, d1, entityHit2 = GetShapeTestResult(closestVeh)
		if entityHit2 ~= 0 and IsEntityAVehicle(entityHit2) then
			entityHit = entityHit2
			break
		end
		Citizen.Wait(1)
	end
    return entityHit
end

