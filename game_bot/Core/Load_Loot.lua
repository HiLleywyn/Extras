local lootTab = "Loot"

setDefaultTab(lootTab)
Loot = {}
Loot.Extensions = {}

-- Import styles
importStyle("/Core/Loot/Main_Loot.otui")

-- Load scripts
dofile("/Core/Loot/Items_Loot.lua")

-- Main_Loot.lua must load last
dofile("/Core/Loot/Main_Loot.lua")
