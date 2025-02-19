Prison = {
    -- Framework
    
    -- !!! IF YOU ARE USING QBCORE / ESX -> YOU DONT NEED TO TOUCH THIS !!!!
    -- !!! IF YOU ARE USING QBCORE / ESX -> YOU DONT NEED TO TOUCH THIS !!!!
    -- !!! IF YOU ARE USING QBCORE / ESX -> YOU DONT NEED TO TOUCH THIS !!!!

    Framework = 2, --[ 0 OR NIL = None |  1 = ESX  | 2 = QBCore |  3 = Other ] Choose your framework
    MySQL = 0,--[ 0  = 'oxmysql' |  1 = 'mysql-async'  | 2 = 'ghmattimysql' ] Choose your SQL

    Notify = {
        DefaultNotify = false, -- Notify provided by rcore_prison
        event = 'QBCore:Notify' -- Retval: serverId, data
    },

    Presets = {
        -- Key: resourceName ['cfx-gabz-prison']
        -- Preset name: ['rcore'] | data/presets/<XX>

        Maps = {
            ['rcore_prison_map'] = 'rcore',
            ['prison_main'] = 'desertos',
            ['cfx-gabz-prison'] = 'gabz',
            ['int_prison'] = 'unclejust',
            ['molo_alcatraz'] = 'alcatraz',
            ['YBNPrison'] = 'ybn',
            ['cfx_prompt_Bolingbroke_Prison_Interiors'] = 'prompt-prison'
        }
    },

    -- FRAMEWORK_TRIGGERS
    -- !!! IF YOU ARE USING QBCORE / ESX -> YOU DONT NEED TO TOUCH THIS !!!!
    -- !!! IF YOU ARE USING QBCORE / ESX -> YOU DONT NEED TO TOUCH THIS !!!!
    -- !!! IF YOU ARE USING QBCORE / ESX -> YOU DONT NEED TO TOUCH THIS !!!!
    -- !!! IF YOU ARE USING QBCORE / ESX -> YOU DONT NEED TO TOUCH THIS !!!!

    FrameworkTriggers = {
        notify = 'qbcore', -- ['esx', 'qbcore'] Set the notification event, if left blank, default will be used
        object = 'qbcore', --['esx', 'qbcore'] Set the shared object event, if left blank, default will be used (deprecated for QBCore)
        playerUnloadedServer = 'qbcore', -- ['esx', 'qbcore'] Set playerLogout (server-side) event, if left blank, automatic detection will be performed
        playerLoadedServer = 'qbcore', -- ['esx', 'qbcore'] Set playerLoadedServer (server-side) event, automatic detection will be performed
        playerUnloadedClient = 'qbcore', -- ['esx', 'qbcore'] Set playerUnloadedClient (client-side) event, automatic detection will be performed
        playerLoadedClient = 'qbcore', -- ['esx', 'qbcore'] Set playerLoadedClient (client-side) event, automatic detection will be performed
        resourceName = 'qbcore', -- ['esx', 'qbcore'] Set the resource name, if left blank, automatic detection will be performed
        resourceNameClothing = 'illenium-appearance', -- [ ESX = 'skinchanger' / QBCore = 'qb-clothing', 'fivem-appearance', 'illenium-appearance' ] Set the clothing resource name, if left blank, automatic detection will be performed
        resourceNamePhone = '', -- '[ 'qb-phone', 'npwd', 'gksphone', 'qs-smartphone'] Set the phone resource name for booth usage, if left blank, automatic detection will be performed
    },

    -- Defined phones that are automatically loaded, if you dont define any: qb-phone, npwd, gksphone, qs-smartphone

    ScriptEvents = {
        ['qb-clothing'] = {
            loadPlayerClothing = 'qb-clothing:client:loadPlayerClothing',
            loadOutfit = 'qb-clothing:client:loadOutfit',
        }
    },

    -- Related to phone booths
    -- Note: This is listed of supported phones
    -- For setting your phone & locales: check [rcore_prison/web/build/config.js]

    ImportAPI = false,

    SupportedPhones = {
        ['gksphone'] = true,
        ['qb-phone'] = true,
        ['qs-smartphone'] = true,
        ['npwd'] = true,
        ['lb-phone'] = true,
    },

    Dashboard = {
        AddSentence = {
            PlayersInAreaCheck = 10.0, -- This will get only players around officer which is using AddSentence.
            ShowNames = true -- Want to hide player names in Add Sentence - list (dashboard - panel)
        }
    },

    RenderNPCBlips = true, -- Do you want to show where are specific things in prison area (true/false)
    RenderPrisonMap = true, -- Do you want to render prison yard and stuff? (true/fase)

    ECONOMY_ITEM = 'marlborocig', -- Used along for Dealers around Prison yard or credits as payment thing.

    BoothMaxCallLenght = 5 * 60 * 1000, -- Max call lenght for calll session.
    BoothTakeCreditsPeriod = 60 * 1000, -- Each minute reduce prisoner credits (BoothPricePerMinute)
    BoothPricePerMinute = 2, -- 2 Credits per BoothTakeCreditsPeriod

    OutfitSkipSelection = false, -- Would you like to get Prisoner instantly in Prison and define own actions?
    OutfitSelectionTimeout = 10 * 1000,  -- How much time prisoner have time for outfit selection.
    PackageCooldown = 30 * 1000, -- For Ciggarets packaging minigame, delay between each package session

    InteractionDist = 1.5, -- Used for cache system, when you are not using target interaction.

    Language = 'en', -- 'en', 'cs

    Yard = {
        AnnoucementState = true, -- Enable annoucement in Prison yard from Warden
        AnnoucementAlarmState = true, -- Enable / Disable annoucement of Alarm, when break-out in progress.
    },

    Inmates = {
        Stab = 1, -- How many prisoners needs to be online to allow this option.
    },

    Circuit = {
        Lifes = 3, -- How much lifes person has for Electrician
        Difficulty = 1, -- 1, 2, 3, 4, 5, 6 --> This is ignored when EachJobLevelIncreaseDifficulty is enabled

        EachJobLevelIncreaseDifficulty = true, -- If enabled, when doing Electrician each tasks gets harder 1, 2, 3, 4, 5, 6

        Keybinds = {
            ['ARROW_UP'] = 172,
            ['ARROW_DOWN'] = 173,
            ['LEFT_ARROW'] = 174,
            ['RIGHT_ARROW'] = 175,
            ['BACKSPACE'] = 177,
        }
    },

    CheckDistTimeout = 10 * 1000, -- Timeout when user is jailed, to start CheckDist for clients if #Prisoners <= 0 | Dont touch this!!
    CheckEscapeDist = 300.0, -- Escape check dist
    CheckDist = true, -- Prisoners only (escape when far away)

    -- Used for checking distance from Prison, intervals when more prisoner are inside prison

    Distance = {
        updateSpacing = 2000,
        UpdateInterval = {
            [256]   = 1000 * 12,
            [128]   = 1000 * 10,
            [96]    = 1000 * 8, 
            [64]    = 1000 * 6,
            [0]     = 1000 * 4,  
        }
    },

    Canteen = {
        FreeFood = true,
        TakeFoodTimeout = 5 * 60 * 1000,

        PackageItems = {
            {
                itemName = 'raine',
                count = 2,
            },
            {
                itemName = 'burger',
                count = 3,
            }
        }
    },

    Keybindings = {
        COMMUNITY_SERVICE = 'E', -- Used for community service interaction
        DO_EXERCISES = 'SPACE', -- Used for GYM interaction
        STOP_EXERCICES = 'H' -- Used fror GYM interaction
    },

    Prolog = {
        ResetCacheState = false, -- If enabled, each time prisoner come to prison prolog will be performed.
        State = true -- Do you want to use for new prisoner prolog guide?
    },

    -- Community service
    -- You can change outline for community service (entities)

    CS = {
        ModuleState = true, -- You want to be community service enabled or disabled?
        DisableGameControls = true, -- When doing community service task, disabled any interaction (handy for abuser with clearing anims and so on)

        Place = vec3(236.464233, -409.489075, 47.924313), -- Place of NPC where CS user is reporting him self and taking tasks.

        TimeoutToJailSentence = 60, -- 1 Hour [in minutes] ----> How many hours user will get after putted in jail by script automatically?
        TimeoutToJail = 10, -- 5 mins by default | How much time before, user is put into jail instead of Community (2 strikes TimeoutJail / 2, 1.5 -> warning before put in jail automatically)

        DefaultPeroll = 5, -- 6 Hours, when there is no defined time for jailed user CSW (command)
        ReducePeroll = 1, -- 1 peroll from CS sentence, after finished current CS task

        Blip = {
            enable = true, -- Do you want to show blip on map?
            sprite = 643,
            scale = 0.3,
        },

        CleaningAnimTime = 6 * 1000,
        PoolCooldown = 5 * 60 * 1000, -- When user finished specific zone, when should be added back to zone select pool?

        Models = {
            'prop_rub_cardpile_05',
            'prop_rub_binbag_03',
            'prop_skid_box_06',
            'prop_rub_flotsam_01',
            'prop_rub_litter_03c',
            'prop_rub_binbag_06',
            'prop_rub_cardpile_06',
        },

        OUTLINE = {
            color = {
                x = 250,
                y = 149,
                z = 68
            },
            opacity = 80
        }
    },
    
    ReduceSentenceOffline = false, -- Allow you to determine how you like to have sentence reducing
    NotifyNewJobMember = true, -- Notify job members (activity), when new member join in

    PrisonerJailCheckDist = 10.0,-- How much dist should be checked for prisoner, when he is jailed via command.

    Commands = {
        Suggestions = true, -- Allow chat suggestions
        State = true, -- Allow chat commands to be used
        Jail = 'jail', -- /jail serverId [jailed] 600 [time] [reason] (optional)
        Unjail = 'unjail', -- /unjail serverId
        Dashboard = 'jailcp', -- /jailcp
        cleanZone = 'cleanzone', -- /cleanzone
        stopZone = 'stopzone', -- /stopZone
        cancelcs = 'cancelcs', -- /cancelcs
        startcs = 'startcs', -- /startcs
    },

    Jobs = {
        ['police'] = true,
    },

    NPC = {
        SpawnNPC = true, -- Handle spawning of guards running arround Prisoners 
        HandleNPCPoolState = false, -- Disable spawning on NPC from scenario!
    },

    -- Gym

    Gym = {
        ['Cranks'] = {
            action = {
                percentIncrease = 2,
                time = 4,
            },
            skills = {
                strength = 0.3,
                stamina = 0.1,  
            }
        },

        ['Situps'] = {
            action = {
                percentIncrease = 8,
                time = 1,
            },
            skills = {
                strength = 0.3,
                stamina = 0.1,  
            }
        },

        ['Musclechin'] = {
            action = {
                percentIncrease = 2,
                time = 4,
            },
            skills = {
                strength = 0.3,
                stamina = 0.1,  
            }
        },
    },

    Target = {
        ModuleState = true, -- You want to use this module true / false?
        CheckMenuDistInterval = 250, -- How many tick interval should check dist opened menu?
        CheckMenuDist = 2.5, -- Distance of when hiding of interaction menu should perform?
        CheckDist = 2.5,  -- Distance of showing options when performing target
    },
    

    Activities = {
        DRAW_MARKER = {
            state = true,
            dist = 10.0
        },

        DRAW_LINE = {
            rgb = vec3(14, 227, 7),  -- Related to jobs, as help draw line
            opacity = 255 -- Opacity
        }
    },

    Accounts = {
        CreditsItem = 'cash', -- Item which is defined as Prison enocomy item
        FriendListLimit = 3, -- How much friends prisoner can have in list?
        DefaultBalance = 0, -- Starting balance for PrisonersAccount
        GiftState = true, -- GiftState handles if anybody can gift credits outside of Prison to specific Prisoner accountId.
    },
    
    -- Recommended values for Minigame.

    Minigame = {
        Steps = 5, -- How many blocks script is going to generate?
        MoveStep = 0.09, -- Speed of arrowKeys generation block (> 0.02!!)
        Tolerance = 0.025, -- What tolenrace should script ignore?
        TimeAcc = 0.3, -- Calc behind keyPress minigame
    
        Keys = {'W', 'S', 'A', 'D'}, -- Option to define own keys for minigame, no need for change! :)

        -- KEY_LABEL => KEY_VALUE
        -- https://docs.fivem.net/docs/game-references/controls/

        -- TRAVERSE MAP
        
        -- If you want to use different Keys layout, you need to define key in TraverseMap
        
        -- LEFT SIDE -> KEY VALUE
        -- RIGHT SIDE -> STRING KEY

        TraverseMap = {
            [20] = "Z",
            [32] = 'W',
            [33] = 'S',
            [34] = 'A',
            [35] = 'D',
            [44] = "Q",
        },

        Keybinds = {
            ['W'] = 32,
            ['S'] = 33,
            ['A'] = 34,
            ['D'] = 35,
            ['ARROW_UP'] = 172,
            ['ARROW_DOWN'] = 173,
            ['LEFT_ARROW'] = 174,
            ['RIGHT_ARROW'] = 175,
        }
    },

    Release = {
        StashItems = true, -- Stashing inventory items when jailed
        ReturnItemsOnRelease = false, -- If you disable return items on release, your items will be stored at Lobby NPC and you can restore them
        TransferCreditsFromAccount = true, -- When prisoner has prisonersAccount, give him back his inserted credits from his account.
    },
    
    Outfits = {
        SelectionTimeout = 15 * 1000 -- Used for cleaning data on server-side dont change this! :)
    },

    Deploy = {
        Inventory = {
            coreName = 'qb-core', -- Used for importing prison items into qb-core/shared/items.lua
        }
    },

    Frontend = {
        AlignMenu = 'top-left', -- 'top-left', 'top-right'
        useLibrary = 'ox_lib', -- Select your preffered library for menus: 'ox_lib', 'qb-menu', 'es_extended', 'es_context', 'rcore'
        Libraries = {
            ['esx_context'] = true,
            ['es_extended'] = true,
            ['ox_lib'] = true,
            ['qb-menu'] = true,
        },
    },

    EnableGuidebookIntegration = false, -- If you want to to hook guidebook with content from prison.

    -- Which items can jailed user take in Prison and outside when released?

    KeepItems = {
        ['lays'] = true,
        ['lays_sc'] = true,
        ['lays_bbq'] = true,
        ['doritos'] = true,
        ['cheetos_jalapeno'] = true,
        ['cheetos_hotlimon'] = true,
        ['cheetos_bones'] = true,
        ['fritos_twists'] = true,
        ['fritos_original'] = true,
        ['sunchip'] = true,
        ['sunchip_cheddar'] = true,
        ['pizzaslice'] = true,
        ['pizzaslice2'] = true,
        ['pizzaslice3'] = true,
        ['pizzaslice4'] = true,
        ['pizzaslice5'] = true,
        ['gingerbread'] = true,
        ['xlollipop_a'] = true,
        ['xlollipop_b'] = true,
        ['xlollipop_c'] = true,
        ['xlollipop_d'] = true,
        ['xlollipop_e'] = true,
        ['macaroon'] = true,
        ['mug_a'] = true,
        ['mug_b'] = true,
        ['mulled_wine'] = true,
        ['cochodonut'] = true,
        ['strawberrydonut'] = true,
        ['croissant'] = true,
        ['mars'] = true,
        ['snickers'] = true,
        ['milkyway'] = true,
        ['smore'] = true,
        ['icecream_cherry'] = true,
        ['icecream_chocolate'] = true,
        ['icecream_lemon'] = true,
        ['icecream_pistachio'] = true,
        ['icecream_raspberry'] = true,
        ['icecream_stracciatella'] = true,
        ['icecream_strawberry'] = true,
        ['icecream_walnut'] = true,
        ['burgerr'] = true,
        ['burger2'] = true,
        ['burger3'] = true,
        ['burger4'] = true,
        ['burger5'] = true,
        ['burrito1'] = true,
        ['burrito2'] = true,
        ['fries'] = true,
        ['frosty'] = true,
        ['frosty2'] = true,
        ['carrot'] = true,
        ['apple'] = true,
        ['banana'] = true,
        ['orange'] = true,
        ['7up_1'] = true,
        ['7up_2'] = true,
        ['flemon'] = true,
        ['forange'] = true,
        ['dew_1'] = true,
        ['dew_2'] = true,
        ['dew_3'] = true,
        ['monster'] = true,
        ['pepsi_1'] = true,
        ['pepsi_2'] = true,
        ['sprite'] = true,
        ['lipton'] = true,
        ['drpepper'] = true,
        ['zero'] = true,
        ['burger'] = true,
        ['chaser'] = true,
        ['meteorite'] = true,
        ['hotdog'] = true,
        ['taco'] = true,
        ['raine'] = true,
        ['coffe'] = true,
        ['energy_drink'] = true,
        ['sprunk'] = true,
        ['coke_1'] = true,
        ['cash'] = true,

    },
    

    Level = {
       Debug = 3 -- Level [1, 2, 3]
    },

    Debug = false,

    DebugLevel = {
        'INFO',
        'CRITICAL',
        'SUCCESS',
        'ERROR',
        'DEBUG',
    },
}
