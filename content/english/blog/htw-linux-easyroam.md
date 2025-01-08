---
title: "TIL: Easyroam auf Linux (Ubuntu/Fedora) an der HTW Berlin einrichten"
meta_title: "Easyroam/eduroam Setup Guide für Linux an der HTW Berlin"
description: "Eine schnelle Anleitung zur Einrichtung von Easyroam/eduroam auf Linux-Systemen (Ubuntu/Fedora) für Studierende der HTW Berlin mit NetworkManager und PKCS12-Zertifikaten"
date: 2025-01-08T14:00:00Z
categories: ["Linux", "Networking", "HTW Berlin"]
author: "René Kuhn"
tags: ["linux", "ubuntu", "fedora", "eduroam", "easyroam", "htw-berlin", "networkmanager"]
draft: false
---

# TIL: Easyroam auf Linux (Ubuntu/Fedora) an der HTW Berlin einrichten

Schnelle Anleitung zum Einrichten von Easyroam (eduroam) auf Linux-Systemen an der HTW Berlin.

## Voraussetzungen
- Linux (Ubuntu 20.04+ oder Fedora)
- NetworkManager
- Temporäre Internetverbindung (z.B. Mobilfunk)
- HTW-Account

{{< notice "warning" >}}
Stelle sicher, dass du im gleichen Verzeichnis bist, in dem sich deine PKCS12-Datei befindet! Nutze `cd` um in das richtige Verzeichnis zu wechseln.
{{< /notice >}}

## Quick Setup

1. Auf [easyroam.de](https://easyroam.de) einloggen
2. "Manuelle Optionen" wählen und PKCS12-Profil erstellen und herunterladen
   - Die heruntergeladene Datei hat normalerweise einen Namen wie "easyroam-zertifikat.p12"
   - Merke dir, wo die Datei gespeichert wurde (standardmäßig im Downloads-Ordner)

3. Öffne ein Terminal (drücke STRG+ALT+T) und führe folgende Befehle aus:

Erster Befehl (kopiere den gesamten Block und führe ihn aus):
```bash
cd ~/Downloads && \
curl -o configure-eduroam-with-easyroam https://gist.githubusercontent.com/RocketRene/290482efa34e7a31664f033c4b587034/raw/b2fe4f68b63017482fc24f7be1f90e62467894c3/configure-eduroam-with-easyroam.sh && \
chmod +x configure-eduroam-with-easyroam
```

Zweiter Befehl (WICHTIG: Passe den Dateinamen an!):
```bash
./configure-eduroam-with-easyroam "easyroam-zertifikat.p12"
```

⚠️ WICHTIG: Ersetze "easyroam-zertifikat.p12" mit dem tatsächlichen Namen deiner heruntergeladenen PKCS12-Datei. Der Name könnte zum Beispiel auch "htw-berlin.p12" oder ähnlich sein.

{{< notice "tip" >}}
Du kannst mit dem Befehl `ls` alle Dateien im aktuellen Verzeichnis anzeigen lassen. So findest du den genauen Namen deiner PKCS12-Datei.
{{< /notice >}}

{{< notice "info" >}}
Der Installer richtet automatisch die nötigen NetworkManager-Einstellungen ein. Nach der Installation solltest du dich sofort mit eduroam verbinden können.
{{< /notice >}}

## Fehlerbehebung

Falls der zweite Befehl nicht funktioniert, überprüfe folgendes:
1. Ist der Dateiname in Anführungszeichen gesetzt? (z.B. "easyroam-zertifikat.p12")
2. Befindet sich die Datei im Downloads-Ordner?
3. Hast du den korrekten Dateinamen verwendet? Nutze `ls` zum Überprüfen.

## Hinweise
- Funktioniert nur mit NetworkManager
- Die PKCS12-Datei enthält deine persönlichen Zertifikate
- Für andere Network-Manager bitte die entsprechende Dokumentation konsultieren

---
*Aktualisiert: Januar 2025*
