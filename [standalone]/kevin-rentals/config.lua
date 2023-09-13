Config = Config or {}

Config.PaymentType = 'cash' -- cash / bank used for when returning vehicles
Config.FuelScript = 'LegacyFuel' -- cdn-fuel / ps-fuel / lj-fuel / LegacyFuel
Config.MoneyReturn = 0.6 -- this is 60% money return once the rental vehicle is returned
Config.Locations = {
    [1] = {
        blip = {
            sprite = 225, color = 46, shortrange = true, scale = 0.75, name = 'Alquiler de vehículos',
        },
        ped = {
            hash = `s_m_y_valet_01`,
            coords = vector4(110.29, -1088.75, 29.3, 355.0),
            scenario = 'WORLD_HUMAN_CLIPBOARD',
            icon = 'fas fa-car',
        },
        vehicles = {
            [1] = {
                vehicleimage = 'https://cdn.discordapp.com/attachments/1106092937948962817/1106294576446185532/image.png', -- Image of the vehicle 
                vehiclehash = 'crfsm', -- Name of the vehicle
                icon = 'fas fa-car',
                gas = math.random(30, 70), -- Random amount of gas the vehicle will have 
                price = 500, -- Price of the vehicle to rent
            },
            [2] = {
                vehicleimage = 'https://cdn.discordapp.com/attachments/1106092937948962817/1106294576853045268/image.png',
                vehiclehash = 'bison', icon = 'fas fa-car', gas = math.random(30, 70), price = 1500,
            },
            [3] = {
                vehicleimage = 'https://cdn.discordapp.com/attachments/1106092937948962817/1106294577310216262/image.png',
                vehiclehash = 'surge', icon = 'fas fa-car', gas = math.random(30, 70), price = 900,
            },
            [4] = {
                vehicleimage = 'https://cdn.discordapp.com/attachments/1106092937948962817/1106294577800945694/image.png',
                vehiclehash = 'sanchez', icon = 'fas fa-car', gas = math.random(30, 70), price = 800,
            },
        },
        spawnpoints = {
            vector4(104.22, -1078.56, 28.59, 337.64),
            vector4(108.02, -1079.43, 28.59, 340.45),
            vector4(111.42, -1080.65, 28.59, 339.63),
            vector4(117.54, -1081.83, 28.59, 0.05),
            vector4(121.1, -1081.53, 28.59, 358.75),
            vector4(124.78, -1081.5, 28.59, 359.93),
        },
    },
    [2] = {
        blip = {
            sprite = 410, color = 46, shortrange = true, scale = 0.75, name = 'Alquiler de barcos',
        },
        ped = {
            hash = `MP_M_BoatStaff_01`,
            coords = vector4(-1612.6, -1126.87, 2.32, 148.86),
            scenario = 'WORLD_HUMAN_CLIPBOARD',
            icon = 'fas fa-anchor',
        },
        vehicles = {
            [1] = {
                vehicleimage = 'https://wiki.rage.mp/images/thumb/e/e7/Seashark.png/800px-Seashark.png',
                vehiclehash = 'seashark', icon = 'fas fa-anchor', gas = math.random(30, 70), price = 200,
            },
            [2] = {
                vehicleimage = 'https://wiki.rage.mp/images/thumb/5/56/Dinghy3.png/164px-Dinghy3.png',
                vehiclehash = 'dinghy3', icon = 'fas fa-anchor', gas = math.random(30, 70), price = 6000,
            },
            [3] = {
                vehicleimage = 'https://wiki.rage.mp/images/thumb/e/e6/Jetmax.png/164px-Jetmax.png',
                vehiclehash = 'jetmax', icon = 'fas fa-anchor', gas = math.random(30, 70), price = 50000,
            },
            [4] = {
                vehicleimage = 'https://wiki.rage.mp/images/thumb/7/70/Marquis.png/164px-Marquis.png',
                vehiclehash = 'marquis', icon = 'fas fa-anchor', gas = math.random(30, 70), price = 5000,
            },
            [5] = {
                vehicleimage = 'https://wiki.rage.mp/images/thumb/3/34/0x6EF89CCC.png/164px-0x6EF89CCC.png',
                vehiclehash = 'longfin', icon = 'fas fa-anchor', gas = math.random(30, 70), price = 10000,
            },
            [6] = {
                vehicleimage = 'https://wiki.rage.mp/images/thumb/e/ec/Squalo.png/164px-Squalo.png',
                vehiclehash = 'squalo', icon = 'fas fa-anchor', gas = math.random(30, 70), price = 4000,
            },
            [7] = {
                vehicleimage = 'https://wiki.rage.mp/images/thumb/2/27/Suntrap.png/164px-Suntrap.png',
                vehiclehash = 'suntrap', icon = 'fas fa-anchor', gas = math.random(30, 70), price = 500,
            },
        },
        spawnpoints = {
            vector4(-1632.98, -1155.1, 0.52, 134.7),
            vector4(-1620.17, -1173.41, 0.26, 142.04),
            vector4(-1633.01, -1170.65, 0.28, 41.54),
            vector4(-1640.71, -1143.77, 0.68, 137.3)
        },
    },
    [3] = {
        blip = {
            sprite = 410, color = 46, shortrange = true, scale = 0.75, name = 'Alquiler de barcos',
        },
        ped = {
            hash = `MP_M_BoatStaff_01`,
            coords = vector4(3862.01, 4465.01, 2.72, 180.68),
            scenario = 'WORLD_HUMAN_CLIPBOARD',
            icon = 'fas fa-anchor',
        },
        vehicles = {
            [1] = {
                vehicleimage = 'https://wiki.rage.mp/images/thumb/e/e7/Seashark.png/800px-Seashark.png',
                vehiclehash = 'seashark', icon = 'fas fa-anchor', gas = math.random(30, 70), price = 200,
            },
            [2] = {
                vehicleimage = 'https://wiki.rage.mp/images/thumb/5/56/Dinghy3.png/164px-Dinghy3.png',
                vehiclehash = 'dinghy3', icon = 'fas fa-anchor', gas = math.random(30, 70), price = 6000,
            },
            [3] = {
                vehicleimage = 'https://wiki.rage.mp/images/thumb/e/e6/Jetmax.png/164px-Jetmax.png',
                vehiclehash = 'jetmax', icon = 'fas fa-anchor', gas = math.random(30, 70), price = 50000,
            },
            [4] = {
                vehicleimage = 'https://wiki.rage.mp/images/thumb/7/70/Marquis.png/164px-Marquis.png',
                vehiclehash = 'marquis', icon = 'fas fa-anchor', gas = math.random(30, 70), price = 5000,
            },
            [5] = {
                vehicleimage = 'https://wiki.rage.mp/images/thumb/3/34/0x6EF89CCC.png/164px-0x6EF89CCC.png',
                vehiclehash = 'longfin', icon = 'fas fa-anchor', gas = math.random(30, 70), price = 10000,
            },
            [6] = {
                vehicleimage = 'https://wiki.rage.mp/images/thumb/e/ec/Squalo.png/164px-Squalo.png',
                vehiclehash = 'squalo', icon = 'fas fa-anchor', gas = math.random(30, 70), price = 4000,
            },
            [7] = {
                vehicleimage = 'https://wiki.rage.mp/images/thumb/2/27/Suntrap.png/164px-Suntrap.png',
                vehiclehash = 'suntrap', icon = 'fas fa-anchor', gas = math.random(30, 70), price = 500,
            },
        },
        spawnpoints = {
            vector4(3856.63, 4455.45, 0.27, 268.8),
        },
    },

    -- To add more locations simply copy the array above an simply change the number and the information within
}