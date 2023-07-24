Config = {

BlipSprite = 237,
BlipColor = 26,
BlipText = 'Mesa de Crafteo',

UseLimitSystem = false, -- Enable if your esx uses limit system

CraftingStopWithDistance = true, -- Crafting will stop when not near workbench

ExperiancePerCraft = 100, -- The amount of experiance added per craft (100 Experiance is 1 level)

HideWhenCantCraft = true, -- Instead of lowering the opacity it hides the item that is not craftable due to low level or wrong job

Categories = {

['misc'] = {
	Label = 'MISC',
	Image = 'fishingrod',
	Jobs = {}
},
['medical'] = {
	Label = 'MEDICAL',
	Image = 'bandage',
	Jobs = {doctor, ambulance}
}
},

MechCategories = {
['turbocharges'] = {
	Label = 'TURBO CHARGER',
	Image = 'turbocharges',
	Jobs = {}
},
['transmission'] = {
	Label = 'TRANSMISIONES',
	Image = 'transmissions',
	Jobs = {}
},
['suspensions'] = {
	Label = 'SUSPENSIONES',
	Image = 'suspensions',
	Jobs = {}
},
['engines'] = {
	Label = 'MOTORES',
	Image = 'engines',
	Jobs = {}
},
['oils'] = {
	Label = 'ACEITES',
	Image = 'oils',
	Jobs = {}
},
['brakes'] = {
	Label = 'FRENOS',
	Image = 'brakes',
	Jobs = {}
},
['tires'] = {
	Label = 'NEUMATICOS',
	Image = 'tires',
	Jobs = {}
},
['sparkplugs'] = {
	Label = 'BUJIAS',
	Image = 'sparkplugs',
	Jobs = {}
},
['bodyparts'] = {
	Label = 'CARROCERIA',
	Image = 'bodyparts',
	Jobs = {}
}
},

GunCategories = {
['weapons'] = {
	Label = 'WEAPONS',
	Image = 'WEAPON_APPISTOL',
	Jobs = {}
},
['attachments'] = {
	Label = 'ATTACHMENTS',
	Image = 'smg_scope',
	Jobs = {}
}
},


PermanentItems = { -- Items that dont get removed when crafting
	['weapon_wrench'] = true
},

Recipes = { -- Enter Item name and then the speed value! The higher the value the more torque

['bandage'] = {
	ItemName = 'bandage',
	Level = 0, -- From what level this item will be craftable
	Category = 'medical', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {'ambulance'}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 2, -- The amount that will be crafted
	SuccessRate = 100, -- 100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['clothe'] = 2, -- item name and count, adding items that dont exist in database will crash the script
		['wood'] = 1,
	}
}, 

['fishingrod'] = {
	ItemName = 'fishingrod',
	Level = 0, -- From what level this item will be craftable
	Category = 'misc', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 3, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['wood'] = 3 -- item name and count, adding items that dont exist in database will crash the script
	}
},

-- // ATTACHMENTS Craft stuff

['pistol_extendedclip'] = {
	ItemName = 'Pistol Extended Clip',
	Level = 0, -- From what level this item will be craftable
	Category = 'attachments', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 140,
		["steel"] = 250,
		["rubber"] = 60
		
	}
},
['pistol_suppressor'] = {
	ItemName = 'Pistol Suppressor',
	Level = 1, -- From what level this item will be craftable
	Category = 'attachments', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 165,
		["steel"] = 285,
		["rubber"] = 75
	}
},
['weapon_pistol'] = {
	ItemName = 'Pistol',
	Level = 3, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 50,
		["steel"] = 100,
		["iron"] = 30,
		["pistol_part_trigger"] = 1,
		["pistol_part_stock"] = 1,
		["pistol_part_mag"] = 1
	}
},
['pistol_part_trigger'] = {
	ItemName = 'Pistol Trigger',
	Level = 2, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 100,
		["steel"] = 50,
		["aluminum"] = 10,
		["iron"] = 10
	}
},
['pistol_part_stock'] = {
	ItemName = 'Pistol Stock',
	Level = 5, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 100,
		["steel"] = 80,
		["aluminum"] = 40,
		["iron"] = 40
	}
},
['pistol_part_mag'] = {
	ItemName = 'Pistol Mag',
	Level = 8, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 100,
		["steel"] = 120,
		["aluminum"] = 10,
		["iron"] = 20
	}
},
['smg_extendedclip'] = {
	ItemName = 'SMG Extended Clip',
	Level = 2, -- From what level this item will be craftable
	Category = 'attachments', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 255,
		["steel"] = 390,
		["rubber"] = 145
	}
},
['rifle_extendedclip'] = {
	ItemName = 'Rifle Extended Clip',
	Level = 4, -- From what level this item will be craftable
	Category = 'attachments', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 190,
		["steel"] = 305,
		["rubber"] = 85,
		["smg_extendedclip"] = 1
	}
},
['rifle_drummag'] = {
	ItemName = 'Rifle Drummag',
	Level = 5, -- From what level this item will be craftable
	Category = 'attachments', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 205,
		["steel"] = 340,
		["rubber"] = 110,
		["smg_extendedclip"] = 1
	}
},
['smg_flashlight'] = {
	ItemName = 'SMG Flashlight',
	Level = 6, -- From what level this item will be craftable
	Category = 'attachments', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 230,
		["steel"] = 365,
		["rubber"] = 130
	}
},
['smg_suppressor'] = {
	ItemName = 'SMG Suppressor',
	Level = 7, -- From what level this item will be craftable
	Category = 'attachments', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 270,
		["steel"] = 435,
		["rubber"] = 155
	}
},
['smg_scope'] = {
	ItemName = 'SMG Scope',
	Level = 8, -- From what level this item will be craftable
	Category = 'attachments', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 300,
		["steel"] = 469,
		["rubber"] = 170
	}
},
['weapon_compactrifle'] = {
	ItemName = 'Compact Rifle',
	Level = 10, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 300,
		["steel"] = 200,
		["aluminum"] = 70,
		["iron"] = 80,
		["rifle_part_trigger"] = 1,
		["rifle_part_stock"] = 1,
		["rifle_part_mag"] = 1
	}
},
['rifle_part_trigger'] = {
	ItemName = 'Rifle Trigger',
	Level = 12, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 100,
		["steel"] = 80,
		["aluminum"] = 40,
		["iron"] = 40
	}
},
['rifle_part_stock'] = {
	ItemName = 'Rifle Stock',
	Level = 15, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 100,
		["steel"] = 150,
		["aluminum"] = 80,
		["iron"] = 120
	}
},
['rifle_part_mag'] = {
	ItemName = 'Rifle Mag',
	Level = 18, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 100,
		["steel"] = 120,
		["aluminum"] = 60,
		["iron"] = 50
	}
},
['weapon_pumpshotgun'] = {
	ItemName = 'Pump Shotgun',
	Level = 10, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["metalscrap"] = 300,
		["steel"] = 469,
		["aluminum"] = 170,
		["iron"] = 180,
		["copper"] = 100
	}
},
['shotgun_ammo'] = {
	ItemName = 'Shotgun Ammo',
	Level = 11, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 10, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["steel"] = 209,
		["aluminum"] = 270,
		["copper"] = 200
	}
},
['smg_ammo'] = {
	ItemName = 'SMG Ammo',
	Level = 11, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 10, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["steel"] = 209,
		["aluminum"] = 270,
		["copper"] = 200
	}
},
['rifle_ammo'] = {
	ItemName = 'Rifle Ammo',
	Level = 12, -- From what level this item will be craftable
	Category = 'weapons', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 5, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["steel"] = 209,
		["aluminum"] = 270,
		["copper"] = 200
	}
},

-- // mech stuff


['turbo_lvl_1'] = {
	ItemName = 'Small Turbo',
	Level = 0, -- From what level this item will be craftable
	Category = 'turbocharges', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	["turbine"] = 2,
	["turbo_parts"] = 4,
	['weapon_wrench'] = 1,
	}
},

['turbo_lvl_2'] = {
	ItemName = 'Great Turbo',
	Level = 0, -- From what level this item will be craftable
	Category = 'turbocharges', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
["turbine"] = 4,
["turbo_parts"] = 8,
['weapon_wrench'] = 1
	}
},

['turbo_lvl_3'] = {
	ItemName = 'Small Twin Turb',
	Level = 0, -- From what level this item will be craftable
	Category = 'turbocharges', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
["turbine"] = 5,
["turbo_parts"] = 10,
['weapon_wrench'] = 1
	}
},

['turbo_lvl_4'] = {
	ItemName = 'Great Twin Turbo',
	Level = 0, -- From what level this item will be craftable
	Category = 'turbocharges', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
["turbine"] = 10,
["turbo_parts"] = 4,
['weapon_wrench'] = 1
	}
},
['stock_transmission'] = {
	ItemName = 'Transmisión automática',
	Level = 0, -- From what level this item will be craftable
	Category = 'transmission', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
      
	}
},
['race_transmission'] = {
	ItemName = 'Rear Wheel Drive',
	Level = 0, -- From what level this item will be craftable
	Category = 'transmission', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
["transmission"] = 2,
["gears"] = 4,
["transmission_shaft"] = 1,
['weapon_wrench'] = 1
	}
},
['race_transmission_4wd'] = {
	ItemName = 'Four Wheel Drive',
	Level = 0, -- From what level this item will be craftable
	Category = 'transmission', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
["transmission"] = 2,
["gears"] = 6,
["transmission_shaft"] = 2,
['weapon_wrench'] = 1
	}
},
['race_transmission_fwd'] = {
	ItemName = 'Front Wheel Drive',
	Level = 0, -- From what level this item will be craftable
	Category = 'transmission', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	

["transmission"] = 1,
["gears"] = 1,
["transmission_shaft"] = 1,
['weapon_wrench'] = 1
	}
},
['stock_suspension'] = {
	ItemName = 'Stock Suspension',
	Level = 0, -- From what level this item will be craftable
	Category = 'suspensions', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		
	}
},
['race_suspension'] = {
	ItemName = 'Race Suspension',
	Level = 0, -- From what level this item will be craftable
	Category = 'suspensions', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 65, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
        ["suspension_spring"] = 1,
        ["suspension_body"] = 1,
		['weapon_wrench'] = 1
	}
},
['stock_engine'] = {
	ItemName = 'Stock Engine',
	Level = 0, -- From what level this item will be craftable
	Category = 'engines', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item

	}
},
['v8engine'] = {
	ItemName = 'v8engine',
	Level = 0, -- From what level this item will be craftable
	Category = 'engines', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item

		["engine_cylinder"] = 3,
		["piston"] = 2,
		["engine_crankshaft"] = 2,
		["engine_oilpan"] = 2,
		["engine_block"] = 2,
		["engine_belts"] = 7,
		['weapon_wrench'] = 1

		}
},
['2jzengine'] = {  -- toyota engine
	ItemName = '2jzengine',
	Level = 0, -- From what level this item will be craftable
	Category = 'engines', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["engine_cylinder"] = 4,
		["piston"] = 8,
		["engine_crankshaft"] = 3,
		["engine_oilpan"] = 4,
		["engine_block"] = 5,
		["engine_belts"] = 5,
		['weapon_wrench'] = 1

		}
},
['diablov12'] = {
	ItemName = 'diablov12',
	Level = 0, -- From what level this item will be craftable
	Category = 'engines', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["engine_cylinder"] = 2,
		["piston"] = 4,
		["engine_crankshaft"] = 3,
		["engine_oilpan"] = 2,
		["engine_block"] = 4,
		["engine_belts"] = 5,
		['weapon_wrench'] = 1

		}
},
['gt3flat6'] = { 
	ItemName = 'gt3flat6',
	Level = 0, -- From what level this item will be craftable
	Category = 'engines', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	 ["engine_cylinder"] = 3,
	 ["piston"] = 7,
	 ["engine_crankshaft"] = 2,
	 ["engine_oilpan"] = 3,
	 ["engine_block"] = 2,
	 ["engine_belts"] = 4,
	 ['weapon_wrench'] = 1

		}
},
['k20a'] = {
	ItemName = 'k20a',
	Level = 0, 
	Category = 'engines',
	isGun = false, 
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["engine_cylinder"] = 1,
        ["piston"] = 2,  
        ["engine_crankshaft"] = 2,
        ["engine_oilpan"] = 2,
        ["engine_block"] = 1,
		["engine_belts"] = 4,
		['weapon_wrench'] = 1

	}
},
['lambov10'] = {  -- nissan skyline engine
	ItemName = 'lambov10',
	Level = 0, -- From what level this item will be craftable
	Category = 'engines', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["engine_cylinder"] = 4,
		["piston"] = 7,
		["engine_crankshaft"] = 3,
		["engine_oilpan"] = 2,
		["engine_block"] = 3,
		["engine_belts"] = 5,
		['weapon_wrench'] = 1

	}
},
['m158huayra'] = { -- 
	ItemName = 'm158huayra',
	Level = 0, -- From what level this item will be craftable
	Category = 'engines', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["engine_cylinder"] = 3,
		["piston"] = 8,
		["engine_crankshaft"] = 3,
		["engine_oilpan"] = 4,
		["engine_block"] = 4,
		["engine_belts"] = 3,
		['weapon_wrench'] = 1

		}
},
['m297zonda'] = { -- supercar engine
	ItemName = 'm297zonda',
	Level = 0, -- From what level this item will be craftable
	Category = 'engines', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["engine_cylinder"] = 4,
		["piston"] = 8,
		["engine_crankshaft"] = 3,
		["engine_oilpan"] = 4,
		["engine_block"] = 4,
		["engine_belts"] = 4,
		['weapon_wrench'] = 1

		}
},
['musv8'] = { -- supercar mercedes
	ItemName = 'musv8',
	Level = 0, -- From what level this item will be craftable
	Category = 'engines', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["engine_cylinder"] = 3,
		["piston"] = 2,
		["engine_crankshaft"] = 2,
		["engine_oilpan"] = 3,
		["engine_block"] = 2,
		["engine_belts"] = 4,
		['weapon_wrench'] = 1

	}
},
['predatorv8'] = { -- v8engine 
	ItemName = 'predatorv8',
	Level = 0, -- From what level this item will be craftable
	Category = 'engines', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["engine_cylinder"] =  2,
		["piston"] =  3,
		["engine_crankshaft"] =  3,
		["engine_oilpan"] =  2,
		["engine_block"] =  1,
		["engine_belts"] =  5,
		['weapon_wrench'] = 1

	}
},
['rb26det'] = {
	ItemName = 'rb26det',
	Level = 0, -- From what level this item will be craftable
	Category = 'engines', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["engine_cylinder"] = 1,
		["piston"] = 3,  
		["engine_crankshaft"] = 3,
		["engine_oilpan"] = 2,
		["engine_block"] = 1,
		["engine_belts"] = 4,
		['weapon_wrench'] = 1

	}
},
['rotary7'] = {
	ItemName = 'rotary7',
	Level = 0, -- From what level this item will be craftable
	Category = 'engines', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		["engine_cylinder"] = 4,
		["piston"] = 4,
		["engine_crankshaft"] = 3,
		["engine_oilpan"] = 2,
		["engine_block"] = 3,
		["engine_belts"] = 6,
		['weapon_wrench'] = 1

	}
},
['m5cracklemod'] = {
	ItemName = 'm5cracklemod',
	Level = 0, 
	Category = 'engines',
	isGun = false, 
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7',  
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, 
	SuccessRate = 90, 
	requireBlueprint = false, 
	Time = 10, 
	Ingredients = { 
		["engine_cylinder"] = 2,
		["piston"] = 4,
		["engine_crankshaft"] = 3,
		["engine_oilpan"] = 2,
		["engine_block"] = 3,
		["engine_belts"] = 4,
		['weapon_wrench'] = 1

		}
},
['zr250'] = {
	ItemName = 'zr250',
	Level = 0, 
	Category = 'engines',
	isGun = false, 
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7',  
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, 
	SuccessRate = 90, 
	requireBlueprint = false, 
	Time = 10, 
	Ingredients = { 
		  ["engine_cylinder"] = 2,
		  ["piston"] = 4,
		  ["engine_crankshaft"] = 4,
		  ["engine_oilpan"] = 2,
		  ["engine_block"] = 1,
		  ["engine_belts"] = 5,
		  ['weapon_wrench'] = 1

	}
},
['v8sultanrs'] = {
	ItemName = 'v8sultanrs',
	Level = 0, 
	Category = 'engines',
	isGun = false, 
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7',  
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, 
	SuccessRate = 90, 
	requireBlueprint = false, 
	Time = 10, 
	Ingredients = { 
		  ["engine_cylinder"] = 3,
		  ["piston"] = 6,
		  ["engine_crankshaft"] = 2,
		  ["engine_oilpan"] = 3,
		  ["engine_block"] = 2,
		  ["engine_belts"] = 4,
		  ['weapon_wrench'] = 1
		}
},
['urusv8'] = {
	ItemName = 'Lambo Urus',
	Level = 0, 
	Category = 'engines',
	isGun = false, 
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7',  
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, 
	SuccessRate = 90, 
	requireBlueprint = false, 
	Time = 10, 
	Ingredients = { 
		["engine_cylinder"] = 5,
		["piston"] = 7,
		["engine_crankshaft"] = 3,
		["engine_oilpan"] = 3,
		["engine_block"] = 3,
		["engine_belts"] = 3,
		['weapon_wrench'] = 1
	}
},
['b58b30'] = {
	ItemName = 'b58b30',
	Level = 0, 
	Category = 'engines',
	isGun = false, 
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7',  
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, 
	SuccessRate = 90, 
	requireBlueprint = false, 
	Time = 10, 
	Ingredients = { 
	["engine_cylinder"] = 2,
	["piston"] = 4,	
 	["engine_crankshaft"] = 3,
    ["engine_oilpan"] = 2,
  	["engine_block"] = 1,
	["engine_belts"] = 5,
	['weapon_wrench'] = 1
	}
},
-- ['nos'] = {
-- 	ItemName = 'NOS',
-- 	Level = 0, -- From what level this item will be craftable
-- 	Category = 'nos', -- The category item will be put in
-- 	isGun = false, -- Specify if this is a gun so it will be added to the loadout
-- 	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
-- 	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
-- 	Amount = 1, -- The amount that will be crafted
-- 	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
-- 	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
-- 	Time = 10, -- Time in seconds it takes to craft this item
-- 	Ingredients = { -- Ingredients needed to craft this item
--         ["nos_bottle"] = 1,
--         ["nos_valve"] = 1
-- 	}
-- },
['stock_oil'] = {
	ItemName = 'Stock Oil',
	Level = 0, -- From what level this item will be craftable
	Category = 'oils', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	}
},

['shell_oil'] = {
	ItemName = 'Shell Oil',
	Level = 0, -- From what level this item will be craftable
	Category = 'oils', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = {  -- Ingredients needed to craft this item
	["oilcan"] = 1,
	['weapon_wrench'] = 1
	}
},
['mobil1_oil'] = {
	ItemName = 'Mobil 1 Oil',
	Level = 0, -- From what level this item will be craftable
	Category = 'oils', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = {  -- Ingredients needed to craft this item
		["oilcan"] = 2,
		['weapon_wrench'] = 1
	}
},


['stock_brakes'] = {
	ItemName = 'Stock Brakes',
	Level = 0, -- From what level this item will be craftable
	Category = 'brakes', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	}
},
['race_brakes'] = {
	ItemName = 'Race Brakes',
	Level = 0, -- From what level this item will be craftable
	Category = 'brakes', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
        ["brake_disc"] = 1,
        ["brake_pad"] = 1,
		["brake_capiler"] = 1,
		['weapon_wrench'] = 1
	}
},
['stock_tires'] = {
	ItemName = 'Neumáticos Estándar',
	Level = 0, -- From what level this item will be craftable
	Category = 'tires', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item

	}
},
['michelin_tires'] = {
	ItemName = 'Neumáticos Michelin',
	Level = 0, -- From what level this item will be craftable
	Category = 'tires', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	["wheel_rim"] = 1,
	["wheel_rubber"] = 1,
	['weapon_wrench'] = 1,
	}
},
['racing_tires'] = {
	ItemName = 'Neumáticos Racing',
	Level = 0, -- From what level this item will be craftable
	Category = 'tires', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	["wheel_rim"] = 2,
	["wheel_rubber"] = 2,
	['weapon_wrench'] = 1,
	}
},
['stock_sparkplugs'] = {
	ItemName = 'Stock Sparkplugs',
	Level = 0, -- From what level this item will be craftable
	Category = 'sparkplugs', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	}
},
['ngk_sparkplugs'] = {
	ItemName = 'Ngk Sparkplugs',
	Level = 0, -- From what level this item will be craftable
	Category = 'sparkplugs', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	}
},
['car_wheel'] = {
	ItemName = 'Goma',
	Level = 0, -- From what level this item will be craftable
	Category = 'bodyparts', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	["cash"] = 150,
	}
},
['car_door'] = {
	ItemName = 'Puerta',
	Level = 0, -- From what level this item will be craftable
	Category = 'bodyparts', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	["car_frame"] = 1,
	["rearview"] = 1,
	["doorhandle"] = 1,
	['weapon_wrench'] = 1
	}
},
['car_hood'] = {
	ItemName = 'Bonete',
	Level = 0, -- From what level this item will be craftable
	Category = 'bodyparts', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	["hood_vent"] = 1,
	["hood_sheet"] = 1,
	["hood_frame"] = 1,
	['weapon_wrench'] = 1
	}
},
['car_trunk'] = {
	ItemName = 'Baúl',
	Level = 0, -- From what level this item will be craftable
	Category = 'bodyparts', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = 'mechanic1, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 10, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
	["trunk_frame"] = 1,
	["trunk_sheet"] = 1,
	['weapon_wrench'] = 1
	}
}


},
Workbenches = { -- Every workbench location, leave {} for jobs if you want everybody to access
		{coords = vector3(125.57, -3030.72, 7.70), jobs = 'mechanic1', Categories = 'MechCategories', blip = false, recipes = {}, radius = 2.0 },       					--AutoExotic
		{coords = vector3(-1407.16, -447.33, 36.91), jobs = 'mechanic2', Categories = 'MechCategories', blip = false, recipes = {}, radius = 3.0 },      					--Hayes
		{coords = vector3(543.04, -185.68, 55.20), jobs = 'mechanic3', Categories = 'MechCategories', blip = false, recipes = {}, radius = 3.0 },         
		{coords = vector3(1182.6520, 2635.1838, 39), jobs = 'mechanic4', Categories = 'MechCategories', blip = false, recipes = {}, radius = 3.0 },         
		{coords = vector3(101.7220, 6624.8652, 32.7873), jobs = 'mechanic5', Categories = 'MechCategories', blip = false, recipes = {}, radius = 3.0 },         

		
		
		--{coords = vector3(164.9575,-1323.114,26.81208), jobs = {}, Categories = 'GunCategories', blip = false, recipes = {}, radius = 3.0} --Gun crafting 2 

},
 

Text = {

    ['not_enough_ingredients'] = 'No tienes los materiales necesarios',
    ['you_cant_hold_item'] = 'No puedes cargar este item',
    ['item_crafted'] = 'Item creado!',
    ['wrong_job'] = 'No puedes abrir esta mesa de crafteo',
    ['workbench_hologram'] = '[~b~E~w~] Mesa de Crafteo',
    ['wrong_usage'] = 'Mal uso del comando',
    ['inv_limit_exceed'] = 'Inventory limit exceeded! Clean up before you lose more',
    ['crafting_failed'] = 'Fallaste en la creacion de este item!'

}

}



function SendTextMessage(msg)

        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0,1)

        --EXAMPLE USED IN VIDEO
        --exports['mythic_notify']:SendAlert('inform', msg)

end
