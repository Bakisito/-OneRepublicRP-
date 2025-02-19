Config = {}

Config.WebhookUrl = "https://discord.com/api/webhooks/1092237792047792212/54M4p4umxA_RqdMESM5lMFlRqRhcMzWg_nAOGp24FExwEYE0kY4Lyt9tRNB15lmy7ol2"

Config.discount = 0.65 -- Percent that is deducted from the car price 10%

Config.pickupblip = vector3(-1327.479736328, -86.045326232910, 49.31)

Config.carspawn = vector4(1253.15, -3070.58, 5.9, 95.51) ----- Same as pickupblip

Config.deliveryblip = {
    vector3(-31.37, -1089.87, 26.42), -- PDM delivery location
    vector3(-1637.95, -3102.1, 13.94), -- AIR delivery location
}
-----------------------------------------------------------------------------
Config.UsingTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Commission = 0.15 -- Percent that goes to sales person from a full car sale 10%
Config.FinanceCommission = 0.05 -- Percent that goes to sales person from a finance sale 5%
Config.FinanceZone = vector3(-28.11, -1108.57, 27.27)-- Where the finance menu is located
Config.PaymentWarning = 10 -- time in minutes that player has to make payment before repo
Config.PaymentInterval = 24 -- time in hours between payment being due
Config.MinimumDown = 10 -- minimum percentage allowed down
Config.MaximumPayments = 24 -- maximum payments allowed
Config.PreventFinanceSelling = true -- allow/prevent players from using /transfervehicle if financed
Config.Shops = {
    ['pdm'] = {
        ['Type'] = 'managed', -- no player interaction is required to purchase a vehicle
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
                vector2(-60.387592315674, -1099.0018310547),
                vector2(-52.911975860596, -1078.4638671875),
                vector2(-18.03772354126, -1090.8881835938),
                vector2(-25.61664390564, -1111.6782226562)
            },
            ['minZ'] = 26.047220230103, -- min height of the shop zone
            ['maxZ'] = 27.0472240448, -- max height of the shop zone
            ['size'] = 2.75 -- size of the vehicles zones
        },
        ['Job'] = 'cardealer', -- Name of job or none
        ['showDuty'] = true, -- true or false
        ['Duty'] = vector3(-32.35, -1099.3, 28.39),
        ['ShopLabel'] = 'Premium Deluxe Motorsport', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 326, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['TestDriveTimeLimit'] = 1.0, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-45.67, -1098.34, 26.42), -- Blip Location
        ['ReturnLocation'] = vector3(-36.97, -1079.14, 27.04), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-23.62, -1094.35, 26.68, 340.02), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-41.73, -1077.77, 26.41, 71.21), -- Spawn location for test drive
        ['spawn'] = vector3(1220.29, -3019.41, 5.87), -- Spawn location for STOCK BOUGHT
        ['pickupblip'] = vector3(1220.29, -3019.41, 5.87), -- BLIP location for PICKUPBLIP (SAME AS SPAWN COORDS)
        ['deliveryblip'] = vector3(-23.66, -1094.41, 26.7), -- BLIP location AND DELIVERY location
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-47.3, -1091.93, 26.3, 194.58), -- where the vehicle will spawn on display
                defaultVehicle = 'focusrs', -- Default display vehicle
                chosenVehicle = 'focusrs', -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-54.48, -1097.1, 26.3, 47.41),
                defaultVehicle = '22sierrapro',
                chosenVehicle = '22sierrapro'
            },
            [3] = {
                coords =vector4(-36.72, -1093.18, 26.3, 95.08),
                defaultVehicle = 'asea',
                chosenVehicle = 'asea'
            },
            [4] = {
                coords = vector4(-49.84, -1083.58, 26.3, 177.37),
                defaultVehicle = '22navi',
                chosenVehicle = '22navi'
            },
            [5] = {
                coords = vector4(-41.95, -1101.76, 26.3, 41.64),
                defaultVehicle = '23ramtrxoi',
                chosenVehicle = '23ramtrxoi'
            },
            [6] = {
                coords = vector4(-52.25, -1089.85, 26.27, 121.28),
                defaultVehicle = 'jango',
                chosenVehicle = 'jango'
            }
        },
    },
    -- ['luxury'] = {
    --     ['Type'] = 'managed', -- meaning a real player has to sell the car
    --     ['Zone'] = {
    --         ['Shape'] = {
    --             vector2(-1260.6973876953, -349.21334838867),
    --             vector2(-1268.6248779297, -352.87365722656),
    --             vector2(-1274.1533203125, -358.29794311523),
    --             vector2(-1273.8425292969, -362.73715209961),
    --             vector2(-1270.5701904297, -368.6716003418),
    --             vector2(-1266.0561523438, -375.14080810547),
    --             vector2(-1244.3684082031, -362.70278930664),
    --             vector2(-1249.8704833984, -352.03326416016),
    --             vector2(-1252.9503173828, -345.85726928711)
    --         },
    --         ['minZ'] = 36.646457672119,
    --         ['maxZ'] = 37.516143798828,
    --         ['size'] = 2.75 -- size of the vehicles zones
    --     },
    --     ['Job'] = 'cardealer', -- Name of job or none
    --     ['showDuty'] = false, -- true or false
    --     ['Duty'] = vector3(-45.67, -1098.34, 26.42),
    --     ['ShopLabel'] = 'Luxury Vehicle Shop',
    --     ['showBlip'] = true, -- true or false
    --     ['blipSprite'] = 326, -- Blip sprite
    --     ['blipColor'] = 3, -- Blip color
    --     ['TestDriveTimeLimit'] = 0.5,
    --     ['Location'] = vector3(-1255.6, -361.16, 36.91),
    --     ['ReturnLocation'] = vector3(-1231.46, -349.86, 37.33),
    --     ['VehicleSpawn'] = vector4(-1231.46, -349.86, 37.33, 26.61),
    --     ['spawn'] = vector3(-1243.8, -327.81, 37.21), -- Spawn location for STOCK BOUGHT
    --     ['pickupblip'] = vector3(-1243.8, -327.81, 37.21), -- BLIP location for PICKUPBLIP (SAME AS SPAWN COORDS)
    --     ['deliveryblip'] = vector3(-1248.83, -357.93, 36.91), -- BLIP location AND DELIVERY location
    --     ['TestDriveSpawn'] = vector4(-1232.81, -347.99, 37.33, 23.28), -- Spawn location for test drive
    --     ['ShowroomVehicles'] = {
    --         [1] = {
    --             coords = vector4(-1265.31, -354.44, 35.91, 205.08),
    --             defaultVehicle = 'italirsx',
    --             chosenVehicle = 'italirsx'
    --         },
    --         [2] = {
    --             coords = vector4(-1270.06, -358.55, 35.91, 247.08),
    --             defaultVehicle = 'italigtb',
    --             chosenVehicle = 'italigtb'
    --         },
    --         [3] = {
    --             coords = vector4(-1269.21, -365.03, 35.91, 297.12),
    --             defaultVehicle = 'nero',
    --             chosenVehicle = 'nero'
    --         },
    --         [4] = {
    --             coords = vector4(-1252.07, -364.2, 35.91, 56.44),
    --             defaultVehicle = 'bati',
    --             chosenVehicle = 'bati'
    --         },
    --         [5] = {
    --             coords = vector4(-1255.49, -365.91, 35.91, 55.63),
    --             defaultVehicle = 'carbonrs',
    --             chosenVehicle = 'carbonrs'
    --         },
    --         [6] = {
    --             coords = vector4(-1249.21, -362.97, 35.91, 53.24),
    --             defaultVehicle = 'hexer',
    --             chosenVehicle = 'hexer'
    --         },
    --     }
    -- }, -- Add your next table under this comma
    ['boats'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a vehicle
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
                vector2(-729.39, -1315.84),
                vector2(-766.81, -1360.11),
                vector2(-754.21, -1371.49),
                vector2(-716.94, -1326.88)
            },
            ['minZ'] = 0.0, -- min height of the shop zone
            ['maxZ'] = 5.0, -- max height of the shop zone
            ['size'] = 6.2 -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['showDuty'] = false, -- true or false
        ['Duty'] = vector3(-45.67, -1098.34, 26.42),
        ['ShopLabel'] = 'Marina Shop', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 410, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['TestDriveTimeLimit'] = 1.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-738.25, -1334.38, 1.6), -- Blip Location
        ['ReturnLocation'] = vector3(-714.34, -1343.31, 0.0), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-727.87, -1353.1, -0.17, 137.09), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-722.23, -1351.98, 0.14, 135.33), -- Spawn location for test drive
        ['spawn'] = vector3(-768.9, -1378.7, 0.4), -- Spawn location for STOCK BOUGHT
        ['pickupblip'] = vector3(-768.9, -1378.7, 0.4), -- BLIP location for PICKUPBLIP (SAME AS SPAWN COORDS)
        ['deliveryblip'] = vector3(-749.94, -1354.6, 1.55), -- BLIP location AND DELIVERY location
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-727.05, -1326.59, 0.00, 229.5), -- where the vehicle will spawn on display
                defaultVehicle = 'seashark', -- Default display vehicle
                chosenVehicle = 'seashark' -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-732.84, -1333.5, -0.50, 229.5),
                defaultVehicle = 'dinghy',
                chosenVehicle = 'dinghy'
            },
            [3] = {
                coords = vector4(-737.84, -1340.83, -0.50, 229.5),
                defaultVehicle = 'speeder',
                chosenVehicle = 'speeder'
            },
            [4] = {
                coords = vector4(-741.53, -1349.7, -2.00, 229.5),
                defaultVehicle = 'marquis',
                chosenVehicle = 'marquis'
            },
        },
    },
    ['air'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a vehicle
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
                vector2(-1607.58, -3141.7),
                vector2(-1672.54, -3103.87),
                vector2(-1703.49, -3158.02),
                vector2(-1646.03, -3190.84)
            },
            ['minZ'] = 12.99, -- min height of the shop zone
            ['maxZ'] = 16.99, -- max height of the shop zone
            ['size'] = 7.0, -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['showDuty'] = false, -- true or false
        ['Duty'] = vector3(-45.67, -1098.34, 26.42),
        ['ShopLabel'] = 'Air Shop', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 251, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['TestDriveTimeLimit'] = 1.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-1652.76, -3143.4, 13.99), -- Blip Location
        ['ReturnLocation'] = vector3(-1628.44, -3104.7, 13.94), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-1617.49, -3086.17, 13.94, 329.2), -- Spawn location when vehicle is bought
        ['spawn'] = vector3(-1738.28, -3048.66, 13.82), -- Spawn location for STOCK BOUGHT
        ['pickupblip'] = vector3(-1738.28, -3048.66, 13.82), -- BLIP location for PICKUPBLIP (SAME AS SPAWN COORDS)
        ['deliveryblip'] = vector3(-1642.55, -3105.58, 13.62), -- Spawn location for PICKUPBLIP (SAME AS SPAWN COORDS)
        ['TestDriveSpawn'] = vector4(-1625.19, -3103.47, 13.94, 330.28), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-1651.36, -3162.66, 12.99, 346.89), -- where the vehicle will spawn on display
                defaultVehicle = 'volatus', -- Default display vehicle
                chosenVehicle = 'volatus' -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-1668.53, -3152.56, 12.99, 303.22),
                defaultVehicle = 'luxor2',
                chosenVehicle = 'luxor2'
            },
            [3] = {
                coords = vector4(-1632.02, -3144.48, 12.99, 31.08),
                defaultVehicle = 'nimbus',
                chosenVehicle = 'nimbus'
            },
            [4] = {
                coords = vector4(-1663.74, -3126.32, 12.99, 275.03),
                defaultVehicle = 'frogger',
                chosenVehicle = 'frogger'
            },
        },
    },
    -- ['truck'] = {
    --     ['Type'] = 'free-use', -- no player interaction is required to purchase a car
    --     ['Zone'] = {
    --         ['Shape'] = {--polygon that surrounds the shop
    --             vector2(872.23, -1173.5),
    --             vector2(868.88, -1162.7),
    --             vector2(900.91, -1156.54),
    --             vector2(901.96, -1173.71),
    --             vector2(883.59, -1174.47),
    --             vector2(884.59, -1161.29),
    --             vector2(890.06, -1155.0),
    --             vector2(907.71, -1168.71)
    --         },
    --         ['minZ'] = 23.0, -- min height of the shop zone
    --         ['maxZ'] = 28.0, -- max height of the shop zone
    --         ['size'] = 5.75 -- size of the vehicles zones
    --     },
    --     ['Job'] = 'none', -- Name of job or none
    --     ['showDuty'] = false, -- true or false
    --     ['Duty'] = vector3(-45.67, -1098.34, 26.42),
    --     ['ShopLabel'] = 'Truck Motor Shop', -- Blip name
    --     ['showBlip'] = true, -- true or false
    --     ['blipSprite'] = 477, -- Blip sprite
    --     ['blipColor'] = 2, -- Blip color
    --     ['TestDriveTimeLimit'] = 0.5, -- Time in minutes until the vehicle gets deleted
    --     ['Location'] = vector3(900.47, -1155.74, 25.16), -- Blip Location
    --     ['ReturnLocation'] = vector3(900.47, -1155.74, 25.16), -- Location to return vehicle, only enables if the vehicleshop has a job owned
    --     ['VehicleSpawn'] = vector4(909.35, -1181.58, 25.55, 177.57), -- Spawn location when vehicle is bought
    --     ['spawn'] = vector3(908.55, -1175.22, 25.38), -- Spawn location for STOCK BOUGHT
    --     ['pickupblip'] =vector3(908.55, -1175.22, 25.38), -- BLIP location for PICKUPBLIP (SAME AS SPAWN COORDS)
    --     ['deliveryblip'] = vector3(892.3, -1167.34, 25.03), -- BLIP location AND DELIVERY location
    --     ['TestDriveSpawn'] = vector4(867.65, -1192.4, 25.37, 95.72), -- Spawn location for test drive
    --     ['ShowroomVehicles'] = {
    --         [1] = {
    --             coords = vector4(890.84, -1170.92, 25.08, 269.58), -- where the vehicle will spawn on display
    --             defaultVehicle = 'hauler', -- Default display vehicle
    --             chosenVehicle = 'hauler', -- Same as default but is dynamically changed when swapping vehicles
    --         },
    --         [2] = {
    --             coords = vector4(878.45, -1171.04, 25.05, 273.08),
    --             defaultVehicle = 'phantom',
    --             chosenVehicle = 'phantom'
    --         },
    --         [3] = {
    --             coords = vector4(880.44, -1163.59, 24.87, 273.08),
    --             defaultVehicle = 'mule',
    --             chosenVehicle = 'mule'
    --         },
    --         [4] = {
    --             coords = vector4(896.95, -1162.62, 24.98, 273.08),
    --             defaultVehicle = 'mixer',
    --             chosenVehicle = 'mixer'
    --         },
    --     },
    -- },
}
