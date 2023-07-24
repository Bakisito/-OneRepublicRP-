--[[
English base language translation for qb-inventory
Translation done by wanderrer (Martin Riggs#0807 on Discord)
]]--
local Translations = {
    progress = {
    ["crafting"] = "Crafteando...",
    ["snowballs"] = "Recolectando bolas de nieve..",
    },
    notify = {
    ["failed"] = "Fallido",
    ["canceled"] = "Cancelado",
    ["vlocked"] = "Vehiculo bloqueado",
    ["notowned"] = "No tienes este articulo!",
    ["missitem"] = "No tienes este articulo!",
    ["nonb"] = "No hay nadie cierca!",
    ["noaccess"] = "Inaccesible",
    ["nosell"] = "No puedes vender este articulo..",
    ["itemexist"] = "Este articulo no existe",
    ["notencash"] = "No tienes suficiente dinero..",
    ["noitem"] = "No tienes los articulos correctos..",
    ["gsitem"] = "No puedes darte un articulo a ti mismo",
    ["tftgitem"] = "Estas muy lejos para dar articulos!",
    ["infound"] = "No se encontro el articulo que intentaste dar!",
    ["iifound"] = "Articulo incorrecto, intentalo de nuevo!",
    ["gitemrec"] = "Recibiste ",
    ["gitemfrom"] = " de ",
    ["gitemyg"] = "Diste ",
    ["gitinvfull"] = "El otro jugador tiene el inventario lleno!",
    ["giymif"] = "Tu inventario esta lleno!",
    ["gitydhei"] = "No tienes suficiente del articulo.",
    ["gitydhitt"] = "No tienes suficientes articulos para transferir",
    ["navt"] = "No es un tipo valido..",
    ["anfoc"] = "Argumentos no rellenados correctamente..",
    ["yhg"] = "Tu has dado ",
    ["cgitem"] = "No puedo dar el articulo!",
    ["idne"] = "El articulo no existe",
    ["pdne"] = "El jugador no esta online",
    },
    inf_mapping = {
    ["opn_inv"] = "Abrir inventario",
    ["tog_slots"] = "Alternar combinacion de teclas",
    ["use_item"] = "Usa el articulo en la ranura ",
    },
    menu = {
    ["vending"] = "Maquina expendedora",
    ["craft"] = "Craftear",
    ["o_bag"] = "Abrir mochila",
    },
    interaction = {
    ["craft"] = "gEw - Craftear",
    },
    label = {
    ["craft"] = "Craftear",
    ["a_craft"] = "Attachment Crafteando",
    },
    }

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
