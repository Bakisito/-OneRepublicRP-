--[[
---------------------------------------------------
LUXART VEHICLE CONTROL V3 (FOR FIVEM)
---------------------------------------------------
Coded by Lt.Caine
ELS Clicks by Faction
Additions by TrevorBarns
---------------------------------------------------
FILE: SIRENS.lua
PURPOSE: Associate specific sirens with specific
vehicles. Siren assignments. 
---------------------------------------------------
SIREN TONE TABLE: 
	ID- Generic Name	(SIREN STRING)									[vehicles.awc name]
	1 - Airhorn 		(SIRENS_AIRHORN)								[AIRHORN_EQD]
	2 - Wail 			(VEHICLES_HORNS_SIREN_1)						[SIREN_PA20A_WAIL]
	3 - Yelp 			(VEHICLES_HORNS_SIREN_2)						[SIREN_2]
	4 - Priority 		(VEHICLES_HORNS_POLICE_WARNING)					[POLICE_WARNING]
	5 - CustomA* 		(RESIDENT_VEHICLES_SIREN_WAIL_01)				[SIREN_WAIL_01]
	6 - CustomB* 		(RESIDENT_VEHICLES_SIREN_WAIL_02)				[SIREN_WAIL_02]
	7 - CustomC* 		(RESIDENT_VEHICLES_SIREN_WAIL_03)				[SIREN_WAIL_03]
	8 - CustomD* 		(RESIDENT_VEHICLES_SIREN_QUICK_01)				[SIREN_QUICK_01]
	9 - CustomE* 		(RESIDENT_VEHICLES_SIREN_QUICK_02)				[SIREN_QUICK_02]
	10 - CustomF* 		(RESIDENT_VEHICLES_SIREN_QUICK_03)				[SIREN_QUICK_03]
	11 - Powercall 		(VEHICLES_HORNS_AMBULANCE_WARNING)				[AMBULANCE_WARNING]
	12 - FireHorn	 	(VEHICLES_HORNS_FIRETRUCK_WARNING)				[FIRE_TRUCK_HORN]
	13 - Firesiren 		(RESIDENT_VEHICLES_SIREN_FIRETRUCK_WAIL_01)		[SIREN_FIRETRUCK_WAIL_01]
	14 - Firesiren2 	(RESIDENT_VEHICLES_SIREN_FIRETRUCK_QUICK_01)	[SIREN_FIRETRUCK_QUICK_01]
]]

RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_LSPD_NEW', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_LSSD_NEW', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_BCSO_NEW', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_SAHP_NEW', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_FIB_NEW', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_LSFD_NEW', false)
RequestScriptAudioBank('DLC_SERVERSIDEAUDIO\\OISS_SSA_VEHAUD_BCFD_NEW', false)
RequestScriptAudioBank("DLC_WMSIRENS\\SIRENPACK_ONE", false)

SIRENS = {
--[[1]]   { Name = 'Airhorn',       String = 'SIRENS_AIRHORN',                              Ref = 0 },
--[[2]]   { Name = 'Wail',          String = 'VEHICLES_HORNS_SIREN_1',                      Ref = 0 },
--[[3]]   { Name = 'Yelp',          String = 'VEHICLES_HORNS_SIREN_2',                      Ref = 0 },
--[[4]]   { Name = 'Priority',      String = 'VEHICLES_HORNS_POLICE_WARNING',               Ref = 0 },
--[[5]]   { Name = 'CustomA',  	    String = 'RESIDENT_VEHICLES_SIREN_WAIL_01',             Ref = 0 },
--[[6]]   { Name = 'CustomB',       String = 'RESIDENT_VEHICLES_SIREN_WAIL_02',             Ref = 0 },
--[[7]]   { Name = 'CustomA',       String = 'RESIDENT_VEHICLES_SIREN_WAIL_03',             Ref = 0 },
--[[8]]   { Name = 'CustomA',       String = 'RESIDENT_VEHICLES_SIREN_QUICK_01',            Ref = 0 },
--[[9]]   { Name = 'CustomA',       String = 'RESIDENT_VEHICLES_SIREN_QUICK_02',            Ref = 0 },
--[[10]]  { Name = 'CustomA',       String = 'RESIDENT_VEHICLES_SIREN_QUICK_03',            Ref = 0 },
--[[11]]  { Name = 'CustomA',       String = 'VEHICLES_HORNS_AMBULANCE_WARNING',            Ref = 0 },
--[[12]]  { Name = 'FireHorn',      String = 'VEHICLES_HORNS_FIRETRUCK_WARNING',            Ref = 0 },
--[[13]]  { Name = 'Fire Yelp',     String = 'RESIDENT_VEHICLES_SIREN_FIRETRUCK_WAIL_01',   Ref = 0 },
--[[14]]  { Name = 'Fire Yelp',     String = 'RESIDENT_VEHICLES_SIREN_FIRETRUCK_QUICK_01',  Ref = 0 },
-- START OF SAS --
--[[15]]  { Name = '295-HORN',         String = 'OISS_SSA_VEHAUD_LSPD_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET'},--horn
--[[16]]  { Name = '295-WAIL',         String = 'OISS_SSA_VEHAUD_LSPD_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET'},
--[[17]]  { Name = '295-YELP',         String = 'OISS_SSA_VEHAUD_LSPD_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET'},
--[[18]]  { Name = '295-PIERCER',      String = 'OISS_SSA_VEHAUD_LSPD_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET'},
--[[19]]  { Name = '295-SWEEP',        String = 'OISS_SSA_VEHAUD_LSPD_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET'},
--[[20]]  { Name = '295-HETRO',        String = 'OISS_SSA_VEHAUD_LSPD_NEW_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_LSPD_NEW_SOUNDSET',   Option = 3},
--[[21]]  { Name = 'FS-HORN',          String = 'OISS_SSA_VEHAUD_LSSD_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_LSSD_NEW_SOUNDSET'},--horn
--[[22]]  { Name = 'FS-WAIL',          String = 'OISS_SSA_VEHAUD_LSSD_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_LSSD_NEW_SOUNDSET'},
--[[23]]  { Name = 'FS-YELP',          String = 'OISS_SSA_VEHAUD_LSSD_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_LSSD_NEW_SOUNDSET'},
--[[24]]  { Name = 'FS-PRIORITY',      String = 'OISS_SSA_VEHAUD_LSSD_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_LSSD_NEW_SOUNDSET'},
--[[25]]  { Name = 'FS-WAIL (RBLR)',   String = 'OISS_SSA_VEHAUD_LSSD_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_LSSD_NEW_SOUNDSET',   Option = 3},
--[[26]]  { Name = 'FS-YELP (RBLR)',   String = 'OISS_SSA_VEHAUD_LSSD_NEW_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_LSSD_NEW_SOUNDSET'},
--[[27]]  { Name = 'TMD-HORN',         String = 'OISS_SSA_VEHAUD_BCSO_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_BCSO_NEW_SOUNDSET'}, --horn
--[[28]]  { Name = 'TMD-WAIL',         String = 'OISS_SSA_VEHAUD_BCSO_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_BCSO_NEW_SOUNDSET'},
--[[29]]  { Name = 'TMD-YELP',         String = 'OISS_SSA_VEHAUD_BCSO_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_BCSO_NEW_SOUNDSET'},
--[[30]]  { Name = 'TMD-HETRO',        String = 'OISS_SSA_VEHAUD_BCSO_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_BCSO_NEW_SOUNDSET'},
--[[31]]  { Name = 'TMD-SWEEP',        String = 'OISS_SSA_VEHAUD_BCSO_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_BCSO_NEW_SOUNDSET'},
--[[32]]  { Name = 'TMD-ULTRA HI-LO',  String = 'OISS_SSA_VEHAUD_BCSO_NEW_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_BCSO_NEW_SOUNDSET',   Option = 3},
--[[33]]  { Name = 'MCB-HORN',         String = 'OISS_SSA_VEHAUD_SAHP_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET'}, --horn
--[[34]]  { Name = 'MCB-WAIL',         String = 'OISS_SSA_VEHAUD_SAHP_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET'},
--[[35]]  { Name = 'MCB-YELP',         String = 'OISS_SSA_VEHAUD_SAHP_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET'},--ambulance
--[[36]]  { Name = 'MCB-HYPER-YELP',   String = 'OISS_SSA_VEHAUD_SAHP_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET'}, --ambulance
--[[37]]  { Name = 'MCB-SWEEP3',       String = 'OISS_SSA_VEHAUD_SAHP_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET'}, --ambulance
--[[38]]  { Name = 'MCB-HYPERLO',      String = 'OISS_SSA_VEHAUD_SAHP_NEW_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_SAHP_NEW_SOUNDSET',   Option = 3}, --ambulance
--[[39]]  { Name = 'CGOLD-HORN',       String = 'OISS_SSA_VEHAUD_FIB_NEW_HORN',              Ref = 'OISS_SSA_VEHAUD_FIB_NEW_SOUNDSET'},  --horn
--[[40]]  { Name = 'CGOLD-WAIL',       String = 'OISS_SSA_VEHAUD_FIB_NEW_SIREN_ADAM',        Ref = 'OISS_SSA_VEHAUD_FIB_NEW_SOUNDSET'},
--[[41]]  { Name = 'CGOLD-YELP',       String = 'OISS_SSA_VEHAUD_FIB_NEW_SIREN_BOY',         Ref = 'OISS_SSA_VEHAUD_FIB_NEW_SOUNDSET'},
--[[42]]  { Name = 'CGOLD-PRIORITY',   String = 'OISS_SSA_VEHAUD_FIB_NEW_SIREN_CHARLES',     Ref = 'OISS_SSA_VEHAUD_FIB_NEW_SOUNDSET'},
--[[43]]  { Name = 'CGOLD-SWEEP',      String = 'OISS_SSA_VEHAUD_FIB_NEW_SIREN_DAVID',       Ref = 'OISS_SSA_VEHAUD_FIB_NEW_SOUNDSET'},  --ambu may
--[[44]]  { Name = 'CGOLD-SWEEP3',     String = 'OISS_SSA_VEHAUD_FIB_NEW_SIREN_EDWARD',      Ref = 'OISS_SSA_VEHAUD_FIB_NEW_SOUNDSET'},  -- ambu may
--[[45]]  { Name = 'FIRE HORN',        String = 'OISS_SSA_VEHAUD_LSFD_NEW_HORN',             Ref = 'OISS_SSA_VEHAUD_LSFD_NEW_SOUNDSET'}, ----ambu horn
--[[46]]  { Name = 'POWERCALL',        String = 'OISS_SSA_VEHAUD_LSFD_NEW_SIREN_ADAM',       Ref = 'OISS_SSA_VEHAUD_LSFD_NEW_SOUNDSET'}, --ambu  
--[[47]]  { Name = 'Q-COAST',          String = 'OISS_SSA_VEHAUD_LSFD_NEW_SIREN_BOY',        Ref = 'OISS_SSA_VEHAUD_LSFD_NEW_SOUNDSET'}, -- ambu Q 
--[[48]]  { Name = 'Q-HIGH',           String = 'OISS_SSA_VEHAUD_LSFD_NEW_SIREN_CHARLES',    Ref = 'OISS_SSA_VEHAUD_LSFD_NEW_SOUNDSET'}, -- ambu Q 
--[[49]]  { Name = 'Q-MID',            String = 'OISS_SSA_VEHAUD_BCFD_NEW_SIREN_DAVID',      Ref = 'OISS_SSA_VEHAUD_BCFD_NEW_SOUNDSET'}, -- ambu Q 
--[[50]]  { Name = 'Q-MID2',           String = 'OISS_SSA_VEHAUD_BCFD_NEW_SIREN_EDWARD',     Ref = 'OISS_SSA_VEHAUD_BCFD_NEW_SOUNDSET'}, -- ambu Q
-- START OF WM-SERVERSIRENS --
--[[51]]  { Name = "Example Tone", 	String = "SIREN_ALPHA", 	Ref = "DLC_WMSIRENS_SOUNDSET" }, --51
--[[52]]  { Name = "Siren Bravo", 	String = "SIREN_BRAVO", 	Ref = "DLC_WMSIRENS_SOUNDSET" }, --52
--[[53]]  { Name = "Custom C", 	        String = "SIREN_CHARLIE", 	Ref = "DLC_WMSIRENS_SOUNDSET" }, --53
--[[54]]  { Name = "Yelpy", 	        String = "SIREN_DELTA", 	Ref = "DLC_WMSIRENS_SOUNDSET" }, --54 -Ambulance
--[[55]]  { Name = "Priority", 	        String = "SIREN_ECHO", 	        Ref = "DLC_WMSIRENS_SOUNDSET" }, --55 --Ambulance
--[[56]]  { Name = "Siren 3", 	        String = "SIREN_FOXTROT", 	Ref = "DLC_WMSIRENS_SOUNDSET" }, --56
--[[57]]  { Name = "Yelp", 	        String = "SIREN_GOLF", 	        Ref = "DLC_WMSIRENS_SOUNDSET" }, --57
--[[58]]  { Name = "Custom H", 	        String = "SIREN_HOTEL", 	Ref = "DLC_WMSIRENS_SOUNDSET" }, --58

}

--ASSIGN SIRENS TO VEHICLES
SIREN_ASSIGNMENTS = {
	--['<gameName>'] = {tones},
	['ambulance1'] = { 45, 55, 54, 46, 43, 44},
	['AMBULAN'] = { 33, 50, 49, 48, 47, 46},
	['SHERIFF'] = { 27, 38, 37, 36, 35, 34},
	['SHERIFF2'] = { 45, 38, 46, 43, 33, 34},
	['emskiastinger'] = { 39, 38, 46, 43, 33, 34},
	['FIRETRUK'] = { 12, 13, 14, 11 },
	['sh4'] = { 1, 2, 3, 4 },
	['11cvpiv'] = { 45, 57, 56, 53, 52, 51, 18, 17, 19},
	['13capricevs'] = { 39, 42, 41, 40, 34, 31, 32, 22},
	['13fpiuvs'] = { 33, 32, 31, 30, 29, 28, 24, 22, 51},
	['14chargervs'] = { 15, 26, 25, 24, 23, 22, 29, 56, 31},
	['16fpiuvs'] = { 27, 16, 17, 18, 19, 20, 22, 57, 56},
	['valor15rb'] = { 45, 22, 57, 56, 32, 29, 34, 53, 57},
	['18chargervs'] = { 21, 56, 42, 31, 41, 29, 34, 16, 17},
	['F150'] = { 45, 51, 57, 30, 23, 52, 53, 40, 18},
	['18taurusvs'] = { 15, 32, 40, 25, 26, 24, 23, 42, 57},
	['18tahoevs'] = { 21, 30, 11, 56, 12, 53, 42, 32, 22 },
	['valor8rb'] = { 27, 41, 16, 13, 58, 20, 23, 31, 24 },
	['Durango'] = { 27, 20, 31, 12, 41, 52, 16, 57, 26 },
	['valor15f150'] = { 33, 32, 17, 40, 19, 51, 25, 58, 20 },
	['valor19silv'] = { 33, 25, 40, 13, 32, 51, 19, 17, 24 },
	['valor20ram'] = { 33, 19, 28, 41, 54, 44, 25, 20, 11 },
	['valorf250'] = { 45, 58, 26, 28, 13, 16, 19, 20, 41 },
	['valorgmc'] = { 45, 18, 52, 12, 20, 23, 26, 11, 30 },
	['valorram'] = { 45, 41, 58, 26, 23, 44, 13, 20, 25 },
	['22f550cesu'] = { 45, 41, 54, 18, 31, 24, 19, 12, 30 },
	['Code3Bike2'] = { 39, 57, 17, 22, 54, 36, 28, 24, 11 },
	['Code3Bike1'] = { 15, 41, 23, 52, 24, 18, 58, 13, 31 },
	['valorharley'] = { 39, 56, 23, 20, 25, 44, 30, 28, 17 },
	['RIOT'] = { 45, 51, 58, 19, 44, 24, 22, 25, 11 },

	-- ['DEFAULT'] = { 1, 2, 3, 4 },
	-- ['FIRETRUK'] = { 12, 13, 14, 11 },
	--['AMBULAN'] = { 1, 2, 3, 4, 11 },
	-- ['LGUARD'] = { 1, 2, 3, 4, 11 },

}