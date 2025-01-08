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
2. "Manuelle Optionen" wählen und PKCS12-Profil erstellen
3. Installer herunterladen und ausführen:

```bash
curl -O https://gist.github.com/RocketRene/290482efa34e7a31664f033c4b587034&& \
chmod +x configure-eduroam-with-easyroam
```

Dann kannst du den Installer folgendermaßen ausführen

```bash
./configure-eduroam-with-easyroam "deine-pkcs12-datei"
```

{{< notice "tip" >}}
Du kannst mit `ls` überprüfen, ob sich die PKCS12-Datei im aktuellen Verzeichnis befindet.
{{< /notice >}}

{{< notice "info" >}}
Der Installer richtet automatisch die nötigen NetworkManager-Einstellungen ein. Nach der Installation solltest du dich sofort mit eduroam verbinden können.
{{< /notice >}}

## Hinweise
- Funktioniert nur mit NetworkManager
- Die PKCS12-Datei enthält deine persönlichen Zertifikate
- Für andere Network-Manager bitte die entsprechende Dokumentation konsultieren

---
*Aktualisiert: Januar 2025*
