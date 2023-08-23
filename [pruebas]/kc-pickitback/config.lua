Config                              = Config or {}

-- Base
Config.PickUpDistance               = 1.8           -- Distance for the player to be able to pick up an object (The default value is 1.8)
Config.AutoDelete                   = 600           -- Time in seconds before a dropped prop is automatically deleted (The default value is 600 aka 10 minutes)
Config.PreventIfAlreadyEquipped     = true          -- Prevent players from picking up hats/glasses if they already have one on
Config.PreventItemPickupByGender    = true          -- Prevent players from picking up items if their character's gender does not match the item's designated gender (This is a short-term solution to avoid mismatch when picking up hats/glasses due to the game having different IDs per gender)
Config.SendToAllPlayers             = false         -- Should the event be sent to all players or only 'active' physical players known to the client? (I recommend setting this to false if you have a 30+ player server, but it may result in worse sync for far away players)

-- Target
Config.TargetType                   = 'qb-target'           -- The type of the target script you're using. Work with ox_target/qb-target/qtarget, even tho ox_target is recommended
Config.TargetName                   = 'qb_target'           -- The name of the target script you're using. It should be the same as above if you haven't modified anything special about your target script
Config.Icon                         = 'fa-solid fa-hand'    -- The target icon from font awesome (https://fontawesome.com/icons)

-- Misc
Config.Language						= 'en'		-- Currently Available: fr, en
Config.Debug        				= false   	-- If you think something is not working properly, you can set 'Config.Debug' to true. It will then print a lot of debug information in your console or above radar
Config.UpdateChecker                = true     -- Set to false if you don't want to check for resource update on start (No need to change this if you're using fivem-checker)
Config.ChangeLog					= true		-- Set to false if you don't want to display the changelog if new version is find (No need to change this if you're using fivem-checker)