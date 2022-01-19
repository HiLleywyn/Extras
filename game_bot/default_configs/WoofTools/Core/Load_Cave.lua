local cavebotTab = "Cave"

setDefaultTab(cavebotTab)
CaveBot = {}
CaveBot.Extensions = {}

--Styles
importStyle("/Core/Cave/Main_Cave.otui")
importStyle("/Core/Cave/Config_Cave.otui")
importStyle("/Core/Cave/Editor_Cave.otui")

-- Core
dofile("/Core/Cave/Waypoints_Cave.lua")
dofile("/Core/Cave/Actions_Cave.lua")
dofile("/Core/Cave/Config_Cave.lua")
dofile("/Core/Cave/Editor_Cave.lua")
dofile("/Core/Cave/Recorder_Cave.lua")
dofile("/Core/Cave/Walk_Cave.lua")
dofile("/Core/Cave/Collecting_Cave.lua")

-- Examples
dofile("/Core/Cave/Examples/Example_Functions.lua")
--dofile("/Core/Cave/Examples/Example_Extension.lua")

-- Extensions
--dofile("/Core/Cave/Examples/Example_Extension.lua")

-- main cavebot file, must be last
dofile("/Core/Cave/Main_Cave.lua")
