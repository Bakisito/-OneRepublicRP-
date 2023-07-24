Config, Locales = {}, {}

Config.Debug = false -- This help find the source of a problem 

Config.OnlyUnpaidCityInvoices = false

Config.OnlyUnpaidSocietyInvoices = false

Config.EventPrefix = 'okokBilling'

Config.Locale = 'es'

Config.DatabaseTable = 'okokbilling'

Config.OpenMenuKey = 168 -- Default 168 (F7)

Config.OpenMenuCommand = 'invoices' -- Command to open the menu

Config.UseOKOKNotify = true -- If set to true it will use okokNotify, if set to false it will use the QB notify

Config.UseOKOKBankingTransactions = true -- If set to true it will register the bills to okokBanking transactions

Config.InvoiceDistance = 1.5

Config.AllowPlayersInvoice = false -- if players can create Player to Player invoices

Config.okokRequests = true -- Player to Player invoices only, to avoid abuse

Config.AuthorReceivesAPercentage = true -- When sending a society invoice

Config.AuthorPercentage = 10 -- Percentage that the invoice author receives

Config.VATPercentage = 18

Config.SocietyReceivesLessWithVAT = false

Config.QBManagement = true -- If set to true it will use the qb-management resource, if set to false it will use the okokBanking database tables

Config.SocietyHasSocietyPrefix = false -- *Do not touch this if the resource is working correctly* If set to true it'll search for `society_police` (example) when paying a society invoice

Config.AutoDeletePaidInvoices = true -- true: Deletes unpaid invoices (to reduce lag) | false: Doesn't delete unpaid invoices.

Config.DeletePaidInvoicesEvery = 30 -- How often it should delete the paid invoices (in minutes)

-- Autopay

Config.UseAutoPay = true

Config.DefaultLimitDate = 3 -- Days for limit pay date

Config.CheckForUnpaidInvoicesEvery = 30 -- minutes

Config.FeeAfterEachDay = true

Config.FeeAfterEachDayPercentage = 10

-- Autopay

Config.JobsWithCityInvoices = { -- Which jobs have City Invoices (They will be allowed to delete any invoice) | Admins will have access by default
	'court'
}

Config.CityInvoicesAccessRanks = { -- Which jobs have City Invoices (They will be allowed to delete any invoice)
	'' -- All of them have access
}

Config.AllowedSocieties = { -- Which societies can access the Society Invoices
	'police',
	'mechanic1',
	'mechanic2',
	'mechanic3',
	'mechanic4',
	'mechanic5',
	'ambulance'
}

Config.InspectCitizenSocieties = { -- Which societies can access the Society Invoices
	'police'
}

Config.SocietyAccessRanks = { -- Which ranks of the society have access to Society Invoices and City Invoices
	'Boss',
	'Chief',
}

Config.BillsList = {
	['police'] = {
		{'High Speed', 550},
		{'Parking on bridge', 1200},
		{'Jumping a red light', 250},
		{'Driving dangerously', 750},
		{'Reckless driving', 1000},
		{'Custom'}, -- If set without a price it'll let the players create a custom invoice (custom price)
	},
	['ambulance'] = {
		{'Ambulance Ride', 550},
		{'Medical treatment 1', 750},
		{'Medical treatment 2', 1200},
		{'Medical treatment 3', 250},
		{'Medical treatment 4', 400},
		{'Custom'}
	},
	['mechanic1'] = {
		{'Mantenimiento'},
		{'Reparación de Motor'},
		{'Reparación de Carroceria'},
		{'Lavado y Encerado'},
		{'Auto Adorno'},
		{'Modificaciones de Rendimiento'},
		{'Venta'}
	},
}

Config.AdminGroups = {
	'god',
	'admin',
	'mod',
}

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to sv_utils.lua, line 3

Config.BotName = 'Billing Bot' -- Write the desired bot name

Config.ServerName = 'One Republic - Logs' -- Write your server's name

Config.IconURL = '' -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.CreatePersonalInvoiceWebhookColor = '65535'

Config.CreateJobInvoiceWebhookColor = '16776960'

Config.CancelInvoiceWebhookColor = '16711680'

Config.PayInvoiceWebhookColor = '65280'

-------------------------- LOCALES (DON'T TOUCH)

function _L(id) 
	if Locales[Config.Locale][id] then 
		return Locales[Config.Locale][id] 
	else 
		print('Locale '..id..' doesn\'t exist') 
	end 
end