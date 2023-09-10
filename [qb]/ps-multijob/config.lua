Config = Config or {}

-- Side of the screen where you want the ui to be on. Can either be "left" or "right"
Config.Side = "right"

Config.MaxJobs = 3
Config.IgnoredJobs = {
	["unemployed"] = true,
}

Config.DenyDuty = {
	["ambulance"] = true,
	["police"] = true,
}

Config.WhitelistJobs = {
	-- ["police"] = true,
	-- ["ambulance"] = true,
	-- ["mechanic"] = true,
	-- ["judge"] = true,
	-- ["lawyer"] = true,
}

Config.Descriptions = {
	["police"] = "Dispara a algunos delincuentes o tal vez ser un buen policía y detenerlos",
	["ambulance"] = "Arregla los agujeros de bala, literal",
	["mechanic1"] = "Arregla los agujeros de bala",
	["mechanic2"] = "Arregla los agujeros de bala",
	["biembo"] = "D' Biembo Auto Parts!",
	["mechanic4"] = "Arregla los agujeros de bala",
	["mechanic5"] = "Arregla los agujeros de bala",
	["tow"] = "Recoge la grúa y roba algún vehículos",
	["taxi"] = "Recoger personas por la ciudad y llevarlas a su destino",
	["bus"] = "Recoger a varias personas por la ciudad y llevarlas a su destino",
	["realestate"] = "Vender casas o algo así",
	["cardealer"] = "Vender coches o algo",
	["judge"] = "Decide si las personas son culpables",
	["lawyer"] = "Ayudar al bueno o al malo",
	["reporter"] = "Lowkey useless",
	["trucker"] = "Conducir un camión",
	["garbage"] = "Conducir un camión de la basura",
	["vineyard"] = "Get them vines",
	["hotdog"] = "Sell them glizzys",
}

-- Change the icons to any free font awesome icon, also add other jobs your server might have to the list
-- List: https://fontawesome.com/search?o=r&s=solid
Config.FontAwesomeIcons = {
	["police"] = "fa-solid fa-handcuffs",
	["ambulance"] = "fa-solid fa-user-doctor",
	["mechanic"] = "fa-solid fa-wrench",
	["tow"] = "fa-solid fa-truck-tow",
	["taxi"] = "fa-solid fa-taxi",
	["bus"] = "fa-solid fa-bus",
	["realestate"] = "fa-solid fa-sign-hanging",
	["cardealer"] = "fa-solid fa-cards",
	["judge"] = "fa-solid fa-gave",
	["lawyer"] = "fa-solid fa-gavel",
	["reporter"] = "fa-solid fa-microphone",
	["trucker"] = "fa-solid fa-truck-front",
	["garbage"] = "fa-solid fa-trash-can",
	["vineyard"] = "fa-solid fa-wine-bottle",
	["hotdog"] = "fa-solid fa-hotdog",
}
