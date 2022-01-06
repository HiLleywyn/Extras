local cavebotTab = "Cave"

setDefaultTab(cavebotTab)
CaveBot = {} -- global namespace
CaveBot.Extensions = {}

--Styles
importStyle("/Core/Cave/cavebot.otui")
importStyle("/Core/Cave/config.otui")
importStyle("/Core/Cave/editor.otui")
importStyle("/Core/Cave/supply.otui")

-- Core
dofile("/Core/Cave/ConfigManager.lua")
dofile("/Core/Cave/actions.lua")
dofile("/Core/Cave/config.lua")
dofile("/Core/Cave/editor.lua")
dofile("/Core/Cave/example_functions.lua")
dofile("/Core/Cave/recorder.lua")
dofile("/Core/Cave/walking.lua")
dofile("/Core/Cave/depositer.lua")
dofile("/Core/Cave/supply.lua")

-- Extensions

-- main cavebot file, must be last
dofile("/Core/Cave/cavebot.lua")
