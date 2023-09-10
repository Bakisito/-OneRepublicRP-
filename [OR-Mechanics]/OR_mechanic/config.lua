-------------------------------------
------- Created by T1GER#9080 -------
-------------------------------------
---Modified by One Republics Devs----


Config = {
	Debug = false, -- allows you to restart script while in-game, otherwise u need to restart fivem.
    ProgressBars = true, -- set to false if you do not use progressBars or using your own
	BuyWithBank = true, -- buy company with bank money, false = cash.
	SalePercentage = 0.55, -- sell percentage when selling a mech shop.
	CarJackProp = "prop_carjack_l2", -- car jack prop name.
	CarHash= 347760077,
	CarHash2= 1873181826,
	ArmsModel= "imp_prop_kq_lift_arms",
	HealthTimer = 60, -- time in seconds until health part damage effects applies to vehicle.
	UseKMH = true, -- Set to false to use MPH system for calculations with speed.
	UseCollisionThread = true, -- set to false if u are using another collission/damage thread.
	UsingOtherDamageScript = false, -- Set to true if u are using other scripts such as Realistic Vehicle Damage etc.
	SlashTires = false, -- Set to false to disable slashing random tires, upon vehicle collision. If using own damage script, set this to false!
	EngineDisable = true, -- Set to false to disable engine being disabled, upon vehicle collision. If using own damage script, set this to false!
	VehSpeed = 80.0, -- Value for speed at which a crash will cause damage etc for vehicle degradation healthd
	DegradeValue = {min = 5, max = 25}, -- Set min and max degrade value, upon crash. 5 is 0.5, 25 is 2.5. Between 0 and 100.
	CraftTime = 4, -- set time in seconds, to craft item.
	TravelDistance = 5000.0, -- Set maximum distance for NPC repair jobs.
}

Config.MechanicShops = {
	[1] = {
		society = 'biembo', -- this must match an identifier name inside Config.Society!
		price = 20000000, -- price of the company.
		owned = false, -- do not touch this!
		menu = vector3(544.67, -200.11, 54.49), -- menu pos
		storage = vector3(0.0, 0.0, 0.0), -- storage pos
		workbench = vector3(0.0, 0.0, 0.0), -- workbench pos
		lifts = {
			
			-- add more lifts
		},
		repair = vector4(0.32,-0.25,0.42,0.7), -- repair pos
	},
	[2] = {
		society = 'mechanic2', -- this must match an identifier name inside Config.Society!
		price = 2000000, -- price of the company.
		owned = false, -- do not touch this!
		menu = vector3(-1427.25, -458.16, 35.91), -- menu pos
		storage = vector3(0.0, 0.0, 0.0), -- storage pos
		workbench = vector3(0.0, 0.0, 0.0), -- workbench pos
		lifts = {
			
			-- add more lifts
		},
		repair = vector4(-0.79,-0.36,0.01,0.02), -- repair pos
	},

	[3] = {
		society = 'mechanic1', -- this must match an identifier name inside Config.Society!
		price = 2000000, -- price of the company.
		owned = false, -- do not touch this!
		menu = vector3(124.61, -3014.4, 7.44), -- menu pos 
		storage = vector3(0.0, 0.0, 0.0), -- storage pos
		workbench = vector3(0.0, 0.0, 0.0), -- workbench pos
		lifts = {
			
			-- add more lifts
		},
		repair = vector4(-0.79,-0.36,0.01,0.02), -- repair pos
	},

	[4] = {
		society = 'mechanic4', -- this must match an identifier name inside Config.Society!
		price = 2000000, -- price of the company.
		owned = false, -- do not touch this!
		menu = vector3(1186.8795, 2636.1519, 38.4020), -- menu pos 
		storage = vector3(0.0, 0.0, 0.0), -- storage pos 
		workbench = vector3(0.0, 0.0, 0.0), -- workbench pos
		lifts = {
			
			-- add more lifts
		},
		repair = vector4(-0.79,-0.36,0.01,0.02), -- repair pos
	},

	[5] = {
		society = 'mechanic5', -- this must match an identifier name inside Config.Society!
		price = 2000000, -- price of the company.
		owned = false, -- do not touch this! 
		menu = vector3(98.9523, 6621.0059, 32.4354), -- menu pos  
		storage = vector3(0.0, 0.0, 0.0), -- storage pos 
		workbench = vector3(0.0, 0.0, 0.0), -- workbench pos
		lifts = {
			
			-- add more lifts
		},
		repair = vector4(-0.79,-0.36,0.01,0.02), -- repair pos
	}

}

-- Blip Settings:
Config.BlipSettings = {
	['shop'] = { enable = true, sprite = 446, display = 4, scale = 0.60, color = 0, name = "Mechanic" },
}

-- Marker Settings:
Config.MarkerSettings = {
	['manage_menu'] = { enable = true, type = 20, scale = {x = 0.7, y = 0.7, z = 0.7}, color = {r = 240, g = 52, b = 52, a = 100} },
	['storage_menu'] = { enable = true, type = 20, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100} },
	['workbench_menu'] = { enable = true, type = 20, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100} },
	['repair_marker'] = { enable = false, type = 20, scale = {x = 0.6, y = 0.6, z = 0.6}, color = {r = 255, g = 165, b = 0, a = 100} },
}

-- BODY PARTS FOR VEHICLE REPAIR:
Config.BodyParts = {
	[1] = {item = 'car_door', prop = 'prop_car_door_01', pos = {0.0, 0.0, 0.0}, rot = {0.0, 0.0, 0.0}},
	[2] = {item = 'car_hood', prop = 'prop_car_bonnet_01', pos = {0.0, 0.0, 0.0}, rot = {0.0, 0.0, 0.0}},
	[3] = {item = 'car_trunk', prop = 'prop_car_bonnet_02', pos = {0.0, 0.0, 0.0}, rot = {0.0, 0.0, 0.0}},  --this is used for back [6] and back2 [7] door as well
	[4] = {item = 'carwheel', prop = 'prop_wheel_03', pos = {0.0, 0.0, 0.0}, rot = {0.0, 0.0, 0.0}},
}

-- Repair Kit:
Config.RepairKits = {
	[1] = { label = "Repair Kit", item = "repairkit", chanceToKeep = 0, repairTime = 5000, progbar = 'USANDO REPAIR KIT', engineValue = 250.0 },
	[2] = { label = "Adv Reapir Kit", item = "advrepairkit", chanceToKeep = 50, repairTime = 3500, progbar = 'USANDO ADV. REPAIR KIT', engineValue = 500.0 },
}

Config.Society = { -- (set settings for what boss can do in each dealerships)
	['mechanic1'] = {
		-- register society:
		name = 'mechanic1', -- job name
		label = 'Ripio Mamao', -- job label
		account = 'society_mechanic1', -- society account
		datastore = 'society_mechanic1', -- society datastore
		inventory = 'society_mechanic1', -- society inventory
		bossGrade = 2, -- boss grade from database
		data = {type = 'private'},	
		-- settings:
		withdraw  = true, -- boss can withdraw money from account
		deposit   = true, -- boss can deposit money into account
		wash      = false, -- boss can wash money
		employees = true, -- boss can manage & recruit employees
		grades    = true -- boss can adjust all salaries for each job grade
	},
	['mechanic2']  = {
		-- register society:
		name = 'mechanic2', -- job name
		label = 'Mechanic', -- job label
		account = 'society_mechanic2', -- society account
		datastore = 'society_mechanic2', -- society datastore
		inventory = 'society_mechanic2', -- society inventory
		bossGrade = 2, -- boss grade from database
		data = {type = 'private'},
		-- settings:
		withdraw  = true, -- boss can withdraw money from account
		deposit   = true, -- boss can deposit money into account
		wash      = false, -- boss can wash money
		employees = true, -- boss can manage & recruit employees
		grades    = false -- boss can adjust all salaries for each job grade
	},
	['biembo']  = {
		-- register society:
		name = 'biembo', -- job name
		label = 'D Biembo Auto Parts', -- job label
		account = 'society_biembo', -- society account
		datastore = 'society_biembo', -- society datastore
		inventory = 'society_biembo', -- society inventory
		bossGrade = 3, -- boss grade from database
		data = {type = 'private'},
		-- settings:
		withdraw  = true, -- boss can withdraw money from account
		deposit   = true, -- boss can deposit money into account
		wash      = false, -- boss can wash money
		employees = true, -- boss can manage & recruit employees
		grades    = true -- boss can adjust all salaries for each job grade
	},
	['mechanic4']  = {
		-- register society:
		name = 'mechanic4', -- job name
		label = 'Mechanic', -- job label
		account = 'society_mechanic4', -- society account
		datastore = 'society_mechanic4', -- society datastore
		inventory = 'society_mechanic4', -- society inventory
		bossGrade = 2, -- boss grade from database
		data = {type = 'private'},
		-- settings:
		withdraw  = true, -- boss can withdraw money from account
		deposit   = true, -- boss can deposit money into account
		wash      = false, -- boss can wash money
		employees = true, -- boss can manage & recruit employees
		grades    = false -- boss can adjust all salaries for each job grade
	},
	['mechanic5']  = {
		-- register society:
		name = 'mechanic5', -- job name
		label = 'Mechanic', -- job label
		account = 'society_mechanic5', -- society account
		datastore = 'society_mechanic5', -- society datastore
		inventory = 'society_mechanic5', -- society inventory
		bossGrade = 2, -- boss grade from database
		data = {type = 'private'},
		-- settings:
		withdraw  = true, -- boss can withdraw money from account
		deposit   = true, -- boss can deposit money into account
		wash      = false, -- boss can wash money
		employees = true, -- boss can manage & recruit employees
		grades    = false -- boss can adjust all salaries for each job grade
	},
}

-- Materials used throughout the script:
Config.Materials = {
	[1] = {label = "Frame Car Door", item = "car_frame"},
	[2] = {label = "Retrovisor", item = "rearview"},
	[3] = {label = "Manija de Coche", item = "doorhandle"},
	[4] = {label = "Vent Hood", item = "hood_vent"},
	[5] = {label = "Hood Sheet", item = "hood_sheet"},
	[6] = {label = "Frame Hood", item = "hood_frame"},
	[7] = {label = "Frame Trunk", item = "trunk_frame"},
	[8] = {label = "Trunk Sheet", item = "trunk_sheet"},
	[9] = {label = "Rim", item = "wheel_rim"},
	[10] = {label = "Wheel Rubber", item = "wheel_rubber"},
	[11] = {label = "Scrap Metal", item = "scrap_metal"},
	[12] = {label = "Electric Scrap", item = "electric_scrap"},

}

-- Available Health Parts to repair and required materials and amounts:
Config.HealthParts = {
	[1] = { label = "Brakes", degName = "brakes", value = 100, materials = { [1] = {id = 11, qty = 3}, [2] = {id = 12, qty = 2} } },
	[2] = { label = "Radiator", degName = "radiator", value = 100, materials = { [1] = {id = 12, qty = 2} } },
	[3] = { label = "Clutch", degName = "clutch", value = 100, materials = { [1] = {id = 11, qty = 4} } },
	[4] = { label = "Transmission", degName = "transmission", value = 100, materials = { [1] = {id = 11, qty = 4} } },
	[5] = { label = "Electronics", degName = "electronics", value = 100, materials = {[1] = {id = 11, qty = 5}, [2] = {id = 12, qty = 3}}},
	[6] = { label = "Drive Shaft", degName = "driveshaft", value = 100, materials = { [1] = {id = 11, qty = 4} } },
	[7] = { label = "Fuel Injector", degName = "fuelinjector", value = 100, materials = { [1] = {id = 11, qty = 4} } },
}

-- Config blacklist vehicle on lift / carjack:
Config.Blacklisted = {
	['lift'] = {"packer", "pounder", "biff", "ripley", "rumpo3"},
	['damage'] = {"packer", "pounder", "biff", "ripley"}
}

Config.Workbench = {
	[1] = {
		label = "Door", item = "car_door",
		recipe = { [1] = {id = 1, qty = 1}, [2] = {id = 2, qty = 1}, [3] = {id = 3, qty = 1} }
	},
	[2] = {
		label = "Hood", item = "car_hood",
		recipe = { [1] = {id = 4, qty = 1}, [2] = {id = 5, qty = 2}, [3] = {id = 6, qty = 1} }
	},
	[3] = {
		label = "Trunk", item = "car_trunk",
		recipe = { [1] = {id = 7, qty = 1}, [2] = {id = 8, qty = 1} }
	},
	[4] = {
		label = "Wheel", item = "car_wheel",
		recipe = { [1] = {id = 9, qty = 1}, [2] = {id = 10, qty = 1} }
	},
}

-- NPC Jobs Position:
Config.NPC_RepairJobs = {
	[1] = { pos = {879.88,-33.99,78.76,238.22}, inUse = false, ped = "s_m_y_dealer_01", payout = {min = 250, max = 400}},
	[2] = { pos = {1492.09,758.45,77.45,288.26}, inUse = false, ped = "s_m_y_dealer_01", payout = {min = 250, max = 400}},
	[3] = { pos = {387.67,-767.56,29.29,358.94}, inUse = false, ped = "s_m_y_dealer_01", payout = {min = 250, max = 400}},
	[4] = { pos = {-583.75,-239.55,36.08,33.14}, inUse = false, ped = "s_m_y_dealer_01", payout = {min = 250, max = 400}},
}

-- Vehicle scrambler for npc jobs:
Config.RepairVehicles = {"sultan", "blista", "glendale", "exemplar"}

-- Prop Emotes:
Config.PropEmotes = {
	["prop_roadcone02a"] = {label = "Road Cone", model = "prop_roadcone02a", bone = 28422, pos = {0.6,-0.15,-0.1}, rot = {315.0,288.0,0.0}},
	["prop_cs_trolley_01"] = {label = "Tool Trolley", model = "prop_cs_trolley_01", bone = 28422, pos = {-0.1,-0.6,-0.85}, rot = {-180.0,-165.0,90.0}},
	["prop_tool_box_04"] = {label = "Tool Box", model = "prop_tool_box_04", bone = 28422, pos = {0.4,-0.1,-0.1}, rot = {315.0,288.0,0.0}},
	["prop_engine_hoist"] = {label = "Engine Hoist", model = "prop_engine_hoist", bone = 28422, pos = {0.0,-0.5,-1.3}, rot = {-195.0,-180.0,180.0}}
}

Config.KeyControls = {
	['manage_menu'] = 38,
	['buy_shop'] = 38,
	['interaction_menu'] = 'F6', -- this use KeyMapping (https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/)
	['car_jack'] = 38,
	['analyse_here'] = 38,
	['install_b_part'] = 47,
	['park_on_lift'] = 38,
	['detach_veh_lift'] = 47,
	['lift_move_up'] = 172,
	['lift_move_down'] = 173,
	['inspect_veh'] = 38,
	['inspect_here'] = 38,
	['repair_h_here'] = 38,
	['repair_engine'] = 38,
	['storage_menu'] = 38,
	['workbench_menu'] = 38,
	['quick_repair'] = 47,
	['push_pickup_objs'] = 324,
	['rep_npc_vehicle'] = 38,
	['collect_npc_cash'] = 38,
	['use_repairkit'] = 38
}

