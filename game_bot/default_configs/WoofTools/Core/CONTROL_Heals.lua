local healsTab = "Heals"

setDefaultTab(healsTab)
Woof.Heals = {}
Woof.Heals.Extensions = {}

-- Import styles
importStyle("/Core/Heals/Heals.Conditions.otui")

-- Import scripts
dofile("/Core/Heals/Heals.Conditions.lua")

-- Main_Heals.lua must load last
dofile("/Core/Heals/Heals.lua")
