language = {
    ["alreadyDrilled"] = "Este cajero ya ha sido perforado, ahora puede colocar un gancho",
    ["drillingComplete"] = "Se ha completado la perforación del cajero, ya puede colocar un gancho",
    ["nothingToDrill"] = "Nada que perforar",
    ["alreadyUsingRope"] = "Ya estás usando una cuerda",
    ["tryAgain"] = "Error, inténtalo de nuevo",
    ["nothingToAttach"] = "Nada a lo que atar la cuerda",
    ["vehicleFar"] = "El vehículo ha ido demasiado lejos",
    ["copCheck"] = "No hay suficientes policías en línea",
    ["cooldownCheck"] = "Otro cajero fue robado recientemente, actualmente hay un %s minutos de enfriamiento.",
    ["search"] = "Buscar",
    ["attach"] = "Atar cuerda",
    ["detach"] = "Separar cuerda",
    ["drillhole"] = "Taladrar un agujero en el cajero para fijar el gancho",
    ["info"] = "Información",
    ["error"] = "Error",
    ["success"] = "Éxito",
    ["snapped"] = "Cuerda enganchada",
    ["mightsnap"] = "La cuerda podría romperse",
    ["cantattach"] = "¡No se puede atar!"
}

config = {
    drillTime = 30, -- 15 seconds to finish drilling the atm.
    interactKey = 47, -- https://docs.fivem.net/docs/game-references/controls/
    copCheck = 2, -- there has to be 3 or more cops online.
    globalCooldown = 10, -- Global cooldown between each robbery (minutes). If a atm has been robbed no one can rob another one until 10 minutes.
}
