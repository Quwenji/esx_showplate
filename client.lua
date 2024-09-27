-- client.lua

ESX = exports['es_extended']:getSharedObject()

exports['ox_target']:addGlobalVehicle({
    {
        name = 'get_plate',
        icon = 'fa-solid fa-car',
        label = 'Kennzeichen anzeigen',
        distance = 2.5,
        onSelect = function(data)
            local vehicle = data.entity
            local plate = GetVehicleNumberPlateText(vehicle)

            -- Sende das Event an den Server mit dem Kennzeichen
            TriggerServerEvent('esx_showplate:showPlate', plate)
        end
    }
})
