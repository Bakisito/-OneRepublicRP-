local QBCore = exports['qb-core']:GetCoreObject()

for i = 1, #Config.Books do
    local bookName = Config.Books[i]
    QBCore.Functions.CreateUseableItem(bookName, function(source, item)
        TriggerClientEvent("paper:client:OpenBook", source, bookName)
    end)
end

print("PAPERSCRIPT: Loaded " .. tostring(#Config.Books) .. " Total Books!");