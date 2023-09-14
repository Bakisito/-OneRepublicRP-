Config = {}

Config.Channels = {
    -- Example for Jobs
    [911] = {
        label = "Radio policial",
        jobs = {"police"}
    },
    [311] = {
        label = "Radio EMS",
        jobs = {"ambulance"}
    },
    -- Example for Gangs
    [420] = {
        label = "Ballas Radio",
        gangs = {"ballas"}
    },
    -- Example for Discord Roles, requires zdiscord or Badger_Discord_API
    [123] = {
        label = "Discord Radio",
        -- Role IDs, has to be strings not numbers
        discordRoles = {
            "931643836562804798"
        }
    }
}

Config.Locale = "en"

-- If true, a radio list will be displayed on the players screen when they are in a radio channel
Config.ShowPlayerList = true

-- pma-voice or mumble-voip
Config.VoiceScript = "pma-voice"

-- item -> Opens through the Config.Item itemname
-- command -> Opens through the command /radio
-- keybind -> Opens through a real keymapping (Config.Keybind)
-- control -> Opens through a button press (Config.Button)
-- custom -> Opens through the event "zerio-radio:client:open" or via the export "Open" (exports["zerio-radio"]:Open())
Config.OpenType = "item"

-- If true, then anonymous mode will be disabled
Config.DisableAnonymous = false

-- (Only important if Config.OpenType is item)
Config.Item = "radio"

-- (Only important if Config.OpenType is keybind)
Config.Keybind = "F5"

-- Full keybind list exists here, https://docs.fivem.net/docs/game-references/controls/ 
-- (Only important if Config.OpenType is control)
Config.Button = 243

-- The command name for changing radio channels, if you remove this line then the command will be removed
Config.ChangeRadioChannelCommand = "changeradio"

-- ONLY FOR MUMBLE-VOIP, has to be the same as the talking key for the animation to work
Config.RadioKey = 137

Config.DisconnectOnDeath = true

-- DONT CHANGE THIS IF YOU DONT KNOW WHAT YOU ARE DOING!!!!!!!!!!!!!!!!
Config.EventNames = {
    PlayerLoaded = "QBCore:Client:OnPlayerLoaded",
    PlayerUnLoaded = "QBCore:Client:OnPlayerUnload"
}
