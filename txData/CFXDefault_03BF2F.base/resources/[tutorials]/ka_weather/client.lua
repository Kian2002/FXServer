RegisterCommand("weather", function(source,args) 
    local weather = args[1] or "CLEAR"

    SetOverrideWeather(weather)

    TriggerEvent("chat:addMessage", {args = {"^1SYSTEM", "Weather changed."}})
end)