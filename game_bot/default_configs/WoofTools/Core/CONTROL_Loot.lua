local lootTab = "Loot"

setDefaultTab(lootTab)
Loot = {}
Loot.Extensions = {}

-- Import styles
importStyle("/Core/Loot/Loot.otui")
importStyle("/Core/Loot/Loot.Window.otui")

-- Load scripts
dofile("/Core/Loot/Loot.Items.lua")
dofile("/Core/Loot/Loot.Containers.lua")
dofile("/Core/Loot/Loot.Window.lua")

-- Main_Loot.lua must load last
dofile("/Core/Loot/Loot.lua")
