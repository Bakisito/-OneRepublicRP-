local Translations = {
    notifications = {
        enoughmoney = "No tienes suficiente dinero.",
        FullInventory = "Tu inventario está lleno, tu dinero ha sido depositado en el banco.",
        recieved = "Has recibido ",
        currency = "$",
        paid = "Has pagado "
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
