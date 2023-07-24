Config = {}

--If you use esx enable this
Config.UseESX = false

--If you use qbcore enable this
Config.UseQBUS = true

--Whitelisted Jobs To Use The Pressure Washer
Config.JobNames = {
    "mechanic1",
    "washer2"
}

--This is a whitelist for the pressure washer (Standalone Only)
Config.UseWhitelist = false
Config.Identifiers = {
    "steam:11000012430xfa",
    "license:1123d12313"
}

--The Pressure Pump Use Price
Config.PumpUsePrice = 75

--A Break Fee If the Pump Hose Is Cut
Config.PumpBreakFee = 150