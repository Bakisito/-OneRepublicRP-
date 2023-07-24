Config = {}

Config.CuffItem = ''
Config.CuffKeysItem = ''
Config.RopeItem = 'rope'
Config.BagToHeadItem = 'headbag'
Config.ElectronicCuffItem = 'electrocuff'
Config.ElectronicCuffTrackerItem = 'electrocufftracker'

Config.OpenMenuKey = ''  --f6
Config.InventoryOpenKey = 289 -- Disables this input when user is cuffed
Config.DisableWhenUserCuffed = {289, 37, 73, 192, 204, 211, 349} -- Disables these input when user is cuffed

Config.HandcuffIMG = 'https://raw.githubusercontent.com/0resmon/db/main/img/black.png'
Config.HandcuffDefaultIMG = 'https://raw.githubusercontent.com/0resmon/db/main/img/prop_chrome_03.png'
Config.HandcuffSound = 'https://raw.githubusercontent.com/0resmon/db/main/sound/handcuff.mp3'

Config.RealtimeGPS = true -- WARNING: Enabling this option will enable realtime gps isntead of just marking gps location on tablet but it may cause a lot of cps/ram usage on both client and server side.
Config.RealtimeGPSRefreshMS = 1000 -- WARNING: This option directly affect cpu/ram usage, so be carefull when changing it! It controls how fast the gps will refresh itself

Config.TestMode = false

Config.GetClosestPlayer = function()
   return ESX.Game.GetClosestPlayer()
end

Config.Lang = {
    ["no_one_nearby"] = "No hay nadie en los alrededores",
    ["no_one_nearby_cuff"] = "No hay nadie cerca para esposarle.",
    ["no_one_nearby_cuff2"] = "No hay nadie cerca para esposarle.",
    ["menu_title"] = "Menú de acciones",
    ["put_bag"] = "Quitar la bolsa de la cabeza",
    ["arac_bin"] = "Colocar el jugador en el coche",
    ["arac_in"] = "Sacar el jugador en el coche",
    ["bacak_coz"] = "Desatar la cuerda de la pierna",
    ["bant_cikar"] = "Colocarse y quitarse la cinta en la boca",
    ["tasi"] = "Jugadores en movimiento",
    ["birak"] = "Liberar jugadores",
    ["tape_type"] = "Selecciona el tipo de banda",
    ["bant"] = "Cinta negra",
    ["money"] = "Dinero",
}

Config.MenuElements = {
  
    { value = "arac_bin", label = Config.Lang["arac_bin"] },
    { value = "arac_in", label = Config.Lang["arac_in"] },
    { value = "bacak_coz", label = Config.Lang["bacak_coz"] },
    { value = "bant_cikar", label = Config.Lang["bant_cikar"] },
    { value = "tasi", label = Config.Lang["tasi"] },
    { value = "birak", label = Config.Lang["birak"] }
}
