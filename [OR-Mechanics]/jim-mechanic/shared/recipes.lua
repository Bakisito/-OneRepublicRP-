Crafting = {
	Nos = {
		{ ["nos"] = { ["noscan"] = 1, } },
		{ ["noscan"] = { ["steel"] = 1, } },
		{ ["noscolour"] = { ["plastic"] = 1, } },
	},
	Repairs = {
		{ ["mechanic_tools"] = { ["iron"] = 1, } },
		{ ["ducttape"] = { ["plastic"] = 1, } },
		{ ["newoil"] = { ["plastic"] = 1, } },
		{ ["sparkplugs"] = { ["metalscrap"] = 1, } },
		{ ["carbattery"] = { ["metalscrap"] = 1, ["plastic"] = 1 } },
		{ ["axleparts"] = { ["steel"] = 1, } },
		{ ["sparetire"] = { ["rubber"] = 1, } },
	},
	Tools = {
		{ ["toolbox"] = { ["iron"] = 1, } },
		{ ["paintcan"] = { ["aluminum"] = 1, } },

		{ ["tint_supplies"] = { ["iron"] = 1, } },
		{ ["underglow_controller"] = { ["iron"] = 1, } },
		{ ["cleaningkit"] = { ["rubber"] = 1, } },

				-- Example : Delete me --
		-- Support for multiple items in recipes --
		-- Support for multiple resulting items --
		-- Support to limit items to certain job roles --
		{ ["cleaningkit"] = { ["rubber"] = 5, ["engine2"] = 1, ["plastic"] = 2 },
				["amount"] = 2, ["job"] = { ["mechanic"] = 4, ["tuner"] = 4, } },
				-- Example : Delete me --
	},
	Perform = {
		{ ["turbo"] = { ["steel"] = 1, } },
		{ ["car_armor"] = { ["plastic"] = 1, } },
		{ ["engine1"] = { ["steel"] = 1, } },
		{ ["engine2"] = { ["steel"] = 1, } },
		{ ["engine3"] = { ["steel"] = 1, } },
		{ ["engine4"] = { ["steel"] = 1, } },
		{ ["engine5"] = { ["steel"] = 1, } },
		{ ["transmission1"] = { ["steel"] = 1, } },
		{ ["transmission2"] = { ["steel"] = 1, } },
		{ ["transmission3"] = { ["steel"] = 1, } },
		{ ["transmission4"] = { ["steel"] = 1, } },
		{ ["brakes1"] = { ["steel"] = 1, } },
		{ ["brakes2"] = { ["steel"] = 1, } },
		{ ["brakes3"] = { ["steel"] = 1, } },
		{ ["suspension1"] = { ["steel"] = 1, } },
		{ ["suspension2"] = { ["steel"] = 1, } },
		{ ["suspension3"] = { ["steel"] = 1, } },
		{ ["suspension4"] = { ["steel"] = 1, } },
		{ ["suspension5"] = { ["steel"] = 1, } },
		{ ["bprooftires"] = { ["rubber"] = 1, } },
		{ ["drifttires"] = { ["rubber"] = 1, } },

		{ ["oilp1"] = { ["steel"] = 1, } },
		{ ["oilp2"] = { ["steel"] = 1, } },
		{ ["oilp3"] = { ["steel"] = 1, } },
		{ ["drives1"] = { ["steel"] = 1, } },
		{ ["drives2"] = { ["steel"] = 1, } },
		{ ["drives3"] = { ["steel"] = 1, } },
		{ ["cylind1"] = { ["steel"] = 1, } },
		{ ["cylind2"] = { ["steel"] = 1, } },
		{ ["cylind3"] = { ["steel"] = 1, } },
		{ ["cables1"] = { ["steel"] = 1, } },
		{ ["cables2"] = { ["steel"] = 1, } },
		{ ["cables3"] = { ["steel"] = 1, } },
		{ ["fueltank1"] = { ["steel"] = 1, } },
		{ ["fueltank2"] = { ["steel"] = 1, } },
		{ ["fueltank3"] = { ["steel"] = 1, } },

		{ ["harness"] = { ["steel"] = 1, } },
		{ ["antilag"] = { ["steel"] = 1, } },
	},
	Cosmetic = {
		{ ["hood"] = { ["plastic"] = 1, } },
		{ ["roof"] = { ["plastic"] = 1, } },
		{ ["spoiler"] = { ["plastic"] = 1, } },
		{ ["bumper"] = { ["plastic"] = 1, } },
		{ ["skirts"] = { ["plastic"] = 1, } },
		{ ["exhaust"] = { ["iron"] = 1, } },
		{ ["seat"] = { ["plastic"] = 1, } },
		{ ["livery"] = { ["plastic"] = 1 }, },
		{ ["tires"] = { ["rubber"] = 1, } },
		{ ["horn"] = { ["plastic"] = 1, } },
		{ ["internals"] = { ["plastic"] = 1, } },
		{ ["externals"] = { ["plastic"] = 1, } },
		{ ["customplate"] = { ["steel"] = 1, } },
		{ ["headlights"] = { ["plastic"] = 1, } },
		{ ["rims"] = { ["iron"] = 1, } },
		{ ["rollcage"] = { ["steel"] = 1, } },
	},
}

Stores = {
	NosItems = {
		label = Loc[Config.Lan]["stores"].nos,
		items = {
			{ name = "nos", price = 5000, amount = 10, info = {}, type = "item", },
			{ name = "noscolour", price = 700, amount = 10, info = {}, type = "item", },
		},
	},
	RepairItems = {
		label = Loc[Config.Lan]["stores"].repairs,
		items = {
			{ name = "weapon_wrench", price = 10, amount = 150, info = {}, type = "item", },
			--{ name = "sparetire", price = 0, amount = 100, info = {}, type = "item", },
			{ name = "axleparts", price = 75, amount = 10, info = {}, type = "item", },
			{ name = "carbattery", price = 75, amount = 10, info = {}, type = "item", },
			{ name = "sparkplugs", price = 25, amount = 10, info = {}, type = "item", },
			{ name = "newoil", price = 50, amount = 10, info = {}, type = "item", },
			{ name = "carwheel", price = 50, amount = 10, info = {}, type = "item", },
			{ name = "kq_drifttire", price = 650, amount = 10, info = {}, type = "item", },
			{ name = "kq_regulartire", price = 100, amount = 10, info = {}, type = "item", },



		},
	},
	ToolItems = {
		label = Loc[Config.Lan]["stores"].tools,
		items = {
			{ name = "mechanic_toolsa", price = 100, amount = 10, info = {}, type = "item", },
			{ name = "mechanic_tools", price = 100, amount = 10, info = {}, type = "item", },
			{ name = "toolboxa", price = 100, amount = 10, info = {}, type = "item", },
			--{ name = "toolbox", price = 0, amount = 10, info = {}, type = "item", },
			{ name = "ducttape", price = 25, amount = 100, info = {}, type = "item", },
			{ name = "paintcan", price = 500, amount = 50, info = {}, type = "item", },
			{ name = "tint_supplies", price = 450, amount = 50, info = {}, type = "item", },
			{ name = "underglow_controller", price = 0, amount = 10, info = {}, type = "item", },
			{ name = "cleaningkit", price = 20, amount = 10, info = {}, type = "item", },
			{ name = "kq_carjack", price = 600, amount = 10, info = {}, type = "item", },
			{ name = "advancedrepairkit", price = 400, amount = 10, info = {}, type = "item", },
			{ name = "lockpick", price = 100, amount = 10, info = {}, type = "item", },
			{ name = "advancedlockpick", price = 200, amount = 10, info = {}, type = "item", },
			
		},
	},
	PerformItems = {
		label = Loc[Config.Lan]["stores"].perform,
		items = {
			{ name = "turbo", price = 2100, amount = 50, info = {}, type = "item", },
			{ name = "engine1", price = 2220, amount = 50, info = {}, type = "item", },
			{ name = "engine2", price = 2700, amount = 50, info = {}, type = "item", },
			{ name = "engine3", price = 3600, amount = 50, info = {}, type = "item", },
			{ name = "engine4", price = 4250, amount = 50, info = {}, type = "item", },
			{ name = "engine5", price = 5250, amount = 50, info = {}, type = "item", },
			{ name = "transmission1", price = 1850, amount = 50, info = {}, type = "item", },
			{ name = "transmission2", price = 2250, amount = 50, info = {}, type = "item", },
			{ name = "transmission3", price = 3400, amount = 50, info = {}, type = "item", },
			{ name = "transmission4", price = 4000, amount = 50, info = {}, type = "item", },
			{ name = "brakes1", price = 750, amount = 50, info = {}, type = "item", },
			{ name = "brakes2", price = 1900, amount = 50, info = {}, type = "item", },
			{ name = "brakes3", price = 2500, amount = 50, info = {}, type = "item", },
			--{ name = "car_armor", price = 0, amount = 50, info = {}, type = "item", },
			{ name = "suspension1", price = 750, amount = 50, info = {}, type = "item", },
			{ name = "suspension2", price = 1600, amount = 50, info = {}, type = "item", },
			{ name = "suspension3", price = 1900, amount = 50, info = {}, type = "item", },
			{ name = "suspension4", price = 2300, amount = 50, info = {}, type = "item", },
			{ name = "suspension5", price = 2750, amount = 50, info = {}, type = "item", },
			--{ name = "bprooftires", price = 0, amount = 50, info = {}, type = "item", },
			--{ name = "drifttires", price = 0, amount = 50, info = {}, type = "item", },

			{ name = "oilp1", price = 700, amount = 50, info = {}, type = "item", },
			{ name = "oilp2", price = 1500, amount = 50, info = {}, type = "item", },
			{ name = "oilp3", price = 3000, amount = 50, info = {}, type = "item", },

			{ name = "drives1", price = 500, amount = 50, info = {}, type = "item", },
			{ name = "drives2", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "drives3", price = 2000, amount = 50, info = {}, type = "item", },

			{ name = "cylind1", price = 400, amount = 50, info = {}, type = "item", },
			{ name = "cylind2", price = 1000, amount = 50, info = {}, type = "item", },
			{ name = "cylind3", price = 2100, amount = 50, info = {}, type = "item", },

			{ name = "cables1", price = 200, amount = 50, info = {}, type = "item", },
			{ name = "cables2", price = 500, amount = 50, info = {}, type = "item", },
			{ name = "cables3", price = 1000, amount = 50, info = {}, type = "item", },

			{ name = "fueltank1", price = 800, amount = 50, info = {}, type = "item", },
			{ name = "fueltank2", price = 1600, amount = 50, info = {}, type = "item", },
			{ name = "fueltank3", price = 2000, amount = 50, info = {}, type = "item", },

			{ name = "harness", price = 350, amount = 50, info = {}, type = "item", },
			--{ name = "antilag", price = 0, amount = 50, info = {}, type = "item", },
		},
	},
	CosmeticItems = {
		label = Loc[Config.Lan]["stores"].cosmetic,
		items = {
			{ name = "hood", price = 700, amount = 50, info = {}, type = "item", },
			{ name = "roof", price = 700, amount = 50, info = {}, type = "item", },
			{ name = "spoiler", price = 700, amount = 50, info = {}, type = "item", },
			{ name = "bumper", price = 700, amount = 50, info = {}, type = "item", },
			{ name = "skirts", price = 700, amount = 50, info = {}, type = "item", },
			{ name = "exhaust", price = 700, amount = 50, info = {}, type = "item", },
			{ name = "seat", price = 700, amount = 50, info = {}, type = "item", },
			{ name = "livery", price = 700, amount = 50, info = {}, type = "item", },
			{ name = "tires", price = 700, amount = 50, info = {}, type = "item", },
			{ name = "horn", price = 700, amount = 50, info = {}, type = "item", },
			{ name = "internals", price = 700, amount = 50, info = {}, type = "item", },
			{ name = "externals", price = 700, amount = 50, info = {}, type = "item", },
			{ name = "customplate", price = 700, amount = 50, info = {}, type = "item", },
			{ name = "headlights", price = 700, amount = 50, info = {}, type = "item", },
			{ name = "rims", price = 700, amount = 100, info = {}, type = "item", },
			{ name = "rollcage", price = 700, amount = 50, info = {}, type = "item", },
		},
	},
}

-- No Touch
	-- This is corrective code to help simplify the stores for people removing the slot info
	-- Jim shops doesn"t use it but other inventories do
	-- Most people don"t even edit the slots, these lines generate the slot info autoamtically
Stores.CosmeticItems.slots = #Stores.CosmeticItems.items
for k in pairs(Stores.CosmeticItems.items) do Stores.CosmeticItems.items[k].slot = k end
Stores.PerformItems.slots = #Stores.PerformItems.items
for k in pairs(Stores.PerformItems.items) do Stores.PerformItems.items[k].slot = k end
Stores.ToolItems.slots = #Stores.ToolItems.items
for k in pairs(Stores.ToolItems.items) do Stores.ToolItems.items[k].slot = k end
Stores.RepairItems.slots = #Stores.RepairItems.items
for k in pairs(Stores.RepairItems.items) do Stores.RepairItems.items[k].slot = k end
Stores.NosItems.slots = #Stores.NosItems.items
for k in pairs(Stores.NosItems.items) do Stores.NosItems.items[k].slot = k end