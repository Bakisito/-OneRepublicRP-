Config = {}

-------------------------- FUNCIONALITY

Config.RemoveContractAfterUse = true -- Choose if you want to keep the item after the player uses it

Config.RemoveMoneyOnSign = true -- Set if you want the script to automatically remove the money from the buyer's bank account and deposit it into the seller's account when the buyer signs it

Config.DateFormat = '%d-%m-%Y' -- (Date that appears in the contract interface) To change the date format check this website - https://www.lua.org/pil/22.1.html

Config.BlacklistedVehicles = { -- All the vehicles that are not allowed to be sold (check the gameName on vehicles.meta -> <gameName>Supra</gameName>)
	'T20',
}

Config.UseOkokRequests = true -- If true okokRequests will popup before opening the contract interface

Config.UseOkokBankingTransactions = true -- If true a transaction will be registered in okokBanking

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to server.lua, line 5

Config.BotName = 'Venta de Vehiculo' -- Write the desired bot name

Config.ServerName = 'One Republic - Logs' -- Write your server's name

Config.IconURL = 'https://cdn.discordapp.com/attachments/1037776105408573450/1040305156618727464/one-republic-logo-3.png' -- Insert your desired image link

Config.WebhookDateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html45518a

Config.sellVehicleWebhookColor = '65352'