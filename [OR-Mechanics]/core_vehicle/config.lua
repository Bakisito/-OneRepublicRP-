Config = {

-------------------------------------------------------------
-- IMPORTANT  
-- All parts need to be added to inventory
-- Custom vehicle sounds for engines (https://www.gta5-mods.com/vehicles/brabus-inspired-custom-engine-sound-add-on-sound)
-------------------------------------------------------------

WhitelistedJobs = { -- Put jobs you want to use mechanic_tools
    'mechanic1','mechanic2','biembo','mechanic4','mechanic5'
},

UsingCoreInventory = false, -- Enables part removal and gives back items with saved health

WearRate = 200000, -- The rate parts wear off (Higher the value less wear on the parts)
UseMiles = false, -- If set to false it will use kilometers
UseRelativeValues = true, -- If set to true cars performance wouldnt be affected with stock parts. Otherwise stock car parts will make the car slower
UseT1gerMechanic = false, -- If set to true Vehicles will use the CarJack (toolbox) and Lift (mechanic_toolbox) from the t1ger_mechanic script. Look at the Readme for using this
DetectDistance = 3.0, -- Distance where vehicles are being detected
OnlyOwnedVehicles = false, -- Script excludes not owned cars

--Double UI
SetWaitTimeBeforeLoadHud = 500, -- Wait time for show/hide the HUD when entering/leaving the vehicle in ms. Play with this value


--Times to repair/install certain parts in miliseconds
EngineRepairTime = 40000, 
EngineInstallTime = 65000,

TurboRepairTime = 20000, 
TurboInstallTime = 35000,

NitroInstallTime = 20000,

OilInstallTime = 10000,

TransmissionInstallTime = 34000,
TransmissionRepairTime = 20000,

TireRepairTime = 5000,
TireInstallTime = 5000,

BreaksInstallTime = 7000,
BreaksRepairTime = 7000,

SuspensionInstallTime = 10000,
SuspensionRepairTime = 10000,


SparkPlugsInstallTime = 10000,
SparkPlugsRepairTime = 10000,

--Manual Transmition Keys
ShiftUp = 'LEFTSHIFT',
ShiftDown = 'LEFTCTRL',


MechanicWorkshop = { -- Mechanic Workshops where mechanics can use MechanicWorkshopAccess

    {coords = vector3(-289.0947265625,6372.568359375,30.578243255615), radius = 20.0},-- NoPixel Bennys
    {coords = vector3(140.03, -3025.14, 6.37), radius = 40.0}, -- Tuner Shop
    {coords = vector3(546.24, -176.87, 54.49), radius = 40.0}, -- Biembo auto parts

    
},

--Check engine, Low oil, Mileage location on screen
InfoBottom = 1,
InfoRight = 1,


-- Parts of vehicle certain condicions can access! For example with mechanic tool box you will be able to access parts mentioned in MechanicTools
-- PART LIST (engine, oil, brakes, suspension, turbo, nitro )

BearHandsAccessCommand = 'inspect',
BearHandsAccess = {
    ['oil'] = true
},

ToolBoxAccess = {
	['oil'] = true,
	['nitro'] = true,
    ['tires'] = true,
	['sparkplugs'] = true
},

MechanicToolsAccess = {
    ['oil'] = true,
	['nitro'] = true,
    ['tires'] = true,
	['brakes'] = true,
    ['suspension'] = true,
	['sparkplugs'] = true
},

MechanicWorkshopAccess = {
    ['oil'] = true,
    ['nitro'] = true,
    ['tires'] = true,
    ['brakes'] = true,
    ['suspension'] = true,
    ['engine'] = true,
    ['transmission'] = true,
    ['turbo'] = true,
	['sparkplugs'] = true
},


-- Parts that your vehicle will be able to use to modify its performance on the road. These parts also need to be added to the item databse.
-- usability - is to exclude some parts to be used on some vehicles exclusive is usually car spawn code
-- power - depends if using relative values but it will increase vehicles power
-- durability - (IMPORTANT) Enter value from 0 to 100. 100 means that the part will never break
-- repair - enter ingrediants to fix up the part. If part is at 0 percent you will need to replace.

Turbos = { -- Turbos affect your car speed at higher rpm's. When turbos break you lose power
    ['turbo_lvl_1'] = {
        label = "Small Turbo", 
        usability = {exclusive = {}, vehicletypes = {}}, 
        power = 10.0,
        durability = 50.0,
        repair = {}
        
    },
	['turbo_lvl_2'] = {
        label = "Great Turbo", 
        usability = {exclusive = {}, vehicletypes = {}}, 
        power = 20.0,
        durability = 45.0,
        repair = {}
        
    },
	['turbo_lvl_3'] = {
        label = "Small Twin Turbo", 
        usability = {exclusive = {}, vehicletypes = {}}, 
        power = 32.0,
        durability = 40.0,
        repair = {}
        
    },
	['turbo_lvl_4'] = {
        label = "Great Twin Turbo", 
        usability = {exclusive = {}, vehicletypes = {}}, 
        power = 25.0,
        durability = 35.0,
        repair = {}
        
    }
},

NitroKey = 'LEFTSHIFT', -- Key to use nitro when available

 Nitros = { -- Nitro affect vehicle power and increases vehicle wear during usage

    --  ['nos'] = {
    --      label = "NOS", 
    --     usability = {exclusive = {}, vehicletypes = {}},
    --      power = 60.0,
    --      durability = 15.0 -- Here enter seconds until nitro will run out
    --  }
 },

Transmissions = {

['stock_transmission'] = {
    label = "Transmisión automática", 
    usability = {exclusive = {}, vehicletypes = {}},
    shiftingtime = 0.9,
    drivingwheels = 'DEFAULT',
    durability = 80.0,
    manual = false,
    repair = {}
},

['race_transmission'] = {
    label = "Rear Wheel Drive", 
    usability = {exclusive = {}, vehicletypes = {}},
    shiftingtime = 3.0,
    drivingwheels = 'RWD',
    durability = 60.0,
    manual = false,
    repair = {}
},
['race_transmission_4wd'] = {
    label = "Four Wheel Drive", 
    usability = {exclusive = {}, vehicletypes = {}},
    shiftingtime = 3.0,
    drivingwheels = '4WD', -- FWD RWD AWD
    durability = 50.0,
    manual = false,
    repair = {}
},

['race_transmission_fwd'] = {
    label = "Front Wheel Drive", 
    usability = {exclusive = {}, vehicletypes = {}},
    shiftingtime = 3.0,
    drivingwheels = 'FWD', -- FWD RWD 4WD
    durability = 50.0,
    manual = false,
    repair = {}
}

},

Suspensions = { -- Suspension will affect handling and will look super cool. Decrease power to lower the vehicle and give better handling.

['stock_suspension'] = {
    label = "Suspensión Estándar", 
    usability = {exclusive = {}, vehicletypes = {}},
    height = 0,
    traction = 0,
    durability = 80.0,
    repair = {}
},

['race_suspension'] = {
    label = "Suspensión Racing", 
    usability = {exclusive = {}, vehicletypes = {}},
    height = -0.07,
    traction = 1.5,
    durability = 60.0,
    repair = {}
}



},

Oils = { -- Oils keep your car cool and happy if oil runs out car parts will start to wear off fast.

['stock_oil'] = {
    label = "Aceite Estándar", 
    usability = {exclusive = {}, vehicletypes = {}},
    durability = 10.0,
},

['shell_oil'] = {
    label = "Aceite Shell", 
    usability = {exclusive = {}, vehicletypes = {}},
    durability = 50.0,
},

['mobil1_oil'] = {
    label = "Aceite Mobil 1", 
    usability = {exclusive = {}, vehicletypes = {}},
    durability = 80.0,
}

},



Engines = { -- Engines will make your car faster and will give it a different sound. Increase power to make car faster. 

['stock_engine'] = {
    label = "Stock Engine", 
    power = 0.0,
    durability = 80.0,
    usability = {exclusive = {}, vehicletypes = {}},
    sound = "DEFAULT",
     repair = {}
    
}, 

['v8engine'] = {
    label = "V8 Engine", 
    power = 25.0,
    durability = 50.0,
    usability = {exclusive = {}, vehicletypes = {}},
    sound = "brabus850", -- These sounds are not in by default download from (https://www.gta5-mods.com/vehicles/brabus-inspired-custom-engine-sound-add-on-sound)
     repair = {}
    
}, 

['2jzengine'] = {
    label = "2JZ Engine", 
    power = 40.0,
    durability = 30.0,
    usability = {exclusive = {}, vehicletypes = {}},
    sound = "toysupmk4", -- These sounds are not in by default download from (https://www.gta5-mods.com/vehicles/brabus-inspired-custom-engine-sound-add-on-sound)
     repair = {}
    
},
['diablov12'] = {
    label = "Diablo V12", 
    power = 30.0,
    durability = 40.0,
    usability = {exclusive = {}, vehicletypes = {}},
    sound = "diablov12",
     repair = {}
    
},
['gt3flat6'] = {
    label = "GT3 Engine", 
    power = 28.0,
    durability = 90.0,
    usability = {exclusive = {}, vehicletypes = {}},
    sound = "gt3flat6",
     repair = {}
    
},
['k20a'] = {
    label = "Integra Type R K20A", 
    power = 15.0,
    durability = 90.0,
    usability = {exclusive = {}, vehicletypes = {}},
    sound = "k20a",
     repair = {}
    
},
['lambov10'] = {
    label = "V10 Lambo Engine", 
    power = 32.0,
    durability = 65.0,
    usability = {exclusive = {}, vehicletypes = {}},
    sound = "lambov10",
     repair = {}
    
},
['m158huayra'] = {
    label = "Pagani Huayra", 
    power = 35.0,
    durability = 65.0,
    usability = {exclusive = {}, vehicletypes = {}},
    sound = "m158huayra",
     repair = {}
    
},
['m297zonda'] = {
    label = "Pagani Zonda", 
    power = 35.0,
    durability = 45.0,
    usability = {exclusive = {}, vehicletypes = {}},
    sound = "m297zonda",
     repair = {}
    
},
['musv8'] = {
    label = "Demon SRT", 
    power = 25.0,
    durability = 45.0,
    usability = {exclusive = {}, vehicletypes = {}},
    sound = "musv8",
     repair = {}
    
}, 
['predatorv8'] = {
    label = "Shelby GT500", 
    power = 20.0,
    durability = 45.0,
    usability = {exclusive = {}, vehicletypes = {}},
    sound = "predatorv8",
     repair = {}
    
},
['rb26det'] = {
    label = "R34 RB26dett", 
    power = 17.0,
    durability = 45.0,
    usability = {exclusive = {}, vehicletypes = {}},
    sound = "f50v12",
     repair = {}
    
},
['rotary7'] = {
    label = "Mazda RX7 Rotary", 
    power = 30.0,
    durability = 45.0,
    usability = {exclusive = {}, vehicletypes = {}},
    sound = "rotary7",
     repair = {}
    
},
['m5cracklemod'] = {
    label = "BMW M5 V10 engine", 
    power = 28.0,
    durability = 80.0,
    usability = {exclusive = {}, vehicletypes = {}},
    sound = "c6v8sound",
     repair = {}
    
},
['zr250'] = {
    label = "Nissan ZR250", 
    power = 23.0,
    durability = 80.0,
    usability = {exclusive = {}, vehicletypes = {}},
    sound = "avesvv12",
     repair = {}
    
},
['v8sultanrs'] = {
    label = "Sultan V8", 
    power = 27.0,
    durability = 80.0,
    usability = {exclusive = {}, vehicletypes = {}},
    sound = "v8sultanrs",
    repair = {}
    
},
['urusv8'] = {
    label = "Lambo Urus", 
    power = 30.0,
    durability = 80.0,
    usability = {exclusive = {}, vehicletypes = {}},
    sound = "urusv8",
    repair = {}
    
},

['b58b30'] = {
    label = "A90/Z4 Engine", 
    power = 21.5,
    durability = 65.0,
    usability = {exclusive = {}, vehicletypes = {}},
    sound = "b58b30",
    repair = {}
    
},
['elsecreto'] = {
    label = "El Secreto Engine", 
    power = 400,
    durability = 100.0,
    usability = {exclusive = {}, vehicletypes = {}},
    sound = "f50v12",
    repair = {}
},

},
 
Tires = { -- Tires affect your cars handling when launching and in corners. Increase traction for better grip or decrease for more drift. When they wear off you will drive without tires lol

['stock_tires'] = {
    label = "Neumáticos Estándar", 
    usability = {exclusive = {}, vehicletypes = {}},
    traction = -0.08, -- Increasing this will make car make sharper turns
    width = 0.0,
    size = 0.0,
    lowspeedtraction = 0.0, -- Increasing this will make the car spin out from low speeds
    durability = 80.0,
    repair = {}
},

['michelin_tires'] = {
    label = "Neumáticos Michelin", 
    usability = {exclusive = {}, vehicletypes = {}},
   traction = 2.5, -- Increasing this will make car make sharper turns
    width = 0.0,
    size = 0.0,
    lowspeedtraction = -1.2, -- Increasing this will make the car spin out from low speeds
    durability = 30.0,
    repair = {}
},

['racing_tires'] = {
    label = "Neumáticos Racing", 
    usability = {exclusive = {}, vehicletypes = {}},
   traction = 1.2, -- Increasing this will make car make sharper turns
    width = 0.0,
    size = 0.0,
    lowspeedtraction = -1.8, -- Increasing this will make the car spin out from low speeds
    durability = 50.0,
    repair = {}
},


},

Brakes = { -- Brakes allow you to stop your car. Increase power to make brakes more affective. When brakes break you will lose ability to break 

['stock_brakes'] = {
    label = "Freno Estándar", 
    usability = {exclusive = {}, vehicletypes = {}},
    power = 1.0,
    durability = 30.0,
    repair = {}
},

['race_brakes'] = {
    label = "Freno AP Racing", 
    usability = {exclusive = {}, vehicletypes = {}},
    power = 2.0,
    durability = 30.0,
    repair = {}
},

},

SparkPlugs = { -- Spark Plugs affect your car ignition. This will cause the vehicle to switch the engine off randomly

    ['stock_sparkplugs'] = {
        label = "Estándar", 
        usability = {exclusive = {}, vehicletypes = {}}, 
        durability = 40.0, -- (IMPORTANT) Enter value from 0 to 100. 100 means that the part will never break
        startbreak = 10.0, -- the health set when the engine starts to switch of random. At < 1 health the engine wont start again. Values from 1-100 are allowed
        minfail = 10000, -- min time when engine turns off in ms
        maxfail = 50000, -- max time when engine turns off in ms
    },
    ['ngk_sparkplugs'] = {
        label = "NGK", 
        usability = {exclusive = {}, vehicletypes = {}}, 
        durability = 75.0, -- (IMPORTANT) Enter value from 0 to 100. 100 means that the part will never break
        startbreak = 25.0, -- the health set when the engine starts to switch of random. At < 1 health the engine wont start again. Values from 1-100 are allowed
        minfail = 20000, -- min time when engine turns off in ms
        maxfail = 60000, -- max time when engine turns off in ms
    }

},

--en
Text = {

    ['hood_closed'] = 'El bonete esta cerrado!',
    ['mechanic_action_complete'] = 'reparación finalizada',
    ['mechanic_action_started'] = 'reparación iniciada',
    ['wrong_job'] = 'Trabajo incorrecto',
    ['not_enough'] = 'no hay suficientes items',
    
    --Added
    ['vehicle_locked'] = 'vehículo cerrado!',
    ['vehicle_nearby'] = '¡no hay ningún vehículo cerca!',
    ['vehicle_notonlift'] = 'el vehículo no está en el ascensor!',
    ['vehicle_notoncarjack'] = 'el vehículo no está sobre el gato!',
    
    --Parts Stuff
    ['install_engine'] = '[~r~E~w~] instalar el motor',
    ['repair_engine'] = '[~r~E~w~] reparar el motor',
    ['installing_engine'] = '~r~se está instalando el motor',
    ['repairing_engine'] = '~r~el motor está siendo reparado',
    ['install_turbo'] = '[~r~E~w~] instalar turbo',
    ['repair_turbo'] = '[~r~E~w~] reparar turbo',
    ['installing_turbo'] = '~r~se está instalando el turbo',
    ['repairing_turbo'] = '~r~el turbo está siendo reparado',
    ['install_nitro'] = '[~r~E~w~] instalar nitro',
    ['repair_nitro'] = '[~r~E~w~] reparar nitro',
    ['installing_nitro'] = '~r~se está instalando el nitro',
    ['repairing_nitro'] = '~r~el nitro está siendo reparado',
    ['exchange_oil'] = '[~r~E~w~] cambiar aceite',
    ['refill_oil'] = '[~r~E~w~] rellenar el aceite',
    ['refilling_oil'] = '~r~el aceite se está rellenando',
    ['exchanging_oil'] = '~r~se está cambiando el aceite',
    ['install_transmission'] = '[~r~E~w~] instalar la transmisión',
    ['repair_transmission'] = '[~r~E~w~] reparar la transmisión',
    ['installing_transmission'] = '~r~se está instalando la transmisión',
    ['repairing_transmission'] = '~r~la transmisión está siendo reparada',
    ['install_tire'] = '[~r~E~w~] instalar el neumático',
    ['install_brakes'] = '[~r~E~w~] instalar el freno',
    ['install_suspension'] = '[~r~E~w~] instalar suspensión',
    
        
    --New
    ['install_sparkplugs'] = '[~r~E~w~] instalar bujías'
}

}



function SendTextMessage(msg)

        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0,1)

        --EXAMPLE USED IN VIDEO
        --exports['mythic_notify']:SendAlert('inform', msg)

end

