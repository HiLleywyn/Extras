local toolsTab = "Tools"

setDefaultTab(toolsTab)
Tools = {}
Tools.Extensions = {}

-- Import styles
--importStyle("/Core/Tools/Main_Tools.otui")

-- Load scripts

-- Main_Tools.lua must load last
dofile("/Core/Tools/Main_Tools.lua")
