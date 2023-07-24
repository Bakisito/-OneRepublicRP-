Config = {

-- IMPORTANT! To configure report text navigate to /html/script.js and find the text you want to replace


-- QB CHARACTER DATA SHOWN IN EVIDENCE REPORT
showFirstname = true,
showLastname = true,
showGender = true,
showBirthdate = false,
showPhone = false,


ShowBloodSplatsOnGround = true, -- Show blood on the ground when player is shot
PlayClipboardAnimation = true, -- Play clipboard animation when reading report

JobRequired = { -- Jobs that can use this system
	['police'] = true
},

CloseReportKey = 'BACKSPACE', -- The key used to close the report
PickupEvidenceKey = 'E', -- The key used to pick up evidence

EvidenceAnalysisLocation = {  -- The place where the evidence will be analyzed and report generated
vector3(470.3150, -993.6809, 32.7564),
},
TimeToAnalyze = 10000, -- Time in miliseconds to analyze the given evidence
TimeToFindFingerprints = 3000, -- Time in miliseconds to find fingerprints in a car

--UPDATE V2
RainRemovesEvidence = true, -- Removes evidence when it starts raining!
TimeBeforeCrimsCanDestory = 20, -- Seconds before Criminals can destroy evidence (300 is the time when evidence coolsdown and shows up as WARM)
EvidenceStorageLocation ={ -- The place where all evidence are being archived! You can view old evidence or delete it
vector3(467.52, -992.47, 36.1),
},
--

Text = {

	--UPDATE V2
	['not_in_vehicle'] = '¡Para usar esto necesitas estar en un vehículo!',
	['remove_evidence'] = 'Destruye la evidencia [~r~E~w~]',
	['cooldown_before_pickup'] = 'La evidencia está demasiado fresca/caliente para destruirla',
	['evidence_removed'] = '¡Evidencia destruida!',
	['open_evidence_archive'] = '[~b~E~w~] Ver archivo de pruebas',
	['evidence_archive'] = 'Archivo de pruebas',
	['view'] = 'Ver',
	['eliminar'] = 'Eliminar',
	['lista_de_informes'] = 'Informe #',
	['evidence_deleted_from_archive'] = '¡Pruebas borradas del archivo!',


	['evidence_colleted'] = '¡Prueba #{number} recogida!',
	['no_more_space'] = '¡No hay suficiente espacio para la evidencia 3/3!',
	['analyze_evidence'] = '[~b~E~w~] Analiza la evidencia',
	['evidence_being_analyzed'] = '¡La evidencia está siendo analizada por los forenses! Espere por favor',
	['evidence_being_analyzed_hologram'] = '~b~La evidencia está siendo analizada',
	['read_evidence_report'] = '[~b~E~w~] Leer informe de pruebas',
	['analyzing_car'] = '¡El coche está siendo analizado! Por favor espere',
	['pick_up_evidence_text'] = 'Recoger evidencia [~r~E~w~]',
	['no_fingerprints_found'] = '¡No se han encontrado huellas!',
	['no_evidence_to_analyze'] = "¡No hay evidencia para analizar!",
	['shell_hologram'] = '~b~ {guncategory} ~w~ casquillo de bala',
	['blood_hologram'] = '~r~Salpicadura de sangre',


	['blood_after_0_minutes'] = 'Estado: ~r~FRESH',
	['blood_after_5_minutes'] = 'Estado: ~y~AGED',
	['blood_after_10_minutes'] = 'Estado: ~b~OLD',

	['shell_after_0_minutes'] = 'Estado: ~r~HOT',
	['shell_after_5_minutes'] = 'Estado: ~y~WARM',
	['shell_after_10_minutes'] = 'Estado: ~b~COLD',


	['submachine_category'] = 'Submachine',
	['pistol_category'] = 'Pistola',
	['shotgun_category'] = 'Escopeta',
	['assault_category'] = 'Rifle de asalto',
	['lightmachine_category'] = 'Ametralladora ligera',
	['sniper_category'] = 'Francotirador',
	['heavy_category'] = 'Arma pesada'


}


}

-- Only change if you know what are you doing!
function SendTextMessage(msg)

		--SetNotificationTextEntry('STRING')
		--AddTextComponentString(msg)
		--DrawNotification(0,1)

		--EXAMPLE USED IN VIDEO
		QBCore.Functions.Notify(msg, "info")

end
