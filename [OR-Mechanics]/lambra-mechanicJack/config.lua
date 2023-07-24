Config = {}
-----------------------------------------------------------------------------------------------------------
--[[Hours to let available this feature]]
Config.MinHour = 22
Config.MaxHour = 4
-----------------------------------------------------------------------------------------------------------
Config.allowedJobs = {--Players with that job are not restricted with the clocking above
"mechanic1","mechanic2","mechanic3","mechanic4","mechanic5"
}

Config.onlyOwnedVehicles = true -- This will restrict the Jack to be only used in player owned vehicles

Config.ItemsNames = {--You gotta set these items names according to your shared
    carjack = "car_jack",
    brick = "brick",
    wheel = "carwheel",
    flatwheel = "carwheelflat"
}

Config.Keys = {
    firstInteract = 38, --E
    secInteract = 47 --G
}

Config.Times = {
    ["timeUnscrewWheels"] = 8000 --time in ms
}


Locales = {
    ["notInTime"] = "You can only do this at: ",
    ["placeCarJack"] = "Press ~g~G~w~ to place the carjack",
    ["interactCarJackHigh"] = "Press ~g~E~w~ to Raise the vehicle / Press ~g~G~w~ to pickup the carjack",
    ["interactCarJackLow"] = "Press ~g~G~w~ to Lower the vehicle",
    ["interactCarJackBoth"] = "Press ~g~E~w~ to Raise the vehicle / Press ~g~G~w~ to Lower",
    ["takeWheel"] = "Press ~g~E~w~ to unscrew the wheel",
    ["unscrewingWheel"] = "Unscrewing the wheel",
    ["needBrick"] = "You cant lower it, there is a wheel missing... Put a brick at least",
    ["notUsedCarJack"] = "You havent used a car jack",
    ["noVehicleNearby"] = "You dont have any vehicle close to you",
    ["settingWheel"] = "Screwing the wheel",
    ["notOwnedVeh"] = "You can only jack owned player vehicles"
}