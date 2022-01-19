local healsTab = "Heals"

setDefaultTab(healsTab)
Heals = {}
Heals.Extensions = {}

-- Import styles
--importStyle("/Core/Heals/Main_Heals.otui")
importStyle("/Core/Heals/Conditions_Heals.otui")

-- Import scripts
dofile("/Core/Heals/Conditions_Heals.lua")

-- Main_Heals.lua must load last
dofile("/Core/Heals/Main_Heals.lua")
