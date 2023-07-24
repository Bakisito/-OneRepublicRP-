Config = {}
Config.UsingTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Commission = 0.10 -- Percent that goes to sales person from a full car sale 10%
Config.FinanceCommission = 0.05 -- Percent that goes to sales person from a finance sale 5%
Config.FinanceZone = vector3(-29.53, -1103.67, 26.42)-- Where the finance menu is located
Config.PaymentWarning = 10 -- time in minutes that player has to make payment before repo
Config.PaymentInterval = 24 -- time in hours between payment being due
Config.MinimumDown = 10 -- minimum percentage allowed down
Config.MaximumPayments = 24 -- maximum payments allowed
Config.PreventFinanceSelling = true -- allow/prevent players from using /transfervehicle if financed
Config.Shops = {
    ['pd'] = {
        ['Type'] = 'free-use',  -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the shop
                 vector2(-18.5246925354, -1081.5234375),
                 vector2(-5.32461977005, -1086.2380371094),
                 vector2(-3.6382207870483, -1081.2329101562),
                 vector2(-15.464838027954, -1076.5571289062)
            },
            ['minZ'] = 26.047220230103,  -- min height of the shop zone
            ['maxZ'] = 27.0472240448  -- max height of the shop zone
        },
        ['Job'] = 'police', -- Name of job or none
        ['ShopLabel'] = 'PD CARS', -- Blip name
        ['Categories'] = { -- Categories available to browse
            ['police'] = 'Police Cars',
        },
        ['TestDriveTimeLimit'] = 0.5, -- Time in minutes until the vehicle gets deleted - default 0.5 (30 seconds)
        ['Location'] = {}, -- Blip Location
        ['ReturnLocation'] = vector4(-22.7560, -1094.6777, 26.15, 339.7901), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-42.9053, -1077.2017, 26.4349, 75.5430), -- Spawn location when vehicle is bought
        ['VehicleSpawnTest'] = vector4(-1900.7145, -3140.7463, 13.3375, 284.0718),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-10.4205, -1082.2305, 26.10, 71.3147), -- where the vehicle will spawn on display
                defaultVehicle = 'sh4', -- Default display vehicle
                chosenVehicle = 'sh4', -- Same as default but is dynamically changed when swapping vehicles
            }
        },
    },
    ['ems'] = {
        ['Type'] = 'free-use',  -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the shop
                vector2(312.85571289062, -574.2548828125),
                vector2(320.80267333984, -577.10290527344),
                vector2(319.3166809082, -581.56890869141),
                vector2(311.63848876953, -578.64141845703),
                vector2(311.47738647461, -578.90747070312)
            },
            ['minZ'] = 26.79686164856,  -- min height of the shop zone
            ['maxZ'] = 27.79686164856  -- max height of the shop zone
        },
        ['Job'] = 'ambulance', -- Name of job or none
        ['ShopLabel'] = 'EMS CARS', -- Blip name
        ['Categories'] = { -- Categories available to browse
            ['ambulance'] = 'EMS Cars',
        },
        ['TestDriveTimeLimit'] = 0.5, -- Time in minutes until the vehicle gets deleted - default 0.5 (30 seconds)
        ['Location'] = {}, -- Blip Location
        ['ReturnLocation'] = vector4(359.5, -545.02, 28.37, 267.43), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(330.01, -576.5, 28.42, 341.66), -- Spawn location when vehicle is bought
        ['VehicleSpawnTest'] = vector4(359.5, -545.02, 28.37, 267.43),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(317.41, -578.58, 27.80, 251.44), -- where the vehicle will spawn on display
                defaultVehicle = 'emskiastinger', -- Default display vehicle
                chosenVehicle = 'emskiastinger', -- Same as default but is dynamically changed when swapping vehicles
            }
        },
    }

}
