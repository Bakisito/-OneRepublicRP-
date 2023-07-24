Config = {}

Config.Debug = false

Config.Framework = 'QB' -- ESX / QB / STANDALONE

Config.UseNewStaffCheckMethod = false -- **QBCORE and ESX ONLY** true = will check if a player is staff in another way (this could fix problems with /repots command)

Config.QBPermissionsUpdate = true -- **QBCORE ONLY** - set it to true if you have the latest Permissions update

Config.ReportCommand = 'report' -- command for players to create a report

Config.AdminReportCommand = 'reports' -- command for admins to check the reports

Config.NotificationToggleCommand = 'rn' -- command to toggle the notifications

Config.UseSteamNames = true -- Uses the steam names insted of game names

Config.SaveRespondedReports = true -- This will save how many reports the admins complete in the database (for this you need to use the sql file and set your sql script in the fxmanifest.lua)

Config.Database = 'oxmysql' -- mysql-async / oxmysql / ghmattimysql (Used if Config.SaveRespondedReports is set to true)

Config.NoAdminAssistingText = 'Ninguno'

Config.TeleportBackAfterConcluding = true

Config.NewReportNotifyType = 'QB' -- QB or STANDALONE

Config.LatestSendNotifyToAdmin = true

Config.GetAllPlayersForNotify = false

Config.ReportCategoriesTranslation = { -- Translate report categories
	player = "REPORTAR JUGADOR",
	bug = "BUG",
	question = "PREGUNTA"
}

Config.AdminGroups = { -- Used for ESX and QB
	'god',
	'superadmin',
	'admin',
	'mod'
}

-- Used to set the admins when using the STANDALONE version
-- Types of identifiers: steam: | license: | xbl: | live: | discord: | fivem: | ip:
Config.StandaloneStaffIdentifiers = { 
}

Config.Notifications = {
	['success_rep'] = {title = 'Sistema de Reportes', text = 'Ha creado con éxito un reporte', time = 5000, type = 'success'},
	['adm_answered'] = {title = 'Sistema de Reportes', text = 'Un administrador te ha respondido', time = 5000, type = 'info'},
	['player_answered'] = {title = 'Sistema de Reportes', text = '#${id} - ${name} te ha contestado', time = 5000, type = 'info'},
	['adm_assist'] = {title = 'Sistema de Reportes', text = 'Un administrador te está ayudando', time = 5000, type = 'info'},
	['rep_concluded'] = {title = 'Sistema de Reportes', text = 'Su reporte ha sido concluido', time = 5000, type = 'success'},
	['rep_canceled'] = {title = 'Sistema de Reportes', text = 'Usted ha cancelado su reporte', time = 5000, type = 'error'},
	['adm_rep_concluded'] = {title = 'Sistema de Reportes', text = 'El Reporte #${id} ha sido concluido', time = 5000, type = 'success'},
	['new_rep'] = {title = 'Sistema de Reportes', text = 'Hay un nuevo reporte', time = 5000, type = 'info'},
	['rep_not_on'] = {title = 'Sistema de Reportes', text = 'Has activado las notificaciones de reportes.', time = 5000, type = 'success'},
	['rep_not_off'] = {title = 'Sistema de Reportes', text = 'Ha desactivado las notificaciones de reportes.', time = 5000, type = 'error'},
	['rep_not_exist'] = {title = 'Sistema de Reportes', text = '¡Este reporte no existe!', time = 5000, type = 'error'},
}

Config.CommandSuggestions = {
	['report'] = {text = 'Comando para crear o comprobar su reporte'},
	['adm_report'] = {text = 'Comando para comprobar los reportes abiertos'},
	['adm_notifications'] = {text = 'Comando para activar/desactivar la notificación de nuevos reportes'},
}

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to webhook.lua, line 1

Config.BotName = 'El Chimoso' -- Write the desired bot name

Config.ServerName = 'One Republic - Logs' -- Write your server's name

Config.IconURL = 'https://cdn.discordapp.com/attachments/1037776105408573450/1040305363276267621/one-republic-logo-small.png' -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

Config.ReportTitle = 'REPORTE'

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.playerReportWebhookColor = '65280'

Config.bugReportWebhookColor = '16711680'

Config.questionReportWebhookColor = '49151'

Config.playerWebhookColor = '255'

Config.adminWebhookColor = '16746240'

Config.WebhookMessages = {
	-- Player
	['player_report'] = {action = 'Opened a report'},
	['bug_report'] = {action = 'Opened a report'},
	['question_report'] = {action = 'Opened a report'},
	['p_cancel_report'] = {action = 'Canceled a report', type = 'Report #${id}'},
	['p_answer_report'] = {action = 'Player answered report', type = 'Report #${id}'},

	-- Admin
	['a_answer_report'] = {action = 'Admin answered report', type = 'Report #${id}'},
	['a_bring_report'] = {action = 'Admin brought the player', type = 'Report #${id}'},
	['a_goto_report'] = {action = 'Admin went to the player', type = 'Report #${id}'},
	['a_closed_report'] = {action = 'Admin closed a report', type = 'Report #${id}'},
}