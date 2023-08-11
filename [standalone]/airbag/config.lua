main = {
    -- Set damageLevel to 100.0 to activate airbags when the vehicle is no longer drivable
    -- This is recommended to stay between 700 - 999.0
    -- Vehicles start at 1000.0 damage level - then gradually reduce
    damageLevel = 650.0,
    modelName = `prop_car_airbag`,
    exemptVehicleClasses = {8, 16, 15, 13},
    exemptVehicleModels = {`police`, `police2`},
    airbagSoundVolume = 1.0,

    removalTimer = {
        enabled = true, -- This enables / disables the automatic removal of airbags
        timer = 45, -- This is the number of seconds until airbags are removed automatically
    },

    warningMessage = {
        enabled = true,  -- This enables / disables the airbag warning message
        flash = true, -- This determines whether to flash the message
        timer = 30, -- This is the number of seconds that the warning message is displayed for
    },

    removeCommand = { -- This allows you to enable / disable the /removeairbags command.
        enabled = true,
        name = "removeairbags",
    },

    airbagsCommand = { -- This allows you to enable / disable the /removeairbags command.
        enabled = true,
        name = "airbag",
    },
}

-- We do not recommend editing the below section
dev = {
    boneIndex1 = "seat_dside_f",
    boneIndex2 = "seat_pside_f",
    offSet1 = {0.0, 0.30, 0.40},
    rotation1 = {90.0, 0.0, 0.0},
    offSet2 = {0.0, 0.50, 0.40},
    rotation2 = {90.0, 0.0, 0.0},
}

translations = {
    airbagSuggestion = 'Activate the vehicle airbags',
    removeSuggestion = 'Removes the vehicle airbags',
}