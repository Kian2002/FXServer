RegisterCommand("givewp", function(source, args, rawCommand)
    local weapon = args[1]
    local ammo = args[2]
    local ped = GetPlayerPed(-1)
    GiveWeaponToPed(ped, GetHashKey(weapon), 512, false, true)
end, false)

RegisterCommand("giveammo", function(source, args, rawCommand)
    local ammoCount = args[1]
    local ammoType = args[2]
    local ped = GetPlayerPed(-1)
    AddAmmoToPedByType(ped, GetHashKey(ammoType), ammoCount)
end, false)