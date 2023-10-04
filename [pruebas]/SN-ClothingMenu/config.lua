Config = {}

Config.ShowProps = true
Config.AllowInVehicle = false

Config.MainMenu = {
    DefaultKey = ';',
    Command = 'clothing',
    CommandHelpText = 'Toggle Clothing'
}

Config.Defaults = {
    ['top'] = {
        Emote = {animDict = 'missmic4', animName = 'michael_tux_fidget', flag = 16,duration = 1000},
        Male = {
            [3] = {drawableId = 15, textureId = 0}, -- hands
            [8] = {drawableId = 15, textureId = 0}, -- shirt
            [11] = {drawableId = 15, textureId = 0}, -- jacket
        },
        Female = {
            [3] = {drawableId = 15, textureId = 0}, -- hands
            [8] = {drawableId = 14, textureId = 0}, -- shirt
            [11] = {drawableId = 840, textureId = math.random(0,1)}, -- jacket
        }
    },
    ['legs'] = {
        Emote = {animDict = 'move_m@_idles@shake_off', animName = 'shakeoff_1', flag = 16,duration = 1000},
        Male = {
            [4] = {drawableId = 61,textureId = math.random(0,13)}, -- legs
        },
        Female = {
            [4] = {drawableId = 220,textureId = math.random(0,25)}, -- legs
        }
    },
    ['shoes'] = {
        Emote = {animDict = 'random@domestic', animName = 'pickup_low', flag = 16,duration = 1000},
        Male = {
            [6] = {drawableId = 34,textureId = 0}, -- shoes
        },
        Female = {
            [6] = {drawableId = 35,textureId = 0}, -- shoes
        }
    },
    ['bag'] = {
        Emote = {animDict = 'missmic4', animName = 'michael_tux_fidget', flag = 16,duration = 1000},
        Male = {
            [5] = {drawableId = 0,textureId = 0}, -- bag
        },
        Female = {
            [5] = {drawableId = 0,textureId = 0}, -- bag
        }
    },
    ['armor'] = {
        Emote = {animDict = 'missmic4', animName = 'michael_tux_fidget', flag = 16,duration = 1000},
        Male = {
            [9] = {drawableId = 0,textureId = 0}, -- vest
        },
        Female = {
            [9] = {drawableId = 0,textureId = 0}, -- vest
        }
    },
    ['mask'] = {
        Emote = {animDict = 'missminuteman_1ig_2', animName = 'tasered_2', flag = 16,duration = 1000},
        Male = {
            [1] = {drawableId = 0,textureId = 0}, -- mask
        },
        Female = {
            [1] = {drawableId = 0,textureId = 0}, -- mask
        }
    },
    ['necklace'] = {
        Emote = {animDict = 'clothingtie', animName = 'try_tie_positive_a', flag = 16,duration = 1000},
        Male = {
            [7] = {drawableId = 0,textureId = 0}, -- neck Accessory
        },
        Female = {
            [7] = {drawableId = 0,textureId = 0}, -- neck Accessory
        }
    },
    ['hat'] = {
        PropID = 0,
        Emote = {animDict = 'missminuteman_1ig_2', animName = 'tasered_2', flag = 16,duration = 1000},
    },
    ['glasses'] = {
        PropID = 1,
        Emote = {animDict = 'missminuteman_1ig_2', animName = 'tasered_2', flag = 16,duration = 1000},
    },
    ['ears'] = {
        PropID = 2,
        Emote = {animDict = 'missminuteman_1ig_2', animName = 'tasered_2', flag = 16,duration = 1000},
    },
    ['watch'] = {
        PropID = 6,
        Emote = {animDict = 'missmic4', animName = 'michael_tux_fidget', flag = 16,duration = 1000},
    },
    ['bracelet'] = {
        PropID = 7,
        Emote = {animDict = 'missmic4', animName = 'michael_tux_fidget', flag = 16,duration = 1000},
    },
}