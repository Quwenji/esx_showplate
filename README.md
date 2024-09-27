# ESX ShowPlate Script

Ein **Open-Source** FiveM-Skript auf ESX-Basis, das es Fahrzeugbesitzern ermöglicht, das Kennzeichen ihres Fahrzeugs über das `ox_target`-System anzuzeigen. Das Skript ist frei verfügbar und kann von jedem genutzt, modifiziert und verteilt werden.

## Inhaltsverzeichnis

- [Beschreibung](#beschreibung)
- [Voraussetzungen](#voraussetzungen)
- [Installation](#installation)
- [Konfiguration](#konfiguration)
- [Nutzung](#nutzung)
- [Bekannte Probleme](#bekannte-probleme)
- [Danksagung](#danksagung)
- [Lizenz](#lizenz)

## Beschreibung

Das **ESX ShowPlate Script** erlaubt es Spielern, an ihr eigenes Fahrzeug heranzutreten und über das `ox_target`-System eine Interaktion zu nutzen, um das Kennzeichen ihres Fahrzeugs per Benachrichtigung angezeigt zu bekommen. Diese Funktion steht ausschließlich dem Fahrzeugbesitzer zur Verfügung, wodurch die Privatsphäre gewahrt und realistisches Rollenspiel gefördert wird.

**Hinweis:** Dieses Skript ist Open Source und steht unter der [MIT-Lizenz](#lizenz). Jeder darf es frei nutzen, modifizieren und verteilen.

## Voraussetzungen

- **FiveM Server** mit ESX-Framework
- **ESX Legacy** (neueste Version)
- **ox_target** ([GitHub Repository](https://github.com/overextended/ox_target))
- **oxmysql** ([GitHub Repository](https://github.com/overextended/oxmysql))
- **MySQL Datenbank**

## Installation

1. **Herunterladen des Skripts:**

   - Lade das Skript herunter und platziere es im `resources`-Verzeichnis deines Servers. Benenne den Ordner beispielsweise in `esx_showplate`.

2. **Abhängigkeiten installieren:**

   - Stelle sicher, dass die folgenden Ressourcen installiert und im `resources`-Verzeichnis vorhanden sind:
     - **ox_target**
     - **oxmysql**

3. **Ressourcen in der `server.cfg` aktivieren:**

   Füge die folgenden Zeilen zu deiner `server.cfg` hinzu, um die Ressourcen in der richtigen Reihenfolge zu starten:

   ```cfg
   ensure oxmysql
   ensure es_extended
   ensure ox_target
   ensure esx_showplate
   ```

4. **Datenbankverbindung einrichten:**

   Stelle sicher, dass deine Datenbankverbindung in der `server.cfg` korrekt konfiguriert ist. Beispiel:

   ```cfg
   set mysql_connection_string "mysql://benutzername:passwort@localhost/datenbankname?charset=utf8mb4"
   ```

   Ersetze `benutzername`, `passwort` und `datenbankname` durch deine MySQL-Zugangsdaten.

5. **Datenbank überprüfen:**

   - Stelle sicher, dass die Tabelle `owned_vehicles` existiert und die Spalten `owner` und `plate` enthält.
   - Achte darauf, dass die Kennzeichen korrekt und ohne unerwünschte Leerzeichen gespeichert werden.

## Konfiguration

Das Skript enthält eine `config.lua` Datei, in der du verschiedene Einstellungen anpassen kannst:

- **Config.InteractionDistance**: Die Distanz, in der die Interaktion verfügbar ist.
- **Config.InteractionIcon**: Das Icon, das im `ox_target`-Menü angezeigt wird.
- **Config.InteractionLabel**: Der Text der Interaktionsoption.
- **Config.OwnerMessage**: Die Nachricht, die angezeigt wird, wenn der Spieler der Besitzer ist.
- **Config.NotOwnerMessage**: Die Nachricht, die angezeigt wird, wenn der Spieler nicht der Besitzer ist.
- **Config.VehicleNotFoundMessage**: Die Nachricht, wenn das Fahrzeug nicht in der Datenbank gefunden wird.
- **Config.EnableOwnershipCheck**: Aktiviert (`true`) oder deaktiviert (`false`) die Besitzüberprüfung.
- **Config.EnableDebugging**: Aktiviert (`true`) oder deaktiviert (`false`) Debug-Ausgaben in der Konsole.

## Nutzung

1. **Im Spiel:**

   - Als Spieler näherst du dich deinem eigenen Fahrzeug.
   - Aktiviere das `ox_target`-System (in der Regel durch Drücken von `ALT` oder der entsprechenden Taste).
   - Richte das Ziel auf dein Fahrzeug.
   - Die Option **"Kennzeichen anzeigen"** sollte erscheinen.
   - Wähle die Option aus, um das Kennzeichen deines Fahrzeugs per Benachrichtigung zu erhalten.

2. **Berechtigungen:**

   - Nur der Eigentümer des Fahrzeugs kann die Option nutzen.
   - Wenn ein anderer Spieler versucht, die Option an deinem Fahrzeug zu nutzen, erhält er eine Benachrichtigung, dass er nicht der Besitzer des Fahrzeugs ist.

## Bekannte Probleme

- **Benachrichtigungen werden nicht angezeigt:**

  - Stelle sicher, dass dein Benachrichtigungssystem korrekt mit ESX verbunden ist.
  - In neueren Versionen von ESX Legacy wird `xPlayer.showNotification` verwendet. Bei Bedarf kannst du dies an dein eigenes Benachrichtigungssystem anpassen.

- **Kennzeichen werden nicht korrekt erkannt:**

  - Überprüfe die Formatierung der Kennzeichen in der Datenbank.
  - Achte darauf, dass keine zusätzlichen Leerzeichen oder Sonderzeichen vorhanden sind.

## Danksagung

- **overextended** für die großartigen Ressourcen [ox_target](https://github.com/overextended/ox_target) und [oxmysql](https://github.com/overextended/oxmysql).
- **ESX-Framework** für die Bereitstellung einer soliden Basis für FiveM-Server.

## Lizenz

Dieses Projekt ist unter der **MIT-Lizenz** lizenziert. Siehe die [LICENSE](LICENSE)-Datei für weitere Details.

**Open Source:** Dieses Skript ist Open Source und darf von jedem frei genutzt, modifiziert und verteilt werden.

---

Solltest du Fragen oder Probleme haben, zögere nicht, Kontakt über Discord mit mir aufzunehmen aufzunehmen "quwenji".

---

**Viel Spaß beim Spielen und gutes Roleplay!**

---
