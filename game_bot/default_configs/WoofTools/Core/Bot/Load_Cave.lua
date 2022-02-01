--------------------------------------------------------------------------------
-- Main CaveBot Loader
--------------------------------------------------------------------------------
local cavebotTab = "Cave"
setDefaultTab(cavebotTab)
CaveBot = {}
CaveBot.Extensions = {}
--------------------------------------------------------------------------------
-- Styles and Scripts to Load
--------------------------------------------------------------------------------
-- Styles - /Core/Bot/Cave/Styles/
CaveBot.Styles = {
  "Main",
  "Config",
  "Editor"
}
--------------------------------------------------------------------------------
-- Core - /Core/Bot/Cave/
CaveBot.Core = {
  "Waypoints",
  "Actions",
  "Config",
  "Editor",
  "Recorder",
  "Walk",
  "Collecting",
}
--------------------------------------------------------------------------------
-- Functions - /Core/Bot/Cave/Functions/
CaveBot.Functions = {
  "Example",
  "Dungeons"
}
--------------------------------------------------------------------------------
-- Extensions - /Core/Bot/Cave/Extensions/
CaveBot.Extensions = {
  --"Example",
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Local Loading Functions
--------------------------------------------------------------------------------
-- Load Styles
local function loadStyles(s)
  return importStyle("/Core/Bot/Cave/Styles/" .. s .. ".otui")
end

-- Load Core
local function loadCore(c)
  return dofile("/Core/Bot/Cave/" .. c .. ".lua")
end

-- Load Extensions
local function loadExtensions(e)
  return dofile("/Core/Bot/Cave/Extensions/" .. e .. ".lua")
end

-- Load Functions
local function loadFunctions(f)
  return dofile("/Core/Bot/Cave/Functions/" .. f .. ".lua")
end

--------------------------------------------------------------------------------
-- Load Styles, Core, Functions, Extensions and Main
--------------------------------------------------------------------------------
-- Load Styles
for i, s in ipairs(CaveBot.Styles) do
  loadStyles(s)
end

-- Load Core
for i, c in ipairs(CaveBot.Core) do
  loadCore(c)
end

-- Load Extensions
for i, e in ipairs(CaveBot.Extensions) do
  loadExtensions(e)
end

-- Load Functions
for i, f in ipairs(CaveBot.Functions) do
  loadFunctions(f)
end

-- Load Main (ALWAYS LOAD LAST)
loadCore("Main")
--------------------------------------------------------------------------------
