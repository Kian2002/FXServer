RegisterCommand("car", function(source, args)

    local vehicleName = args[1] or "adder"

    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent("chat:addMessage", {args = {"^1SYSTEM", "Invalid vehicle model."}})
        return
    end

    RequestModel(vehicleName)

    while not HasModelLoaded(vehicleName) do
       Wait(10)
    end

    local heading = GetEntityHeading(PlayerPedId())
    local coords = GetEntityCoords(PlayerPedId())

    local vehicle =
	CreateVehicle(
		GetHashKey(vehicleName),
        coords,
		heading, 
		true, 
		false
	)

    SetPedIntoVehicle(PlayerPedId(), vehicle, -1)

    SetModelAsNoLongerNeeded(vehicleName)
end)

RegisterCommand("del", function(source, args)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    DeleteEntity(vehicle)
end)

RegisterCommand("fix", function(source, args)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleFixed(vehicle)
end)

RegisterCommand("clean", function(source, args)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleDirtLevel(vehicle, 0)
end)