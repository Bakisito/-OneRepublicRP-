
Bridge.FetchItems = function(src)
    dbg.debug('Bridge.FetchItems - is not defined, running standalone mode.')
    return false
end

Bridge.GetItem = function(serverId, itemName, metadata)
    dbg.debug('Bridge.GetItem - is not defined, running standalone mode.')
    return 0
end

Bridge.AddItem = function(serverId, itemName, amount, metadata, slot)
    dbg.debug('Bridge.AddItem - is not defined, running standalone mode.')
    return true
end

Bridge.RemoveItem = function(serverId, itemName, amount, metadata, slot)
    dbg.debug('Bridge.RemoveItem - is not defined, running standalone mode.')
    return true
end

Bridge.TransferCreditToMoney = function(serverId, charid)
    if not Prison.Release.TransferCreditsFromAccount then return end

    local account = GetPrisonerAccount(charid)

    if account then
        local prisonerCredits = account.balance

        if prisonerCredits > 0 then
            cfxSetState(serverId, 'PrisonAccount', nil)
        end
    end
end

Bridge.GetInventoryItems = function(serverId)
    dbg.debug('Bridge.GetInventoryItems - is not defined, running standalone mode.')
    return {}
end

Bridge.ReturnPrisonerItems = function(serverId, charId, returnType)
    if not serverId then return end
    if not charId then return end

    local state = false

    if Prison.Release.ReturnItemsOnRelease and returnType == 'release' then
        state = Bridge.FetchItems(serverId)
    elseif not Prison.Release.ReturnItemsOnRelease and returnType == 'npc' then
        state = Bridge.FetchItems(serverId)
    end

    if not Prison.Release.ReturnItemsOnRelease and returnType == 'release' then
        Bridge.Notify(serverId, {
            title = l('WARDEN_TITLE'),
            description = l('PRISONER_RELEASE_ITEMS_AT_NPC'),
            position = 'top',
            subtitle = l('LOBBY_MENU_TITLE'),
            lenght = 6000,
            style = {
                backgroundColor = '#141517',
                color = '#909296'
            },
        })
    end

    return state
end

Bridge.CreateStashAndDefineItems = function(targetSID, charId)
    local stash = db.CreateStashForPrisoner(charId)

    if stash then
        Bridge.TakePrisonerItems(targetSID, charId)
    end
end

Bridge.TakePrisonerItems = function(serverId, charId)
    if not Prison.Release.StashItems then return end
    if not serverId then return end
    dbg.debug('Bridge.TakePrisonerItems - is not defined, running standalone')
end