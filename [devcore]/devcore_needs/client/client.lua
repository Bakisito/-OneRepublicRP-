QBCore = Config.QbCoreExport()

	STATE = {}

	local Locked = false

function TakeConsumeItem(item)
	local data = Config.ConsumeItems[item]
		if (STATE.SELECT_ITEM == item) then
			CreateConsumeProp(data.Prop)
			local m =  Config.Menu
			Citizen.CreateThread(function()
				while STATE.SELECT_ITEM == item do
					if (not STATE.USING) then
						if STATE.ACTION == 'CONSUME' then
							if data.Type == 'GLASS' then
								if STATE.GLASS_CONTENT ~= 'nil' then
									Draw2DTextNeeds(Translations['MENU']['use_menu'], m['MAIN'])
								else
									Draw2DTextNeeds(Translations['MENU']['empty_glass'], m['MAIN'])
								end
							else
								Draw2DTextNeeds(Translations['MENU']['use_menu'], m['MAIN'])
							end
						end
						if STATE.ACTION == 'AUTOCONSUME' then
							Draw2DTextNeeds(Translations['MENU']['back'], m['INFO'])
						end
						if STATE.ACTION == 'GIVE' then
							Draw2DTextNeeds(Translations['MENU']['give_menu'], m['MAIN'])
						end
						if STATE.ACTION == 'PLACE' then
							Draw2DTextNeeds(Translations['MENU']['place_menu'], m['MAIN'])
						end

							if data.Type == 'DRINK' then	
								Draw2DTextNeeds(STATE.SIZE.. ' ~b~ml', m['STATUS'])
							end
								if data.Type == 'FOOD' then
								Draw2DTextNeeds(STATE.SIZE.. ' ~o~g', m['STATUS'])
							end
								if data.Type == 'GLASS' then
								if STATE.GLASS_CONTENT ~= 'nil' then
								Draw2DTextNeeds(STATE.GLASS_CONTENT.. ' | '..STATE.SIZE.. ' ~b~ml', m['STATUS'])
							end

						end
	

						if data.Anim.Hold ~= nil and not STATE.HOLD then
							STATE.HOLD = true
							startAnimHold(data.Anim.Hold)
						end
					end
				
				if STATE.SIZE <= 0 then
					if data.Type == 'GLASS' then
						STATE.SIZE = 0
						if STATE.GLASS_CONTENT ~= 'nil' then
							if Locked == false then
								Locked = true
								STATE.GLASS_CONTENT = 'nil'
								Locked = false
								CreateConsumeProp(data.Prop)
							end
						end
					else
						STATE.SIZE = 0
						StopConsume('stop')
						break
					end
				end
					if Config.DisableCombatButtons then
						for i=140, 143 do
							DisableControlAction(0, i, true)
						end
					end

					Citizen.Wait(1)
				end
			end)
		end
end



function ControlPanel(item)
	local data = Config.ConsumeItems[item]
	Citizen.CreateThread(function()
		while STATE.SELECT_ITEM == item do
			if (not STATE.USING) then

			if  STATE.ACTION == 'CONSUME' and IsControlJustPressed(0, Config.Buttons.Use) then
				if STATE.ALCOHOL < Config.DrunkSystem.MaxDrunk then
				if data.Type == 'GLASS' then
					if STATE.GLASS_CONTENT ~= 'nil' then
						OnUsed(STATE.GLASS_CONTENT)
					end
				else
					OnUsed(item)
				end
			else
			Config.Notify(Translations['TEXT']['max_drunk'], 'error')
		end
	end
		if STATE.ACTION == 'CONSUME' and IsControlJustPressed(0, Config.Buttons.AutoConsume) then
			if STATE.ALCOHOL < Config.DrunkSystem.MaxDrunk then
			if data.Type == 'GLASS' then
				if STATE.GLASS_CONTENT ~= 'nil' then
					STATE.ACTION = 'AUTOCONSUME'
					AutoConsume(STATE.GLASS_CONTENT)
				end
			else
			STATE.ACTION = 'AUTOCONSUME'
			AutoConsume(item)
			end
		else
			STATE.ACTION = 'CONSUME'
			Config.Notify(Translations['TEXT']['max_drunk'], 'error')
		end
	end
		if STATE.ACTION == 'CONSUME' and IsControlJustPressed(0, Config.Buttons.Give) then
			STATE.ACTION = 'GIVE'
			GiveConsumeItem(item)
		end
		if STATE.ACTION == 'CONSUME' and IsControlJustPressed(0, Config.Buttons.Place) then
			STATE.ACTION = 'PLACE'
			SetPlacePosition(item)
		end
		if STATE.ACTION == 'CONSUME' and IsControlJustPressed(0, Config.Buttons.Hide) then
			if STATE.INV == 'ox' then
				if Config.AutoTake.enable then
				local o = GetTakeItems(item)
				if o ~= item then
				TriggerServerEvent(GetCurrentResourceName()..':server:HideConsumeItem', item, STATE.SIZE, STATE.GLASS_CONTENT)
			end
		else
			TriggerServerEvent(GetCurrentResourceName()..':server:HideConsumeItem', item, STATE.SIZE, STATE.GLASS_CONTENT)
		end
	else
		TriggerServerEvent(GetCurrentResourceName()..':server:HideConsumeItem', item, STATE.SIZE, STATE.GLASS_CONTENT)
	end
				StopConsume('stop')
			break
		end
		if STATE.ACTION ~= 'CONSUME' and IsControlJustPressed(0, Config.Buttons.Back) then
			if STATE.ACTION == 'PLACE' then
				DetachEntity(obj, 1, 1)
				DeleteEntity(obj)
				end
				STATE.ACTION = 'CONSUME'
			end
		end
			Citizen.Wait(1)
		end
	end)
end

RegisterNetEvent(GetCurrentResourceName()..':client:UseConsumeItem')
AddEventHandler(GetCurrentResourceName()..':client:UseConsumeItem', function(data, value, content)
	local type = Config.ConsumeItems[data].Type
		if content ~= 'nil' then
		STATE.GLASS_CONTENT = content
		else
			STATE.GLASS_CONTENT = 'nil'
		end
		STATE.ACTION = 'CONSUME'
		STATE.SIZE = value
		STATE.SELECT_ITEM = data
		STATE.USING = false
		TakeConsumeItem(data)
		ControlPanel(data)
end)


RegisterNetEvent(GetCurrentResourceName()..':client:UseTester')
AddEventHandler(GetCurrentResourceName()..':client:UseTester', function()
	STATE.ACTION = 'TESTER'
	UseTesterItem()
end)

RegisterNetEvent(GetCurrentResourceName()..':client:Notify')
AddEventHandler(GetCurrentResourceName()..':client:Notify', function(msg, type)
	Config.Notify(msg, type)
end)

