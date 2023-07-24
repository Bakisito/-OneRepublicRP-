if (Config.target.enabled and Config.target.system) then
    local armsModel = 'imp_prop_kq_lift_arms'

    local system = Config.target.system

    exports[system]:AddTargetModel({GetHashKey('imp_prop_kq_lift_empty')}, {
        options = {
            {
                type = "client",
                event = "kq_carlift:stop",
                icon = "fas fa-stop",
                label = L('Stop'),
                canInteract = function(entity)
                    local object = GetClosestObjectOfType(GetEntityCoords(entity), 1.0, GetHashKey(armsModel), 0, 0, 0)
                    local job = Entity(object).state.job
                    local event = Entity(object).state.event
                    return event ~= 'none' and event ~= nil and (not job or playerJob == nil or Contains(job, playerJob))
                end,
            },
            {
                type = "client",
                event = "kq_carlift:down",
                icon = "fas fa-arrow-down",
                label = L('Go down'),
                canInteract = function(entity)
                    local object = GetClosestObjectOfType(GetEntityCoords(entity), 3.0, GetHashKey(armsModel), 0, 0, 0)
                    local job = Entity(object).state.job
                    local event = Entity(object).state.event
                    return event ~= 'down' and (not job or playerJob == nil or Contains(job, playerJob))
                end,
            },
            {
                type = "client",
                event = "kq_carlift:up",
                icon = "fas fa-arrow-up",
                label = L('Go up'),
                canInteract = function(entity)
                    local object = GetClosestObjectOfType(GetEntityCoords(entity), 3.0, GetHashKey(armsModel), 0, 0, 0)
                    local job = Entity(object).state.job
                    local event = Entity(object).state.event
                    return event ~= 'up' and (not job or playerJob == nil or Contains(job, playerJob))
                end,
            },
        },
        distance = 2.0
    })
end
