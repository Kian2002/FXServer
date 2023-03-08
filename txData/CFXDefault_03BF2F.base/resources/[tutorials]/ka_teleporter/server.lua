RegisterNetEvent("ka_teleporter:goto", function(targetId)
    local playerId = source
    local playerPed = GetPlayerPed(playerId)

    local targetPed = GetPlayerPed(targetId)

    if not targetPed then
        TriggerClientEvent("chat:addMessage", playerId, {
            color = {255, 0, 0},
            multiline = true,
            args = {"[ERROR]", "Player not found."}
        })

        return
    end

    local targetCoords = GetEntityCoords(targetPed)

    SetEntityCoords(playerPed, targetCoords)

end)

RegisterNetEvent("ka_teleporter:bring", function(targetId)
    local playerId = source
    local playerPed = GetPlayerPed(playerId)
    local playerCoords = GetEntityCoords(playerPed)

    local targetPed = GetPlayerPed(targetId)

    if not targetPed then
        TriggerClientEvent("chat:addMessage", playerId, {
            color = {255, 0, 0},
            multiline = true,
            args = {"[ERROR]", "Player not found."}
        })

        return
    end

    SetEntityCoords(targetPed, playerCoords)
end)