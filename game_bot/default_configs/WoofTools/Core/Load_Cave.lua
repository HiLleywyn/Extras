local cavebotTab = "Cave"

setDefaultTab(cavebotTab)
CaveBot = {}
CaveBot.Extensions = {}

--Styles
importStyle("/Core/Cave/Cave.otui")
importStyle("/Core/Cave/Cave.Config.otui")
importStyle("/Core/Cave/Cave.Editor.otui")

-- Core
dofile("/Core/Cave/Cave.Waypoints.lua")
dofile("/Core/Cave/Cave.Actions.lua")
dofile("/Core/Cave/Cave.Config.lua")
dofile("/Core/Cave/Cave.Editor.lua")
dofile("/Core/Cave/Cave.Recorder.lua")
dofile("/Core/Cave/Cave.Walk.lua")
dofile("/Core/Cave/Cave.Collecting.lua")

-- Examples
dofile("/Core/Cave/Examples/Example_Functions.lua")
--dofile("/Core/Cave/Examples/Example_Extension.lua")

-- Extensions
--dofile("/Core/Cave/Examples/Example_Extension.lua")

-- main cavebot file, must load last!
dofile("/Core/Cave/Cave.lua")
