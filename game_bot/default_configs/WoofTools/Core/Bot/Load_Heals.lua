--------------------------------------------------------------------------------
-- Main Heals Loader
--------------------------------------------------------------------------------
local healsTab = "Heals"
setDefaultTab(healsTab)
Heals = {}
Heals.Extensions = {}
--------------------------------------------------------------------------------
-- Styles and Scripts to Load
--------------------------------------------------------------------------------
-- Styles - /Core/Bot/Heals/Styles/
Heals.Styles = {
  "Conditions"
}
--------------------------------------------------------------------------------
-- Core - /Core/Bot/Heals/
Heals.Core = {
  "Conditions"
}
--------------------------------------------------------------------------------
-- Functions - /Core/Bot/Heals/Functions/
Heals.Functions = {
}
--------------------------------------------------------------------------------
-- Extensions - /Core/Bot/Heals/Extensions/
Heals.Extensions = {
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Local Loading Functions
--------------------------------------------------------------------------------
-- Load Styles
local function loadStyles(s)
  return importStyle("/Core/Bot/Heals/Styles/" .. s .. ".otui")
end

-- Load Core
local function loadCore(c)
  return dofile("/Core/Bot/Heals/" .. c .. ".lua")
end

-- Load Extensions
local function loadExtensions(e)
  return dofile("/Core/Bot/Heals/Extensions/" .. e .. ".lua")
end

-- Load Functions
local function loadFunctions(f)
  return dofile("/Core/Bot/Heals/Functions/" .. f .. ".lua")
end

--------------------------------------------------------------------------------
-- Load Styles, Core, Functions, Extensions and Main
--------------------------------------------------------------------------------
-- Load Styles
for i, s in ipairs(Heals.Styles) do
  loadStyles(s)
end

-- Load Core
for i, c in ipairs(Heals.Core) do
  loadCore(c)
end

-- Load Extensions
for i, e in ipairs(Heals.Extensions) do
  loadExtensions(e)
end

-- Load Functions
for i, f in ipairs(Heals.Functions) do
  loadFunctions(f)
end

-- Load Main (ALWAYS LOAD LAST)
loadCore("Main")
--------------------------------------------------------------------------------
