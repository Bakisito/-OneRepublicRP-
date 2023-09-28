Config.Locations = {}

Config.Locations[#Config.Locations+1] = { --[[ GABZ ALTA STREET BENNYS ]]--
	Enabled = true,
	job = "mechanic",
	zones = {
		vec2(-263.99075317382, -1349.6701660156),
		vec2(-263.5015258789, -1298.9702148438),
		vec2(-229.94024658204, -1299.089477539),
		vec2(-229.81985473632, -1291.589477539),
		vec2(-216.73846435546, -1288.9470214844),
		vec2(-193.63221740722, -1294.155883789),
		vec2(-174.24346923828, -1293.1431884766),
		vec2(-151.77659606934, -1300.6693115234),
		vec2(-151.88639831542, -1311.1921386718),
		vec2(-177.41833496094, -1311.566772461),
		vec2(-177.5919342041, -1351.1942138672)
	},
	autoClock = { enter = false, exit = false, },
	stash = {
		{ coords = vec4(-226.48, -1316.17, 31.27, 0.0), w = 3.6, d = 0.8, },
	},
	store = {
		{ coords = vec4(-228.64, -1314.19, 31.3, 90.0), w = 3.60, d = 0.8 },
	},
	crafting = {
		{ coords = vec4(-214.82, -1339.74, 31.46, 90.0), w = 2.8, d = 1.5 },
	},
	clockin = {
		{ coords = vec4(-195.55, -1316.46, 31.2, 181.72), prop = false },
	},
	manualRepair = {
		{ coords = vec4(-200.28, -1311.62, 31.3, 0.0), prop = true, },
	},
	carLift = {
        { coords = vector4(-201.85, -1319.65, 31.3, 19.36), use = true },
        { coords = vector4(-221.27, -1318.71, 31.3, 352.67), use = true },
    },
	garage = {
		spawn = vec4(-182.74, -1317.61, 30.63, 357.23),
		out = vec4(-190.62, -1311.57, 31.3, 0.0),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png",
		{ coords = vec4(-192.21, -1316.34, 31.10, 285.83), prop = true },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(-211.55, -1324.55, 30.9),
		label = "Bennys Original Motorworks",
		color = 1,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 16711680,
	}
}

Config.Locations[#Config.Locations+1] = { --[[ AUTO Exotic]]--
	Enabled = true,
	job = "biembo",
	zones = {
		vector2(524.21795654297, -164.02458190918),
		vector2(524.65454101562, -182.37878417969),
		vector2(530.119140625, -193.26835632324),
		vector2(538.5830078125, -193.23571777344),
		vector2(539.71356201172, -217.19281005859),
		vector2(551.21160888672, -215.1937713623),
		vector2(552.77630615234, -201.77980041504),
		vector2(552.56274414062, -164.00897216797)
	},
	autoClock = { enter = false, exit = false, },
	nosrefill = {  {coords = vec4(548.9797, -170.2274, 54.4860, 268.4527) },  }, -- 548.9797, -170.2274, 54.4860, 268.4527
	stash = {
		{ coords = vec4(538.3455, -165.950, 54.7932, 90), w = 4.5, d = 0.9, },
	},
	store = {
		{ coords = vec4(547.8114, -182.7018, 54.7932, 180), w = 4, d = 0.8, },
	},
	crafting = {
		{ coords = vec4(136.71, -3051.29, 7.04, 0.0), w = 0.6, d = 1.0, },
	},
	clockin = {
		{ coords = vec4(541.8090, -199.1589, 54.3, 180.0), prop = true },
	},
	manualRepair = {
		{ coords = vec4(540.3610, -184.4602, 54.4, 90), prop = true, },
	},
	garage = {
		spawn = vec4(543.0393, -209.5833, 53.0382, 181.9472),
		out = vec4(545.3940, -202.9446, 54.4458, 180),
		list = { "towtruck","cheburek"},
		prop = true
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
		{ coords = vec4(541.7952, -195.2382, 54.2932, 90), prop = true, },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(-336.84, -136.39, 39.01),
		label = "Los Santos Customs",
		color = 81,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "https://discord.com/api/webhooks/1155619820235132999/QgkWZ3aG_gl7AZCCOdO8Hg0SkHb5YstGvhqRCtjOZ4Afot5eNfTA4NrKRn4HLDUlu_BW",
		color = 2571775,
	}
}

Config.Locations[#Config.Locations+1] = { --[[ HAYES AUTOS ]]--
	Enabled = true,
	job = "mechanic",
	zones = {
		vec2(490.57400512695, -1302.0946044922),
		vec2(490.27529907227, -1305.3948974609),
		vec2(509.71032714844, -1336.8293457031),
		vec2(483.09429931641, -1339.0887451172),
		vec2(479.38552856445, -1330.6906738281),
		vec2(469.89437866211, -1309.5773925781)
	},
	autoClock = { enter = false, exit = false, },
	stash = {
		{ coords = vec4(478.84, -1326.94, 29.21, 27.0), w = 1.6, d = 0.6, },
	},
	store = {
		{ coords = vec4(474.83, -1308.06, 29.21, 295.0), w = 1.6, d = 0.5, },
	},
	crafting = {
		{ coords = vec4(472.54, -1313.22, 29.21, 30.0), w = 3.2, d = 1.0, },
	},
	clockin = {
		{ coords = vec4(471.51, -1310.97, 29.22, 23.0), w = 0.45, d = 0.4, },
	},
	manualRepair = {
		{ coords = vector4(498.12, -1318.13, 29.25, 122.41), prop = true, },
	},
	carLift = {
		{ coords = vector4(491.54, -1328.32, 29.29, 122.78) },
	},
	garage = {
		spawn = vec4(487.67, -1308.78, 28.6, 233.44),
		out = vec4(483.06, -1311.35, 29.21, 298.78),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/0/0c/HayesAutoBodyShop-GTAV-Logo.png",
		{ coords = vec4(485.88, -1319.49, 29.11, 284.0), prop = true },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(480.52, -1318.24, 29.2),
		label = "Hayes Autos",
		color = 57,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 39135,
	}
}

Config.Locations[#Config.Locations+1] = { -- [[LS CUSTOMS ROUTE 68]] --
	Enabled = true,
	job = "mechanic",
	zones = {
		vec2(1190.58, 2645.39),
		vec2(1190.72, 2634.46),
		vec2(1170.39, 2634.2),
		vec2(1170.33, 2645.83)
	},
	autoClock = { enter = false, exit = false, },
	stash = {
		{ coords = vec4(1180.85, 2635.0, 37.75, 90.0), w = 1.6, d = 0.6 },
	},
	store = {
		{ coords = vec4(1171.64, 2635.84, 37.78, 45.0), w = 0.6, d = 0.5 },
	},
	crafting = {
		{ coords = vec4(1176.69, 2635.44, 37.75, 270.0), w = 3.2, d = 1.0 },
	},
	clockin = {
		{ coords = vec4(1183.89, 2635.29, 37.78, 185.0), prop = true, },
	},
	manualRepair = {
		{ coords = vec4(1162.75, 2622.96, 38.0, 1.32), prop = true, },
	},
	carLift = {
		{ coords = vector4(1174.78, 2644.54, 37.75, 180.0), },
		{ coords = vector4(1182.22, 2644.75, 37.75, 180.0) },
	},
	garage = {
		spawn = vec4(1165.92, 2642.87, 37.23, 358.2),
		out = vec4(1170.25, 2645.6, 37.81, 88.15),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true,
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
		{ coords = vec4(1179.39, 2635.17, 37.75, 176.0), prop = true, },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(1177.62, 2640.83, 37.75),
		label = "Los Santos Customs",
		color = 81,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 2571775,
	}
}

Config.Locations[#Config.Locations+1] = { --[[ BEEKERS GARAGE PALETO ]]--
	Enabled = true,
	job = "mechanic",
	zones = {
		vec2(117.79, 6625.31),
		vec2(102.88, 6611.96),
		vec2(95.51, 6619.93),
		vec2(108.8, 6633.98)
	},
	autoClock = { enter = false, exit = false, },
	stash = {
		{ coords = vec4(105.98, 6628.84, 31.79, 315.0), w = 3.2, d = 1.0, },
	},
	store = {
		{ coords = vec4(109.9, 6632.02, 31.79, 270.0), w = 0.6, d = 0.5, },
	},
	crafting = {
		{ coords = vec4(102.7, 6626.23, 31.79, 315.0), w = 1.6, d = 0.6, },
	},
	clockin = {
		{ coords = vec4(100.61, 6623.84, 31.81, 74.0), prop = true, },
	},
	manualRepair = {
		{ coords = vec4(103.35, 6620.51, 31.79, 313.74), prop = true, },
	},
	carLift = {
		{ coords = vector4(113.7, 6623.79, 31.79, 45.31), },
	},
	garage = {
		spawn = vec4(109.92, 6608.11, 31.18, 313.99),
		out = vec4(107.43, 6614.64, 32.0, 226.54),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true,
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/4/40/Beeker%27s_logo_GTA_V.png",
		{ coords = vec4(103.87, 6627.14, 31.79, 12.0), prop = true },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(108.36, 6623.67, 31.79),
		label = "Beekers Garage",
		color = 52,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 23552,
	}
}

Config.Locations[#Config.Locations+1] = { --[[ GABZ LS TUNER SHOP ]]--
	Enabled = true,
	job = "mechanic",
	zones = {
		vec2(154.69816589355, -3007.0153808594),
		vec2(120.64015197754, -3006.7275390625),
		vec2(120.48593902588, -3051.8874511719),
		vec2(154.61296081543, -3051.5419921875)
	},
	autoClock = { enter = true, exit = true, },
	stash = {
		{ coords = vec4(144.38, -3051.3, 7.04, 0.0), w = 0.6, d = 3.6, },
		{ coords = vec4(128.45, -3007.83, 7.04, 0.0), w = 2.4, d = 3.5, },
	},
	store = {
		{ coords = vec4(128.64, -3014.68, 7.04, 0.0), w = 1.6, d = 3.0, },
	},
	crafting = {
		{ coords = vec4(136.71, -3051.29, 7.04, 0.0), w = 0.6, d = 1.0, },
	},
	clockin = {
		{ coords = vec4(145.29, -3012.93, 6.94, 86.0), prop = true, },
		{ coords = vec4(125.55, -3007.25, 6.94, 350.0), w = 0.4, d = 0.45, },
	},
	manualRepair = {
		{ coords = vec4(121.0, -3047.69, 7.04, 270.11), prop = true, },
	},
	nosrefill = {
		{ coords = vec4(121.17, -3044.73, 7.04, 268.96) },
	},
	carLift = {
		{ coords = vector4(123.0, -3038.0, 7.04, 90.0), use = true, },
		{ coords = vector4(123.0, -3044.0, 7.04, 90.0), use = true, },
	},
	garage = {
		spawn = vec4(163.22, -3009.31, 5.27, 89.72),
		out = vec4(157.37, -3016.57, 7.04, 179.58),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true,
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
		{ coords = vec4(146.44, -3014.09, 6.94, 195.0), prop = true, },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(139.91, -3023.83, 7.04),
		label = "LS Tuner Shop",
		color = 81,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 2571775,
	}
}

Config.Locations[#Config.Locations+1] = { --[[ AIRPORT LS CUSTOMS ]]--
	Enabled = true,
	job = "mechanic",
	zones = {
		vec2(-1118.5782470703, -2017.4730224609),
		vec2(-1143.9351806641, -2042.6685791016),
		vec2(-1172.8060302734, -2014.1071777344),
		vec2(-1147.3665771484, -1988.7028808594)
	},
	autoClock = { enter = false, exit = false, },
	stash = {
		{ coords = vec4(-1141.11, -2004.79, 13.18, 45.0), w = 1.6, d = 0.6, },
	},
	store = {
		{ coords = vec4(-1144.2, -2003.91, 13.18, 45.0), w = 1.6, d = 0.6, },
	},
	crafting = {
		{ coords = vec4(-1158.71, -2002.37, 13.18, 45.0), w = 0.6, d = 3.8, },
	},
	clockin = {
		{ coords = vec4(-1155.69, -1998.91, 13.22, 62.0), prop = true, },
	},
	manualRepair = {
		{ coords = vector4(-1154.66, -2023.07, 13.18, 225.81), },
	},
	carLift = {
		{ coords = vector4(-1161.43, -2015.11, 13.18, 133.41) },
	},
	garage = {
		spawn = vec4(-1154.63, -1986.95, 12.5, 315.29),
		out = vec4(-1147.87, -1989.09, 13.16, 45.01),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true,
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
		{ coords = vec4(-1147.41, -2001.07, 13.18, 285.0), prop = true, },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(-1150.68, -2002.48, 13.18),
		label = "Los Santos Customs",
		color = 81,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 2571775,
	}
}

Config.Locations[#Config.Locations+1] = { --[[ POPULAR STREET LS CUSTOMS ]]--
	Enabled = true,
	job = "mechanic",
	zones = {
		vec2(712.07940673828, -1092.9447021484),
		vec2(712.08245849609, -1052.4462890625),
		vec2(767.2265625, -1053.3394775391),
		vec2(770.71307373047, -1113.0911865234),
		vec2(741.73657226562, -1108.9860839844)
	},
	autoClock = { enter = false, exit = false, },
	stash = {
		{ coords = vec4(736.25, -1063.52, 22.17, 87.0), w = 3.2, d = 0.6, },
	},
	store = {
		{ coords = vec4(738.35, -1073.36, 22.17, 359.0), w = 3.8, d = 0.6, },
	},
	crafting = {
		{ coords = vec4(724.49, -1075.09, 22.17, 91.0), w = 0.8, d = 1.0, },
	},
	clockin = {
		{ coords = vec4(738.26, -1087.66, 21.97, 276.0), prop = true, },
	},
	manualRepair = {
		{ coords = vec4(732.89, -1093.79, 22.17, 351.08), prop = true, },
	},
	carLift = {
		{ coords = vec4(734.0, -1071.38, 22.17, 0.0) },
		{ coords = vector4(728.95, -1071.41, 22.17, 0.0)}
	},
	garage = {
		spawn = vec4(716.22, -1069.58, 21.6, 1.08),
		out = vec4(719.63, -1068.84, 22.24, 89.2),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
		{ coords = vec4(738.34, -1090.52, 21.97, 220.0), prop = true, },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(731.69, -1088.84, 22.17),
		label = "Los Santos Customs",
		color = 81,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 2571775,
	}
}

Config.Locations[#Config.Locations+1] = { --[[ OTTOS AUTOS ]]--
	Enabled = true,
	job = "mechanic",
	zones = {
		vec2(824.64721679688, -802.48284912109),
		vec2(838.40698242188, -802.47802734375),
		vec2(837.53460693359, -830.51928710938),
		vec2(823.86810302734, -830.36676025391)
	},
	autoClock = { enter = false, exit = false, },
	stash = {
		{ coords = vec4(836.97, -814.73, 26.33, 90.0), w = 0.6, d = 3.6, },
	},
	store = {
		{ coords = vec4(837.02, -808.22, 26.33, 90.0), w = 1.0, d = 1.4, },
	},
	crafting = {
		{ coords = vec4(837.03, -811.74, 26.33, 90.0), w = 1.4, d = 2.2, },
	},
	clockin = {
		{ coords = vec4(834.63, -829.76, 26.13, 197.67), prop = true, },
	},
	manualRepair = {
		{ coords = vec4(835.0, -801.06, 26.27, 0.25), prop = true, },
	},
	carLift = {
		{ coords = vector4(828.15, -812.69, 26.33, 270.5) },
		{ coords = vector4(828.25, -819.93, 26.33, 270.5) },
		{ coords = vector4(827.96, -805.63, 26.33, 270.5) },
	},
	garage = {
		spawn = vec4(826.59, -793.63, 26.21, 84.34),
		out = vec4(824.3, -801.2, 26.37, 0.65),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true
	},
	payments = {
		{ coords = vec4(833.96, -826.79, 26.13, 0.35), prop = true },
		img = "https://i.imgur.com/74UVnCb.jpeg",
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(831.03, -813.01, 26.33),
		label = "Hayes Autos",
		color = 1,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 16711680,
	}
}

Config.Locations[#Config.Locations+1] = { --[[ HAYES AUTOS ]]--
	Enabled = true,
	job = "mechanic",
	zones = {
		vec2(-1439.9047851563, -443.4548034668),
		vec2(-1426.0206298828, -466.5227355957),
		vec2(-1400.1343994141, -451.71572875977),
		vec2(-1414.7999267578, -427.64019775391)
	},
	autoClock = { enter = false, exit = false, },
	stash = {
		{ coords = vec4(-1414.94, -452.35, 35.91, 302.0), w = 4.0, d = 1.0, },
	},
	store = {
		{ coords = vec4(-1408.04, -448.04, 35.91, 302.0), w = 5.5, d = 1.0, },
	},
	crafting = {
		{ coords = vec4(-1407.68, -442.32, 35.91, 302.0), w = 0.6, d = 1.0, },
	},
	clockin = {
		{ coords = vec4(-1427.19, -457.51, 35.71, 300.0), prop = true, },
	},
	manualRepair = {
		{ coords = vec4(-1421.91, -455.41, 35.91, 33.32), prop = true, },
	},
	carLift = {
		{ coords = vector4(-1418.92, -443.53, 35.91, 211.54) },
	},
	garage = {
		spawn = vec4(-1379.84, -451.82, 34.44, 124.0),
		out = vec4(-1401.57, -451.19, 34.48, 212.71),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" }
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/0/0c/HayesAutoBodyShop-GTAV-Logo.png",
		{ coords = vec4(-1429.02, -453.6, 35.97, 350.0), prop = true, },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(-1417.12, -445.9, 35.91),
		label = "Hayes Autos",
		color = 57,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 39135,
	}
}

Config.Locations[#Config.Locations+1] = { --[[ BENNYS NEXT TO PDM ]]--
	Enabled = false,
	job = "mechanic",
	zones = {
		vec2(-39.657638549805, -1026.12890625),
		vec2(-54.971218109131, -1066.3665771484),
		vec2(-20.210899353027, -1079.1593017578),
		vec2(-6.8900542259216, -1038.0417480469),
	},
	autoClock = { enter = false, exit = false, },
	stash = {
		{ coords = vec4(-40.9, -1056.62, 28.4, 70.0), w = 3.6, d = 0.6 },
	},
	store = {
		{ coords = vec4(-37.53, -1036.11, 28.6, 340.0), w = 1.6, d = 0.6 },
	},
	crafting = {
		{ coords = vec4(-38.25, -1038.99, 28.6, 340.0), w = 4.0, d = 0.6 },
	},
	clockin = {
		{ coords = vec4(-34.95, -1040.71, 28.59, 8.0), prop = true, },
	},
	manualRepair = {
		{ coords = vec4(-45.11, -1048.54, 28.4, 249.94), prop = true, },
	},
	garage = { -- requires jim-jobgarge
		spawn = vec4(-49.14, -1031.25, 27.76, 339.67),
		out = vec4(-42.38, -1035.11, 28.52, 68.01),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true, -- spawn a prop (if there isn't alreaady one available in the current MLO at the location)
	},
	payments = { -- requires jim-payments
		{ coords = vec4(-35.91, -1040.47, 28.6, 340.0), prop = true, },
		img = "https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png",
	},
	Restrictions = { -- Remove what you DON'T what the location to be able to edit
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(-43.05, -1043.99, 28.76),
		label = "Bennys Workshop",
		color = 1,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 16711680,
	}
}

Config.Locations[#Config.Locations+1] = { --[[ LA MESA IMPORT SHOP ]]--
	Enabled = true,
	job = "mechanic",
	zones = {
		vec2(912.01, -987.16),
		vec2(911.06, -973.9),
		vec2(903.25, -974.3),
		vec2(909.76, -957.19),
		vec2(909.58, -955.95),
		vec2(903.27, -956.28),
		vec2(902.61, -945.22),
		vec2(923.9, -943.79),
		vec2(924.5, -956.21),
		vec2(932.85, -956.09),
		vec2(933.32, -952.66),
		vec2(941.05, -952.19),
		vec2(940.58, -944.6),
		vec2(932.12, -944.41),
		vec2(931.48, -934.47),
		vec2(961.09, -932.64),
		vec2(962.56, -955.52),
		vec2(964.37, -983.87),
	},
	autoClock = { enter = false, exit = false, },
	stash = {
		{ coords = vec4(948.48, -972.38, 39.5, 5.0), w = 1.5, d = 1.0, },
	},
	store = {
		{ coords = vec4(951.14, -979.1, 39.5, 4.0), w = 4.2, d = 1.0, },
	},
	crafting = {
		{ coords = vec4(921.14, -986.24, 39.5, 4.0), w = 1.0, d = 4.0, },
	},
	clockin = {
		{ coords = vec4(952.1, -968.39, 39.31, 273.2), prop = true, },
	},
	manualRepair = {
		{ coords = vector4(952.84, -955.83, 39.5, 182.32), prop = false, },
	},
	carLift = {
		{ coords = vec4(956.32, -953.20, 39.5, 273.65) },
		{ coords = vec4(955.99, -947.97, 39.5, 273.65) },
		{ coords = vec4(955.67, -942.91, 39.5, 273.65) },
		{ coords = vec4(954.56, -939.35, 39.5, 3.65) },
		{ coords = vec4(950.48, -939.61, 39.5, 3.65) },
		{ coords = vec4(946.24, -939.88, 39.5, 3.65) },
		{ coords = vec4(942.15, -940.14, 39.5, 3.65) },
		{ coords = vec4(937.95, -940.41, 39.5, 3.65) },
		{ coords = vec4(933.86, -940.67, 39.5, 3.65) },
		{ coords = vec4(910.62, -951.03, 39.5, 3.65) },
		{ coords = vec4(916.10, -950.68, 39.5, 3.65) },
		{ coords = vec4(921.37, -950.34, 39.5, 3.65) },
		{ coords = vec4(905.41, -951.36, 39.5, 3.65) },
		{ coords = vec4(939.96, -978.72, 39.5, 93.60) },
		{ coords = vec4(938.56, -961.8, 39.5, 93.60) },
	},
	garage = {
		spawn = vec4(937.02, -990.27, 38.34, 93.92),
		out = vec4(936.81, -987.17, 38.34, 184.37),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
		{ coords = vec4(949.46, -968.68, 39.31, 92.0), prop = true },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(932.49, -970.83, 39.5),
		label = "Import Garage",
		color = 81,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 2571775,
	}
}