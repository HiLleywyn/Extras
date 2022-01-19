local healsTab = "Heals"

setDefaultTab(healsTab)
Heals = {}
Heals.Extensions = {}

-- Import styles
--importStyle("/Core/Heals/Main_Heals.otui")

-- Main_Heals.lua must load last
dofile("/Core/Heals/Main_Heals.lua")
