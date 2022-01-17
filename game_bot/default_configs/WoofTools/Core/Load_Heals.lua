local healsTab = "Heals"

setDefaultTab(healsTab)
Woof.Heals = {}
Woof.Heals.Extensions = {}

-- Import styles
--importStyle("/Core/Heals/Main_Heals.otui")

-- Main_Heals.lua must load last
dofile("/Core/Heals/Heals.lua")
