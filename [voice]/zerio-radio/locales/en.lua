Locales["en"] = {
    -- // MISC \\--
    ["radiosuggestion"] = "Open Radio",

    -- // COMMAND \\--
    ["command_help"] = "Change radio channel",
    ["channel_name"] = "Radio channel (number)",
    ["channel_help"] = "The frequency / radio channel you want to change to",

    -- // NOTIFICATIONS \\--
    ["muted"] = "You muted: %s",
    ["unmuted"] = "You unmuted: %s",
    ["left"] = "You left the radio",
    ["onanonymous"] = "You turned on anonymous mode",
    ["offanonymous"] = "You turned off anonymous mode",
    ["invalid_params"] = "The parameters you inputted are invalid",
    ["change_radio"] = "You joined radio channel: %s",
    ["locked_channel"] = "You dont have access to radio channel: %s",
    ["player_dead"] = "You cant change channels while being dead",

    -- // UI / HTML \\--
    ui = {
        notifications = {
            leftRadioTitle = "Left radio",
            leftRadioText = "You left the radio channel",

            lockedChannelTitle = "Locked channel",
            lockedChannelText = "You dont have access to join this channel!",

            joinedRadioTitle = "Joined radio",
            joinedRadioText = "You joined {0}"
        },

        general = {
            goback = "Go back",
            volumeUp = "Volume up",
            volumeDown = "Volume down",
            turnOff = "Turn off",
            turnOn = "Turn on"
        },

        settings = {
            darkMode = "Dark mode",
            anonymous = "Anonymous",
            allowDrag = "Allow drag",
            size = "Size"
        },

        radioMembers = {
            title = "Radio Members",
            notInChannel = "You are not in any radio channel",
            emptyMembersList = "This radio channel is empty"
        },

        joinRadio = {
            title = "Join Radio",
            frequency = "Frequency",
            join = "Join Frequency",
            leave = "Leave Frequency"
        },

        info = {
            statusTitle = "Your Status",
            status = "My Status",
            frequency = "Frequency: {0}",
            radioStatus = "Radio Status",
            openRadioMembers = "Open radio members",
            openSettings = "Open settings",
            settings = "Settings",
            joinRadio = "Join Radio",
            notInRadio = "Not in any radio",
            inRadio = "In radio"
        }
    }
}
