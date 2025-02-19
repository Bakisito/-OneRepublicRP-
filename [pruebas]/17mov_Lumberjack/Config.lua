Config = {}

Config.UseTarget = true                -- Change it to true if you want to use a target system. All settings about the target system are under target.lua file.
Config.UseBuiltInNotifications = false   -- Set to false if you want to use your framework notification style. Otherwise, the built in modern notifications will be used. Available only with modern UI
Config.RequiredItem = "none"                        -- Set it to anything you want, to require players to have an item in their inventory before they start the job
Config.RequireItemFromWholeTeam = true              -- If it's false, then only the host needs to have the required item, otherwise entire team needs it.
Config.RequiredJob = "none"             -- Set to "none" if you dont want to use jobs. If you are using target, you have to set "job" parameter inside every export in target.lua
Config.RequireJobAlsoForFriends = true          -- If it's false, then only the host needs to have the job, if it's true, then everybody from the group needs to have the Config.RequiredJob
Config.RequireOneFriendMinimum = false  -- Set to true if you want to force players to create teams
Config.letBossSplitReward = true                    -- If it's true, then boss can manage whole party rewards percent in menu. If set to false, then everybody will get same amount. Avalible only in modern UI
Config.multiplyRewardWhileWorkingInGroup = true     -- If it's false, then reward will stay by default. For example $1000 for completing whole job. If you set it to true, then the payout will depend on how many players is there in the group. For example, if for full job there's $1000, then if player works in a 4 member group, the reward will be $4000. (baseReward * partyCount)
Config.UseBetterPerformance = false                 -- When it's true, animations will be not be that smooth, but the resmon for clients will be much better. There's a 100 objects animation at one time, and it can't be better optimized, so if you don't like the resmon around 0.4 while processing logs, set it to true, but animations will be not that smooth. 

Config.EnableVehicleTeleporting = true               -- If its true, then the script will teleport the host to the company vehicle. If its false, then the company vehicle will apeear, but the whole squad will need to enter the car manually
Config.JobVehicleModel = "17mov_Tractor"             -- Model of the company log vehicle
Config.JobFlatbedModel = "17mov_logTrailer"          -- Model of the company flatbed trailer
Config.JobTruckModel = "17mov_LumberjackTruck"       -- Model of the company phantom
Config.JobForkliftModel = "forklift"                 -- Model of the company forklift
Config.PickupModel = "17mov_LumberJackcar2"          -- Model of the company pickup

Config.SoundsMultipler = 0.5        -- All sounds will be half of their default value. Range is 0.0-1.0

Config.ForksAttachment = {
    {
        rotation = vector3(0.0, 0.0, 90.0),
        offset = vector3(0.50, -0.4, 0.51),
    },

    {
        rotation = vector3(0.0, 0.0, 90.0),
        offset = vector3(0.50, 0.1, 0.51),
    },

    {
        rotation = vector3(0.0, 0.0, 90.0),
        offset = vector3(0.50, 0.5, 0.51),
    },

    {
        rotation = vector3(0.0, 0.0, 90.0),
        offset = vector3(0.50, -0.4, 1.01),
    },

}

Config.TreeRespawnTime = 60 * 20 * 1000             -- After this time, tree will respawn after cutting
Config.PenaltyAmount = 500                          -- Penalty that is levied when a player finishes work without a company vehicle
Config.DontPayRewardWithoutVehicle = false          -- Set to true if you want to not pay reward to players who want to end without company vehicle (accepting the penalty)
Config.DeleteVehicleWithPenalty = false             -- Delete Vehicle even if its not company vehicle
Config.JobCooldown = 5 * 60 -- 10 * 60              -- 0 minutes cooldown between making jobs (in brackets there's example for 10 minutes)
Config.GiveKeysToAllLobby = true                    -- Set to false if you want to give keys only to group creator while starting job

-- ^ Options: top-left, top-center, top-right, bottom-left, bottom-center, bottom-right

Config.RequireWorkClothes = true                   -- Set it to true, to change players clothes everytime they're starting the job.
Config.RestrictBlipToRequiredJob = false            -- Set to true, to hide job blip for players, who dont have RequiredJob. If requried job is "none", then this option will not have any effect.
Config.Blips = { -- Here you can configure Company blip.
    [1] = {
        Sprite = 516,
        Color = 25,
        Scale = 0.8,
        Pos = vector3(-552.9, 5348.58, 74.74),
        Label = 'Trabajo de leñador'
    },
}

Config.BlipsStyles = {
    ["treeBlip"] = {
        color = 25, 
        label = "[LUMBERJACK] Arbol para cortar",
        sprite = 153,
        scale = 0.6
    },

    ["withdrawTruck"] = {
        color = 25, 
        label = "~g~[LUMBERJACK]~s~ Rentar un camion",
        sprite = 477,
        scale = 0.7
    },
 
    ["sellLogs"] = {
        color = 1, 
        label = "~g~[LUMBERJACK]~s~ Vender troncos sin procesar",
        sprite = 272,
        scale = 1.0
    },

    ["processLogs"] = {
        color = 25, 
        label = "~g~[LUMBERJACK]~s~ Convertir troncos en tablones",
        sprite = 365,
        scale = 0.8
    },
    
    ["processToChips"] = {
        color = 25, 
        label = "~g~[LUMBERJACK]~s~ Convertir troncos en astillas de madera",
        sprite = 365,
        scale = 0.8
    },

    ["rentForklift"] = {
        color = 25, 
        label = "~g~[LUMBERJACK]~s~ Rentar una carretilla elevadora para cargar tablones",
        sprite = 88,
        scale = 0.6,
    },

    ["sellPlanks"] = {
        color = 2, 
        label = "~g~[LUMBERJACK]~s~ Vender tablones procesados",
        sprite = 272,
        scale = 1.0,
    },

    ["sellChips"] = {
        color = 5, 
        label = "~g~[LUMBERJACK]~s~ Vender astillas de madera",
        sprite = 272,
        scale = 1.0,
    }
}

Config.MarkerSettings = {   -- used only when Config.UseTarget = false. Colors of the marker. Active = when player stands inside the marker.
    Active = {
        r = 235, 
        g = 123,
        b = 54,
        a = 240,
    },

    UnActive = {
        r = 171, 
        g = 91,
        b = 41,
        a = 240,
    }
}

Config.PlanksProcessStations = {
    {
        coords = vector4(-488.77, 5341.81, 84.01, 249.7),
        rotation = vec3(0, 0, -20.0),
        targetHeading = 250,
    },
    {
        coords = vector4(-487.04, 5346.5, 84.01, 249.7),
        rotation = vec3(0, 0, -20.0),
        targetHeading = 250,
    },
}

Config.ChipsProcessStations = {
    {
        coords = vector4(-478.6, 5320.78, 84.09, 338.44),
        rotation = vec3(0, 0, -110.0),
        targetHeading = 340.99,
    },

    {
        coords = vector4(-482.13, 5322.18, 84.09, 338.44),
        rotation = vec3(0, 0, -110.0),
        targetHeading = 340.99,
    },
}

Config.PlanksAttachments = {
    vector3(0.0, 4.0, 0.15),
    vector3(0.0, 0.1, 0.15),
    vector3(0.0, -3.9, 0.15),

    vector3(0.0, 4.0, 1.15),
    vector3(0.0, 0.1, 1.15),
    vector3(0.0, -3.9, 1.15),

    vector3(0.0, 4.0, 2.15),
    vector3(0.0, 0.1, 2.15),
    vector3(0.0, -3.9, 2.15),
}

Config.HintPlankAttachment = {
    offset = vec3(0.0, -6.9, 0.3),
    rotation = vec3(0.0, -3.5, 90.0)
}

Config.DeliveryLocations = {
    ["chips"] = {
        {
            coords = vector4(1162.71, 2119.91, 57.08, 181.97),
            rotation = vec3(0, 0.0, 90.0),
            targetHeading = 181.97,
            pricePerPercent = math.random(30, 31),
            itemRewards = {
                -- {
                --     item_name = "water_bottle",
                --     chance = 50,
                --     amountPerPercent = 1,
                -- }
            },
            tittle = "CONSTRUCTION SITE",
            subtittle = "BIENVENIDO A SANDY CONSTRUCTION SITE!",
            content = "Podemos comprar sus astillas de madera en<span style='color: #80FF00'> $%s </span>cada una. Si decides vender, presiona el boton de vender. Quizas alguien mas te ofrezca un precio diferente. Elige sabiamente!",
            confirmBtn = "Vender Astillas", 
            closeBtn = "Cerrar",
            photo = "assets/sandyChips.webp"
        },

        {
            coords = vector4(2408.8, 4985.74, 47.67, 130.56),
            rotation = vec3(0, 0, -135.0),
            targetHeading = 137.34,
            pricePerPercent = math.random(30, 31),
            itemRewards = {
                -- {
                --     item_name = "water_bottle",
                --     chance = 50,
                --     amountPerPercent = 1,
                -- }
            },
            tittle = "O'Neil Ranch",
            subtittle = "BIENVENIDO A O'NEIL RANCH!",
            content = "Podemos comprar sus astillas de madera en<span style='color: #80FF00'> $%s </span>cada una. Si decides vender, presiona el boton de vender. Quizas alguien mas te ofrezca un precio diferente. Elige sabiamente!",
            confirmBtn = "Vender Astillas", 
            closeBtn = "Cerrar",
            photo = "assets/sandyChips2.webp"
        },
    },

    ["logs"] = {
        {
            coords = vector4(1246.87, -3155.74, 7.0, 270.07),
            rotation = vec3(0, -3.0, 0.0),
            targetHeading = 270,
            pricePerLog = math.random(116, 125),
            itemRewards = {
                -- {
                --     item_name = "water_bottle",
                --     chance = 50,
                --     amountPerLog = 1,
                -- }
            },
            tittle = "LS DOCKS",
            subtittle = "BIENVENIDO A LS DOCKS LOG DEPOT!",
            content = "Podemos comprar sus troncos a<span style='color: #80FF00'> $%s </span>cada uno. Si decides vender, presiona el boton de vender. Quizas alguien mas te ofrezca un precio diferente. Elige sabiamente!",
            confirmBtn = "Vender Troncos", 
            closeBtn = "Cerrar",
            photo = "assets/lsdocks.webp"
        },

        {
            coords = vector4(165.57, -3151.59, 7.0, 272.06),
            rotation = vec3(0, 0, 0.0),
            targetHeading = 272.06,
            pricePerLog = math.random(116, 125),
            itemRewards = {
                -- {
                --     item_name = "water_bottle",
                --     chance = 50,
                --     amountPerLog = 1,
                -- }
            },
            tittle = "LS DOCKS",
            subtittle = "BIENVENIDO A LS DOCKS LOG DEPOT!",
            content = "Podemos comprar sus troncos a<span style='color: #80FF00'> $%s </span>cada uno. Si decides vender, presiona el boton de vender. Quizas alguien mas te ofrezca un precio diferente. Elige sabiamente!",
            confirmBtn = "Vender Troncos", 
            closeBtn = "Cerrar",
            photo = "assets/lsdocks2.webp"
        },
    },

    ["planks"] = {
        {
            coords = vector4(119.48, -445.33, 42.33, 339.04),
            rotation = vec3(0, 0, 70.0),
            targetHeading = 339.04,
            pricePerPallete = math.random(1200, 1375),
            itemRewards = {
                -- {
                --     item_name = "water_bottle",
                --     chance = 50,
                --     amountPerPallete = 1,
                -- }
            },
            tittle = "StoneSober Builders",
            subtittle = "ADENTRATE EN EL CORAZON DE LA CONSTRUCCION!",
            content = "Saludos, Leñador! StoneSober, como una empresa lider en la industria de la construccion, estamos listos para adquirir tus tablones de alta calidad. Nuestra tarifa actual es <span style='color: #80FF00'>$%s </span>por paleta. Si deseas llegar a una acuerdo, simplemente presiona el boton 'Vender Tablones'. Sin embargo, recuerda que puede haber otros dispuestos a ofrecer un precio diferente. La decision es tuya, elige con discrecion!",
            confirmBtn = "Vender Tablones", 
            closeBtn = "Cerrar",
            photo = "assets/stonesober1.webp"
        },

        {
            coords = vector4(-1095.58, -1638.03, 5.5, 35.11),
            rotation = vec3(0, 0, 125.0),
            targetHeading = 35.11,
            pricePerPallete = math.random(1200, 1375),
            itemRewards = {
                -- {
                --     item_name = "water_bottle",
                --     chance = 50,
                --     amountPerPallete = 1,
                -- }
            },
            tittle = "StoneSober Builders",
            subtittle = "ADENTRATE EN EL CORAZON DE LA CONSTRUCCION!",
            content = "Saludos, Leñador! StoneSober, como una empresa lider en la industria de la construccion, estamos listos para adquirir tus tablones de alta calidad. Nuestra tarifa actual es <span style='color: #80FF00'>$%s </span>por paleta. Si deseas llegar a una acuerdo, simplemente presiona el boton 'Vender Tablones'. Sin embargo, recuerda que puede haber otros dispuestos a ofrecer un precio diferente. La decision es tuya, elige con discrecion!",
            confirmBtn = "Vender Tablones", 
            closeBtn = "Cerrar",
            photo = "assets/stonesober2.webp"
        },

        {
            coords = vector4(-477.95, -958.22, 24.99, 93.47),
            rotation = vec3(0, 0, 0.0),
            targetHeading = 93.47,
            pricePerPallete = math.random(900, 970),
            itemRewards = {
                -- {
                --     item_name = "water_bottle",
                --     chance = 50,
                --     amountPerPallete = 1,
                -- }
            },
            tittle = "StoneSober Builders",
            subtittle = "ADENTRATE EN EL CORAZON DE LA CONSTRUCCION!",
            content = "Saludos, Leñador! StoneSober, como una empresa lider en la industria de la construccion, estamos listos para adquirir tus tablones de alta calidad. Nuestra tarifa actual es <span style='color: #80FF00'>$%s </span>por paleta. Si deseas llegar a una acuerdo, simplemente presiona el boton 'Vender Tablones'. Sin embargo, recuerda que puede haber otros dispuestos a ofrecer un precio diferente. La decision es tuya, elige con discrecion!",
            confirmBtn = "Vender Tablones", 
            closeBtn = "Cerrar",
            photo = "assets/stonesober3.webp"
        },
    },
}

Config.Locations = {       -- Here u can change all of the base job locations. 
    DutyToggle = {
        Coords = {
            vector3(-552.8, 5348.55, 74.74),
        },
        CurrentAction = 'open_dutyToggle',
        CurrentActionMsg = 'Press ~INPUT_CONTEXT~ to ~y~start/finish~s~ work.',
        type = 'duty',
        scale = {x = 1.0, y = 1.0, z = 1.0},
    },

    FinishJob = {
        Coords = {
            vector3(-558.8, 5366.1, 70.3),
        },
        CurrentAction = 'finish_job',
        CurrentActionMsg = 'Press ~INPUT_CONTEXT~ to ~y~end ~s~working.',
        scale = {x = 3.0, y = 3.0, z = 3.0},
    },

    ReturnLogCar = {
        Coords = {
            vector3(-569.05, 5336.43, 70.27),
        },
        CurrentAction = 'return_logcar',
        CurrentActionMsg = 'Press ~INPUT_CONTEXT~ to ~y~return ~s~Log Car.',
        scale = {x = 3.0, y = 3.0, z = 3.0},
    },

    WithdrawTruck = {
        Coords = {
            vector3(-566.0, 5326.07, 73.59),
        },
        CurrentAction = 'withdraw_truck',
        CurrentActionMsg = 'Press ~INPUT_CONTEXT~ to ~y~rent a ~s~truck.',
        scale = {x = 1.0, y = 1.0, z = 1.0},
    },

    rentForklift = {
        Coords = {
            vector3(-560.8, 5282.81, 73.05),
        },
        CurrentAction = 'rent_forklift',
        CurrentActionMsg = 'Press ~INPUT_CONTEXT~ to ~y~rent~s~ a forklift.',
        scale = {x = 1.0, y = 1.0, z = 1.0},
    },
}

Config.SpawnPoint = vector4(-558.8, 5366.1, 70.3, 345.66)                -- Company Tractor spawn point
Config.SpawnPoint2 = vector4(-572.32, 5374.91, 70.32, 253.07)            -- Company Tractor2 spawn point
Config.SpawnPointFlatbed = vector4(-562.06, 5356.17, 70.40, 341.15)      -- Company flatbed point
Config.SpawnPointTruck = vector4(-569.05, 5336.43, 70.27, 340.67)        -- Company truck spawn point   
Config.SpawnPointForklift = vector4(-569.15, 5271.18, 70.26, 164.37)     -- Company forklift spawn point
Config.SpawnPointPickup = vector4(-572.47, 5369.57, 70.18, 253.64)       -- Company pickup spawn point

Config.EnableCloakroom = true                                            -- if false, then you can't see the Cloakroom button under Work Menu
Config.Clothes = {

    male = {
        ["mask"] = {clotheId = 0, variation = 0},
        ["arms"] = {clotheId = 6, variation = 0},
        ["pants"] = {clotheId = 9, variation = 0},
        ["bag"] = {clotheId = 0, variation = 0},
        ["shoes"] = {clotheId = 25, variation = 0},
        ["t-shirt"] = {clotheId = 59, variation = 1},
        ["torso"] = {clotheId = 117, variation = 2},
        ["decals"] = {clotheId = 0, variation = 0},
        ["kevlar"] = {clotheId = 0, variation = 0},
    },

    female = {
        ["mask"] = {clotheId = 0, variation = 0},
        ["arms"] = {clotheId = 6, variation = 0},
        ["pants"] = {clotheId = 30, variation = 0},
        ["bag"] = {clotheId = 0, variation = 0},
        ["shoes"] = {clotheId = 24, variation = 0},
        ["t-shirt"] = {clotheId = 15, variation = 0},
        ["torso"] = {clotheId = 109, variation = 2},
        ["decals"] = {clotheId = 0, variation = 0},
        ["kevlar"] = {clotheId = 0, variation = 0},
    },
}

Config.Panels = {
    ["rentTruck"] = { 
        tittle = "Renta de camiones",
        subtittle = "Que es esto?",
        content = "Esta es la zona en donde puedes intercambiar tu cargador de troncos por un camion. El camion te permitira transportar el remolque mas rapido y mas comodo. Para spawnear el camion, por favor presion el boton 'Rentar Camion' abajo",
        confirmBtn = "Rentar Camion", 
        closeBtn = "Cerrar",
    },

    ["rentForklift"] = {
        tittle = "Renta de carretillas",
        subtittle = "NECESITAS CARGAR TUS TABLONES?",
        content = "Bienvenido a forklift rental area. Aqui, puedes rentar una carretilla elevadora para tener asistencia a la hora de poner tus paletas de tablones en tu trailer. La carretilla elevadora es vital para administrar tus productos de madera, diseñada para hacer tu trabajo mas simple y eficiente. Por favor recuerda, la carretilla elevadora va a desaparecer una vez que termines de cargar el trailer. Renta una carretilla elevadora y agiliza operacion de procesamiento de troncos!",
        confirmBtn = "Rentar Carretilla",
        closeBtn = "Cerrar",
    },

    ["woodProcess"] = { 
        tittle = "Procesamiento de madera",
        subtittle = "CONVERTIR TRONCOS EN TABLONES?",
        content = "Bienvenido al corazon del procesamiento de troncos, donde puedes convertir tus troncos en tablones. Estos tendran que ser cargados en tu trailer utilizando una carretilla elevadora. Para crear una pequeña paleta de tablones, necesitas 6 troncos, hasta ese momento recibiras %s paletas de tablones. Sin embargo, tu trailer solo puede llevar 9 paletas de tablones. Mientras que los tablones alcanzaran un precio mas alto, no olvides que el procesamiento lleva tiempo. Elige sabiamente y capitaliza tus esfuerzos!",
        confirmBtn = "Procesar Troncos", 
        closeBtn = "Cerrar",
    },

    ["chipsProcess"] = {
        tittle = "Procesamiento de madera",
        subtittle = "CONVERTIR TRONCOS EN ASTILLAS DE MADERA?",
        content = "Bienvenido al corazon del astillado de madera, donde puedes convertir tus troncos en astillas de madera. Cada tronco va a llenar 5% de tu contenedor de astillas. recuerda, tu trailer puede acomodar al menos 3 contenedores al mismo tiempo. Para poner el contenedor en la plataforma, necesitaras un tractor con dientes largos. Una vez tu que tu contenedor este full, el sistema dejara de procesar automaticamente. Mientras que las astillas de madera pueden tardar mas para procesar, su demanda es alta. Elige sabiamente y capitaliza tus esfuerzos!",
        confirmBtn = "Procesar Troncos", 
        closeBtn = "Cerrar",   
    }
}

Config.Lang = {

    -- Here you can changea all translations used in client.lua, and server.lua. Dont forget to translate it also under the HTML and JS file.

    -- Client
    ["no_permission"] = "Solo el dueño de la partida puede hacer eso!",
    ["keybind"] = 'Interacción con marcadores',
    ["too_far"] = "Tu partida ha empezado a trabajar, pero estas my lejos de la sede.",
    ["kicked"] = "Has expulsado %s de tu partida",
    ["alreadyWorking"] = "Primero, completa la orden previa",
    ["quit"] = "Has abandonado el equipo",
    ["nobodyNearby"] = "No hay nadie alrededor",
    ["cantInvite"] = "Para poder invitar mas personas, debes terminar el trabajo primero",
    ["inviteSent"] = "Invitación Enviada!",
    ["spawnpointOccupied"] = "El sitio para spawnear el auto esta ocupado",
    
    ["startingTutorial"] = "Bienvenido al rol de leñador. Este trabajo te ofrece la libertad de trabajar de manera independiente y a tu propio ritmo. Inicialmente, necesitaras cortar arboles y cargar la madera en tu trailer utilizando el cargador de troncos. Recuerda, para separar el trailer del cargador de troncos, simplemente manten presionado la letra H. Tienes la opcion de convertir la madera en tablones, astillas de madera, o de vender solo los troncos. Despues de que termines de procesar la madera, puedes intercambiar tu cargador de troncos por un camion y vender tus productos en varias zonas alrededor del mapa. Por favor recuerda, el precio de tu mercancia puede variar dependiendo la zona",
    
    ["AfterTreeFallTutorial"] = "Felicitaciones!, has cortado tu primer arbol. Ahora subelo a tu trailer utilizando el cargador de troncos. Usa CTRL y SHIFT o NUMPAD en tu teclado para controlar el brazo.",
    ["afterLoadingFullTrailer"] = "Felicitaciones! Has llenado tu trailer al meximo. Ahora puedes vender los troncos, o convertir troncos en tablones o astillas de madera, y tal vez ganar mas dinero. Recuerda que los precios cambian segun la demanda",
    ["afterLogsProcess"] = "Felicitaciones! Todos tus troncos han sido procesados. Si no lo has hecho hazlo ya, no olvidez rentar una carretilla elevadora, y poner todas tus paletas en el trailer. Despues puedes vender tus paletas de tablones en diferentes areas. Todas estan marcadas en el mapa.",
    ["afterSkipFullLoad"] = "Uno de tus tres contenedores esta lleno a capacidad, or todos los troncos han sido procesados. Por favor transporta el contenedor a tu trailer cuando este lleno y el proceso continuara normalmente en caso de que queden mas troncos",
    ["afterChipsProcess"] = "Felicitaciones! Has convertido todos tus troncos en astillas de madera. Ya es hora de que lleves el contenedor lleno a tu trailer y vendas la mercancia a alguna de las zonas de venta que hay en el mapa. Si todavia tienes espacio para contenedores, sientete libre de ir a cortar mas arboles y continuar procesando.",

    ["notADriver"] = "Necesitas ser conductor de vehículos para terminar el trabajo",
    ["partyIsFull"] = "Fallo al enviar invitación, tu grupo esta full",
    ["wrongReward1"] = "El procentaje de pago debe ser entre 0 y 100",
    ["wrongReward2"] = "El porcentaje total de todos los pagos a superado el 100%",
    ["cut_smaller"] = "~r~[E] | ~w~Cortar",
    ["grab"] = "~r~[E] | ~w~Agarrar",
    ["treeCutting"] = "Presiona ~INPUT_CONTEXT~ para empezar a cortar el arbol",
    ["useLogLoader"] = "Subelo a tu trailer utilizando el cargador de troncos",
    ["attachLogToLoader"] = "Presiona ~INPUT_CONTEXT~ para agarrar el tronco",
    ["putLogOnLoader"] = "Presiona ~INPUT_CONTEXT~ para cargar el tronco",
    ["CantWithTrailer"] = "No puedes devolver el cargador de troncos con el trailer enganchado. Manten presionado H para soltarlo",
    ["notDriverOrValidModel"] = "No eres un conductor o no estas dentro de tu cargador de troncos",
    ["OpenSellingMenu"] = "Presiona ~INPUT_CONTEXT~ para abrir el menu de venta",
    ["OpenProcessingMenu"] = "Presiona ~INPUT_CONTEXT~ para abrir el menu de procesado",
    ["logsSellInProgress"] = "Espera a que todos los troncos sean descargados del trailer y vuelve a la base para que te paguen",
    ["planksSellInProgress"] = "Espera a que todas las paletas de tablones sean descargadas del trailer y vuelve a la base para que te paguen",
    ["chipsSellInProgress"] = "Espera a que se descarguen todos los contenedores del remolque y vuelve a la base para que te paguen",
    ["attachPlanksToForklift"] = "Presiona ~INPUT_CONTEXT~ Para sujetar la plataforma de tablones a las horquillas",
    ["attachSkipToTrailer"] = "Presiona ~INPUT_CONTEXT~ para cargar el contenedor en el trailer",
    ["loadItOnFlatbed"] = "Ahora por favor ve y sube esta paleta a tu trailer. ten en cuenta que no puede cargarlo mientras aún haya troncos en él",
    ["loadPallete"] = "Presiona ~INPUT_CONTEXT~ para cargar la paleta a tu trailer",
    ["notEnoughLogs"] = "No tienes suficientes troncos en tu trailer para empezar a procesar",
    ["dontHaveLogs"] = "No tienes troncos para vender en tu trailer",
    ["dontHavePlanks"] = "No tienes tablones para vender en tu trailer",
    ["sold"] = "Has vendido los productos exitosamente. Ve a la base y termina el trabajo para que te paguen",
    ["fullTrailer"] = "Ya no cabe mas material en tu trailer",
    ["noSkipUnder"] = "No hay contenedores debajo de la salida de astillas. No puedes empezar a procesar ahora",
    ["currentSkipIsFull"] = "El contenedor actual esta full. Por favor, cambia el contenedor, o cargalo en tu trailer",
    ["useJobTractor"] = "Utiliza tu tractor de trabajo",
    ["useJobForklift"] = "Renta y use una carretilla elevadora",
    ["AttachSkip"] = "Presiona ~INPUT_CONTEXT~ para enganchar tu contenedor",
    ["WaitUntilFullLoad"] = "El contenedor esta siendo cargado. Por favor espera mientras tanto",
    ["newSkipSet"] = "Hemos puesto tu contenedor debajo de la salida de astillas automaticamente. Ahora puedes resumer la conversion de astillas.",
    ["dontHaveChips"] = "No tienes ninguna astilla de madera para vender",
    ["wentWrong"] = "Algo fue mal. Intentalo de nuevo",
    ["tooManyLogs"] = "Ya has cortado demasiados troncos. Primero, cargalos.",
    ["cantLeaveLobby"] = "No puedes dejar el lobby mientras estas trabajando. Primero, termina el trabajo.",

    -- Server
    ["isAlreadyHost"] = "Este jugador lidera su equipo.",
    ["isBusy"] = "Este jugador ya pertenece a otro equipo.", 
    ["hasActiveInvite"] = "Este jugador ya tiene una invitacion activa de alguien mas.",
    ["HaveActiveInvite"] = "Ya tienes una invitacion activa para unirte al equipo.",
    ["InviteDeclined"] = "Tu invitacio ha sido rechazada.",
    ["InviteAccepted"] = "Tu invitacion ha sido aceptada!",
    ["error"] = "Hubo un problema uniendose al equipo. Por favor intentalo mas tarde.",
    ["kickedOut"] = "Has sido expulsado del equipo!",
    ["reward"] = "Has recibido un pago de $",
    ["RequireOneFriend"] = "Este trabajo requiere al menos un miembro del equipo",
    ["penalty"] = "Has pagado una multa por el monto de ",
    ["clientsPenalty"] = "El host del equpo ha aceptado el castigo. Tu no has recibido el pago",
    ["dontHaveReqItem"] = "You or someone from your team does not have the required item to start work",
    ["notEverybodyHasRequiredJob"] = "No todos tus amigos tienen el trabajo requerido",
    ["someoneIsOnCooldown"] = "Tu o alguien de tu equipo no puede trabajar ahora (cooldown: %s)",
    ["hours"] = "h",
    ["minutes"] = "m",
    ["seconds"] = "s",
    ["logCarHidden"] = "Tu cargador de troncos ha sido devuelto. Ahora puedes rentar un camion.",
    ["LogCarNotHidden"] = "No has escondido tu cargador de troncos. Necesitas esconderlo primero",
    ["alreadyRentedOneTruck"] = "Ya has rentado un camion de la empresa. No podemos darte otro",
    ["alreadyRentedOneForklift"] = "Ya has rentado una carretilla elevadora.  No podemos darte otra",
    ["PlanksNotProcessed"] = "No has procesado ningun tablon. No podemos darte una carretilla elevadora",
}

Config.Props = {
    tree = {
        hash = `prop_tree_cedar_02`,
        zOffset = -3.5,
    },

    logs = {
        hash = `prop_log_01`,
        height = 4.5,
    }
}

Config.TreeSpawningCoords = {
    vector3(-645.61, 5411.87, 47.29),
    vector3(-624.56, 5411.82, 49.45),
    vector3(-634.15, 5387.13, 53.53),
    vector3(-665.86, 5365.69, 58.91),
    vector3(-664.95, 5343.81, 62.6),
    vector3(-728.37, 5279.53, 78.79),
    vector3(-755.76, 5283.57, 83.55),
    vector3(-690.96, 5224.04, 94.91),
    vector3(-672.6, 5210.38, 95.82),
    vector3(-635.4, 5152.26, 111.67),
    vector3(-616.73, 5119.49, 120.38),
    vector3(-574.23, 5101.81, 122.5),
    vector3(-545.2, 5111.71, 112.19),
    vector3(-495.51, 5136.5, 103.01),
    vector3(-490.38, 5477.88, 82.8),
    vector3(-519.72, 5486.62, 70.91),
    vector3(-531.71, 5462.31, 70.49),
    vector3(-540.1, 5441.34, 68.05),
    vector3(-519.32, 5438.12, 72.49),
    vector3(-509.31, 5492.07, 74.33),
    vector3(-471.69, 5487.43, 84.03),
    vector3(-519.16, 5585.13, 65.9),
    vector3(-531.55, 5571.48, 62.81),
    vector3(-529.61, 5552.31, 64.9),
    vector3(-540.84, 5531.77, 61.61),
    vector3(-554.39, 5562.05, 56.39),
    vector3(-589.23, 5431.29, 57.21),
    vector3(-567.84, 5426.72, 61.0),
    vector3(-728.19, 5350.34, 63.3),
    vector3(-730.67, 5364.64, 60.48),
    vector3(-722.48, 5390.02, 55.06),
    vector3(-727.42, 5401.34, 50.97),
    vector3(-735.48, 5382.91, 55.01),
    vector3(-747.37, 5359.01, 59.81),
    vector3(-748.72, 5285.98, 80.81),
    vector3(-498.74, 5451.62, 79.77),
    vector3(-510.49, 5467.59, 76.77),
    vector3(-529.41, 5504.77, 66.24),
    vector3(-512.72, 5533.79, 70.85),
    vector3(-584.55, 5512.0, 52.62),
    vector3(-582.23, 5503.76, 54.13),
    vector3(-579.39, 5481.86, 58.13),
    vector3(-608.1, 5468.1, 56.72),
    vector3(-625.57, 5481.37, 52.83),
    vector3(-660.37, 5474.98, 51.37),
    vector3(-689.38, 5464.27, 47.12),
    vector3(-712.04, 5413.47, 49.73),
    vector3(-711.86, 5374.91, 60.19),
    vector3(-722.23, 5344.14, 65.91),
    vector3(-722.23, 5302.66, 72.62),
    vector3(-757.18, 5247.65, 95.3),
    vector3(-694.52, 5194.67, 103.17),
    vector3(-677.13, 5173.72, 108.07),
    vector3(-638.68, 5180.63, 99.24),
    vector3(-590.7, 5181.34, 95.81),
    vector3(-562.96, 5161.92, 101.71),
    vector3(-586.59, 5138.02, 111.49),
    vector3(-681.87, 5131.28, 124.55),
    vector3(-684.47, 5360.15, 65.19),
    vector3(-688.87, 4977.74, 179.36),
    vector3(-667.43, 5011.87, 164.96),
    vector3(-666.18, 5056.28, 147.76),
    vector3(-605.13, 5043.49, 140.34),
    vector3(-657.11, 5136.94, 124.69),
    vector3(-613.6, 5243.29, 72.38),
    vector3(-517.75, 5185.98, 89.79),
    vector3(-802.51, 5287.74, 86.55),
    vector3(-817.04, 5269.61, 87.95),
    vector3(-788.8, 5227.42, 104.26),
    vector3(-771.96, 5205.25, 111.4),
    vector3(-740.68, 5200.75, 104.22),
    vector3(-744.22, 5120.48, 135.0),
    vector3(-706.64, 5105.96, 132.03),
    vector3(-722.7, 5066.09, 143.12),
    vector3(-654.21, 5035.41, 154.55),
    vector3(-577.6, 5077.24, 130.64),
    vector3(-452.45, 5099.4, 130.34),
    vector3(-480.19, 5108.66, 118.7),
    vector3(-476.73, 5123.16, 113.17),
    vector3(-442.23, 5182.72, 110.59),
    vector3(-421.5, 5225.06, 124.34),
    vector3(-409.42, 5268.9, 127.09),
    vector3(-398.38, 5286.62, 125.51),
    vector3(-449.79, 5385.96, 80.44),
    vector3(-476.24, 5424.59, 68.6),
    vector3(-657.12, 5303.43, 66.9),
    vector3(-545.45, 5079.27, 123.59),
    vector3(-661.94, 5113.78, 129.96),
    vector3(-668.48, 5122.11, 127.41),
    vector3(-676.88, 5123.98, 127.41),
    vector3(-684.74, 5135.61, 122.77),
    vector3(-678.92, 5173.07, 108.17),
    vector3(-683.94, 5186.62, 105.05),
    vector3(-666.42, 5189.94, 102.1),
    vector3(-654.8, 5194.65, 96.19),
    vector3(-640.27, 5196.54, 92.35),
    vector3(-625.11, 5196.69, 89.46),
    vector3(-617.0, 5232.85, 73.87),
    vector3(-625.6, 5244.29, 73.76),
    vector3(-642.6, 5255.01, 74.94),
    vector3(-651.35, 5255.88, 75.64),
    vector3(-659.65, 5261.74, 76.39),
    vector3(-661.34, 5275.45, 74.48),
    vector3(-670.49, 5287.44, 72.19),
    vector3(-680.75, 5282.51, 72.4),
    vector3(-554.78, 5226.8, 74.85),
    vector3(-543.34, 5237.91, 74.79),
    vector3(-534.23, 5237.0, 78.31),
    vector3(-507.72, 5222.4, 87.04),
    vector3(-356.02, 5366.27, 132.39),
    vector3(-366.05, 5366.66, 125.56),
    vector3(-378.78, 5368.71, 118.62),
    vector3(-385.71, 5363.21, 115.97),
    vector3(-463.55, 5566.79, 72.87),
    vector3(-465.37, 5580.11, 71.19),
    vector3(-489.26, 5557.56, 72.94),
    vector3(-496.86, 5525.12, 75.06),
    vector3(-517.58, 5521.56, 69.58),
    vector3(-535.48, 5515.5, 64.09),
    vector3(-560.11, 5496.26, 59.52),
    vector3(-571.11, 5486.93, 58.88),
    vector3(-585.56, 5484.2, 56.46),
    vector3(-593.1, 5472.41, 57.3),
    vector3(-609.0, 5472.4, 55.09),
    vector3(-648.85, 5479.99, 51.72),
    vector3(-646.64, 5492.6, 51.28),
    vector3(-661.73, 5453.63, 50.43),
    vector3(-679.16, 5432.8, 47.39),
    vector3(-691.1, 5395.92, 53.59),
    vector3(-685.85, 5380.1, 58.06),
    vector3(-687.99, 5359.93, 65.76),
    vector3(-685.81, 5348.95, 67.62),
    vector3(-683.72, 5331.08, 68.33),
    vector3(-674.66, 5327.79, 66.42),
}

Config.Sounds = {
    TreeFallingMaxDistance = 75,            -- Tree fall will be heard up to 75 meters
    ChainsawNoiseMaxDistance = 250,         -- Chainsaw Will be heard up to 250 meters
    logRollProcessing = 60,                 -- Log to planks processing will be heard up to 250 meters
}

Config.TrailerSkipsAttachments = {
    vec3(0.0, 3.68, 0.3),
    vec3(0.0, -0.61, 0.3),
    vec3(0.0, -4.89, 0.3),
}

Config.HintSkip = {
    offset = vec3(0.0, -8.6, 1.0),
    rotation = vec3(0.0, -25.0, 90.0)
}

Config.TrailerLogsAttachments = {
    vector3(-1.03, 3.910, 0.65),
    vector3(-0.47, 3.910, 0.65),
    vector3(0.09, 3.910, 0.65),
    vector3(0.65, 3.910, 0.65),
    vector3(1.12, 3.910, 0.65),

    vector3(-1.03, -0.21, 0.65),
    vector3(-0.47, -0.21, 0.65),
    vector3(0.09, -0.21, 0.65),
    vector3(0.65, -0.21, 0.65),
    vector3(1.12, -0.21, 0.65),

    vector3(-1.03, -4.32, 0.65),
    vector3(-0.47, -4.32, 0.65),
    vector3(0.09, -4.32, 0.65),
    vector3(0.65, -4.32, 0.65),
    vector3(1.12, -4.32, 0.65),

    vector3(-1.03, 3.910, 1.18),
    vector3(-0.47, 3.910, 1.18),
    vector3(0.09, 3.910, 1.18),
    vector3(0.65, 3.910, 1.18),
    vector3(1.12, 3.910, 1.18),

    vector3(-1.03, -0.21, 1.18),
    vector3(-0.47, -0.21, 1.18),
    vector3(0.09, -0.21, 1.18),
    vector3(0.65, -0.21, 1.18),
    vector3(1.12, -0.21, 1.18),

    vector3(-1.03, -4.32, 1.18),
    vector3(-0.47, -4.32, 1.18),
    vector3(0.09, -4.32, 1.18),
    vector3(0.65, -4.32, 1.18),
    vector3(1.12, -4.32, 1.18),

    vector3(-1.03, 3.910, 1.66),
    vector3(-0.47, 3.910, 1.66),
    vector3(0.09, 3.910, 1.66),
    vector3(0.65, 3.910, 1.66),
    vector3(1.12, 3.910, 1.66),

    vector3(-1.03, -0.21, 1.66),
    vector3(-0.47, -0.21, 1.66),
    vector3(0.09, -0.21, 1.66),
    vector3(0.65, -0.21, 1.66),
    vector3(1.12, -0.21, 1.66),

    vector3(-1.03, -4.32, 1.66),
    vector3(-0.47, -4.32, 1.66),
    vector3(0.09, -4.32, 1.66),
    vector3(0.65, -4.32, 1.66),
    vector3(1.12, -4.32, 1.66),

    vector3(-1.03, 3.910, 2.19),
    vector3(-0.47, 3.910, 2.19),
    vector3(0.09, 3.910, 2.19),
    vector3(0.65, 3.910, 2.19),
    vector3(1.12, 3.910, 2.19),

    vector3(-1.03, -0.21, 2.19),
    vector3(-0.47, -0.21, 2.19),
    vector3(0.09, -0.21, 2.19),
    vector3(0.65, -0.21, 2.19),
    vector3(1.12, -0.21, 2.19),

    vector3(-1.03, -4.32, 2.19),
    vector3(-0.47, -4.32, 2.19),
    vector3(0.09, -4.32, 2.19),
    vector3(0.65, -4.32, 2.19),
    vector3(1.12, -4.32, 2.19),
}
