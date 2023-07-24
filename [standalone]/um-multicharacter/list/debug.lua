-- Simply prints a message to the console if Config.Debug is true
function Debug(msg)
    if not Config.Debug then return end
    print("[UM-DEBUG] " .. msg)
end