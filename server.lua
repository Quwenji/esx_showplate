-- server.lua

ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx_showplate:showPlate')
AddEventHandler('esx_showplate:showPlate', function(plate)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then
        print('[esx_showplate] Fehler: xPlayer ist nil')
        return
    end

    if not plate or plate == '' then
        print('[esx_showplate] Fehler: plate ist nil oder leer')
        return
    end

    print('[esx_showplate] Spieler-Identifier:', xPlayer.getIdentifier())
    print('[esx_showplate] Fahrzeug-Kennzeichen:', plate)

    -- Entferne Leerzeichen und konvertiere in Großbuchstaben
    local cleanedPlate = plate:match("^%s*(.-)%s*$"):upper()

    MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE TRIM(UPPER(plate)) = @plate', {
        ['@plate'] = cleanedPlate
    }, function(result)
        if result[1] then
            local owner = result[1].owner
            print('[esx_showplate] Datenbank-Identifier:', owner)

            if owner == xPlayer.getIdentifier() then
                print('[esx_showplate] Spieler ist der Besitzer des Fahrzeugs')
                xPlayer.showNotification('Dein Kennzeichen: ' .. plate)
            else
                print('[esx_showplate] Spieler ist nicht der Besitzer des Fahrzeugs')
                xPlayer.showNotification('Du bist nicht der Besitzer dieses Fahrzeugs.')
            end
        else
            print('[esx_showplate] Fahrzeug nicht in der Datenbank gefunden')
            xPlayer.showNotification('Fahrzeug nicht in der Datenbank gefunden.')
        end
    end)
end)
