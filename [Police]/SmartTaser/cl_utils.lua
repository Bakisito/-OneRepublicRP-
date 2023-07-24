function alert(msg) 
    -- SetNotificationTextEntry("STRING")
    -- AddTextComponentString(msg)
    -- DrawNotification(true, false)
    QBCore.Functions.Notify(msg, "info")

end

function safetyToggled(newStatus)
    
end