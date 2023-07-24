DiscordWebhook = "https://discord.com/api/webhooks/1130676383765516378/j5ClchsBYLVw4Cep4JFRabTuBrrbHPA4jRBnzu6B5NPxvNVL04flogjgD7oXuyWpR6_z"

function HasPermission(src) 
    local DiscordAPI = Config.EnableDiscordAPI
    if DiscordAPI then 
        local discordMemberRoles = exports.night_discordapi:GetDiscordMemberRoles(src)
        for k, v in pairs(Config.DiscordRolesWithPermission) do
            for key, val in pairs(discordMemberRoles) do
                if v == val then
                    return true
                end
            end
        end
        return false
    else -- Edit the below to your permission check likings.
       -- return true

        --=========== ACE PERMS EXAMPLE: ===========-- How to use these Ace perms? -> https://docs.ea-rp.com/resources/acePerms/
        
        if IsPlayerAceAllowed(src, "Admin") or IsPlayerAceAllowed(src, "administrator") or IsPlayerAceAllowed(src, "tester") then -- You can remove roles if you don't want them to have the permission.
            return true 
        else 
            return false 
        end
    end
end

function SendServerMessage(targetS, msgType, r, g, b, text) -- Edit this to your liking, just giving an example.
    if Config.NativeServerMessages then
        TriggerClientEvent("chatMessage", targetS, msgType, {r,g,b}, text)
    else
        -- do your thing here in regards to server notifications.
    end
end

function DiscordNotification(pName)
    local embed = {
        {
            ["fields"] = {
                {
                    ["name"] = Config.DiscordNameTitle,
                    ["value"] = tostring(pName),
                    ["inline"] = true
                },
                {
                    ["name"] = Config.DiscordAlertTitle,
                    ["value"] = ""..Config.DiscordMessageText.."",
                    ["inline"] = true
                }
            },
            ["color"] = 16767002,
            ["title"] = "**"..Config.DiscordMessageTitle.."**",
            ["description"] = ""..Config.DiscordMessageDescription.."",
            ["footer"] = {
                ["text"] = ""..Config.DiscordFooterText.." "..os.date("%Y").." | "..os.date("%d-%m-%Y at %H:%M:%S"),
                ["icon_url"] = Config.DiscordWebhookFooterImage
            },
            ["thumbnail"] = {
                ["url"] = Config.DiscordWebhookImage,
            }
        }
    }
    PerformHttpRequest(DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = Config.DiscordWebhookName, embeds = embed}), { ['Content-Type'] = 'application/json' })
end