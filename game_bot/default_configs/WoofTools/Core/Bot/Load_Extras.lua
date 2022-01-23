--------------------------------------------------------------------------------
-- Main Extras Loader
--------------------------------------------------------------------------------
Extras = {}
Extras.Extensions = {}
--------------------------------------------------------------------------------
-- Styles and Scripts to Load
--------------------------------------------------------------------------------
-- Styles - /Core/Bot/Extras/Styles/
Extras.Styles = {
}
--------------------------------------------------------------------------------
-- Core - /Core/Bot/Extras/
Extras.Core = {
  "MagicWallTimers",
}
--------------------------------------------------------------------------------
-- Functions - /Core/Bot/Extras/Functions/
Extras.Functions = {
}
--------------------------------------------------------------------------------
-- Extensions - /Core/Bot/Extras/Extensions/
Extras.Extensions = {
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Local Loading Functions
--------------------------------------------------------------------------------
-- Load Styles
local function loadStyles(s)
  return importStyle("/Core/Bot/Extras/Styles/" .. s .. ".otui")
end

-- Load Core
local function loadCore(c)
  return dofile("/Core/Bot/Extras/" .. c .. ".lua")
end

-- Load Extensions
local function loadExtensions(e)
  return dofile("/Core/Bot/Extras/Extensions/" .. e .. ".lua")
end

-- Load Functions
local function loadFunctions(f)
  return dofile("/Core/Bot/Extras/Functions/" .. f .. ".lua")
end

--------------------------------------------------------------------------------
-- Load Styles, Core, Functions, Extensions and Main
--------------------------------------------------------------------------------
-- Load Styles
for i, s in ipairs(Extras.Styles) do
  loadStyles(s)
end

-- Load Core
for i, c in ipairs(Extras.Core) do
  loadCore(c)
end

-- Load Extensions
for i, e in ipairs(Extras.Extensions) do
  loadExtensions(e)
end

-- Load Functions
for i, f in ipairs(Extras.Functions) do
  loadFunctions(f)
end
--------------------------------------------------------------------------------
