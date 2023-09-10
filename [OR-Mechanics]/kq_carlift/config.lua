Config = {}

-- <!>
-- Debugging will enable debug logs as well as the `/lclear` command. This command deletes all the lifts which will then allow
-- you to restart the script to preview the new locations. Restarting the script while near a lift (in render distance)
-- will crash your game as the model will be unloaded. Make sure to use `/lclear` before restarting the script
Config.debug = false

-- jobs is an array of jobs that can use the lift. If you set jobs to false everyone no matter the job will be able to use it
Config.locations = {
    ---Tuners Mech 
    {
        x = 124.6794,
        y = -3047.0459,
        z = 7.0409, 
        h = 91.895,
        jobs = {
            'mechanic1',
        },
    }, 
    {
        x = 124.9692,
        y = -3034.9460,
        z = 7.0409,
        h = 93.3253,
        jobs = {
            'mechanic1',
        },
    }, 

    -----Hayes

    {
        x = -1417.2943,
        y = -446.0913,
        z = 35.9098,
        h = 212.5255,
        jobs = {
            'mechanic2',
        },
    }, 
    ---Japan  
    {
        x = 543.3585,
        y = -168.9433,
        z = 54.4932,
        h = 278.7791,
        jobs = {
            'biembo',
        },
    }, 

    ---- Route 68
    {
        x = 1174.9462,
        y = 2640.3025,
        z = 37.7538,
        h = 0,
        jobs = {
            'mechanic4', 
        },
    }, 
    -------- Paleto  
    {
        x = 110.9894,
        y = 6626.2852,
        z = 31.791,
        h = 46.0957,
        jobs = {
            'mechanic5', 
        },
    }, 
}


--- SETTINGS FOR ESX
Config.esxSettings = {
    enabled = false,
    -- Whether or not to use the new ESX export method
    useNewESXExport = false
}

--- SETTINGS FOR QBCORE
Config.qbSettings = {
    enabled = true,
    useNewQBExport = true, -- Make sure to uncomment the old export inside fxmanifest.lua if you're still using it
}

Config.target = {
    enabled = true,
    system = 'qb-target' -- 'qtarget' or 'qb-target'  (Other systems might work as well)
}

Config.keybinds = {
    up = {
        key = 'TOP',
        label = '⬆',
    },
    down = {
        key = 'DOWN',
        label = '⬇',
    },
    stop = {
        key = 'LEFT',
        label = '⬅',
    }
}
