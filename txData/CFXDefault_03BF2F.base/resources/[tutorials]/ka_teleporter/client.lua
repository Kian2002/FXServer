RegisterCommand("goto", function(_, args)
    local targetId = args[1]

    if not targetId then
        TriggerEvent("chat:addMessage", {
            color = {255, 0, 0},
            multiline = true,
            args = {"[ERROR]", "Please specify a player ID."}
        })

        return
    end

    TriggerServerEvent("ka_teleporter:goto", targetId)
end)

RegisterCommand("bring", function(_, args)
    local targetId = args[1]

    if not targetId then
        TriggerEvent("chat:addMessage", {
            color = {255, 0, 0},
            multiline = true,
            args = {"[ERROR]", "Please specify a player ID."}
        })

        return
    end

    TriggerServerEvent("ka_teleporter:bring", targetId)
end)

RegisterCommand("tp", function()
	local waypointBlip = GetFirstBlipInfoId(GetWaypointBlipEnumId())
	local blipPos = GetBlipInfoIdCoord(waypointBlip) -- GetGpsWaypointRouteEnd(false, 0, 0)

	local z = GetHeightmapTopZForPosition(blipPos.x, blipPos.y)
	local _, gz = GetGroundZFor_3dCoord(blipPos.x, blipPos.y, z, true)

	SetEntityCoords(PlayerPedId(), blipPos.x, blipPos.y, z, true, false, false, false)
	FreezeEntityPosition(PlayerPedId(), true)

	repeat
		Citizen.Wait(50)
		_, gz = GetGroundZFor_3dCoord(blipPos.x, blipPos.y, z, true)
	until gz ~= 0

	SetEntityCoords(PlayerPedId(), blipPos.x, blipPos.y, gz, true, false, false, false)
	FreezeEntityPosition(PlayerPedId(), false)
end, false)