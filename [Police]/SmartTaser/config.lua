main = {
    -- This section allows you to define your server framework. By default, standalone is enabled
    framework = { -- Incorrectly named but kept for backwards compatibility
        standalone = false,
        ESX = false,
        QBCore = true,
        alternativeQBCoreItemRemoval = {
            enabled = false,
            eventToTrigger = ""
        },
        vRP = false,
        oxInv = false,
        cartridgeItemName = "taser_cartridge"
    },
    useUI = true, -- Use this to allow UI components to be enabled/disabled
    refreshTaserPresence = 1000, -- In ms. This is how long between the server checking for presence of a taser in the players inventory.A lower number is more realistic but will have a greater detriment on perfromance
    waitTimeInThreads = 2, -- In seconds. (If you are having issues with the UI loading in long after a player pulls a taser out, lower this number)
    safetyDefault = false,
    soundVolume = 0.7, -- This allows you to change the sound volume. The number should be a maximum of 1.0
    rangeToRemoveBarbs = 25.0, -- This is the range of barbs, after this, they will remove automatically
    arcModeRange = 1.2, -- This is the range your drive stun (arc) mode will operate in, you must be this close to another player
    driveStunCooldown = 1, -- This is the cooldown after using drive stun (arc) mode, before being able to use it again
    cartridgeReactivationCooldown = 1, -- This is the cooldown between reactivations
    -- These are all the default keybinds for various parts of the taser. These can be changed by each individual user in their settings and keybinds section.
    selectRightCartridge = "PAGEDOWN",
    selectLeftCartridge = "PAGEUP",
    enableArcMode = 'X',
    enableFlashlight = 'Q',
    enableLaserSight = 'E',
    enableSafety = 'Z',
    reloadTaser = 'R',
    flashlightColour = {221, 221, 221}, -- This is the colour of the flashlight
    laserSightColour = {255, 0, 0}, -- This is the colour of the laser sight
    laserSightRange = 25.0, -- This is the range on the laser sight
    webhookOptions = {
        colour = 1752220, -- This must be in a decimal format, please find a list here: https://gist.github.com/thomasbnt/b6f455e2c7d743b796917fa3c205f812
        webhookImage = "https://i.imgur.com/FtbsbMX.png", -- This is the image that will display in the webhook
        webHookName = "Axon Audit Trail" -- This is the name of the webhook
    },
    -- This allows you to move the position of the CID. By default, this is in the bottom right
    cidXY = {0.0625, 0.055}, -- {X, Y}
    -- Copy these into the CID for wherever you'd like it to be placed:
    -- Above Map: {0.08, 0.73}
    -- Top Left: {0.0625, 0.055}
    -- Bottom Right: {0.94, 0.94}
    -- Top Right: {0.94, 0.055}}
}

-- This section along with the commands below allows you to fully translate every element of the resource into another language
main.translations = {
    embedTitle = "Taser - Registro de sucesos",
    event = "Evento:",
    device = "Dispositivo:",
    carrier = "Carrier:",
    cartridgesRemaining = "Cartuchos restantes:",
    cartridgeID = "ID de cartucho:",
    serialNumber = "Número de serie:",
    battery = "Batería:",
    timestamp = "Timestamp:",
    eventType1 = "Disparo - Cartucho 1",
    eventType2 = "Disparo - Cartucho 2",
    eventType3 = "Disparo - Modo Arco",
    eventType4 = "Cartucho Taser Reactivado",
    left = "Izquierda",
    right = "Derecha",
    barbReactivated = " cartucho reactivado",
    arcTase = "Modo aturdidor activado",
    taserReloaded = "Recarga exitosa",
    barbsRemovedByOfficer = "Púas retiradas con éxito",
    barbsRemovedByOfficer2 = "Las púas de tu taser han sido retiradas manualmente",
    barbsRemovedAutomatically = "Las púas de tu taser han sido arrancadas",
    barbsRemovedAutomaticallyOfficer = "Las púas del taser del sospechoso han sido arrancadas",
    suspectDied = "El sospechoso ha muerto",
    weaponFull = "Tu taser ya está completamente cargada",
    weaponNotFound = "Debe tener el taser en la mano",
    reloadTaserSuggestion = "Recargue su taser",
    removeBarbsSuggestion = "Quita las púas después de disparar",

    -- Formatting colour codes for people using external notification systems which do not support colour codes 
    -- No need to edit this in most instances
    formatting = {
        title = "~h~~r~",
        body1 = "~s~~h~",
        body2 = "~w~",
    },
}



main.commands = {
    toggleTorch = 'toggletorch',
    toggleTorchDescription = "Torch Toggle",
    toggleLaser = 'togglelaser',
    toggleLaserDescription = "Laser Toggle",
    toggleSafety = 'togglesafety',
    toggleSafetyDescription = "Safety Mode Toggle",
    selectRightCartridge = 'selectrightcartridge',
    selectRightCartridgeDescription = "Reactivate Right Cartridge",
    selectLeftCartridge = 'selectleftcartridge',
    selectLeftCartridgeDescription = "Reactivate Left Cartridge",
    driveStun = "drivestun",
    driveStunDescription = "Drive Stun Toggle",
    reloadTaser = "reloadtaser",
    reloadTaserDescription = "Reload your taser.",
    reloadTaserKey = "reloadtaserwithkey",
    reloadTaserKeyDescription = "Reload your taser.",
    removeBarbs = "removebarbs",
    removeBarbsDescription = "Remove barbs off a suspect."

}

-- This section allows you to support additional taser models for your server
tasers = {
    [`weapon_stungun`] = { -- This is the model of the taser
        name = "Taser X2", -- This is the name of the taser and will appear in logs
        loadedCartridges = 2, -- Always keep loadedCartrides as 2
        ableToDriveStun = true, -- This enables/disables Arc Mode of the taser
        ableToReactivate = true, -- This enables/disables reactivating the taser
    },
}

-- This section allows you to define which notification resource you want to use
-- We plan to add support for many more notification systems in a future update
main.notifications = {
    gtaAboveMap = false,
    mythicNotify = {
        enabled = true,
        mythicNotifyResourceName = "okokNotify"
    }
}