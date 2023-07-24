# mk_vehiclekeys
# Vehicle Keys System [OneSync-Infinity]
# Written by ManKind [https://discord.gg/39fNFepADG]

## Features ##
#   Main
-   Vehicle Keys system to allow players to start/stop vehicles
-   Uses One Sync Infinity (State Bags) to handle keys instead of old plate number or decor methods. Players will have keys for as long as the vehicle exists on the server (until its destroyed/garaged/server restart) even if they logout or disconnect from the server. As long as the vehicle is spawned they will not magically lose keys.
-   Easy to use exports to give players keys/check if they have keys from other scripts
-   Limit players access to flying vehicles (Job or license restrictions)
-   Locking/Unlocking state for vehicles controlled by the server (no desync of lock state between players)
#   Framework Independant
-   Useable on all frameworks (Setup for QB-Core / ESX-Legacy by default)
-   Setup custom framework integration inside config file
-   Setup any notify system you chose to use (qb-core/esx/ox_lib/t-notify/ect)
-   All script text is inside Config so you can change to any language you like
#   Optimized
-   Script runs at 0.0 idle and between 0.0-0.01 while you have a weapon equipped
#   Keys as Items
-   Setup an item with metadata to be used for player owned vehicles. (Having the item allowing driving, locking and unlocking the vehicle)
-   Keyfob management menu for purchasing additional sets of keys or reprogramming your vehicle with a new fob.
#   Hotwiring
-   Ability to hotwire vehicles (1 attempt per vehicle per player)
-   Base hotwire uses a progress bar with a chance to fail (changeable in config)
-   Ability to import any minigame for use instead of the progress bar (setup in config)
-   Police alert (setup in config)
-   Trigger custom events on successful vehicle hotwire
#   Lockpicking
-   Setup any lockpick/advanced lockpick item in config
#   Lockpicking Vehicle Doors
-   Ability to lockpick vehicle doors
-   Base lockpicking doors uses a progressbar with chance to fail and break picks (setup in config)
-   Ability to import any minigame for use instead of the progress bar (setup in config)
-   Police alert (setup in config)
#   Lockpicking Vehicle Ignitions
-   Ability to lockpick vehicle ignitions
-   Base lockpick of ignitions is [ox_lib] skillCheck mini game (hard for regular lockpick/easier with advanced)
-   Ability to import any minigame for use instead of [ox_lib] skillcheck
-   Chance to break picks on win/fail (setup in config)
-   Police alert (setup in config)
-   Trigger custom events on successful vehicle ignition lockpick
#   Carjack NPC PEDs
-   Carjack PEDs by aiming at them with a shooting type weapon (not melee)
-   All PEDs will exit the vehicle and flee. Driver will hand you the keys and run off
-   Police alert (setup in config)
#   Steal Dead NPC PEDs Keys
-   If you drag a dead NPC out of the driver seat you will take his car keys
#   Commands
-   [/givekey] - Give a set of keys to nearest player (command can be turned off or renamed in config)
-   [/removekey] [PlayerSource] - Remove a set of keys from a specific player (can be turned off or renamed in config)
-   [/engine]  - Toggle engine on/off (command can be turned off or renamed in config)
#   Keybinds
-   Toggle Vehicle Locks - default [L] keybind to lock/unlock vehicle. (Can change default in config)
-   Toggle Engine - default [MouseWheelUp] keybind to toggle engine on/off (can be disabled or default changed in config)
#   Sounds
-   Vehicle locking/unlocking plays sound for all players within a short distance
-   Can disable in config if you don't run the sound resource
#   Restrictions
-   Enable restriction checks in config to check before allowing toggling locks (check if dead/down/cuffed)
#   No Shuffle
-   Enable/Disable players automatically shuffling from passenger seat to driver seat if you don't have a script already doing it
#   NPC Vehicles
-   Enable/Disable ability for parked NPC vehicles to have a chance to be locked/unlocked instead of just being able to break the window and get inside
-   Enable/Disable ability for NPC driven vehicles to be locked/unlocked while on the roadway
#   Whitelist Vehicles
-   Any vehicle in this list will not require a set of keys to be driven and locally spawned vehicles will always be unlocked. Useful for certain vehicles like golf carts
#   Whitelist Job Vehicles
-   Define a table with a job name and a list of vehicles. Any player who sits in (or toggles vehicle locks while close) one of the vehicles in the list with that job will automatically get a set of keys to it.
    -   If using keyfobs you can disable this feature for player owned vehicles so that only fobs will allow use.
#   Engine Starting
-   Disable/Enable vehicle engine starting when the accelerater key is pressed
-   Disable/Enable vehicle engine auto starting when you get in the driver seat

# Requirements
-   One Sync Infinity
-   [ox_lib] (https://github.com/overextended/ox_lib/releases)

# Installation
-   onesync "on" (In server.cfg)
-   setup ox_lib resource - Instructions (https://overextended.github.io/docs/ox_lib/)
    - add script to resource folder
    - ensure ox_lib (server.cfg)
    - add following lines to server.cfg file
        add_ace resource.ox_lib command.add_ace allow
        add_ace resource.ox_lib command.remove_ace allow
        add_ace resource.ox_lib command.add_principal allow
        add_ace resource.ox_lib command.remove_principal allow
-   Setup exports. Edit your scripts that give vehicle keys using the following export:
    exports["mk_vehiclekeys"]:AddKey(VehicleEntity) **Client Side**
    - Note that keys are given based on the vehicles client entity id (not server entity) and not the vehicles plate number.
    exports["mk_vehiclekeys"]:AddKey(VehicleEntity, PlayerSource) **Server Side**
    - Note that keys are given based on the vehicles server entity id (not client entity) and not the vehicles plate number.
    - For other useful exports read the **#Exports** section at the bottom of this file
    **NOTE; IF USING KEYS AS ITEM YOU STILL HAVE TO SETUP THESE EXPORTS WHEN PLAYER VEHICLES ARE SPAWNED AS THE EXPORT SYNCS THE VEHICLE WITH THE CORRECT FOB ID FROM THE DATABASE**

    # QB-Core / ESX-Legacy
    -   Script is by default setup to integrate QB-Core / ESX-Legacy framework automatically. You only need to edit your preferences in config.lua
        # Dispatch Notifications (Not default QB-Core/ESX)
        -   If you use something other than the default notify system for Dispatch Alerts do the following:
            -   Inside Config.PoliceNotify set [UseCustomDispatchAlert] to true
            -   Inside Config.PoliceNotify.CustomAlertFunction() input your dispatch notification (NOTE: This code is ran client side)
                - Examples:
                    -   exports['ps-dispatch']:VehicleTheft(Vehicle) --PS-DISPATCH EXAMPLE
        # Notify System (Not default QB-Core/ESX)
        -   If you use something other than the default notification system for QBCore/ESX do the following:
            -   **Note that you will need to setup both Client and Server functions to prevent errors**
            -   Inside Config.Notify set [UseCustom] to true
            #   Client Side Notifications
            -   Inside config.Notify.CustomClientNotifyFunction() input your **CLIENT SIDE** event to trigger a notification
                - Inside this function you have access to the table [Data] which contains information the script sends from the Config.Notifications table. By default this would be Data.Message/Data.Type/Data.Duration. You can add more items to the Config.Notifications table to match your notify system if you need just DONT edit the table names as they are used by the script.
                - Example: TriggerEvent('QBCore:Notify', Data.Message, Data.Type, Data.Duration)
                - Example: exports.my_notify_script:NotifyFuntion(Data) --Send the entire table if this is how your notify script reads data
                - Example: exports.my_notify_script:NotifyFunction(Data.Message, Data.Type, Data.Duration)
            #   Server Side Notifications
            -   Inside config.Notify.CustomServerNotifyFunction() input your **SERVER SIDE** event to trigger a notification
                - Inside this function you have access to the varible [PlayerSource] which is determined by the script and presented here. Use this variable to trigger your client notify event. This source may be another player other than yourself (example giving keys to someone else) so please use this variable instead of source
                - Inside this function you have access to the table [Data] which contains information the script sends from the Config.Notifications table. By default this would be Data.Message/Data.Type/Data.Duration. You can add more items to the Config.Notifications table to match your notify system if you need just DONT edit the table names as they are used by the script.
                - Example: TriggerClientEvent('QBCore:Notify', PlayerSource, Data.Message, Data.Type, Data.Duration)
                (NOTE: it is recommended to use a [TriggerClientEvent] for this function. If your notify system does not have one you can declare one inside config.lua)
                    - Example would be to place the following code at the end of config.lua
                        RegisterNetEvent('MyNotifyScript:SendNotification', function(Data)
                            --CODE INSIDE HERE WOULD BE THE SAME AS WHAT YOU HAVE IN YOUR CLIENT EVENT
                            Example: exports.my_notify_script:NotifyFuntion(Data) --Send the entire table if this is how your notify script reads data
                            Example: exports.my_notify_script:NotifyFunction(Data.Message, Data.Type, Data.Duration)
                        end)
                    - You would then use this event inside of [CustomServerNotifyFunction]
                        TriggerClientEvent('MyNotifyScript:SendNotification', PlayerSource, Data)
        # Aircraft Licenses & Authorization Setup
           #  Helicopter License Checks
           -   If your server has licenses for Helicopters and Planes you can configure this in config.lua
           -   Inside Config.Licenses.Helicopter set [CheckLicense] to true
           -   Inside Config.Licenses.Helicopter.CheckLicenseFunction() input your servers way of obtaining wether the player has a license or not. (This code is ran client side) (You MUST cb(true) if the player has a license or cb(false) if they do not. **Not setting up the callback properly will cause the script to hang waiting for a result of this function**)
           # Helicopter Job Authorization Checks
            -   If you would like to set certain jobs to automatically obtain keys to any Helicopter the player sit in you can configure this in config.lua. This check can be ran along side with license checks (you can use both)
            -   Inside Config.Licenses.Helicopter set [CheckJob] = true
            -   Inside Config.Licenses.Helicopter.AuthorizedJobs set the jobs you would like to be authorized. Input can be a string 'police' or a table {'police', 'ambulance', 'someotherjob'}
            -   Inside Config.Licenses.Helicopter set [UseCustomJobCheck] (false will use job checks coded by the script for QBCore/ESX. If using these frameworks there is not reason to set to true unless you are not using the base job system) (true will disregard the jobs listed in [AuthorizedJobs] and you must do your check inside the function provided [CheckJobFunction] (NOTE: for custom framework you must set this to true and use the [CheckJobFunction]))
            -   If using [UseCustomJobCheck] function place code inside the function to check if the player has an authorized job. Please note you must check for the job names inside this function, the jobs set in [AuthorizedJobs] only apply to checks done by default QBCore/ESX. cb(true) if the player has the job and cb(false) if they do not. (NOTE: **You must set your callbacks properly inside this function or the script will hang waiting for a result.**)
            # Plane License Checks
            -   Same exact steps as listed above for Helicopters; Just do the setup inside Config.Licenses.Plane
        # Keys as Items
        -   [DATABASE]
            -   Run Keyfobs.sql in your server database
        -   [QBCORE] [qb-inventory] (If using ox_inventory follow steps under ESX-LEGACY/ox_inventory as they are the same)
            -   **If using a custom inventory besides [qb-inventory] or [ox_inventory] set Config.UseCustomInventory = true inside inventory.lua and setup your functions**
            -   Add item to [qb-core/shared/items.lua]
                -   Example: 	['carkey'] 				 		 = {['name'] = 'carkey', 			  	  		['label'] = 'Vehicle Keys', 			['weight'] = 100, 		['type'] = 'item', 		['image'] = 'carkey.png', 				['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   	['description'] = 'Vehicle Key Fob'},
            -   Add metadata display to [qb-inventory/html/js/app.js]
                -   Locate [FormatItemInfo(itemData)] function and add the following statement
                    -   else if (itemData.name == "carkey") {
                        $(".item-info-title").html('<p>'+itemData.label+'</p>')
                        $(".item-info-description").html("<p><strong>Brand: </strong>" + itemData.info.brand + "</p><p><strong>Name: </strong>" + itemData.info.name + "</p><p><strong>Vehicle ID: </strong>" + itemData.info.id + "</p><p><strong>Plate: </strong>" + itemData.info.plate + "</p>");
                    }
            -   Add item image to [qb-inventory/html/images/]
                - Example is provided in [mk_vehiclekeys/itemimage/carkey.png]
        -   [ESX-LEGACY] [ox_inventory]
            -   **If using a custom inventory besides [ox_inventory] set Config.UseCustomInventory = true inside inventory.lua and setup your functions**
            -   Add the following to [ox_inventory/data/items.lua]
                -   ['carkey'] = {
                        label = 'Vehicle Keys',
                        weight = 1,
                        consume = 0,
                        stack = false,
                        close = true,
                        server = {
                            export = 'mk_vehiclekeys.usevehkey'
                        },
                    },
            -   Add image to [ox_inventory/web/images/]
                - Example is provided in [mk_vehiclekeys/itemimage/carkey.png]
        -   [Custom-Framework]
            -   Inventory that supports metadata is required for this to function
            -   Set `Config.KeysAsItem.PlayerOwned.Database.Custom = true`
                -   Configure database structure inside table
            -   Setup inventory item based on your frameworks inventory used. Refer to custom inventory setup or comments in inventory.lua
        # Other
        -   All other config options are not framework dependant and you can edit them to fit your server. Just follow the commented sections inside config.lua and enjoy!
    # Custom Framework
    -   Make the following changes inside of [config.lua] to setup a custom framework 
        -   [Config.UseCustomFramework] set to true
    -   Make the following changes inside [framework_cl.lua]
        -   [CustomFramework.PlayerLoadedEvent] set to the client event that is triggered when your player has loaded into the server (Example: QBCore:Client:OnPlayerLoaded)
        -   [CustomFramework.PlayerUnloadedEvent] set to the client event that is triggered when your player has logged off the server (Example: QBCore:Client:OnPlayerUnload)
        -   [CustomFramework.LoadClient] load your framework inside of this function. You must cb(true) when it has loaded and cb(false) if there is an error. Not setting up the callback properly will make the script not load
        -   [CustomFramework.GetIdentifier] obtain your players identifier inside this function. Must be unique to the player and not shared across characters. (Example would be citizenid or phone number) You must cb(Identifier) when it is found or cb(false) if it is not. Not calling back the identifier or using a non unique identifier will break the script.
        -   [CustomFramework.Restrictions] input code inside this function to check if the player should be restricted from certain aspects of the script (locking/unlocking vehicle/lockpicking/hotwiring/ect)
            -   **You only need to set this up if you are checking for restrictions.** If you are you must set [Config.CheckRestrictions] to true inside of [config.lua]
            -   cb(true) if the player is restricted (example: cuffed/down/dead/escorted)
            -   cb(false) if the player is not restricted
                **NOTE: Not setting this up properly will cause the script to hang waiting for a result**
        -   [CustomFramework.GetPlayerJob] input code inside this function to get the players job name
            -   cb(jobname) as a string or cb(false) if it could not be found
        -   [CustomFramework.GetVehicleInfo] input code inside this function to retreive vehicle info based on model name string
            -   return data as a table with the following keys
                -   brand (string containing brand of vehicle)
                -   name (string containing name of vehicle)
                -   If return data is false the script will use FiveM natives to get this info but will not work for imports
    -   Make the following changes inside [framework_sv.lua]
        -   [CustomFramework.LoadServer] load your framework inside of this function. You must cb(true) when it has loaded and cb(false) if there is an error. Not setting up the callback properly will make the script not load
        -   [CustomFramework.Money]
            -   [CheckBalance] input code inside this function to check a players cash/bank balance
                -   Type param has 2 string values 
                    - cash or bank
                -   return the found value converted to a number or 0
            -   [Remove] input code inside this function to remove money from a players cash/bank balance
                -   Type param has 2 string values
                    - cash or bank
                -   return true if money was removed
                -   return false if money could not be removed        
        # Dispatch Notifications
        -   Inside Config.PoliceNotify set [UseCustomDispatchAlert] to true
        -   Inside Config.PoliceNotify.CustomAlertFunction() input your dispatch notification (NOTE: This code is ran client side)
            - Examples:
                -   exports['ps-dispatch']:VehicleTheft(Vehicle) --PS-DISPATCH EXAMPLE
        # Notify System
        -   **Note that you will need to setup both Client and Server functions to prevent errors**
        -   Inside Config.Notify set [UseCustom] to true
        #   Client Side Notifications
        -   Inside config.Notify.CustomClientNotifyFunction() input your **CLIENT SIDE** event to trigger a notification
            - Inside this function you have access to the table [Data] which contains information the script sends from the Config.Notifications table. By default this would be Data.Message/Data.Type/Data.Duration. You can add more items to the Config.Notifications table to match your notify system if you need just DONT edit the table names as they are used by the script.
            - Example: TriggerEvent('QBCore:Notify', Data.Message, Data.Type, Data.Duration)
            - Example: exports.my_notify_script:NotifyFuntion(Data) --Send the entire table if this is how your notify script reads data
            - Example: exports.my_notify_script:NotifyFunction(Data.Message, Data.Type, Data.Duration)
        #   Server Side Notifications
        -   Inside config.Notify.CustomServerNotifyFunction() input your **SERVER SIDE** event to trigger a notification
            - Inside this function you have access to the varible [PlayerSource] which is determined by the script and presented here. Use this variable to trigger your client notify event. This source may be another player other than yourself (example giving keys to someone else) so please use this variable instead of source
            - Inside this function you have access to the table [Data] which contains information the script sends from the Config.Notifications table. By default this would be Data.Message/Data.Type/Data.Duration. You can add more items to the Config.Notifications table to match your notify system if you need just DONT edit the table names as they are used by the script.
            - Example: TriggerClientEvent('QBCore:Notify', PlayerSource, Data.Message, Data.Type, Data.Duration)
            (NOTE: it is recommended to use a [TriggerClientEvent] for this function. If your notify system does not have one you can declare one inside config.lua)
                - Example would be to place the following code at the end of config.lua
                    RegisterNetEvent('MyNotifyScript:SendNotification', function(Data)
                        --CODE INSIDE HERE WOULD BE THE SAME AS WHAT YOU HAVE IN YOUR CLIENT EVENT
                        Example: exports.my_notify_script:NotifyFuntion(Data) --Send the entire table if this is how your notify script reads data
                        Example: exports.my_notify_script:NotifyFunction(Data.Message, Data.Type, Data.Duration)
                    end)
                - You would then use this event inside of [CustomServerNotifyFunction]
                    TriggerClientEvent('MyNotifyScript:SendNotification', PlayerSource, Data)
        # Aircraft Licenses & Authorization Setup
           #  Helicopter License Checks
           -   If your server has licenses for Helicopters and Planes you can configure this in config.lua
           -   Inside Config.Licenses.Helicopter set [CheckLicense] to true
           -   Inside Config.Licenses.Helicopter.CheckLicenseFunction() input your servers way of obtaining wether the player has a license or not. (This code is ran client side) (You MUST cb(true) if the player has a license or cb(false) if they do not. **Not setting up the callback properly will cause the script to hang waiting for a result of this function**)
           # Helicopter Job Authorization Checks
            -   If you would like to set certain jobs to automatically obtain keys to any Helicopter the player sit in you can configure this in config.lua. This check can be ran along side with license checks (you can use both)
            -   Inside Config.Licenses.Helicopter set [UseCustomJobCheck] to true (NOTE: for custom framework you must set this to true and ignore [CheckJob] and [AuthorizedJobs] as they are only used by integrated frameworks (QBCore/ESX))
            -   Inside [UseCustomJobCheck] function place code to check if the player has an authorized job. Please note you must check for the job names inside this function, the jobs set in [AuthorizedJobs] only apply to checks done by default QBCore/ESX. cb(true) if the player has the job and cb(false) if they do not. (NOTE: **You must set your callbacks properly inside this function or the script will hang waiting for a result.**)
            # Plane License Checks
            -   Same exact steps as listed above for Helicopters; Just do the setup inside Config.Licenses.Plane
        # Other
        -   All other config options are not framework dependant and you can edit them to fit your server. Just follow the commented sections inside config.lua and enjoy!
        # Inventory
        -   **If using Keys as Items follow setup for custom inventory**

    # Custom Inventory
    -   set Config.UseCustomInventory = true inside inventory.lua
    -   setup the following functions inside [Config.Inventory] in [inventory.lua]
        -   [CreatUseableItemFunction] input **SERVER SIDED** code inside this function to register an item as usable with your framework. Note that (ItemName, TriggerEvent, Args) are available to you inside this function:
            -   ItemName = string of the item used by the script (Example: 'lockpick')
            -   TriggerEvent = the event the script needs you to call when your item is registered. You must trigger this along with Args as shown below
            -   Args = table of data sent from the script that needs to be sent with your event when the item is used
            - Once the item is registered with your framework **you must trigger the following event** when the item is used:
                **TriggerClientEvent(TriggerEvent, source, ItemName, Args)** --Note you can send ItemName as a table instead of just the name. This table will be sent to the RemoveItemFunction if you require it there for checking (slot/metadata/ect)
        -   [RemoveItemFunction] input **SERVER SIDED** code inside this function to remove an item from a players inventory.   Note that (source, Item, cb) are available to you inside this function:
            -   source = Players source that we need to remove the item from
            -   Item = the item we need to remove. Will return in the same format it was sent inside [CreateUsableItemFunction] wether that be as a string example: ('lockpick') or a table example: ({name = 'lockpick', quality = '100'})
            -   cb = callback to the script saying we could remove it or not
                NOTE: You must cb(true) if the item was removed and cb(false) if it couldn't be removed. 
                **Not setting this up properly will cause the script to hang waiting for a result.**
        -   [AddItemFunction] input **SERVER SIDED** code inside this function to add an item to the players inventory
            Note that (souce, ItemName, Info, cb) are available to you inside this function
            -   source = Player source to add item to
            -   ItemName = string of item name to be added
            -   Info = table of items metadata that needs to be set when added
            -   cb = callback to the script
                -   cb(true) means we added the item successfully
                -   cb(false) means we couldn't add the item to inventory
        -   [HasFobServer] input **SERVER SIDED** code inside this function to check players inventory for a keyfob item with the correct metadata
            -   FobId = number value of the metadata to check
            -   PlayerSource = players source to check their inventory
            -   return true if item with correct metadata is found / return false if not
            -   **Script waits for this return. If not setup properly script will hang**
        -   [HasFobClient] input **CLIENT SIDED** code inside this function to check players inventory for a keyfob item with the correct metadata
            -   FobId = number value of the metadata to check
            -   return true if item with correct metadata is found / return false if not
            -   **Script waits for this return. If not setup properly script will hang**

# Exports
-   exports["mk_vehiclekeys"]:HasKey(VehicleEntity) **Client export** to check if player has keys to specific vehicle entity
-   exports["mk_vehiclekeys"]:AddKey(VehicleEntity) **Client export** to give player a set of keys to specific vehicle entity
-   exports["mk_vehiclekeys"]:HasFlyingAuth(VehicleEntity) **Client export** to check if player is authorized to fly a helicopter/plane (setup is in config) **Use this export only to check flying vehicles (Vehicle Class 15 or 16)**
-   exports["mk_vehiclekeys]:ChangeOwner(VehicleEntity) **Client export** to change vehicle owner when selling it between players
-   exports["mk_vehiclekeys]:ToggleLocks(VehicleEntity) **Client export** to toggle locks on a vehicle the player has keys for. Must be within 7.5 distance of the vehicle (useful for targeting system)
-   exports["mk_vehiclekeys]:UnlockVehicle(VehicleEntity) **Client export** to unlock a vehicle door. No has keys check (use for job or your own custom items to unlock vehicle doors) must be within 7.5 distance of the vehicle. If not VehicleEntity is passed to the export it will check the closest vehicle to the player!
-   Example:
        local Vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if Vehicle and Vehicle > 0 then 
            if not exports["mk_vehiclekeys"]:HasKey(Vehicle) then --Will return false if player does not have a key to this vehicle
                local Class = GetVehicleClass(Vehicle)
                if Class == 15 then --Helicopter
                    if exports["mk_vehiclekeys"]:HasFlyingAuth(Vehicle) then --Will return true if player has helicopter license or flying job (setup in config)
                        exports["mk_vehiclekeys"]:AddKey(Vehicle) --Gives player a set of keys
                    end
                elseif Class == 16 then --Plane
                    if exports["mk_vehiclekeys"]:HasFlyingAuth(Vehicle) then --Will return true if player has plane license or flying job (setup in config)
                        exports["mk_vehiclekeys"]:AddKey(Vehicle) --Gives player a set of keys
                    end
                else
                    exports["mk_vehiclekeys"]:AddKey(Vehicle) --Gives player a set of keys
                end
            end
        end
-   exports["mk_vehiclekeys"]:HasKey(VehicleEntity, PlayerSource) **Server export** to check if the player has keys to a specific vehicle entity
-   exports["mk_vehiclekeys"]:AddKey(VehicleEntity, PlayerSource) **Server export** to give a player a set of keys to a specific vehicle entity
-   exports["mk_vehiclekeys]:ChangeOwner(VehicleEntity, PlayerSource) **Server export** to change vehicle owner when selling it between players
-   exports["mk_vehiclekeys]:UpdatePlate(OldPlate, NewPlate) **Server exports** to update keyfob database with new plate. Run this export if you are using a script that updates vehicle plates to keep the keyfob database updated properly.

# Developer Notes:
-   This script uses the `player loaded` event trigger for most of the script to run. If you restart the script you **must /logout (qb) or /relog (esx) first** 
-   If your server uses a vehicle parking system that is not a store/retrieve garage system there are features built into the script for your players to acquire their keys upon server restart. Simply walk up to the vehicle and press your hotkey for Toggle Locks (default L) and the script will check if the player owns that vehicle and give them keys. If you are using KeysAsItem feature the AddKey export should setup your fobs properly but if not the player simply uses the item and the script will attempt to locate that vehicle and configure it automatically if the vehicle is already spawned in.
-   State Bags
    -   Hotwiring
        -   To disable a vehicle from being hotwired by all players add the following state bag setter when the vehicle is spawned
            -   Entity(vehicle).state:set('Hotwired', 'Failed', true)
    -   Lockpicking
        -   To disable a vehicle from being lockpicked add the following state bag setter when the vehicle is spawned
        -   Entity(vehicle).state:set('LockpickDisabled', true, true)
    -   Stealing Dead NPC Driver Keys
        -   To disable a player from taking keys from a dead NPC while dragging them out of the driver seat set the following statebag on the PED when its spawned
            -   Entity(ped).state:set('MK_Disable_TakeKeys', true, true)
            -   Useful for scripts like bank truck robberies to make getting keys for the truck not as easy
    -   Carjack NPC Driver with weapon
        -   To disable a player from carjacking an NPC driver set the following statebag on the PED when its spawned
            -   Entity(ped).state:set('MK_Disable_CarJack', true, true)
            -   Useful if you have a script that spawns peds you don't want to give keys easily

# Credits
-   [Overextended] Amazing MySQL and Lib resources! (https://github.com/overextended)

# Support
-   If you need any help or have questions please reach out to me in my discord [https://discord.gg/39fNFepADG] or drop me a DM!
