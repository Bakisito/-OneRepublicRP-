Config = {}

Config.QBPermissionsUpdate = true -- set it to true if you have the latest Permissions update

--------------------------------
-- [Discord Logs]

Config.EnableDiscordLogs = true

Config.IconURL = "https://cdn.discordapp.com/attachments/1037776105408573450/1040305156618727464/one-republic-logo-3.png"

Config.ServerName = "One Republic"

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.WebhookColor = "16741888"

--------------------------------
-- [Staff Groups]

Config.StaffGroups = { -- Groups that can access the different staff chats (/staff, /staffo, /sa)
	'god',
	'admin',
	'mod'
}

--------------------------------
-- [General]

Config.AllowPlayersToClearTheirChat = true

Config.ClearChatCommand = 'clear'

Config.EnableHideChat = true

Config.HideChatCommand = 'hide'

Config.ShowIDOnMessage = true -- Shows the player ID on every message that is sent

Config.ShowIDOnMessageForEveryone = false -- true: shows the player ID for everyone | false: shows it only for staffs

Config.ClearChatMessageTitle = 'SISTEMA'

Config.ClearChatMessage = '¡El chat ha sido borrado!'

-- [Date Format]

Config.DateFormat = '%H:%M' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

--------------------------------
-- [Time Out]

Config.TimeOutPlayers = true

Config.TimeOutCommand = "mute"

Config.RemoveTimeOutCommand = "unmute"

Config.ShowTimeOutMessageForEveryone = true

Config.TimeOutIcon = 'fas fa-gavel'

Config.MessageTitle = 'SERVER'

Config.TimeOutMessages = {
	['muted_for'] = '<b>{3}</b> se ha silenciado por <b>{1}</b> minutos',
	['you_muted_for'] = 'Has silenciado <b>{3}</b> por <b>{1}</b> minutos',
	['been_muted_for'] = 'Has sido silenciado por <b>{0}</b> minutos',

	['you_unmuted'] = 'You unmuted <b>{2}</b>',
	['been_unmuted'] = 'Te han anulado el silencio',

	['muted_message'] = 'Usted está silenciado por <b>{0}</b>',
	['seconds'] = ' segundos',
	['minutes'] = ' minutos',
	['hours'] = ' horas',
}

--------------------------------
-- [Job]

Config.JobChat = false

Config.JobCommand = 'jobc'

Config.JobIcon = 'fas fa-briefcase'

--------------------------------
-- [Private Message]

Config.EnablePM = true

Config.PMCommand = 'pm'

Config.PMIcon = 'fas fa-comment pm-icon'

Config.PMMessageTitle = "PM"

--------------------------------
-- [OOC/Me/Do/Try]

Config.Distance = 20.0

--------------------------------
-- [OOC]

Config.EnableOOC = true

Config.OOCCommand = 'ooc'

Config.OOCIcon = 'fas fa-door-open'

Config.OOCMessageTitle = 'OOC'

Config.OOCMessageWithoutCommand = true -- true: sends OOC message without command (/ooc) | false: doesn't send any message without it being a command

--------------------------------
-- [Me]

Config.EnableMeCommand = true

Config.MeCommand = 'me'

Config.MeIcon = 'fas fa-comment me-icon'

Config.MeMessageTitle = 'ME'

--Config en Pantalla ME


Config.CoordsX = 0
Config.CoordsY = 0
Config.CoordsZ = 1.30
Config.MaxLength = 112 
Config.Duration = 8000  -- 6



--------------------------------
-- [Do]

Config.EnableDoCommand = true

Config.DoCommand = 'do'

Config.DoIcon = 'fas fa-comment do-icon'

Config.DoMessageTitle = 'DO'

--Config en Pantalla DO
Config.DoCoordsX = 0
Config.DoCoordsY = 0
Config.DoCoordsZ = 1.30




--------------------------------

-- [DoFijo]

Config.EnableDoFijoCommand = true

Config.DoFijoCommand = 'dofijo'

Config.DoFijoIcon = 'fas fa-comment dofijo-icon'

Config.DoFijoMessageTitle = 'DO FIJO'

--------------------------------
-- [Try]

Config.EnableTryCommand = false

Config.TryCommand = 'try'

Config.TryIcon = 'fas fa-comment try-icon'

Config.TryMessageTitle = 'TRY'

--------------------------------
-- [Staff]

Config.EnableStaffCommand = true

Config.StaffCommand = 'staff'

Config.StaffMessageTitle = 'STAFF'

Config.StaffIcon = 'fas fa-shield-alt'

Config.AllowStaffsToClearEveryonesChat = true

Config.ClearEveryonesChatCommand = 'clearall'

Config.StaffSteamName = true

-- [Staff Only]

Config.EnableStaffOnlyCommand = true

Config.StaffOnlyCommand = 'staffo'

Config.StaffOnlyMessageTitle = 'STAFF ONLY'

Config.StaffOnlyIcon = 'fas fa-eye-slash'

Config.StaffOnlySteamName = true

-- [Server Announcement]

Config.EnableServerAnnouncement = true

Config.ServerAnnouncementCommand = 'sa'

Config.AnnouncementIcon = 'fas fa-exclamation-circle'

Config.AnnouncementMessageTitle = 'ANUNCIO'

--------------------------------
-- [Advertisements]

Config.EnableAdvertisementCommand = true

Config.AdvertisementCommand = 'ad'

Config.AdvertisementPrice = 1000

Config.AdvertisementCooldown = 15 -- in minutes

Config.AdvertisementIcon = 'fas fa-ad'

--------------------------------
-- [Anonymous/Dark]

Config.EnableAnonymousCommand = false

Config.AnonymousCommand = 'anon'

Config.AnonymousPrice = 1000

Config.AnonymousCooldown = 5 -- in minutes

Config.WhatJobsCantSeeAnonymousChat = {
	'police',
	'ambulance',
}

Config.AnonymousIcon = 'fas fa-mask'

--------------------------------
-- [Twitch]

Config.EnableTwitchCommand = true

Config.TwitchCommand = 'twitch'

-- Types of identifiers: steam: | license: | xbl: | live: | discord: | fivem: | ip:
Config.TwitchList = {
	'steam:1100001459f1c71', -- Example, change this
}

Config.TwitchIcon = 'fab fa-twitch'

--------------------------------
-- [Youtube]

Config.EnableYoutubeCommand = true

Config.YoutubeCommand = 'youtube'

-- Types of identifiers: steam: | license: | xbl: | live: | discord: | fivem: | ip:
Config.YoutubeList = {
	'steam:1100001459f1c71', -- Example, change this
}

Config.YoutubeIcon = 'fab fa-youtube'

--------------------------------
-- [Twitter]

Config.EnableTwitterCommand = false

Config.TwitterCommand = 'twitter'

Config.TwitterIcon = 'fab fa-twitter'

--------------------------------
-- [Police]

Config.EnablePoliceCommand = true

Config.PoliceCommand = 'police'

Config.PoliceJobName = 'police'

Config.PoliceIcon = 'fas fa-bullhorn'

--------------------------------
-- [Ambulance]

Config.EnableAmbulanceCommand = true

Config.AmbulanceCommand = 'ambulance'

Config.AmbulanceJobName = 'ambulance'

Config.AmbulanceIcon = 'fas fa-ambulance'

--------------------------------
-- [Auto Message]

Config.EnableAutoMessage = false

Config.AutoMessageTime = 60 -- (in minutes) will send messages every x minutes 

Config.AutoMessages = {
	"Don't break the rules!",
	"Have fun!",
}

--------------------------------
-- [Notifications]

Config.NotificationsText = {
	['disable_chat'] = { title = 'SISTEMA', message = 'Has desactivado el chat', time = 5000, type = 'info'},
	['enable_chat'] = { title = 'SISTEMA', message = 'Has activado el chat', time = 5000, type = 'info'},
	['ad_success'] = { title = 'PUBLICIDAD', message = 'Anuncio realizado con éxito por ${price}$', time = 5000, type = 'success'},
	['ad_no_money'] = { title = 'PUBLICIDAD', message = "No tienes suficiente dinero para hacer un anuncio", time = 5000, type = 'error'},
	['ad_too_quick'] = { title = 'PUBLICIDAD', message = "No puedes anunciarte tan rápido", time = 5000, type = 'info'},
	['mute_not_adm'] = { title = 'SISTEMA', message = 'Usted no es administrador', time = 5000, type = 'error'},
	['mute_id_inv'] = { title = 'SISTEMA', message = 'El id no es válido', time = 5000, type = 'error'},
	['mute_time_inv'] = { title = 'SISTEMA', message = 'El tiempo de silencio no es válido', time = 5000, type = 'error'},
	['alr_muted'] = { title = 'SISTEMA', message = 'Esta persona ya está silenciada', time = 5000, type = 'error'},
	['alr_unmuted'] = { title = 'SISTEMA', message = 'Esta persona ya no está silenciada', time = 5000, type = 'error'},
	['an_success'] = { title = 'ANONYMOUS', message = 'Advertisement successfully made for price€', time = 5000, type = 'success'},
	['an_no_money'] = { title = 'ANONYMOUS', message = "You don't have enough money to make an advertisement", time = 5000, type = 'error'},
	['an_too_quick'] = { title = 'ANONYMOUS', message = "You can't advertise so quickly", time = 5000, type = 'error'},
	['an_not_allowed'] = { title = 'ANONYMOUS', message = "You are not allowed to send messages in the anonymous chat", time = 5000, type = 'error'},
	['is_muted'] = { title = 'ANONYMOUS', message = "This player is muted", time = 5000, type = 'error'},
}

Config.WebhookText = {
	['clear_all'] = 'Borrado de todos los chats',
	['staff_msg'] = 'Staff message',
	['staff_chat_msg'] = 'Staff chat message',
	['sv_an'] = 'Anuncio del servidor',
	['ad'] = 'Publicidad',
	['twitch'] = 'Twitch',
	['youtube'] = 'Youtube',
	['twitter'] = 'Twitter',
	['police'] = 'Police',
	['ambulance'] = 'Ambulance',
	['job_chat'] = 'Chat de trabajo [${job}]',
	['pm_chat'] = 'Mensaje privado a ${name} [${id}]',
	['ooc'] = 'OOC',
	['me'] = 'ME',
	['do'] = 'DO',
    ['dofijo'] = 'DOFIJO',
	['try'] = 'TRY',
	['muted'] = 'Silenciado [${id}]',
	['muted_for'] = 'Por ${muteTime} minutos',
	['unmuted'] = 'Unmuted [${id}]',
	['p_unmuted'] = 'El jugador ha sido unmuted',
	['anon'] = 'Anonymous',
}