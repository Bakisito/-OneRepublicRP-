Config = {}
-- DISCORD : https://discord.gg/zcG9KQj3sa
-- STORE : https://store.devcore.cz/

Config.PlaceItems = {} -- DONT TOUCH --

-- QB CORE --
Config.QbCoreExport = function()
    return exports['qb-core']:GetCoreObject()
end

-- MAIN --
Config.SaveDB = true -- Storing placed items in the database (after restarting the server/script the items remain on the ground)
Config.DisableCombatButtons = true --Deactivate combat buttons when consuming
Config.AutoTake = { -- only for ox_inventory
    enable = false, -- true if the set items are to be used automatically if they are found in the inventory.
    items = { -- The listed items are automatically placed in your hand if they are in inventory and the item is not returned when you press the x button.
        'cola',
        'coffe',
        'sprunk'
    },
}

-- BUTTONS --
Config.Buttons = {
    Use = 38, -- Button for consumption
    AutoConsume = 58, -- Button for automatic consumption
    Give = 10, -- Button to give the item to the player
    PlaceDistance = {scrollup = 50, scrolldown = 99},
    Place = 11, -- Button to place an item on the ground
    Hide = 105, -- Button to cancel consumption
    Accept = 38, -- Button to confirm that the item will be placed on the ground, Button to confirm the give of the item to the player 
    Take = 38, -- Button to pick up an item from the ground
    Pour = 172, -- Button for pouring drinks into glasses
    Back = 105 -- Button to return from the menu to place the item on the ground and give the item to the player
}

-- MENU CUSTOMIZE --
Config.Menu = {
    ['MAIN'] = {
        TextFont = 4,
        TextColor = {255, 255, 255},
        Scale = 0.4,
        Position = {x = 0.50, y = 0.95},
        Background = {
            enable = true,
            color = { r = 35, g = 35, b = 35, alpha = 200 },
        },
    },
    ['STATUS'] = {
        TextFont = 4,
        TextColor = {255, 255, 255},
        Scale = 0.4,
        Position = {x = 0.94, y = 0.94},
        Background = {
            enable = true,
            color = { r = 35, g = 35, b = 35, alpha = 200 },
        },
    },
    ['INFO'] = {
        TextFont = 4,
        TextColor = {255, 255, 255},
        Scale = 0.4,
        Position = {x = 0.94, y = 0.90},
        Background = {
            enable = true,
            color = { r = 35, g = 35, b = 35, alpha = 200 },
        },
    },

}

-- NOTIFY --
Config.Notify = function(message, style)

    QBCore.Functions.Notify(message, style)

end

-- STATUS --
Config.Status = { --Settings for adding food, drink, alcohol and removing stress
    ["FOOD"] = function(data) -- Trigger to increase hunger status
        TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + data.Consume.Status)
    end,
    ["DRINK"] = function(data) -- Trigger to increase thirst status
        TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + data.Consume.Status)
    end,
    ["STRESS"] = function(data) -- Trigger to increase stress status
        TriggerServerEvent('hud:server:RelieveStress', data.Consume.Stress)
    end,
    ["ALCOHOL"] = function(data)
        setAlcohol(data.Consume.Alcohol)
    end,
}

-- DRUNK SYSTEM -- 
Config.DrunkSystem = {
    TesterItem = 'alcotester', -- Item name for breath test
    ResultTime = 3, -- Duration per breath test result in seconds
    Driving = true, -- Difficult driving under the influence of alcohol
    DisableSprint = true, -- No sprinting while drunk walking
    Ragdoll = true, --true if you want a drunk player to occasionally fall to the ground while walking.
    MaxDrunk = 2.3, -- blood alcohol limit
    Time = 10, -- Effect update time in seconds
    Remove = 0.05, -- Removal of alcohol from the blood after updating the effect
    Effect = "spectator5", -- Effect of drunkenness
    MovementTime = 3, -- -- the lower the time you give the harder it will be for the drunk driver to drive the vehicle
    RandomVehicleInteraction = { -- Drunk driving interactions
        {interaction = 10, time = 300}, --turn left and restore wheel pos
        {interaction = 11, time = 300}, --turn right and restore wheel pos
        {interaction = 10, time = 500}, --turn left and restore wheel pos
        {interaction = 11, time = 500}, --turn right and restore wheel pos
    },
}

-- MENU AND TEXT --
Translations = {
    ['MENU'] = {
        ['use_menu'] = '~g~[E]~w~ Usar ~g~[G]~w~ Auto ~g~[PGUP]~w~ Dar ~g~[PGDN]~w~ Colocar ~g~[X]~w~ Guardar',
        ['empty_glass'] = '~g~[PGUP]~w~ Dar ~g~[PGDN]~w~ Colocar ~g~[X]~w~ Guardar',
        ['back'] = '~g~[X]~w~ Atras',
        ['give_menu'] = '~g~[E]~w~ Dar ~g~[X]~w~ Atras',
        ['place_menu'] = '~g~[E]~w~ Colocar ~g~[X]~w~ Atras',
        ['item_placed_menu'] = '~g~[E]~w~ Tomar',
        ['pour_menu'] = '~g~[AUP]~w~ Servir',
        ['tester_menu'] = '~g~[E]~w~ Usar ~g~[X]~w~ Guardar',
    },
    ['TEXT'] = { 
        ['already'] = 'Ya tienes algo en la mano',
        ['player_already'] = 'El jugador ya está consumiendo algo',
        ['max_drunk'] = 'Miop.. ute ta virao como una media ya, bajale a la bebida',
        ['add_content'] = 'Cuánto añadir ml en ',
        ['large_number'] = 'No es posible verter en un vaso más de lo que cabe',
        ['no_near_you'] = 'No hay nadie cerca de ti',
        ['result'] = 'Resultado: ',
        ['request_rejected'] = 'La persona se negó a someterse a la prueba de alcoholemia',
        ['request_text'] = 'Solicitud de prueba de alcoholemia',
        ['waiting'] = ' Esperando..',
    },
}