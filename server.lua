CreateThread(function()
    local resourceName = GetCurrentResourceName()
    if resourceName ~= "ammo_sync_jaffar" then
        print("^1[ammo-sync] Fel resursnamn! Byt tillbaka till 'ammo_sync_jaffar'^0")
        StopResource(resourceName)
    end
end)

RegisterNetEvent('ammoSync:updateAmmo', function(weapon, ammo)
    local src = source
    local player = exports.qbx_core:GetPlayer(src)

    if not player then return end

    local weapons = exports.ox_inventory:GetInventoryItems(src, 'weapon')

    for _, v in pairs(weapons) do
        if joaat(v.name) == weapon then
            exports.ox_inventory:SetMetadata(src, v.slot, { ammo = ammo })

            TriggerClientEvent('ammoSync:forceUpdate', src, weapon, ammo)
            break
        end
    end
end)
