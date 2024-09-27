-- config.lua

Config = {}

-- Interaktionsdistanz
Config.InteractionDistance = 2.5

-- Icon für die ox_target Interaktion
Config.InteractionIcon = 'fa-solid fa-car'

-- Label für die ox_target Interaktion
Config.InteractionLabel = 'Kennzeichen anzeigen'

-- Nachricht, wenn der Spieler der Besitzer ist
Config.OwnerMessage = 'Dein Kennzeichen: '

-- Nachricht, wenn der Spieler nicht der Besitzer ist
Config.NotOwnerMessage = 'Du bist nicht der Besitzer dieses Fahrzeugs.'

-- Nachricht, wenn das Fahrzeug nicht in der Datenbank gefunden wurde
Config.VehicleNotFoundMessage = 'Fahrzeug nicht in der Datenbank gefunden.'

-- Soll die Besitzüberprüfung aktiviert sein?
Config.EnableOwnershipCheck = true

-- Soll Debugging aktiviert sein?
Config.EnableDebugging = false
