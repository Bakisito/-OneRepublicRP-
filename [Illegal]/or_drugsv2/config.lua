Config = {}

Config.Framework = "qbcore" -- esx or qbcore
-- todo add remove object

-- Config.CornerHolding = {
--     commandName = "corner",
--     useNPC = false, -- if you want to use npc make it true
--     pedSpeed = 3.0, -- moving speed
--     requiredCops = 0,
--     giveBlackMoney = false,
--     jobNames = {
--         "police"
--     },
--     alertChance = 1, -- 1 - 2 - 3 - 4 (1 = 25%, 2 = 50%, 3 = 75%, 4 = 100%)
--     failedAlert = false, -- If he doesn't have enough items on it or he fired the buyer, should report it?
--     salableItems = {
--         { name = "packed_cokea", price = 1, salableCount = 1 },
--         { name = "packed_metha", price = 1, salableCount = 1 },
--         { name = "packed_weeda", price = 1, salableCount = 1 },
--     },
--     certainArea = false, -- set true if you want it to be able to do it only near certain areas
--     certainAreas = {
--         { coords = vector3(-293.3, -1447.92, 31.31), radius = 100 },
--     },
--     pedModels = {
--         "a_f_y_hipster_02",
--         "a_f_y_vinewood_02",
--         "a_m_m_hillbilly_02",
--         "a_m_o_soucent_02",
--         "a_m_o_tramp_01",
--     },
-- }

Config.Meth = {
    labs = {
        [1] = {
            enterance = {
                showMarker = true,
                bucketId = 0, 
                requiredItems = {
                    -- ["lab_card"] = 1,
                }, 
                removeItem = false,
                enterCoords = vector4(1194.17, 2721.64, 38.81, 0.0), 
                exitCoords = vector4(996.89, -3200.64, -36.39, 0.0),
            },
            cookScene = {
                showMarker = true,
                requiredItems = {
                    ["ammonia"] = 1,
                    ["sacid"] = 1,
                },
                removeItem = true,
                coords = vector3(1005.74, -3200.39, -38.52),
                offset = vector3(5.0, 2.0, -0.40),
                rotation = vector3(0.0, 0.0, 0.0),
                itemName = "cooked_meth",
                itemCount = 1
            },
            hammerScene = {
                showMarker = true,
                requiredItems = {
                    ["cooked_meth"] = 1
                },
                removeItem = true,
                coords = vector3(1016.44, -3194.87, -38.99),
                offset = vector3(-3.16, -1.75, -1.0),
                rotation = vector3(0.0, 0.0, 0.0),
                itemName = "breaked_meth",
                itemCount = 6
            },
            packingScene = {
                showMarker = true,
                requiredItems = {
                    ["breaked_meth"] = 6
                },
                removeItem = true,
                coords = vector3(1012.07, -3194.95, -38.99),
                offset = vector3(-4.71, -1.52, -1.0),
                rotation = vector3(0.0, 0.0, 0.0),
                itemName = "packed_meth",
                itemCount = 12
            },
        },
    },
}

Config.Coke = {
    labs = {
        [1] = {
            enterance = {
                showMarker = true,
                bucketId = 0, 
                requiredItems = {
                    ["lab_card"] = 1,
                }, 
                removeItem = false,
                enterCoords = vector4(10.0, -12.0, 15.0, 16.0),
                exitCoords = vector4(10.0, -10.0, -10.0, 10.0), 
            },
            unpackScene = {
                showMarker = true,
                requiredItems = {
                    ["coca_leaf"] = 30,
                    ["hydrochloric_acid"] = 5
                },
                removeItem = true,
                coords = {
                    { 
                        coords = vector3(602.41, -426.28, 17.62),  
                        offset = vector3(0.09, 0.57, -0.65), 
                        rotation = vector3(0.0, 0.0, 180.0) 
                    },
                    { 
                        coords = vector3(602.84, -422.36, 17.62),  
                        offset = vector3(0.09, 0.57, -0.65), 
                        rotation = vector3(0.0, 0.0, 180.0) 
                    },
                    { 
                        coords = vector3(603.17, -419.43, 17.62),  
                        offset = vector3(0.09, 0.57, -0.65), 
                        rotation = vector3(0.0, 0.0, 180.0) 
                    },
                },
                itemName = "base_coke",
                itemCount = 1
            },
            cutterScene = {
                showMarker = true,
                requiredItems = {
                    ["base_coke"] = 1,
                    ["bakingsoda"] = 10,
                    ["levamisol"] = 2
                },
                removeItem = true,
                coords = {
                    { 
                        coords = vector3(591.67, -427.68, 17.62), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, -90.0)   
                    },
                    { 
                        coords = vector3(591.89, -425.11, 17.62), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, -90.0)   
                    },
                    { 
                        coords = vector3(593.75, -428.06, 17.62), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, 90.0) 
                    },
                    { 
                        coords = vector3(592.41, -421.11, 17.62), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, -90.0)   
                    },
                    { 
                        coords = vector3(592.68, -418.41, 17.62), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, -90.0)   
                    },
                    { 
                        coords = vector3(590.11, -427.69, 17.62), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, 90.0) 
                    },
                    { 
                        coords = vector3(591.04, -418.24, 17.62), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, 90.0) 
                    },
                    { 
                        coords = vector3(594.45, -421.39, 17.62), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, 90.0) 
                    },
                    { 
                        coords = vector3(596.14, -421.59, 17.62), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, -90.0) 
                    },
                    { 
                        coords = vector3(595.51, -428.17, 17.62), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, -90.0) 
                    },
                    { 
                        coords = vector3(598.72, -428.5, 17.62), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, -90.0) 
                    },
                    { 
                        coords = vector3(598.99, -425.77, 17.62), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, -90.0) 
                    },
                    { 
                        coords = vector3(599.4, -421.99, 17.62), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, -90.0) 
                    },
                    { 
                        coords = vector3(599.69, -419.27, 17.62), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, -90.0) 
                    },
                    { 
                        coords = vector3(596.44, -418.98, 17.62), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, -90.0) 
                    },
                    { 
                        coords = vector3(595.76, -425.11, 17.62), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, -90.0) 
                    },
                    { 
                        coords = vector3(596.99, -428.31, 17.62), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, 90.0) 
                    },
                    { 
                        coords = vector3(597.7, -421.71, 17.62), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, 90.0) 
                    },

                },
                itemName = "cutted_coke",
                itemCount = 1
            },
            packingScene = {
                showMarker = true,
                requiredItems = {
                    ["cutted_coke"] = 1
                },
                removeItem = true,
                coords = vector3(603.97, -416.99, 17.62),
                offset = vector3(-7.66, 2.17, -1.0),
                rotation = vector3(0.0, 0.0, 180.0),
                itemName = "impotent_rage",
                itemCount = 2
            },
        },
    },
}

Config.Weed = {
    labs = {
        [1] = {
            enterance = {
                showMarker = false,
                bucketId = 0, 
                requiredItems = {
                     ["lab_card"] = 1,
                }, 
                removeItem = false,
                enterCoords = vector4(10.0, -12.0, 15.0, 16.0),
                exitCoords = vector4(10.0, -10.0, -10.0, 10.0), 
            },
            gatheringScene = {
                showMarker = true,
                requiredItems = {
                    ["plant_spray"] = 1,
                },
                removeItem = false,
                coords = {
                    { 
                        coords = vector3(15.61, -15.85, -15.16), 
                        offset = vector3(-0.9, 0.1, -1.18), 
                        rotation = vector3(0.0, 0.0, 90.0) 
                    },

                },
                itemName = "unpacking_weed",
                itemCount = 1
            },
            packingScene = {
                showMarker = true,
                requiredItems = {
                    ["blue_dream_weed"] = 30,
                    ["empty_bag"] = 15
                },
                removeItem = true,
                coords = {
                    { 
                        coords = vector3(-1252.64, -1111.32, 0.79), 
                        offset = vector3(-0.76, 0.87, -0.98), 
                        rotation = vector3(0.0, 0.0, 0.0) 
                    },
                    { 
                        coords = vector3(-1246.98, -1109.47, 0.79), 
                        offset = vector3(-0.76, 0.87, -0.98), 
                        rotation = vector3(0.0, 0.0, 0.0) 
                    },
                    { 
                        coords = vector3(-1249.49, -1110.32, 0.79), 
                        offset = vector3(-0.76, 0.87, -0.98), 
                        rotation = vector3(0.0, 0.0, 0.0) 
                    },
                },
                itemName = "blue_dream_bag",
                itemCount = 15
            },
        },
    },
}

Config.Laundry = {
    labs = {
        [1] = {
            enterance = {
                showMarker = true,
                bucketId = 0, 
                requiredItems = {
                     ["lab_card"] = 1,
                }, 
                removeItem = false,
                enterCoords = vector4(15.04, -15.96, 15.6, 0.0),
                exitCoords = vector4(15.0, -15.96, -15.68, 0.0), 
            },
            placePaperScene = {
                showMarker = true,
                requiredItems = {"black"},
                removeItem = true,
                coords = {
                    { 
                        coords = vector3(1134.33, -3197.23, -39.67), 
                        offset = vector3(-1.0, 1.0, -1.0), 
                        rotation = vector3(0.0, 0.0, 180.0) 
                    },
                    { 
                        coords = vector3(1132.94, -3197.27, -39.67), 
                        offset = vector3(-1.0, 1.0, -1.0), 
                        rotation = vector3(0.0, 0.0, 180.0) 
                    },
                    { 
                        coords = vector3(1131.37, -3197.28, -39.67), 
                        offset = vector3(-1.0, 1.0, -1.0), 
                        rotation = vector3(0.0, 0.0, 180.0) 
                    },
                    { 
                        coords = vector3(1129.88, -3197.29, -39.67), 
                        offset = vector3(-1.0, 1.0, -1.0), 
                        rotation = vector3(0.0, 0.0, 180.0) 
                    },
                    { 
                        coords = vector3(1128.52, -3197.31, -39.67), 
                        offset = vector3(-1.0, 1.0, -1.0), 
                        rotation = vector3(0.0, 0.0, 180.0) 
                    },
                },
                itemName = "uncutted_money",
                itemCount = 8
            },
            cuttingScene = {
                showMarker = true,
                requiredItems = {},
                removeItem = true,
                coords = vector3(1122.41, -3197.88, -40.39),
                offset = vector3(2.29, 0.66, -0.6),
                rotation = vector3(0.0, 0.0, 180.0),
                itemName = "cutted_money",
                itemCount = 16
            },
            dryingScene = {
                showMarker = true,
                requiredItems = {},
                removeItem = true,
                coords = {
                    { 
                        coords = vector3(1122.51, -3194.62, -40.4), 
                        offset = vector3(0.0, 0.0, 0.0), 
                        rotation = vector3(0.0, 0.0, 90.0) 
                    },
                    { 
                        coords = vector3(1125.55, -3194.5, -40.4), 
                        offset = vector3(0.0, 0.0, 0.0), 
                        rotation = vector3(0.0, 0.0, 90.0) 
                    },
                },
                itemName = "washed_money",
                itemCount = 24
            },
            packingScene = {
                showMarker = true,
                giveBlackMoney = false,
                requiredItems = {},
                removeItem = true,
                coords = {
                    { 
                        coords = vector3(1116.66, -3195.75, -40.4), 
                        offset = vector3(-0.8, 0.9, -0.59), 
                        rotation = vector3(0.0, 0.0, 90.0) 
                    },
                    { 
                        coords = vector3(1116.71, -3194.42, -40.4), 
                        offset = vector3(-0.8, 0.95, -0.59), 
                        rotation = vector3(0.0, 0.0, 90.0) 
                    },
                },
                itemName = "cash",
                itemCount = 24
            },
        },
    },
}

iplList = {
    ["Meth"] = { 
        coords = vector3(1009.5, -3196.6, -38.99682),
        ipl = { 
            "meth_lab_upgrade",
            "meth_lab_setup",
            "meth_lab_production",
            "meth_lab_security_high", 
        }
    },
    ["Coke"] = {
        coords = vector3(1093.6, -3196.6, -38.99841),
        ipl = { 
            "equipment_upgrade",
            "production_upgrade",
            "table_equipment_upgrade",
            "coke_press_upgrade",
            "coke_cut_01",
            "coke_cut_02",
            "coke_cut_03",
            "coke_cut_04",
            "coke_cut_05",
            "security_high", 
        } 
    },
    ["Weed"] = {
        coords = vector3(1051.491, -3196.536, -39.14842),
        ipl = { 
            'weed_drying',
            'weed_production',
            'weed_upgrade_equip',
            'weed_chairs',
            "weed_growtha_stage3",
            "weed_growthb_stage3",
            "weed_growthc_stage3",
            "weed_growthd_stage3",
            "weed_growthe_stage3",
            "weed_growthf_stage3",
            "weed_growthg_stage3",
            "weed_growthh_stage3",
            "weed_growthi_stage3",
            "weed_hosea",
            "weed_hoseb",
            "weed_hosec",
            "weed_hosed",
            "weed_hosee",
            "weed_hosef",
            "weed_hoseg",
            "weed_hoseh",
            "weed_hosei",
            'light_growtha_stage23_upgrade',
            'light_growthb_stage23_upgrade',
            'light_growthc_stage23_upgrade',
            'light_growthc_stage23_upgrade',
            'light_growthd_stage23_upgrade',
            'light_growthe_stage23_upgrade',
            'light_growthf_stage23_upgrade',
            'light_growthg_stage23_upgrade',
            'light_growthh_stage23_upgrade',
            'light_growthi_stage23_upgrade',
        } 
    },
    ["Laundry"] = { 
        coords = vector3(1121.897, -3195.338, -40.4025),
        ipl = { 
            'special_chairs',
            'money_cutter',
            'counterfeit_setup',
            'counterfeit_upgrade_equip',
            'counterfeit_cashpile100a',
            'counterfeit_cashpile100b',
            'counterfeit_cashpile100c',
            'counterfeit_cashpile100d',
        }
    },
}

Strings = {
    -- General --
    ["dont_have_item"] = "No tienes suficientes %s",
    ["gave_item"] = "You gaved %s %sx",
    ["sold_item"] = "You sold %sx %s",

    -- Meth --
    ["enter_meth_lab"] = "Press ~INPUT_CONTEXT~ to enter meth lab",
    ["exit_meth_lab"] = "Press ~INPUT_CONTEXT~ to exit meth lab",

    ["start_meth_cooking"] = "Pulsa ~INPUT_CONTEXT~ para empezar a cocinar metanfetamina",
    ["cooking_meth"] = "Has empezado a cocinar metanfetamina",
    ["cooking_meth_text"] = "Cocinando metanfetamina...",

    ["start_breaking_meth"] = "Pulsa ~INPUT_CONTEXT~ para empezar a romper la metanfetamina",
    ["breaking_meth"] = "Has empezado a romper metanfetamina cocinada",
    ["breaking_meth_text"] = "Rompiendo metanfetamina...",

    ["start_packing_meth"] = "Pulsa ~INPUT_CONTEXT~ para empezar a empaquetar metanfetamina",
    ["packing_meth"] = "Has empezado a empaquetar metanfetamina",
    ["packing_meth_text"] = "Empaquetando metanfetamina...",

    -- Coke --
    ["enter_coke_lab"] = "Press ~INPUT_CONTEXT~ to enter coke lab",
    ["exit_coke_lab"] = "Press ~INPUT_CONTEXT~ to exit coke lab",

    ["start_unpacking_coke"] = "Pulse ~INPUT_CONTEXT~ para empezar a crear pasta de cocaina",
    ["unpacking_coke"] = "Empezaste a preparar la pasta coca",
    ["unpacking_coke_text"] = "Preparando pasta de coca",

    ["start_cutting_coke"] = "Pulse ~INPUT_CONTEXT~ para empezar a cortar la cocaina",
    ["cutting_coke"] = "Empezaste a cortar la cocaína",
    ["cutting_coke_text"] = "Cortando Cocaina",

    ["start_packing_coke"] = "Pulse ~INPUT_CONTEXT~ para empacar la cocaína",
    ["packing_coke"] = "Empezaste a empacar la cocaína",
    ["packing_coke_text"] = "Empacando Cocaina",

    -- Weed --
    ["enter_weed_lab"] = "Pulse ~INPUT_CONTEXT~ para entrar en el laboratorio de malas hierbas",
    ["exit_weed_lab"] = "Pulse ~INPUT_CONTEXT~ para salir del laboratorio de malas hierbas",

    ["start_gather_weed"] = "Pulsar ~INPUT_CONTEXT~ para empezar a recoger hierba",
    ["gathering_weed"] = "Has empezado a recoger hierba",
    ["gathering_weed_text"] = "Recogiendo hierba...",

    ["start_packing_weed"] = "Pulsa ~INPUT_CONTEXT~ para empezar a empaquetar hierba",
    ["packing_weed"] = "Empiezas a empaquetar hierba",
    ["packing_weed_text"] = "Empacando hierba...",

    -- Laundry --
    ["enter_laundry_lab"] = "Press ~INPUT_CONTEXT~ to enter laundry lab",
    ["exit_laundry_lab"] = "Press ~INPUT_CONTEXT~ to exit laundry lab",

    ["start_place_paper"] = "Press ~INPUT_CONTEXT~ to start place the money paper",
    ["place_money"] = "You started placing money paper",
    ["place_money_text"] = "Placing Money Paper...",

    ["start_cutting_money"] = "Press ~INPUT_CONTEXT~ to start cutting money",
    ["cutting_money"] = "You started cutting money",
    ["cutting_money_text"] = "Cutting Money...",

    ["start_wash_money"] = "Press ~INPUT_CONTEXT~ to start wash money",
    ["wash_money"] = "You started washing money",
    ["wash_money_text"] = "Washing Money...",

    ["start_count_money"] = "Press ~INPUT_CONTEXT~ to start count money",
    ["count_money"] = "You started couting money",
    ["count_money_text"] = "Counting Money...",

    -- Corner Holding --
    ["cant_corner_in_vehicle"] = "You can't hold a corner in the vehicle",
    ["cant_corner_while_dead"] = "You can't hold a corner because you're dead",
    ["cant_corner_this_area"] = "You can't hold a corner in this area",
    ["cant_corner_not_enough_cops"] = "Not enough cops to hold a corner",
    ["cancel_cornerholding"] = "You canceled the corner holding",

    ["started_corner_holding"] = "You started to corner holding, departure from the area!",
    ["corner_holding_moved_away"] = "Cornering canceled because you moved away from the area",
    ["buyer_has_damaged"] = "Buyer does not want to buy anything because it is injured",
    ["looking_new_buyer"] = "You are looking for new buyer",
    ["buyer_not_like"] = "Buyer did not like it because buyer did not have enough goods",
}