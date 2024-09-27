-- server.lua

ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx_showplate:showPlate')
AddEventHandler('esx_showplate:showPlate', function(plate)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then
        if Config.EnableDebugging then
            print('[esx_showplate] Fehler: xPlayer ist nil')
        end
        return
    end

    if not plate or plate == '' then
        if Config.EnableDebugging then
            print('[esx_showplate] Fehler: plate ist nil oder leer')
        end
        return
    end

    -- Optionales Debugging
    if Config.EnableDebugging then
        print('[esx_showplate] Spieler-Identifier:', xPlayer.getIdentifier())
        print('[esx_showplate] Fahrzeug-Kennzeichen:', plate)
    end

    -- Entferne Leerzeichen und konvertiere in Großbuchstaben
    local cleanedPlate = plate:match("^%s*(.-)%s*$"):upper()

    if Config.EnableOwnershipCheck then
        -- Überprüfe den Fahrzeugbesitz
        MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE TRIM(UPPER(plate)) = @plate', {
            ['@plate'] = cleanedPlate
        }, function(result)
            if result[1] then
                local owner = result[1].owner

                if Config.EnableDebugging then
                    print('[esx_showplate] Datenbank-Identifier:', owner)
                end

                if owner == xPlayer.getIdentifier() then
                    if Config.EnableDebugging then
                        print('[esx_showplate] Spieler ist der Besitzer des Fahrzeugs')
                    end
                    xPlayer.showNotification(Config.OwnerMessage .. plate)
                else
                    if Config.EnableDebugging then
                        print('[esx_showplate] Spieler ist nicht der Besitzer des Fahrzeugs')
                    end
                    xPlayer.showNotification(Config.NotOwnerMessage)
                end
            else
                if Config.EnableDebugging then
                    print('[esx_showplate] Fahrzeug nicht in der Datenbank gefunden')
                end
                xPlayer.showNotification(Config.VehicleNotFoundMessage)
            end
        end)
    else
        -- Besitzüberprüfung deaktiviert, zeige das Kennzeichen direkt an
        xPlayer.showNotification(Config.OwnerMessage .. plate)
    end
end)
