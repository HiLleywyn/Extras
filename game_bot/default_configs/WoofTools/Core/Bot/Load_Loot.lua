--------------------------------------------------------------------------------
-- Main Loot Loader
--------------------------------------------------------------------------------
local lootTab = "Loot"
setDefaultTab(lootTab)
Loot = {}
Loot.Extensions = {}
--------------------------------------------------------------------------------
-- Styles and Scripts to Load
--------------------------------------------------------------------------------
-- Styles - /Core/Bot/Loot/Styles/
Loot.Styles = {
  "Main"
}
--------------------------------------------------------------------------------
-- Core - /Core/Bot/Loot/
Loot.Core = {
  "Items",
  "Containers"
}
--------------------------------------------------------------------------------
-- Functions - /Core/Bot/Loot/Functions/
Loot.Functions = {
}
--------------------------------------------------------------------------------
-- Extensions - /Core/Bot/Loot/Extensions/
Loot.Extensions = {
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Local Loading Functions
--------------------------------------------------------------------------------
-- Load Styles
local function loadStyles(s)
  return importStyle("/Core/Bot/Loot/Styles/" .. s .. ".otui")
end

-- Load Core
local function loadCore(c)
  return dofile("/Core/Bot/Loot/" .. c .. ".lua")
end

-- Load Extensions
local function loadExtensions(e)
  return dofile("/Core/Bot/Loot/Extensions/" .. e .. ".lua")
end

-- Load Functions
local function loadFunctions(f)
  return dofile("/Core/Bot/Loot/Functions/" .. f .. ".lua")
end

--------------------------------------------------------------------------------
-- Load Styles, Core, Functions, Extensions and Main
--------------------------------------------------------------------------------
-- Load Styles
for i, s in ipairs(Loot.Styles) do
  loadStyles(s)
end

-- Load Core
for i, c in ipairs(Loot.Core) do
  loadCore(c)
end

-- Load Extensions
for i, e in ipairs(Loot.Extensions) do
  loadExtensions(e)
end

-- Load Functions
for i, f in ipairs(Loot.Functions) do
  loadFunctions(f)
end

-- Load Main (ALWAYS LOAD LAST)
loadCore("Main")
--------------------------------------------------------------------------------
