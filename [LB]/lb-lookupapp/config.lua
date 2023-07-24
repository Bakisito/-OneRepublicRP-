Config = {}

Config.Framework = "qb" -- "esx" or "qb"
Config.Locale = "en"

Config.VisibleInformation = {
    -- PERSON
    Job = true,
    JobGrade = true,
    Gender = true,
    Age = true,
    
    -- VEHICLE
    Model = true,
    Color = true,
    Owner = true,

    -- Both
    PhoneNumber = true,
}

Config.HiddenPersons = {
    -- "identifier"
}

Config.HiddenVehicles = {
    -- "ABC 123",
}
