Config = {}

Config.DeepSeaDistance = -4342.89
Config.NormalBait = 'baitfish'
Config.DeepSeaBait = 'squid'
Config.BaitUses = 2

Config.FishSellSpot = vector3(-1280.5, -1328.87, 4.09)
Config.IllegalSellSpot = vector3(-1014.22, -1366.48, 5.55)

Config.MinFishingTime = 5000
Config.MaxFishingTime = 50000
Config.MIBChance = 10

Config.FishAnywhere = true -- This allows you to fish anywhere
Config.MinNorth = 7700 -- Min distance to fish (This is a players POSITIVE Y Value)
Config.MinEast = 4300 -- Min distance to fish (This is a players POSITIVE X Value)
Config.MinWest = -3400-- Min distance to fish (This is a players NEGATIVE X Value)
Config.MinSouth = -4000 -- Min distance to fish (This is a players NEGATIVE Y Value)

Config.MiniGame = function(attempts)
    local p = promise.new()
    local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
    local counter = 0
    Skillbar.Start({
        duration = math.random(5000, 10000),
        pos = math.random(10, 30),
        width = math.random(10, 20),
    }, function()
        if counter + 1 >= attempts then
            p:resolve(true)
        else
            Skillbar.Repeat({
                duration = math.random(1500, 3000),
                pos = math.random(10, 30),
                width = math.random(5, 15),
            })
            counter = counter + 1
        end
    end, function()
        p:resolve(false)
    end)
    return Citizen.Await(p)
end

Config.CommonFish = {
    [1] = {
        name = 'yellowtail',
        price = 20,
    },
    [2] = {
        name = 'tuna',
        price = 25,
    },
    [3] = {
        name = 'sea_bass',
        price = 30,
    },
    [4] = {
        name = 'grupper',
        price = 35,
    },
    [5] = {
        name = 'salmon',
        price = 40,
    },
    [6] = {
        name = 'mahi_mahi',
        price = 45,
    }
}

Config.MediumFish = {
    [1] = {
        name = 'flounder',
        price = 60,
    },
    [2] = {
        name = 'cod',
        price = 55,
    }
}

Config.RareFish = {
    [1] = {
        name = 'orange_roughy',
        price = 60,
    },
    [2] = {
        name = 'blowfish',
        price = 70,
    }
}


Config.DeepSeaFish = {
    [1] = {
        name = 'turtle',
        price = 90,
    },
    [2] = {
        name = 'shark',
        price = 130,
    }
}

Config.MIB = {
    [1] = {
        coords = vector3(579.22,4166.1,37.9),
        message = 'Si estás recibiendo este mensaje, he estado perdido en el mar durante meses. Antes de partir, dejé un alijo lleno de golosinas en este lugar. Como estoy perdido en el mar, ya no lo necesito y no quiero que se desperdicie.',
        item1 = 'headbag',
        item1Amount = 1,
        item2 = 'cash',
        item2Amount = 600
    },
    [2] = {
        coords = false,
        message = 'S.O.S Estoy perdido en el mar. Escribí este mensaje sin esperanza de rescate, sino simplemente para hacerte saber que, quienquiera que seas, te odio por estar a salvo. Eso es todo.                 Firmado, Tipo que ya está muerto..',
        item1 = false,
        item1Amount = 0,
        item2 = false,
        item2Amount = 0
    },
    [3] = {
        coords = vector3(-25.35,2874.9,58.07),
        message = 'Para quien encuentre esta carta, escondí lo mas importante de mi vida en este lugar. Ya no estoy necesitado porque estoy perdido en el mar. No debí haber ido a pescar mientras bebía. Diablo Dios mio.',
        item1 = 'cash',
        item1Amount = 2500,
        item2 = false,
        item2Amount = 0
    },
    [4] = {
        coords = vector3(-2744.21,3569.02,1.16),
        message = '¡Los chicos me traicionaron! Sabía que el atraco iría de esta manera. Estaba preparado y escondí el botín en la ubicación de abajo. Eso les enseñará a respetar la 42.',
        item1 = 'cash',
        item1Amount = 2000,
        item2 = 'weapon_miniuzi',
        item2Amount = 1
    },

    [5] = {
        coords = vector3(-2166.28,5182.34,14.44),
        message = 'Quienquiera que encuentre esto, me abandonó brevemente en una pequeña isla ubicada [here] y luego fui arrastrado por la corriente. Dejé algunas cosas preciosas allí, por favor encuéntralas. ¡Y ENCUÉNTRAME!',
        item1 = 'cubancigar',
        item1Amount = 1,
        item2 = 'backpack2',
        item2Amount = 1
    },
    [6] = {
        coords = vector3(-3173.92, 1336.94, 6.23),
        message = 'Si encontraste esto, mi esposa probablemente me asesinó en el mar. Antes de irnos, escondí algunas cosas debajo de nuestra casa. Son tuyos ahora.',
        item1 = 'cash',
        item1Amount = 1200,
        item2 = 'ds_diamond',
        item2Amount = 1
    },
}