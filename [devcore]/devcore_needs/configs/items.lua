
--------------CONSUME ITEMS---------------
-- PROPS = https://forge.plebmasters.de/
-- BONES INDEX = LEFT HAND : 18905 , RIGHT HAND : 28422
--[[
--------------------- LEFT HAND HOLD ANIM 
    Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
        },
-------------------- RIGHT HAND HOLD ANIM 
    Hold = {
            dict = "anim@heists@humane_labs@finale@keycards",
            anim = "ped_a_enter_loop",
            params = {8.0, -8, -1, 49, 0}
        },

]]


Config.ConsumeItems = { -- It is possible to add custom items

---FOOD--

    ["burger"] = {-- item name
        Size = 190,
        Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {
                Model = 'prop_cs_burger_01',
                BoneID = 18905,
                Offset = vector3(0.13, 0.05, 0.02),
                Rot = vector3(-180.0, 0.0, 0.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_inteat@burger",
                anim = "mp_player_int_eat_burger_fp",
                params = {nil, nil, 1200, 49}
            }
        },
        Consume = {
            Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 6, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["burgerr"] = {-- item name
    Size = 215,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Main = {
    Prop = { -- Prop spawn data for idle & usage.
            Model = 'nels_burger_simply_prop',
            BoneID = 18905,
            Offset = vector3(0.13, 0.05, 0.02),
            Rot = vector3(-180.0, 0.0, 0.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 6, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },

    ["burger2"] = {-- item name
    Size = 225,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {
            Model = 'nels_burger_bleeder_prop',
            BoneID = 18905,
            Offset = vector3(0.13, 0.05, 0.02),
            Rot = vector3(-180.0, 0.0, 0.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 6, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },

    ["burger3"] = {-- item name
    Size = 245,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Main = {
    Prop = { -- Prop spawn data for idle & usage.
            Model = 'nels_burger_glorious_prop',
            BoneID = 18905,
            Offset = vector3(0.13, 0.05, 0.02),
            Rot = vector3(-180.0, 0.0, 0.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 6, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },

    ["burger4"] = {-- item name
    Size = 275,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {
            Model = 'nels_burger_fabulous_6lb_prop',
            BoneID = 18905,
            Offset = vector3(0.13, 0.05, 0.02),
            Rot = vector3(-180.0, 0.0, 0.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 6, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },

    ["burger5"] = {-- item name
    Size = 225,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'nels_burger_prickly_prop',
            BoneID = 18905,
            Offset = vector3(0.13, 0.05, 0.02),
            Rot = vector3(-180.0, 0.0, 0.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 6, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },

    ["fries"] = {-- item name
    Size = 110,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'nels_fries_box_prop',
            BoneID = 18905,
            Offset = vector3(0.13, 0.05, 0.02),
            Rot = vector3(0.0, -140.0, 360.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 4, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },

    ["burrito1"] = {-- item name
    Size = 110,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'nels_goat_wrap_prop',
            BoneID = 18905,
            Offset = vector3(0.13, 0.05, 0.02),
            Rot = vector3(0.0, -140.0, 360.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 4, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },

    ["burrito2"] = {-- item name
    Size = 110,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'nels_chicken_wrap_prop',
            BoneID = 18905,
            Offset = vector3(0.13, 0.05, 0.02),
            Rot = vector3(0.0, -140.0, 360.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 4, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },


    ["chaser"] = {-- item name
        Size = 70,
        Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {
                Model = 'prop_choc_ego',
                BoneID = 18905,
                Offset = vector3(0.13, 0.04, 0.0),
                Rot = vector3(48.0, 18.0, -133.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_inteat@burger",
                anim = "mp_player_int_eat_burger_fp",
                params = {nil, nil, 1200, 49}
            }
        },
        Consume = {
            Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 5, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },


    ["meteorite"] = {-- item name
        Size = 80,
        Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {
                Model = 'prop_choc_meto',
                BoneID = 18905,
                Offset = vector3(0.13, 0.05, 0.02),
                Rot = vector3(50.0, 30.0, 260.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_inteat@burger",
                anim = "mp_player_int_eat_burger_fp",
                params = {nil, nil, 1200, 49}
            }
        },
        Consume = {
            Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 5, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },


    ["hotdog"] = {-- item name
        Size = 120,
        Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {
                Model = 'prop_cs_hotdog_01',
                BoneID = 18905,
                Offset = vector3(0.13, 0.05, 0.02),
                Rot = vector3(0.0, -140.0, -140.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_inteat@burger",
                anim = "mp_player_int_eat_burger_fp",
                params = {nil, nil, 1200, 49}
            }
        },
        Consume = {
            Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 6, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },


    ["taco"] = {-- item name
        Size = 100,
        Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {
                Model = 'prop_taco_01',
                BoneID = 18905,
                Offset = vector3(0.13, 0.05, 0.02),
                Rot = vector3(0.0, -140.0, -140.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_inteat@burger",
                anim = "mp_player_int_eat_burger_fp",
                params = {nil, nil, 1200, 49}
            }
        },
        Consume = {
            Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 6, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["carrot"] = {-- item name
    Size = 100,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'knjgh_carrot',
            BoneID = 18905,
            Offset = vector3(0.13, 0.05, 0.02),
            Rot = vector3(0.0, -140.0, -140.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 10, max = 11}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 3, -- set how much food or drink you want to add 
        Stress = 1, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["apple"] = {-- item name
    Size = 120,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'knjgh_apple',
            BoneID = 18905,
            Offset = vector3(0.13, 0.05, 0.02),
            Rot = vector3(0.0, -140.0, -140.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 3, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["banana"] = {-- item name
    Size = 100,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'

    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'knjgh_banana',
            BoneID = 18905,
            Offset = vector3(0.13, 0.05, 0.02),
            Rot = vector3(0.0, -140.0, -140.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 30, max = 45}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 3, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["orange"] = {-- item name
    Size = 120,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Main = {

    Prop = { -- Prop spawn data for idle & usage.
            Model = 'knjgh_orange',
            BoneID = 18905,
            Offset = vector3(0.13, 0.05, 0.02),
            Rot = vector3(0.0, -140.0, -140.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 20, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 3, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },

    --las papitas 
    ["lays"] = {-- item name
    Size = 250,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
   

    Prop = { -- Prop spawn data for idle & usag e.
    Main = {
            Model = 'prop_wasabi_snacks_lays',
            BoneID = 28422,
            Offset = vector3(-0.19, -0.31, -0.05),
            Rot = vector3(0.0, -10.0, 280.0),
        }
    },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@world_human_drinking@coffee@male@idle_a",
            anim = "idle_a",
            params = {nil, nil, 2500, 49}
        }
    },
    Consume = {
        Bite = {min = 20, max = 45}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["lays_sc"] = {-- item name
    Size = 250,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usag e.
    Main = {

            Model = 'prop_wasbabi_snacks_lays_sc',
            BoneID = 28422,
            Offset = vector3(-0.24, -0.12, -0.05),
            Rot = vector3(0.0, -10.0, 280.0),
        }
    },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@world_human_drinking@coffee@male@idle_a",
            anim = "idle_a",
            params = {nil, nil, 2500, 49}
        }
    },
    Consume = {
        Bite = {min = 20, max = 45}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["lays_bbq"] = {-- item name
    Size = 250,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usag e.
    Main = {

            Model = 'prop_wasabi_snacks_lays_bbq',
            BoneID = 28422,
            Offset = vector3(-0.29, 0.26, -0.05),
            Rot = vector3(0.0, -10.0, 280.0),
        }
    },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@world_human_drinking@coffee@male@idle_a",
            anim = "idle_a",
            params = {nil, nil, 2500, 49}
        }
    },
    Consume = {
        Bite = {min = 20, max = 45}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["doritos"] = {-- item name
    Size = 250,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usag e.
    Main = {
            Model = 'prop_wasabi_snacks_doritos',
            BoneID = 28422,
            Offset = vector3(0.08, -0.31, -0.01),
            Rot = vector3(0.0, -10.0, 280.0),
        }
    },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@world_human_drinking@coffee@male@idle_a",
            anim = "idle_a",
            params = {nil, nil, 2500, 49}
        }
    },
    Consume = {
        Bite = {min = 20, max = 45}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["cheetos_jalapeno"] = {-- item name
    Size = 250,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usag e.
    Main = {

            Model = 'prop_wasabi_snacks_cheetos_001',
            BoneID = 28422,
            Offset = vector3(0.03, -0.2, -0.0),
            Rot = vector3(0.0, -10.0, 280.0),
        }
    },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@world_human_drinking@coffee@male@idle_a",
            anim = "idle_a",
            params = {nil, nil, 2500, 49}
        }
    },
    Consume = {
        Bite = {min = 20, max = 45}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["cheetos_hotlimon"] = {-- item name
    Size = 250,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usag e.
    Main = {

            Model = 'prop_wasabi_snacks_cheetos_002',
            BoneID = 28422,
            Offset = vector3(0.02, 0.0, -0.05),
            Rot = vector3(0.0, -10.0, 280.0),
        }
    },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@world_human_drinking@coffee@male@idle_a",
            anim = "idle_a",
            params = {nil, nil, 2500, 49}
        }
    },
    Consume = {
        Bite = {min = 20, max = 45}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["cheetos_bones"] = {-- item name
    Size = 250,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usag e.
    Main = {
            Model = 'prop_wasabi_snacks_cheetos_003',
            BoneID = 28422,
            Offset = vector3(-0.01, 0.17, -0.05),
            Rot = vector3(0.0, -10.0, 280.0),
        }
    },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@world_human_drinking@coffee@male@idle_a",
            anim = "idle_a",
            params = {nil, nil, 2500, 49}
        }
    },
    Consume = {
        Bite = {min = 20, max = 45}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["fritos_twists"] = {-- item name
    Size = 250,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usag e.
    Main = {
            Model = 'prop_wasabi_snacks_fritos',
            BoneID = 28422,
            Offset = vector3(0.23, 0.35, 0.0),
            Rot = vector3(0.0, -10.0, 280.0),
        }
    },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@world_human_drinking@coffee@male@idle_a",
            anim = "idle_a",
            params = {nil, nil, 2500, 49}
        }
    },
    Consume = {
        Bite = {min = 20, max = 45}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["fritos_original"] = {-- item name
    Size = 250,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usag e.
    Main = {
            Model = 'prop_wasabi_snacks_fritos',
            BoneID = 28422,
            Offset = vector3(0.23, 0.35, 0.0),
            Rot = vector3(0.0, -10.0, 280.0),
        }
    },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@world_human_drinking@coffee@male@idle_a",
            anim = "idle_a",
            params = {nil, nil, 2500, 49}
        }
    },
    Consume = {
        Bite = {min = 20, max = 45}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["sunchip"] = {-- item name
    Size = 250,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usag e.
    Main = {

            Model = 'prop_wasabi_snacks_sunchip',
            BoneID = 28422,
            Offset = vector3(0.29, -0.05, 0.01),
            Rot = vector3(0.0, -10.0, 280.0),
        }
    },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@world_human_drinking@coffee@male@idle_a",
            anim = "idle_a",
            params = {nil, nil, 2500, 49}
        }
    },
    Consume = {
        Bite = {min = 20, max = 45}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["sunchip_cheddar"] = {-- item name
    Size = 250,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usag e.
    Main = {
            Model = 'prop_wasabi_snacks_sun_cheddar',
            BoneID = 28422,
            Offset = vector3(0.26, 0.17, 0.01),
            Rot = vector3(0.0, -10.0, 280.0),
        }
    },
    
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@world_human_drinking@coffee@male@idle_a",
            anim = "idle_a",
            params = {nil, nil, 2500, 49}
        }
    },
    Consume = {
        Bite = {min = 20, max = 45}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["pizzaslice"] = {-- item name
    Size = 150,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'knjgh_pizzaslice1',
            BoneID = 18905,
            Offset = vector3(0.13, 0.05, 0.02),
            Rot = vector3(-180.0, 0.0, 180.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["pizzaslice2"] = {-- item name
    Size = 150,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'knjgh_pizzaslice2',
            BoneID = 18905,
            Offset = vector3(0.13, 0.05, 0.02),
            Rot = vector3(-180.0, 0.0, 180.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["pizzaslice3"] = {-- item name
    Size = 150,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'knjgh_pizzaslice3',
            BoneID = 18905,
            Offset = vector3(0.13, 0.05, 0.02),
            Rot = vector3(-180.0, 0.0, 180.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["pizzaslice4"] = {-- item name
    Size = 150,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'knjgh_pizzaslice4',
            BoneID = 18905,
            Offset = vector3(0.13, 0.05, 0.02),
            Rot = vector3(-180.0, 0.0, 180.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["pizzaslice5"] = {-- item name
    Size = 150,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'knjgh_pizzaslice5',
            BoneID = 18905,
            Offset = vector3(0.13, 0.05, 0.02),
            Rot = vector3(-180.0, 0.0, 180.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },

    ["gingerbread"] = {-- item name
    Size = 150,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Main = {

    Prop = { -- Prop spawn data for idle & usage.
            Model = 'bzzz_food_xmas_gingerbread_a',
            BoneID = 18905,
            Offset = vector3(0.16, 0.04, 0.03),
            Rot = vector3(18.0, 164.0, -5.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["xlollipop_a"] = {-- item name
    Size = 150,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_food_xmas_lollipop_a',
            BoneID = 18905,
            Offset = vector3(0.16, 0.02, 0.03),
            Rot = vector3(-73.0, 146.0, -5.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["xlollipop_b"] = {-- item name
    Size = 150,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_food_xmas_lollipop_b',
            BoneID = 18905,
            Offset = vector3(0.16, 0.02, 0.03),
            Rot = vector3(-73.0, 146.0, -5.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["xlollipop_c"] = {-- item name
    Size = 150,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_food_xmas_lollipop_c',
            BoneID = 18905,
            Offset = vector3(0.16, 0.02, 0.03),
            Rot = vector3(-73.0, 146.0, -5.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["xlollipop_d"] = {-- item name
    Size = 150,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_food_xmas_lollipop_d',
            BoneID = 18905,
            Offset = vector3(0.16, 0.02, 0.03),
            Rot = vector3(-73.0, 146.0, -5.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 5, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["xlollipop_e"] = {-- item name
    Size = 150,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_food_xmas_lollipop_e',
            BoneID = 18905,
            Offset = vector3(0.16, 0.02, 0.03),
            Rot = vector3(-73.0, 146.0, -5.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 4, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["macaroon"] = {-- item name
    Size = 150,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_food_xmas_macaroon_a',
            BoneID = 18905,
            Offset = vector3(0.15, 0.07, 0.0),
            Rot = vector3(-38.0, -7.0, 7.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 4, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },

    ["cochodonut"] = {-- item name
    Size = 100,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_foodpack_donut002',
            BoneID = 18905,
            Offset = vector3(0.12, 0.06, 0.03),
            Rot = vector3(-38.0, -228.0, 0.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 4, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["strawberrydonut"] = {-- item name
    Size = 100,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_foodpack_donut001',
            BoneID = 18905,
            Offset = vector3(0.12, 0.06, 0.03),
            Rot = vector3(-38.0, -228.0, 0.0),
        }
    },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 4, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["croissant"] = {-- item name
    Size = 100,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_foodpack_croissant001',
            BoneID = 18905,
            Offset = vector3(0.12, 0.02, 0.02),
            Rot = vector3(7.0, -144.0, 30.0),
        }
        },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 4, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["mars"] = {-- item name
    Size = 100,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_foodpack_mars001',
            BoneID = 18905,
            Offset = vector3(0.13, 0.03, 0.01),
            Rot = vector3(116.0, -61.0, 206.0),
        }
        },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 4, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["snickers"] = {-- item name
    Size = 100,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_foodpack_snickers001',
            BoneID = 18905,
            Offset = vector3(0.13, 0.03, 0.01),
            Rot = vector3(116.0, -61.0, 206.0),
        }
        },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 6, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["milkyway"] = {-- item name
    Size = 100,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_foodpack_milkyway001',
            BoneID = 18905,
            Offset = vector3(0.14, 0.06, 0.01),
            Rot = vector3(109.0, -25.0, 150.0),
        }
        },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 4, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["smore"] = {-- item name
    Size = 100,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_food_dessert_a',
            BoneID = 18905,
            Offset = vector3(0.15, 0.03, 0.03),
            Rot = vector3(-42.0, -36.0, 0.0),
        }
        },
    Anim = {
        Hold = nil,
        Use = {
            dict = "mp_player_inteat@burger",
            anim = "mp_player_int_eat_burger_fp",
            params = {nil, nil, 1200, 49}
        }
    },
    Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 4, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },

    ["icecream_cherry"] = {-- item name
    Size = 100,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_icecream_cherry',
            BoneID = 28422,
            Offset = vector3(0.0, -0.01, 0.02),
            Rot = vector3(05.0, -10.0, 0.0),
        }
        },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
                },
            Use = {
                dict = "amb@code_human_wander_drinking_fat@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 2000, 49}
                }
            },
        Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 3, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["icecream_chocolate"] = {-- item name
    Size = 100,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_icecream_chocolate',
            BoneID = 28422,
            Offset = vector3(0.0, -0.01, 0.02),
            Rot = vector3(05.0, -10.0, 0.0),
        }
        },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
                },
            Use = {
                dict = "amb@code_human_wander_drinking_fat@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 2000, 49}
                }
            },
        Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 3, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["icecream_lemon"] = {-- item name
    Size = 100,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_icecream_lemon',
            BoneID = 28422,
            Offset = vector3(0.0, -0.01, 0.02),
            Rot = vector3(05.0, -10.0, 0.0),
        }
        },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
                },
            Use = {
                dict = "amb@code_human_wander_drinking_fat@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 2000, 49}
                }
            },
        Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 3, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["icecream_pistachio"] = {-- item name
    Size = 100,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_icecream_pistachio',
            BoneID = 28422,
            Offset = vector3(0.0, -0.01, 0.02),
            Rot = vector3(05.0, -10.0, 0.0),
        }
        },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
                },
            Use = {
                dict = "amb@code_human_wander_drinking_fat@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 2000, 49}
                }
            },
        Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 3, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["icecream_raspberry"] = {-- item name
    Size = 100,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_icecream_raspberry',
            BoneID = 28422,
            Offset = vector3(0.0, -0.01, 0.02),
            Rot = vector3(05.0, -10.0, 0.0),
        }
        },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
                },
            Use = {
                dict = "amb@code_human_wander_drinking_fat@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 2000, 49}
                }
            },
        Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 3, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["icecream_stracciatella"] = {-- item name
    Size = 100,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_icecream_stracciatella',
            BoneID = 28422,
            Offset = vector3(0.0, -0.01, 0.02),
            Rot = vector3(05.0, -10.0, 0.0),
        }
        },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
                },
            Use = {
                dict = "amb@code_human_wander_drinking_fat@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 2000, 49}
                }
            },
        Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 3, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["icecream_strawberry"] = {-- item name
    Size = 100,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_icecream_strawberry',
            BoneID = 28422,
            Offset = vector3(0.0, -0.01, 0.02),
            Rot = vector3(05.0, -10.0, 0.0),
        }
        },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
                },
            Use = {
                dict = "amb@code_human_wander_drinking_fat@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 2000, 49}
                }
            },
        Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 3, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },
    ["icecream_walnut"] = {-- item name
    Size = 100,
    Type = 'FOOD', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_icecream_walnut',
            BoneID = 28422,
            Offset = vector3(0.0, -0.01, 0.02),
            Rot = vector3(05.0, -10.0, 0.0),
        }
        },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
                },
            Use = {
                dict = "amb@code_human_wander_drinking_fat@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 2000, 49}
                }
            },
        Consume = {
        Bite = {min = 15, max = 25}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 3, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },



--DRINK



    ["mug_a"] = {-- item name
    Size = 250,
    Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_food_xmas_mug_a',
            BoneID = 28422,
            Offset = vector3(0.0, -0.015, -0.05),
            Rot = vector3(5.0, -10.0, 45.5),
        }
    },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@code_human_wander_drinking_fat@male@idle_a",
            anim = "idle_c",
            params = {nil, nil, 2000, 49}
            }
        },
    Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 6, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },
    ["mug_b"] = {-- item name
    Size = 250,
    Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_food_xmas_mug_b',
            BoneID = 28422,
            Offset = vector3(0.0, -0.015, -0.05),
            Rot = vector3(5.0, -10.0, 45.5),
        }
    },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@code_human_wander_drinking_fat@male@idle_a",
            anim = "idle_c",
            params = {nil, nil, 2000, 49}
            }
        },
    Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 6, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },
    ["mulled_wine"] = {-- item name
    Size = 330,
    Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {
            Model = 'bzzz_food_xmas_mulled_wine_a',
            BoneID = 28422,
            Offset = vector3(0.0, -0.015, 0.05),
            Rot = vector3(5.0, -10.0, 45.5),
        }
        },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@code_human_wander_drinking_fat@male@idle_a",
            anim = "idle_c",
            params = {nil, nil, 2000, 49}
            }
        },
    Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 4, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = 2 -- Set the amount of alcohol the item should add after each drink.
        },
    },
    ["sprite"] = {-- item name
    Size = 330,
    Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_drinkpack_sprite001',
            BoneID = 28422,
            Offset = vector3(0.0, -0.015, 0.01),
            Rot = vector3(5.0, 5.0, 45.5),
        }
        },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@code_human_wander_drinking_fat@male@idle_a",
            anim = "idle_c",
            params = {nil, nil, 2000, 49}
            }
        },
    Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 6, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },
    ["lipton"] = {-- item name
    Size = 330,
    Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_drinkpack_lipton001',
            BoneID = 28422,
            Offset = vector3(0.0, -0.015, 0.01),
            Rot = vector3(5.0, 5.0, 45.5),
        }
        },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@code_human_wander_drinking_fat@male@idle_a",
            anim = "idle_c",
            params = {nil, nil, 2000, 49}
            }
        },
    Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 6, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },
    ["drpepper"] = {-- item name
    Size = 330,
    Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_drinkpack_drpepper001',
            BoneID = 28422,
            Offset = vector3(0.0, -0.015, 0.01),
            Rot = vector3(5.0, 5.0, 45.5),
        }
        },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@code_human_wander_drinking_fat@male@idle_a",
            anim = "idle_c",
            params = {nil, nil, 2000, 49}
            }
        },
    Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 6, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },
    ["zero"] = {-- item name
    Size = 330,
    Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'bzzz_drinkpack_colazero001',
            BoneID = 28422,
            Offset = vector3(0.0, -0.015, 0.01),
            Rot = vector3(5.0, 5.0, 45.5),
        }
        },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@code_human_wander_drinking_fat@male@idle_a",
            anim = "idle_c",
            params = {nil, nil, 2000, 49}
            }
        },
    Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 6, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["7up_1"] = {-- item name
        Size = 330,
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {

                Model = 'wasabi_7up_1',
                BoneID = 28422,
                Offset = vector3(0.0, 0.01, 0.05),
                Rot = vector3(5.0, 5.0, 45.5),

            }
            },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
                },
            Use = {
                dict = "amb@code_human_wander_drinking_fat@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 2000, 49}
                }
            },
        Consume = {
                Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
                Status = 6, -- set how much food or drink you want to add 
                Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
                Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
            },
    },

    ["7up_2"] = {-- item name
    Size = 330,
    Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'wasabi_7up_2',
            BoneID = 28422,
            Offset = vector3(0.0, -0.01, 0.05),
            Rot = vector3(5.0, 5.0, 90.5),
        }
        },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@code_human_wander_drinking_fat@male@idle_a",
            anim = "idle_c",
            params = {nil, nil, 2000, 49}
            }
        },
    Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 6, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["flemon"] = {-- item name
    Size = 330,
    Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'wasabi_fanta_lemon_1',
            BoneID = 28422,
            Offset = vector3(0.0, 0.01, 0.05),
            Rot = vector3(5.0, 5.0, 90.5),
        }
        },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@code_human_wander_drinking_fat@male@idle_a",
            anim = "idle_c",
            params = {nil, nil, 2000, 49}
            }
        },
    Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 6, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["forange"] = {-- item name
    Size = 330,
    Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'wasabi_fanta_orange_1',
            BoneID = 28422,
            Offset = vector3(0.0, 0.01, 0.05),
            Rot = vector3(5.0, 5.0, 0.5),
        }
        },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@code_human_wander_drinking_fat@male@idle_a",
            anim = "idle_c",
            params = {nil, nil, 2000, 49}
            }
        },
    Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 6, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["dew_1"] = {-- item name
    Size = 330,
    Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'wasabi_mntdew_1',
            BoneID = 28422,
            Offset = vector3(0.0, 0.01, 0.05),
            Rot = vector3(5.0, 5.0, 90.5),
        }
        },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@code_human_wander_drinking_fat@male@idle_a",
            anim = "idle_c",
            params = {nil, nil, 2000, 49}
            }
        },
    Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 6, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["dew_2"] = {-- item name
    Size = 330,
    Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'wasabi_mntdew_2',
            BoneID = 28422,
            Offset = vector3(0.0, 0.01, 0.05),
            Rot = vector3(5.0, 5.0, -20.5),
        }
        },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@code_human_wander_drinking_fat@male@idle_a",
            anim = "idle_c",
            params = {nil, nil, 2000, 49}
            }
        },
    Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 6, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["dew_3"] = {-- item name
    Size = 330,
    Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'wasabi_mntdew_3',
            BoneID = 28422,
            Offset = vector3(0.0, 0.01, 0.05),
            Rot = vector3(5.0, 5.0, 0.5),
        }
        },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@code_human_wander_drinking_fat@male@idle_a",
            anim = "idle_c",
            params = {nil, nil, 2000, 49}
            }
        },
    Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 6, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["monster"] = {-- item name
    Size = 330,
    Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'wasabi_monster_1',
            BoneID = 28422,
            Offset = vector3(0.0, 0.01, 0.05),
            Rot = vector3(5.0, 5.0, 90.5),
        }
        },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@code_human_wander_drinking_fat@male@idle_a",
            anim = "idle_c",
            params = {nil, nil, 2000, 49}
            }
        },
    Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 6, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["pepsi_1"] = {-- item name
    Size = 330,
    Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'wasabi_pepsi_1',
            BoneID = 28422,
            Offset = vector3(0.0, 0.01, 0.05),
            Rot = vector3(5.0, 5.0, 40.5),
        }
        },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@code_human_wander_drinking_fat@male@idle_a",
            anim = "idle_c",
            params = {nil, nil, 2000, 49}
            }
        },
    Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 6, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["pepsi_2"] = {-- item name
    Size = 330,
    Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'wasabi_pepsi_2',
            BoneID = 28422,
            Offset = vector3(0.0, 0.01, 0.05),
            Rot = vector3(5.0, 5.0, 0.5),
        }
        },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@code_human_wander_drinking_fat@male@idle_a",
            anim = "idle_c",
            params = {nil, nil, 2000, 49}
            }
        },
    Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 6, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },


    ["frosty"] = {-- item name
    Size = 250,
    Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'nels_ice_cream_meteorite_prop',
            BoneID = 28422,
            Offset = vector3(0.0, -0.01, 0.02),
            Rot = vector3(05.0, -10.0, 0.0),
        }
    },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@code_human_wander_drinking_fat@male@idle_a",
            anim = "idle_c",
            params = {nil, nil, 2000, 49}
            }
        },
Consume = {
        Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 6, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },

    ["frosty2"] = {-- item name
    Size = 250,
    Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
    Prop = { -- Prop spawn data for idle & usage.
    Main = {

            Model = 'nels_ice_cream_orang_otan_prop',
            BoneID = 28422,
            Offset = vector3(0.0, -0.01, 0.02),
            Rot = vector3(05.0, -10.0, 0.0),
        }
    },
    Anim = {
        Hold = {
            dict = "amb@code_human_wander_drinking@male@base",
            anim = "static",
            params = {8.0, -8, -1, 49, 0}
            },
        Use = {
            dict = "amb@code_human_wander_drinking_fat@male@idle_a",
            anim = "idle_c",
            params = {nil, nil, 2000, 49}
            }
        },
Consume = {
        Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
        Status = 6, -- set how much food or drink you want to add 
        Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
        Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
    },
    },

    ["raine"] = {-- item name
        Size = 500,
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {

                Model = 'ba_prop_club_water_bottle',
                BoneID = 18905,
                Offset = vector3(0.14, -0.08, 0.05),
                Rot = vector3(251.0, -14.0, 11.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 7, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["energy_drink"] = {-- item name
        Size = 500,
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {

                Model = 'prop_energy_drink',
                BoneID = 18905,
                Offset = vector3(0.14, -0.08, 0.05),
                Rot = vector3(251.0, -14.0, 11.0),
            }
            },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
                Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
                Status = 6, -- set how much food or drink you want to add 
                Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
                Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
            },
    },


    ["sprunk"] = {-- item name
        Size = 330,
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {

                Model = 'prop_ld_can_01',
                BoneID = 28422,
                Offset = vector3(0.0, -0.01, -0.02),
                Rot = vector3(05.0, -10.0, 0.0),
            }
            },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
                },
            Use = {
                dict = "amb@code_human_wander_drinking_fat@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 2000, 49}
                }
            },
        Consume = {
                Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
                Status = 6, -- set how much food or drink you want to add 
                Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
                Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
            },
    },

    ["coffe"] = {-- item name
        Size = 330,
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {

                Model = 'prop_fib_coffee',
                BoneID = 28422,
                Offset = vector3(0.0, -0.01, -0.02),
                Rot = vector3(05.0, -10.0, 0.0),
            }
            },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
                },
            Use = {
                dict = "amb@code_human_wander_drinking_fat@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 2000, 49}
                }
            },
        Consume = {
                Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
                Status = 5, -- set how much food or drink you want to add 
                Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
                Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
            },
    },

    ["coke_1"] = {-- item name
        Size = 330,
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {

                Model = 'wasabi_coke_1',
                BoneID = 28422,
                Offset = vector3(0.01, 0.01, 0.06),
                Rot = vector3(5.0, 5.0, 0.5),
            }
            },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
                },
            Use = {
                dict = "amb@code_human_wander_drinking_fat@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 2000, 49}
                }
            },
        Consume = {
                Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
                Status = 6, -- set how much food or drink you want to add 
                Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
                Alcohol = nil -- Set the amount of alcohol the item should add after each drink.
            },
    },

    ["piswasser"] = {-- item name
        Size = 500,
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {

                Model = 'prop_amb_beer_bottle',
                BoneID = 18905,
                Offset = vector3(0.14, -0.08, 0.05),
                Rot = vector3(251.0, -14.0, 11.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 4, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = 1, -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["mount_whiskey"] = {-- Item spawn name
        Size = 700, -- 
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {

                Model = 'prop_whiskey_bottle',
                BoneID = 18905,
                Offset = vector3(0.18, -0.19, 0.13),
                Rot = vector3(-120.0, 12.0, 6.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 4, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = 3, -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["tequila"] = {-- Item spawn name
        Size = 700, -- 
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {

                Model = 'prop_tequila_bottle',
                BoneID = 18905,
                Offset = vector3(0.14, -0.28, 0.1),
                Rot = vector3(-74.0, 190.0, 0.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 4, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = 4, -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["nogo_vodka"] = {-- Item spawn name
        Size = 700, -- 
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {

                Model = 'prop_vodka_bottle',
                BoneID = 18905,
                Offset = vector3(0.12, -0.28, 0.19),
                Rot = vector3(-120.0, .0, 0.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 4, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = 3, -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["costa_del_perro"] = {-- Item spawn name
        Size = 500, -- 
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {

                Model = 'prop_wine_bot_01',
                BoneID = 18905,
                Offset = vector3(0.14, -0.32, 0.1),
                Rot = vector3(-74.0, 190.0, 0.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 4, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = 2 -- Set the amount of alcohol the item should add after each drink.
        },
    },

    ["rockford_hill"] = {-- Item spawn name
        Size = 500, -- 
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {

                Model = 'prop_wine_bot_02',
                BoneID = 18905,
                Offset = vector3(0.14, -0.32, 0.1),
                Rot = vector3(-74.0, 190.0, 0.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 4, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = 2 -- Set the amount of alcohol the item should add after each drink.
        },
    },


    ["vinewood_red"] = {-- Item spawn name
        Size = 500, -- 
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {

                Model = 'prop_wine_rose',
                BoneID = 18905,
                Offset = vector3(0.14, -0.32, 0.1),
                Rot = vector3(-74.0, 190.0, 0.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 4, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = 2 -- Set the amount of alcohol the item should add after each drink.
        },
    },


    ["vinewood_blanc"] = {-- Item spawn name
        Size = 500, -- 
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {

                Model = 'prop_wine_white',
                BoneID = 18905,
                Offset = vector3(0.14, -0.32, 0.1),
                Rot = vector3(-74.0, 190.0, 0.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 4, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = 2 -- Set the amount of alcohol the item should add after each drink.
        },
    },


    ["bleuterd"] = { -- Item spawn name
        Size = 700, -- 
        Type = 'DRINK', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {

                Model = 'prop_champ_jer_01a',
                BoneID = 18905,
                Offset = vector3(0.14, -0.32, 0.1),
                Rot = vector3(-74.0, 190.0, 0.0),
            }
        },
        Anim = {
            Hold = nil,
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            }
        },
        Consume = {
            Bite = {min = 30, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
            Status = 4, -- set how much food or drink you want to add 
            Stress = nil, -- How much stress do you want to remove after using the item if you don't want to use the stress system leave nil
            Alcohol = 2 -- Set the amount of alcohol the item should add after each drink.
        },
    },


    ---GLASSES


    ['whiskey_glass'] = {
        Size = 250,
        Type = 'GLASS', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Main = {

        Prop = { -- Prop spawn data for idle & usage.
                Model = {full = 'prop_drink_whisky', null = 'prop_whiskey_01'}, -- Prop model null = prop of empty glass, full = prop of full glass
                BoneID = 28422, -- Id of the bone to which the prop is to be attached
                Offset = vector3(0.0, -0.01, -0.02),
                Rot = vector3(05.0, -10.0, 0.0),
            }
        },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
            },
            Use = {
                dict = "amb@code_human_wander_drinking@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 3000, 49}
            },
            Pour = { -- only for glasses 
                dict = "devcore_fox@pour",
                anim = "foxyando_pour_clip",
                params = {4.0, 4.0, 4000, 16, 0}
            }
        },
        Consume = { -- For glasses, there is no need to indicate alcohol, status, or stress because this information is taken from the beverage that is poured into the glass.
            Bite = {min = 30, max = 40}, -- Set how many ml or g are removed from the item after each drink / bite into food
        },
        AllowedItems = { -- Items that can not be poured into the glass
            'mount_whiskey',
            'tequila',
        },
    },

    ['flute_glass'] = {
        Size = 250,
        Type = 'GLASS', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {

                Model = {full = 'prop_cs_champ_flute', null = 'prop_champ_flute'}, -- Prop model null = prop of empty glass, full = prop of full glass
                BoneID = 28422, -- Id of the bone to which the prop is to be attached
                Offset = vector3(0.06, 0.0, -0.18),
                Rot = vector3(05.0, -10.0, 0.0),
            }
        },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
            },
            Use = {
                dict = "amb@code_human_wander_drinking@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 3000, 49}
            },
            Pour = { -- only for glasses 
                dict = "devcore_fox@pour",
                anim = "foxyando_pour_clip",
                params = {4.0, 4.0, 4000, 16, 0}
            }
        },
        Consume = { -- For glasses, there is no need to indicate alcohol, status, or stress because this information is taken from the beverage that is poured into the glass.
            Bite = {min = 25, max = 40}, -- Set how many ml or g are removed from the item after each drink / bite into food
        },
        AllowedItems = { -- Items that can not be poured into the glass
            'costa_del_perro',
            'vinewood_blanc',
            'vinewood_red',
            'rockford_hill',
            'bleuterd',
        },
    },

    ['wine_glass'] = {
        Size = 250, -- 
        Type = 'GLASS', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {
                Model = {full = 'prop_drink_redwine', null = 'prop_sh_wine_glass'}, -- -- Prop model null = prop of empty glass, full = prop of full glass
                BoneID = 28422, -- Id of the bone to which the prop is to be attached
                Offset = vector3(0.01, 0.01, -0.1),
                Rot = vector3(05.0, -10.0, 0.0),
            }
        },
        Anim = {
            Hold = {
                dict = "amb@code_human_wander_drinking@male@base",
                anim = "static",
                params = {8.0, -8, -1, 49, 0}
            },
            Use = {
                dict = "amb@code_human_wander_drinking@male@idle_a",
                anim = "idle_c",
                params = {nil, nil, 3000, 49}
            },
            Pour = { -- only for glasses 
                dict = "devcore_fox@pour",
                anim = "foxyando_pour_clip",
                params = {4.0, 4.0, 4000, 16, 0}
            },
        },
        Consume = { -- For glasses, there is no need to indicate alcohol, status, or stress because this information is taken from the beverage that is poured into the glass.
            Bite = {min = 30, max = 40}, -- Set how many ml or g are removed from the item after each drink / bite into food
        },
        AllowedItems = { -- Items that can not be poured into the glass
            'costa_del_perro',
            'vinewood_blanc',
            'vinewood_red',
            'rockford_hill',
        },
    },

    ['shot_glass'] = {
        Size = 50,
        Type = 'GLASS', -- Item type 'DRINK' , 'FOOD' , 'GLASS'
        Prop = { -- Prop spawn data for idle & usage.
        Main = {

                Model = {full = 'p_cs_shot_glass_2_s', null = 'prop_sh_shot_glass'}, -- -- Prop model null = prop of empty glass, full = prop of full glass
                BoneID = 18905, -- Id of the bone to which the prop is to be attached
                Offset = vector3(0.11, 0.01, 0.03),
                Rot = vector3(-101.0, -91.0, 11.0),
            }
        },
        Anim = {
            Hold = {
                dict = "anim@heists@humane_labs@finale@keycards",
                anim = "ped_a_enter_loop",
                params = {8.0, -8, -1, 49, 0}
            },
            Use = {
                dict = "mp_player_intdrink",
                anim = "loop_bottle",
                params = {nil, nil, 2000, 49}
            },
            Pour = { -- only for glasses 
                dict = "devcore_fox@pour",
                anim = "foxyando_pour_clip",
                params = {4.0, 4.0, 4000, 16, 0}
            }
        },
        Consume = { -- For glasses, there is no need to indicate alcohol, status, or stress because this information is taken from the beverage that is poured into the glass.
            Bite = {min = 50, max = 50}, -- Set how many ml or g are removed from the item after each drink / bite into food
        },
        AllowedItems = { -- Items that can not be poured into the glass
            'nogo_vodka',
            'tequila',
            'mount_whiskey',
        },
    },

}