Locales["en"] = {
    -- // MISC \\--
    ["radiosuggestion"] = "Abrir Radio",

    -- // COMMAND \\--
    ["command_help"] = "Cambiar canal de Radio",
    ["channel_name"] = "Canal de radio (número)",
    ["channel_help"] = "La frecuencia / canal de radio al que desea cambiar",

    -- // NOTIFICATIONS \\--
    ["muted"] = "Te silenciaste: %s",
    ["unmuted"] = "Te desilenciaste: %s",
    ["left"] = "Saliste de la radio",
    ["onanonymous"] = "Activaste el modo anónimo",
    ["offanonymous"] = "Desactivaste el modo anónimo",
    ["invalid_params"] = "Los parámetros introducidos no son validos",
    ["change_radio"] = "Te uniste al canal de radio: %s",
    ["locked_channel"] = "No tienes acceso a este canal de radio: %s",
    ["player_dead"] = "No puedes cambiar de canal estando muerto",

    -- // UI / HTML \\--
    ui = {
        notifications = {
            leftRadioTitle = "Radio",
            leftRadioText = "Has salido del canal de radio",

            lockedChannelTitle = "Canal bloqueado",
            lockedChannelText = "No tienes acceso para unirte a este canal!",

            joinedRadioTitle = "Uniendose a la Radio",
            joinedRadioText = "Te uniste a {0}"
        },

        general = {
            goback = "Volver",
            volumeUp = "Subir Volumen",
            volumeDown = "Bajar Volumen",
            turnOff = "Apagar",
            turnOn = "Encender"
        },

        settings = {
            darkMode = "Modo Oscuro",
            anonymous = "Anonimo",
            allowDrag = "Permitir arrastrar",
            size = "Tamaño"
        },

        radioMembers = {
            title = "Miembros de la Radio",
            notInChannel = "No estas en ningun canal",
            emptyMembersList = "Este canal esta vacio"
        },

        joinRadio = {
            title = "Unete a la radio",
            frequency = "Frecuencia",
            join = "Unirse a la frecuencia",
            leave = "Salid de la frecuencia"
        },

        info = {
            statusTitle = "Tu estado",
            status = "Mi estado",
            frequency = "Frecuencia: {0}",
            radioStatus = "Estado de la Radio",
            openRadioMembers = "Abrir miembres de la Radio",
            openSettings = "Abrir Ajustes",
            settings = "Ajustes",
            joinRadio = "Unirse a la radio",
            notInRadio = "No estas en radio",
            inRadio = "En radio"
        }
    }
}