local mpxmenu = MenuV:CreateMenu(false, 'Customizing weapon...', 'topleft', 0, 195, 227)

local spawnmpx = mpxmenu:AddButton({ icon = '📋', label = 'Spawn Sig Sauer MPX', value = 'spawner', description = 'Spawn your Sig Sauer MPX' })
local despawnmpx = mpxmenu:AddButton({ icon = '📋', label = 'DeSpawn Sig Sauer MPX', value = 'despawner', description = 'DeSpawn your Sig Sauer MPX' })

local magazines = mpxmenu:AddSlider({ icon = '🔫', label = 'Magazines', value = 'magazines', values = {
    { label = 'Stock Magazine', value = 'mag1', description = 'Add a 20rnd Magazine' },
    { label = '41rnd Magazine', value = 'mag2', description = 'Add a 41rnd Magazine' },
    { label = '50rnd Stick Magazine', value = 'mag3', description = 'Add a 50rnd Magazine' }
}})

local barrels = mpxmenu:AddSlider({ icon = '🔫', label = 'Barrels', value = 'barrels', values = {
    { label = '114mm Barrel', value = 'barrel1', description = 'Add a 114mm barrel' },
    { label = '114mm ISBarrel', value = 'barrel2', description = 'Add a 114mm barrel' },
    { label = '114mm SBarrel', value = 'barrel3', description = 'Add a 114mm barrel' },
    { label = '165mm Barrel', value = 'barrel4', description = 'Add a 165mm barrel' },
    { label = '165mm ISBarrel', value = 'barrel5', description = 'Add a 165mm barrel' },
    { label = '165mm SBarrel', value = 'barrel6', description = 'Add a 165mm barrel' },
    { label = '205mm Barrel', value = 'barrel7', description = 'Add a 205mm barrel' },
    { label = '205mm SBarrel', value = 'barrel8', description = 'Add a 205mm barrel' },
    { label = '265mm Barrel', value = 'barrel9', description = 'Add a 265mm barrel' },
    { label = '265mm SBarrel', value = 'barrel10', description = 'Add a 265mm barrel' },
    { label = '355mm Barrel', value = 'barrel11', description = 'Add a 355mm barrel' },
    { label = '355mm SBarrel', value = 'barrel12', description = 'Add a 355mm barrel' },
}})

local handguards = mpxmenu:AddSlider({ icon = '🔫', label = 'Handguards', value = 'handguards', values = {
    { label = 'Handguard #1', value = 'handguard1', description = 'Add a handguard #1' },
    { label = 'Handguard #2', value = 'handguard2', description = 'Add a handguard #2' },
    { label = 'Handguard #3', value = 'handguard3', description = 'Add a handguard #3' },
    { label = 'Handguard #4', value = 'handguard4', description = 'Add a handguard #4' },
    { label = 'Handguard #5', value = 'handguard5', description = 'Add a handguard #5' },
    { label = 'Handguard #6', value = 'handguard6', description = 'Add a handguard #6' }
}})

local stocks = mpxmenu:AddSlider({ icon = '🔫', label = 'Stocks', value = 'stocks', values = {
    { label = 'Stock #1', value = 'stock1', description = 'Add a stock #1' },
    { label = 'Stock #2', value = 'stock2', description = 'Add a stock #2' },
    { label = 'Stock #3', value = 'stock3', description = 'Add a stock #3' },
    { label = 'Stock #4', value = 'stock4', description = 'Add a stock #4' },
    { label = 'Stock #5', value = 'stock5', description = 'Add a stock #5' },
    { label = 'Stock #6', value = 'stock6', description = 'Add a stock #6' },
    { label = 'Stock #7', value = 'stock7', description = 'Add a stock #7' },
    { label = 'Stock #8', value = 'stock8', description = 'Add a stock #8' },
    { label = 'Stock #9', value = 'stock9', description = 'Add a stock #9' },
    { label = 'Stock #10', value = 'stock10', description = 'Add a stock #10' }
}})


local flash = mpxmenu:AddSlider({ icon = '🔫', label = 'Flashlights', value = 'flash', values = {
    { label = 'Flashlight #1', value = 'flash1', description = 'Add a Flashlight #1' },
    { label = 'Flashlight #2', value = 'flash2', description = 'Add a Flashlight #2' },
    { label = 'Flashlight #3', value = 'flash3', description = 'Add a Flashlight #3' },
    { label = 'Flashlight #4', value = 'flash4', description = 'Add a Flashlight #4' },
    { label = 'Flashlight #5', value = 'flash5', description = 'Add a Flashlight #5' },
    { label = 'Flashlight #6', value = 'flash6', description = 'Add a Flashlight #6' },
    { label = 'Flashlight #7', value = 'flash7', description = 'Add a Flashlight #7' },
    { label = 'Flashlight #8', value = 'flash8', description = 'Add a Flashlight #8' }
}})

local scopes = mpxmenu:AddSlider({ icon = '🔫', label = 'Scopes', value = 'scopes', values = {
    { label = 'Ironsights', value = 'scope1', description = 'Add ironsights #1' },
    { label = 'Scope #1', value = 'scope2', description = 'Add a scope #1' },
    { label = 'Scope #2', value = 'scope3', description = 'Add a scope #2' },
    { label = 'Scope #3', value = 'scope4', description = 'Add a scope #3' },
    { label = 'Scope #4', value = 'scope5', description = 'Add a scope #4' },
    { label = 'Scope #5', value = 'scope6', description = 'Add a scope #5' },
    { label = 'Scope #6', value = 'scope7', description = 'Add a scope #6' },
    { label = 'Scope #7', value = 'scope8', description = 'Add a scope #7' },
    { label = 'Scope #8', value = 'scope9', description = 'Add a scope #8' }
}})

spawnmpx:On('select', function(item, value) 
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), 9999, true, true)
end)

despawnmpx:On('select', function(item, value) 
    RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"))
end)



magazines:On('select', function(item, value) 
    if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey("weapon_mpx"), false) then
        if (('%s'):format(value)) == "mag1" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_CLIP_01"))
        elseif (('%s'):format(value)) == "mag2" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_CLIP_02"))
        elseif (('%s'):format(value)) == "mag3" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_CLIP_03"))
        end
    end
end)

barrels:On('select', function(item, value) 
    if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey("weapon_mpx"), false) then
        if (('%s'):format(value)) == "barrel1" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_BARREL_01"))
        elseif (('%s'):format(value)) == "barrel2" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_BARREL_02"))
        elseif (('%s'):format(value)) == "barrel3" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_BARREL_03"))
        elseif (('%s'):format(value)) == "barrel4" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_BARREL_04"))
        elseif (('%s'):format(value)) == "barrel5" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_BARREL_05"))
        elseif (('%s'):format(value)) == "barrel6" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_BARREL_06"))
        elseif (('%s'):format(value)) == "barrel7" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_BARREL_07"))
        elseif (('%s'):format(value)) == "barrel8" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_BARREL_08"))
        elseif (('%s'):format(value)) == "barrel9" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_BARREL_09"))
        elseif (('%s'):format(value)) == "barrel10" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_BARREL_10"))
        elseif (('%s'):format(value)) == "barrel11" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_BARREL_11"))
        elseif (('%s'):format(value)) == "barrel12" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_BARREL_12"))
        end
    end
end)

handguards:On('select', function(item, value) 
    if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey("weapon_mpx"), false) then
        if (('%s'):format(value)) == "handguard1" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_HANDGUARD_01"))
        elseif (('%s'):format(value)) == "handguard2" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_HANDGUARD_02"))
        elseif (('%s'):format(value)) == "handguard3" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_HANDGUARD_03"))
        elseif (('%s'):format(value)) == "handguard4" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_HANDGUARD_04"))
        elseif (('%s'):format(value)) == "handguard5" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_HANDGUARD_05"))
        elseif (('%s'):format(value)) == "handguard6" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_HANDGUARD_06"))
        end
    end
end)

stocks:On('select', function(item, value) 
    if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey("weapon_mpx"), false) then
        if (('%s'):format(value)) == "stock1" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_STOCK_01"))
        elseif (('%s'):format(value)) == "stock2" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_STOCK_02"))
        elseif (('%s'):format(value)) == "stock3" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_STOCK_03"))
        elseif (('%s'):format(value)) == "stock4" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_STOCK_04"))
        elseif (('%s'):format(value)) == "stock5" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_STOCK_05"))
        elseif (('%s'):format(value)) == "stock6" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_STOCK_06"))
        elseif (('%s'):format(value)) == "stock7" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_STOCK_07"))
        elseif (('%s'):format(value)) == "stock8" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_STOCK_08"))
        elseif (('%s'):format(value)) == "stock9" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_STOCK_09"))
        elseif (('%s'):format(value)) == "stock10" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_STOCK_10"))
        end
    end
end)

flash:On('select', function(item, value) 
    if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey("weapon_mpx"), false) then
        if (('%s'):format(value)) == "flash1" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_FLSH_01"))
        elseif (('%s'):format(value)) == "flash2" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_FLSH_02"))
        elseif (('%s'):format(value)) == "flash3" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_FLSH_03"))
        elseif (('%s'):format(value)) == "flash4" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_FLSH_04"))
        elseif (('%s'):format(value)) == "flash5" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_FLSH_05"))
        elseif (('%s'):format(value)) == "flash6" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_FLSH_06"))
        elseif (('%s'):format(value)) == "flash7" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_FLSH_07"))
        elseif (('%s'):format(value)) == "flash8" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_FLSH_08"))
        end
    end
end)

scopes:On('select', function(item, value) 
    if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey("weapon_mpx"), false) then
        if (('%s'):format(value)) == "scope1" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_SCOPE_01"))
        elseif (('%s'):format(value)) == "scope2" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_SCOPE_02"))
        elseif (('%s'):format(value)) == "scope3" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_SCOPE_03"))
        elseif (('%s'):format(value)) == "scope4" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_SCOPE_04"))
        elseif (('%s'):format(value)) == "scope5" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_SCOPE_05"))
        elseif (('%s'):format(value)) == "scope6" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_SCOPE_06"))
        elseif (('%s'):format(value)) == "scope7" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_SCOPE_07"))
        elseif (('%s'):format(value)) == "scope8" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_SCOPE_08"))
        elseif (('%s'):format(value)) == "scope9" then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_mpx"), GetHashKey("COMPONENT_MPX_SCOPE_09"))
        end
    end
end)

RegisterCommand('mpx', function(source, args, RawCommand)
    local ped = GetPlayerPed(-1)
    MenuV:OpenMenu(mpxmenu)
end)
