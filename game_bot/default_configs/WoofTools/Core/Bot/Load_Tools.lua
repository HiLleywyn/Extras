--------------------------------------------------------------------------------
-- Main Tools Loader
--------------------------------------------------------------------------------
local toolsTab = "Tools"
setDefaultTab(toolsTab)
Tools = {}
Tools.Extensions = {}
--------------------------------------------------------------------------------
-- Styles and Scripts to Load
--------------------------------------------------------------------------------
-- Styles - /Core/Bot/Tools/Styles/
Tools.Styles = {
}
--------------------------------------------------------------------------------
-- Core - /Core/Bot/Tools/
Tools.Core = {
  "Party"
}
--------------------------------------------------------------------------------
-- Functions - /Core/Bot/Tools/Functions/
Tools.Functions = {
}
--------------------------------------------------------------------------------
-- Extensions - /Core/Bot/Tools/Extensions/
Tools.Extensions = {
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Local Loading Functions
--------------------------------------------------------------------------------
-- Load Styles
local function loadStyles(s)
  return importStyle("/Core/Bot/Tools/Styles/" .. s .. ".otui")
end

-- Load Core
local function loadCore(c)
  return dofile("/Core/Bot/Tools/" .. c .. ".lua")
end

-- Load Extensions
local function loadExtensions(e)
  return dofile("/Core/Bot/Tools/Extensions/" .. e .. ".lua")
end

-- Load Functions
local function loadFunctions(f)
  return dofile("/Core/Bot/Tools/Functions/" .. f .. ".lua")
end

--------------------------------------------------------------------------------
-- Load Styles, Core, Functions, Extensions and Main
--------------------------------------------------------------------------------
-- Load Styles
for i, s in ipairs(Tools.Styles) do
  loadStyles(s)
end

-- Load Core
for i, c in ipairs(Tools.Core) do
  loadCore(c)
end

-- Load Extensions
for i, e in ipairs(Tools.Extensions) do
  loadExtensions(e)
end

-- Load Functions
for i, f in ipairs(Tools.Functions) do
  loadFunctions(f)
end

-- Load Main (ALWAYS LOAD LAST)
loadCore("Main")
--------------------------------------------------------------------------------
