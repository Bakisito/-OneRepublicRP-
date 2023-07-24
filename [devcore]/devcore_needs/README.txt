Realistic Needs script from https://store.devcore.cz/
If you have a problem with the script, contact our support Discord: https://discord.gg/zcG9KQj3sa


The script uses the escrow system

How to install the script


1. After purchasing the script, the script can be downloaded here https://keymaster.fivem.net/assets

2. Upload the contents of the rar file to your server

3. ensure devcore_needs after qb-core 

4. Now create items depending on the inventory.

If you are using ox_inventory 
paste the contents of the file upload/inventory/ox_inventory_items.txt into the file ox_inventory/data/items.lua,

If you are using qs-inventory
paste the contents of the file upload/inventory/qs_inventory_items.txt into the file qb-core/shared/items.lua.

If you are using qb-inventory
upload the file upload/inventory/qb_inventory_items.txt to the file qb-core/shared/items.lua.


5.If you want to store the positions of items placed on the ground in the database, don't forget to upload the upload/sql/needs.sql file to the database

6. Go to script qb-smallresources/config.lua and delete all Consumeables 

-- Default --

Config.ConsumablesEat = {

    ["sandwich"] = math.random(35, 54),
    ["tosti"] = math.random(40, 50),
    ["twerks_candy"] = math.random(35, 54),
    ["snikkel_candy"] = math.random(40, 50),
}

Config.ConsumablesDrink = {
    ["water_bottle"] = math.random(35, 54),
    ["kurkakola"] = math.random(35, 54),
    ["coffee"] = math.random(40, 50),
}

Config.ConsumablesAlcohol = {
    ["whiskey"] = math.random(20, 30),
    ["beer"] = math.random(30, 40),
    ["vodka"] = math.random(20, 40),
}

--After removed --

Config.ConsumablesEat = {

}

Config.ConsumablesDrink = {

}

Config.ConsumablesAlcohol = {

}

----
Make sure your server artifacts version is above the 5181.
