RegisterCommand("ped", function(source, args)
    local player = PlayerId()
    local ped = args[1]
    local b2 = true
    local resetDamage = true

    RequestModel(ped)

    while not HasModelLoaded(ped) do
        Citizen.Wait(0)
    end

    SetPlayerModel(player, ped)
    SetModelAsNoLongerNeeded(ped)
end)