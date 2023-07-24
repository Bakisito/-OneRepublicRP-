
----------------------------------------------------------------------
-- Thanks for supporting AngelicXS Scripts!							--
-- Support can be found at: https://discord.gg/tQYmqm4xNb			--
-- More paid scripts at: https://angelicxs.tebex.io/ 				--
-- More FREE scripts at: https://github.com/GouveiaXS/ 				--
----------------------------------------------------------------------

Config = {}

Config.UseESX = false						-- Use ESX Framework
Config.UseQBCore = true					-- Use QBCore Framework (Ignored if Config.UseESX = true)

Config.UseCustomNotify = false				-- Use a custom notification script, must complete event below.

-- Only complete this event if Config.UseCustomNotify is true; mythic_notification provided as an example
RegisterNetEvent('angelicxs-MedicalDiseases:CustomNotify')
AddEventHandler('angelicxs-MedicalDiseases:CustomNotify', function(message, type)
    --exports.mythic_notify:SendAlert(type, message, 4000)
end)


Config.RegisterCommand = true               -- Allows a /command to cure all diseases instead of items
Config.CommandName = 'Curar'          -- If Config.RegisterCommand, name of /command
Config.CommandDistance = 3		            -- If Config.RegisterCommand, max distance player can be away to use command.
Config.CommandJob = {                       -- If Config.RegisterCommand what jobs can use the /command to cure all diseases
    'ambulance',
    'doctor'
}

Config.IllnessCheck = 60                    -- In minutes, how long to do a illness check

Config.CoughDrug = 'coughmedicine'          -- Name of item used to cure coughing
Config.VomitDrug = 'nauesamedicine'          -- Name of item used to cure vomiting
Config.DizzyDrug = 'gingermedicine'         -- Name of item used to cure dizziness

Config.LangType = {
	['error'] = 'error',
	['success'] = 'success',
	['info'] = 'primary'
}

Config.Lang = {
	['wrong_job'] = 'No tienes el trabajo correcto para hacer esto!',
	['no_id'] = 'Introduce el ID del jugador que estás intentando curar!',
	['wrong_medicine'] = 'Tomó el tipo de medicamento equivocado para su enfermedad!',
	['cured'] = 'Te tomaste la medicina y te sentiste mucho mejor!',
	['feel_sick'] = 'Te sientes enfermo...',
	['not_sick'] = 'Te tomaste la medicacion y ya no estas enfermo!',
	['too_far'] = 'Estan demasiado lejos para proporcionar el medicamento!',
}
