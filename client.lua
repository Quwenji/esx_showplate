-- client.lua
-- test test

ESX = exports['es_extended']:getSharedObject()

exports['ox_target']:addGlobalVehicle({
    {
        name = 'get_plate',
        icon = Config.InteractionIcon,
        label = Config.InteractionLabel,
        distance = Config.InteractionDistance,
        onSelect = function(data)
            local vehicle = data.entity
            local plate = GetVehicleNumberPlateText(vehicle)

            -- Optionales Debugging
            if Config.EnableDebugging then
                print('[esx_showplate] Fahrzeug-Kennzeichen:', plate)
            end

            -- Sende das Event an den Server mit dem Kennzeichen
            TriggerServerEvent('esx_showplate:showPlate', plate)
        end
    }
})
