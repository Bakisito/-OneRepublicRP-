Config = Config or {}

Config.Target = 'qb' -- qb / ox
Config.Inventory = 'qb' -- qb / lj / ps / ox
Config.AdminCommand = 'showstores' -- command used to show stores an be able to teleport to each
Config.Police = {
    copsneeded = 0, -- amount of cops needed to rob stores
    dispatch = 'cd', -- ps = ps-dispatch / cd = cd_dispatch
    failedalertchance = 100,-- 30% chance an alert is triggered if minigame fails
    jobnames = { -- names of all police jobs
        'lapd',
        'bcso',
        'ranger',
        'swat',
    }
}
Config.StoreRefreshTime = 20 -- after 10 minutes of hitting the store the refresh an able to be robbed again
Config.DebugPolyZones = false
Config.SafeData = {
    minigame = 'ps-thermite', -- ps-ui minigames = (ps-circle,ps-maze,ps-var,ps-thermite,ps-scrambler) / memorygame
    itemchance = 50, -- 45% chance to get item from the safe
    items = { -- reward items
        [1] = { name = 'bolt_cutter', amount = 2, },
         [2] = { name = 'powerbank', amount = 10, },
         [3] = { name = 'firework1', amount = 2, },
         [4] = { name = 'camera', amount = 1, },
         [5] = { name = 'comic_book_2', amount = 1, },
         [7] = { name = 'weapon_m1911', amount = 1, },

    },
    min = 1500, max = 4000, -- min/max amount of cash that will be given
}
Config.RegisterData = {
    minigame = 'ps-circle', -- ps-ui minigames = (ps-circle,ps-maze,ps-var,ps-thermite,ps-scrambler) / memorygame
    min = 100, max = 900, -- min/max amount of cash that will be given
}

-- For more info on the minigames the are all named accordingly
-- ps minigames https://github.com/Project-Sloth/ps-ui
-- memorygame https://github.com/pushkart2/memorygame

Config.MiniGameData = { --  https://github.com/Project-Sloth/ps-ui
    circle = { circles = 3, seconds = 20 },
    maze = { seconds = 20 },
    var = { blocks = 3, seconds = 20 },
    thermite = { seconds = 20, gridsize = 6, incorrectblocks = 3 },
    scrambler = { type = 'numeric', seconds = 20, mirrored = 0 },
    
    memorygame = { correctblocks = 10, incorrectblocks = 3, timetoshow = 4, timetolose = 10, }
}

Config.StoreData = {
    [1] = {-- store type id
        type = 'register', -- either safe or register
        target = { -- below is of the boxzone created using the command pzcreate with polyzone
            coords = vector3(25.5, -1345.72, 29.5),
            length = 0.4, width = 0.6, heading = 0, minZ = 29.5, maxZ = 29.9,
            label = 'Abrir caja registradora', -- label for the target on register/safes
            neededitem = 'lockpick' -- item needed on player to do the hack for register or safe
        },
        canloot = false, -- DO NOT CHANGE
        timer = { min = 1, max = 2 }, -- timer after the hack until the player can grab the loot
        opended = false, busy = false -- DO NOT CHANGE
    },
    [2] = {
        type = 'register',
        target = {
            coords = vector3(25.5, -1347.87, 29.5),
            length = 0.4, width = 0.6, heading = 0, minZ = 29.5, maxZ = 29.9,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [3] = {
        type = 'register',
        target = {
            coords = vector3(-48.6, -1759.15, 29.42),
            length = 0.4, width = 0.6, heading = 320, minZ = 29.42, maxZ = 29.82,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [4] = {
        type = 'register',
        target = {
            coords = vector3(-47.19, -1757.59, 29.42),
            length = 0.4, width = 0.6, heading = 320, minZ = 29.42, maxZ = 29.82,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [5] = {
        type = 'register',
        target = {
            coords = vector3(-706.73, -915.74, 19.22),
            length = 0.4, width = 0.6, heading = 0, minZ = 19.22, maxZ = 19.62,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [6] = {
        type = 'register',
        target = {
            coords = vector3(-706.73, -913.69, 19.22),
            length = 0.4, width = 0.6, heading = 0, minZ = 19.22, maxZ = 19.62,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [7] = {
        type = 'register',
        target = {
            coords = vector3(-1222.36, -907.77, 12.33),
            length = 0.4, width = 0.6, heading = 303, minZ = 12.33, maxZ = 12.73,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [8] = {
        type = 'register',
        target = {
            coords = vector3(-1486.74, -378.51, 40.16),
            length = 0.4, width = 0.6, heading = 224, minZ = 40.16, maxZ = 40.56,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [9] = {
        type = 'register',
        target = {
            coords = vector3(373.45, 325.61, 103.57),
            length = 0.4, width = 0.6, heading = 165, minZ = 103.57, maxZ = 103.97,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [10] = {
        type = 'register',
        target = {
            coords = vector3(374.0, 327.70, 103.57),
            length = 0.4, width = 0.6, heading = 166, minZ = 103.57, maxZ = 103.97,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [11] = {
        type = 'register',
        target = {
            coords = vector3(1164.1, -322.91, 69.21),
            length = 0.4, width = 0.6, heading = 190, minZ = 69.21, maxZ = 69.61,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [12] = {
        type = 'register',
        target = {
            coords = vector3(1164.45, -324.91, 69.21),
            length = 0.4, width = 0.6, heading = 190, minZ = 69.21, maxZ = 69.61,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [13] = {
        type = 'register',
        target = {
            coords = vector3(2557.81, 381.85, 108.62),
            length = 0.4, width = 0.6, heading = 268, minZ = 108.62, maxZ = 109.02,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [14] = {
        type = 'register',
        target = {
            coords = vector3(2555.65, 381.94, 108.62),
            length = 0.4, width = 0.6, heading = 268, minZ = 108.62, maxZ = 109.02,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [15] = {
        type = 'register',
        target = {
            coords = vector3(-2967.06, 390.91, 15.04),
            length = 0.4, width = 0.6, heading = 356, minZ = 15.04, maxZ = 15.44,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [16] = {
        type = 'register',
        target = {
            coords = vector3(-3038.75, 585.72, 7.91),
            length = 0.4, width = 0.6, heading = 288, minZ = 7.91, maxZ = 8.31,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [17] = {
        type = 'register',
        target = {
            coords = vector3(-3040.80, 585.05, 7.91),
            length = 0.4, width = 0.6, heading = 288, minZ = 7.91, maxZ = 8.31,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [18] = {
        type = 'register',
        target = {
            coords = vector3(-3241.65, 1000.90, 12.83),
            length = 0.4, width = 0.6, heading = 355, minZ = 12.83, maxZ = 13.23,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [19] = {
        type = 'register',
        target = {
            coords = vector3(-3243.76, 1001.1, 12.83),
            length = 0.4, width = 0.6, heading = 355, minZ = 12.83, maxZ = 13.23,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [20] = {
        type = 'register',
        target = {
            coords = vector3(-1820.57, 793.73, 138.14),
            length = 0.4, width = 0.6, heading = 313, minZ = 12.83, maxZ = 13.23,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [21] = {
        type = 'register',
        target = {
            coords = vector3(-1819.19, 792.22, 138.11),
            length = 0.4, width = 0.6, heading = 313, minZ = 138.11, maxZ = 138.51,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [22] = {
        type = 'register',
        target = {
            coords = vector3(548.00, 2671.75, 42.16),
            length = 0.4, width = 0.6, heading = 278, minZ = 42.16, maxZ = 42.56,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [23] = {
        type = 'register',
        target = {
            coords = vector3(548.3, 2669.65, 42.16),
            length = 0.4, width = 0.6, heading = 278, minZ = 42.16, maxZ = 42.56,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [24] = {
        type = 'register',
        target = {
            coords = vector3(1961.3, 3740.0, 32.34),
            length = 0.4, width = 0.6, heading = 300, minZ = 32.34, maxZ = 32.74,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [25] = {
        type = 'register',
        target = {
            coords = vector3(1960.15, 3741.90, 32.34),
            length = 0.4, width = 0.6, heading = 300, minZ = 32.34, maxZ = 32.74,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [26] = {
        type = 'register',
        target = {
            coords = vector3(1698.37, 4923.44, 42.06),
            length = 0.4, width = 0.6, heading = 324, minZ = 42.06, maxZ = 42.46,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [27] = {
        type = 'register',
        target = {
            coords = vector3(1696.66, 4924.59, 42.06),
            length = 0.4, width = 0.6, heading = 324, minZ = 42.06, maxZ = 42.46,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [28] = {
        type = 'register',
        target = {
            coords = vector3(2679.0, 3279.99, 55.24),
            length = 0.4, width = 0.6, heading = 61, minZ = 55.24, maxZ = 55.64,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [29] = {
        type = 'register',
        target = {
            coords = vector3(2677.18, 3281.10, 55.24),
            length = 0.4, width = 0.6, heading = 60, minZ = 55.24, maxZ = 55.64,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [30] = {
        type = 'register',
        target = {
            coords = vector3(1728.5, 6414.25, 36.3),
            length = 0.4, width = 0.6, heading = 64, minZ = 35.04, maxZ = 35.44,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [31] = {
        type = 'register',
        target = {
            coords = vector3(1729.50, 6416.30, 36.55),
            length = 0.4, width = 0.6, heading = 64, minZ = 35.04, maxZ = 35.44,
            label = 'Abrir caja registradora',
            neededitem = 'lockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    -- [32] = {
    --     type = 'register',
    --     target = {
    --         coords = vector3(-330.7, 6079.69, 31.45),
    --         length = 0.4, width = 0.6, heading = 46, minZ = 31.45, maxZ = 31.85,
    --         label = 'Abrir caja registradora',
    --         neededitem = 'lockpick'
    --     },
    --     canloot = false,
    --     timer = { min = 1, max = 5 },
    --     opended = false, busy = false
    -- },
    -- [33] = {
    --     type = 'register',
    --     target = {
    --         coords = vector3(-330.22, 6085.46, 31.45),
    --         length = 0.4, width = 0.6, heading = 135, minZ = 31.45, maxZ = 31.85,
    --         label = 'Abrir caja registradora',
    --         neededitem = 'lockpick'
    --     },
    --     canloot = false,
    --     timer = { min = 1, max = 5 },
    --     opended = false, busy = false
    -- },
    -- [34] = {
    --     type = 'register',
    --     target = {
    --         coords = vector3(1693.36, 3755.72, 34.71),
    --         length = 0.4, width = 0.6, heading = 228, minZ = 34.71, maxZ = 35.11,
    --         label = 'Abrir caja registradora',
    --         neededitem = 'lockpick'
    --     },
    --     canloot = false,
    --     timer = { min = 1, max = 5 },
    --     opended = false, busy = false
    -- },
    -- [35] = {
    --     type = 'register',
    --     target = {
    --         coords = vector3(1693.62, 3761.58, 34.71),
    --         length = 0.4, width = 0.6, heading = 318, minZ = 34.71, maxZ = 35.11,
    --         label = 'Abrir caja registradora',
    --         neededitem = 'lockpick'
    --     },
    --     canloot = false,
    --     timer = { min = 1, max = 5 },
    --     opended = false, busy = false
    -- },
    -- [36] = {
    --     type = 'register',
    --     target = {
    --         coords = vector3(-1118.38, 2694.44, 18.55),
    --         length = 0.4, width = 0.6, heading = 43, minZ = 18.55, maxZ = 18.95,
    --         label = 'Abrir caja registradora',
    --         neededitem = 'lockpick'
    --     },
    --     canloot = false,
    --     timer = { min = 1, max = 5 },
    --     opended = false, busy = false
    -- },
    -- [37] = {
    --     type = 'register',
    --     target = {
    --         coords = vector3(-1117.56, 2700.23, 18.55),
    --         length = 0.4, width = 0.6, heading = 132, minZ = 18.55, maxZ = 18.95,
    --         label = 'Abrir caja registradora',
    --         neededitem = 'lockpick'
    --     },
    --     canloot = false,
    --     timer = { min = 1, max = 5 },
    --     opended = false, busy = false
    -- },
    -- [38] = {
    --     type = 'register',
    --     target = {
    --         coords = vector3(w),
    --         length = 0.4, width = 0.6, heading = 76, minZ = 36.7, maxZ = 37.1,
    --         label = 'Abrir caja registradora',
    --         neededitem = 'lockpick'
    --     },
    --     canloot = false,
    --     timer = { min = 1, max = 5 },
    --     opended = false, busy = false
    -- },
    -- [39] = {
    --     type = 'register',
    --     target = {
    --         coords = vector3(-1305.04, -395.79, 36.7),
    --         length = 0.4, width = 0.6, heading = 166, minZ = 36.7, maxZ = 37.1,
    --         label = 'Abrir caja registradora',
    --         neededitem = 'lockpick'
    --     },
    --     canloot = false,
    --     timer = { min = 1, max = 5 },
    --     opended = false, busy = false
    -- },
    -- [40] = {
    --     type = 'register',
    --     target = {
    --         coords = vector3(-665.38, -937.93, 21.83),
    --         length = 0.4, width = 0.6, heading = 181, minZ = 21.83, maxZ = 22.23,
    --         label = 'Abrir caja registradora',
    --         neededitem = 'lockpick'
    --     },
    --     canloot = false,
    --     timer = { min = 1, max = 5 },
    --     opended = false, busy = false
    -- },
    -- [41] = {
    --     type = 'register',
    --     target = {
    --         coords = vector3(-660.94, -934.15, 21.83),
    --         length = 0.4, width = 0.6, heading = 270, minZ = 21.83, maxZ = 22.23,
    --         label = 'Abrir caja registradora',
    --         neededitem = 'lockpick'
    --     },
    --     canloot = false,
    --     timer = { min = 1, max = 5 },
    --     opended = false, busy = false
    -- },
    -- [42] = {
    --     type = 'register',
    --     target = {
    --         coords = vector3(23.67, -1106.5, 29.8),
    --         length = 0.4, width = 0.6, heading = 71, minZ = 29.8, maxZ = 30.2,
    --         label = 'Abrir caja registradora',
    --         neededitem = 'lockpick'
    --     },
    --     canloot = false,
    --     timer = { min = 1, max = 5 },
    --     opended = false, busy = false
    -- },
    -- [43] = {
    --     type = 'register',
    --     target = {
    --         coords = vector3(813.28, -2154.67, 29.62),
    --         length = 0.4, width = 0.6, heading = 1, minZ = 29.62, maxZ = 30.02,
    --         label = 'Abrir caja registradora',
    --         neededitem = 'lockpick'
    --     },
    --     canloot = false,
    --     timer = { min = 1, max = 5 },
    --     opended = false, busy = false
    -- },
    -- [44] = {
    --     type = 'register',
    --     target = {
    --         coords = vector3(808.87, -2158.43, 29.62),
    --         length = 0.4, width = 0.6, heading = 271, minZ = 29.62, maxZ = 30.02,
    --         label = 'Abrir caja registradora',
    --         neededitem = 'lockpick'
    --     },
    --     canloot = false,
    --     timer = { min = 1, max = 5 },
    --     opended = false, busy = false
    -- },
    -- [45] = {
    --     type = 'register',
    --     target = {
    --         coords = vector3(845.56, -1030.93, 28.19),
    --         length = 0.4, width = 0.6, heading = 182, minZ = 28.19, maxZ = 28.59,
    --         label = 'Abrir caja registradora',
    --         neededitem = 'lockpick'
    --     },
    --     canloot = false,
    --     timer = { min = 1, max = 5 },
    --     opended = false, busy = false
    -- },
    -- [46] = {
    --     type = 'register',
    --     target = {
    --         coords = vector3(841.07, -1034.7, 28.19),
    --         length = 0.4, width = 0.6, heading = 91, minZ = 28.19, maxZ = 28.59,
    --         label = 'Abrir caja registradora',
    --         neededitem = 'lockpick'
    --     },
    --     canloot = false,
    --     timer = { min = 1, max = 5 },
    --     opended = false, busy = false
    -- },
    [47] = {
        type = 'safe',
        target = {
            coords = vector3(31.60, -1339.3, 30.5),
            length = 0.8, width = 0.8, heading = 0, minZ = 29.5, maxZ = 30.5,
            label = 'Abrir caja fuerte',
            neededitem = 'advancedlockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [48] = {
        type = 'safe',
        target = {
            coords = vector3(-43.94, -1747.98, 29.42),
            length = 0.8, width = 0.8, heading = 320, minZ = 28.22, maxZ = 29.32,
            label = 'Abrir caja fuerte',
            neededitem = 'advancedlockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [49] = {
        type = 'safe',
        target = {
            coords = vector3(-710.4, -904.15, 19.22),
            length = 0.8, width = 0.8, heading = 0, minZ = 18.02, maxZ = 19.12,
            label = 'Abrir caja fuerte',
            neededitem = 'advancedlockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [50] = {
        type = 'safe',
        target = {
            coords = vector3(-1221.34, -916.35, 11.33),
            length = 0.8, width = 0.8, heading = 35, minZ = 10.13, maxZ = 12.00,
            label = 'Abrir caja fuerte',
            neededitem = 'advancedlockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [51] = {
        type = 'safe',
        target = {
            coords = vector3(-1478.47, -375.87, 39.16),
            length = 0.8, width = 0.8, heading = 45, minZ = 37.96, maxZ = 39.80,
            label = 'Abrir caja fuerte',
            neededitem = 'advancedlockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [52] = {
        type = 'safe',
        target = {
            coords = vector3(381.5, 332.43, 104.37),
            length = 0.8, width = 0.8, heading = 75, minZ = 103.57, maxZ = 104.37,
            label = 'Abrir caja fuerte',
            neededitem = 'advancedlockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [53] = {
        type = 'safe',
        target = {
            coords = vector3(1158.83, -314.14, 69.21),
            length = 0.8, width = 0.8, heading = 99, minZ = 68.01, maxZ = 69.11,
            label = 'Abrir caja fuerte',
            neededitem = 'advancedlockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [54] = {
        type = 'safe',
        target = {
            coords = vector3(2549.51, 388.5, 108.62), 
            length = 0.8, width = 0.8, heading = 88, minZ = 108.58, maxZ = 109.52,
            label = 'Abrir caja fuerte',
            neededitem = 'advancedlockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [55] = {
        type = 'safe',
        target = {
            coords = vector3(-3048.88, 589.1, 8.8),
            length = 0.8, width = 0.8, heading = 108, minZ = 7.8, maxZ = 8.8,
            label = 'Abrir caja fuerte',
            neededitem = 'advancedlockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [56] = {
        type = 'safe',
        target = {
            coords = vector3(-3249.58, 1007.80, 13.60),
            length = 0.8, width = 0.8, heading = 85, minZ = 12.9, maxZ = 13.72,
            label = 'Abrir caja fuerte',
            neededitem = 'advancedlockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [57] = { 
        type = 'safe',
        target = {
            coords = vector3(-1829.67, 798.31, 138.17),
            length = 0.8, width = 0.8, heading = 42, minZ = 136.97, maxZ = 138.07,
            label = 'Abrir caja fuerte',
            neededitem = 'advancedlockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [58] = {
        type = 'safe',
        target = {
            coords = vector3(543.27, 2662.47, 42.80),
            length = 0.8, width = 0.8, heading = 8, minZ = 42.20, maxZ = 43.06,
            label = 'Abrir caja fuerte',
            neededitem = 'advancedlockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [59] = {
        type = 'safe',
        target = {
            coords = vector3(1962.04, 3750.39, 32.80),
            length = 0.8, width = 0.8, heading = 30, minZ = 32.30, maxZ = 33.20,
            label = 'Abrir caja fuerte',
            neededitem = 'advancedlockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    -- [60] = {
    --     type = 'safe',
    --     target = {
    --         coords = vector3(2672.2, 3286.94, 55.24),
    --         length = 0.8, width = 0.8, heading = 61, minZ = 54.04, maxZ = 55.14,
    --         label = 'Abrir caja fuerte',
    --         neededitem = 'advancedlockpick'
    --     },
    --     canloot = false,
    --     timer = { min = 1, max = 5 },
    --     opended = false, busy = false
    -- },
    [61] = {
        type = 'safe',
        target = {
            coords = vector3(2674.33, 3289.27, 55.54),
            length = 0.8, width = 0.8, heading = 61, minZ = 55.24, maxZ = 56.05,
            label = 'Abrir caja fuerte',
            neededitem = 'advancedlockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [62] = {
        type = 'safe',
        target = {
            coords = vector3(1708.23, 4920.93, 42.06),
            length = 0.8, width = 0.8, heading = 55, minZ = 40.86, maxZ = 41.96,
            label = 'Abrir caja fuerte',
            neededitem = 'advancedlockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
    [63] = {
        type = 'safe',
        target = {
            coords = vector3(1737.66, 6419.32, 35.50),
            length = 0.8, width = 0.8, heading = 64, minZ = 35.0, maxZ = 35.9,
            label = 'Abrir caja fuerte',
            neededitem = 'advancedlockpick'
        },
        canloot = false,
        timer = { min = 1, max = 5 },
        opended = false, busy = false
    },
}

Config.MaleNoGloves = {
    [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [18] = true, [26] = true, [52] = true, [53] = true, [54] = true, [55] = true, [56] = true, [57] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [112] = true, [113] = true, [114] = true, [118] = true, [125] = true, [132] = true,
}
Config.FemaleNoGloves = {
    [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [19] = true, [59] = true, [60] = true, [61] = true, [62] = true, [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true, [69] = true, [70] = true, [71] = true, [129] = true, [130] = true, [131] = true, [135] = true, [142] = true, [149] = true, [153] = true, [157] = true, [161] = true, [165] = true,
}
