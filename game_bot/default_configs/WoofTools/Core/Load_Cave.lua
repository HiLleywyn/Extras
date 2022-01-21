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
-- Styles - /Core/Cave/Styles/
CaveBot.Styles = {
  "Main",
  "Config",
  "Editor"
}
--------------------------------------------------------------------------------
-- Core - /Core/Cave/
CaveBot.Core = {
  "Waypoints",
  --"Dungeons",
  "Actions",
  "Config",
  "Editor",
  "Recorder",
  "Walk",
  "Collecting",
}
--------------------------------------------------------------------------------
-- Functions - /Core/Cave/Functions/
CaveBot.Functions = {
  "Example",
  "Dungeons"
}
--------------------------------------------------------------------------------
-- Extensions - /Core/Cave/Extensions/
CaveBot.Extensions = {
  --"Example",
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Local Loading Functions
--------------------------------------------------------------------------------
-- Load Styles
local function loadStyles(s)
  return importStyle("/Core/Cave/Styles/" .. s .. ".otui")
end

-- Load Core
local function loadCore(c)
  return dofile("/Core/Cave/" .. c .. ".lua")
end

-- Load Extensions
local function loadExtensions(e)
  return dofile("/Core/Cave/Extensions/" .. e .. ".lua")
end

-- Load Functions
local function loadFunctions(f)
  return dofile("/Core/Cave/Functions/" .. f .. ".lua")
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
