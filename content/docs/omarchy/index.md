---
title: "Omarchy"
weight: 10
description: "minhas configs do ormarchy caso eu formate o pc algum dia"
draft: false
---


## Monitores
Configs de monitor ficam em `~/.config/hypr/monitors.lua`

```lua

local omarchy_gdk_scale = 1
local omarchy_monitor_scale = 1.25

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
-- scale usando a var pra que seja alterada pelo menu
hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = omarchy_monitor_scale })

-- monitor em cima do notebook e com escala fixa
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@120", position = "0x-1080", scale = 1 })
--monitor ao lado esquero do notebook e com escala fixa
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@120", position = "-1920x0", scale = 1 })

```


