--------------------------------------------------------------------------------
-- Main TargetBot Loader
--------------------------------------------------------------------------------
local targetBotTab = "Target"
setDefaultTab(targetBotTab)
TargetBot = {}
TargetBot.Extensions = {}
--------------------------------------------------------------------------------
-- Styles and Scripts to Load
--------------------------------------------------------------------------------
-- Styles - /Core/Bot/Target/Styles/
TargetBot.Styles = {
  "Main",
  "Editor"
}
--------------------------------------------------------------------------------
-- Core - /Core/Bot/Target/
TargetBot.Core = {
  "Creature",
  "Attack",
  "Editor",
  "Priority",
  "Walk",
  "AutoFollow",
  "Buff",
  "Spells",
  "Taunt"
}
--------------------------------------------------------------------------------
-- Functions - /Core/Bot/Target/Functions/
TargetBot.Functions = {
}
--------------------------------------------------------------------------------
-- Extensions - /Core/Bot/Target/Extensions/
TargetBot.Extensions = {
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Local Loading Functions
--------------------------------------------------------------------------------
-- Load Styles
local function loadStyles(s)
  return importStyle("/Core/Bot/Target/Styles/" .. s .. ".otui")
end

-- Load Core
local function loadCore(c)
  return dofile("/Core/Bot/Target/" .. c .. ".lua")
end

-- Load Extensions
local function loadExtensions(e)
  return dofile("/Core/Bot/Target/Extensions/" .. e .. ".lua")
end

-- Load Functions
local function loadFunctions(f)
  return dofile("/Core/Bot/Target/Functions/" .. f .. ".lua")
end

--------------------------------------------------------------------------------
-- Load Styles, Core, Functions, Extensions and Main
--------------------------------------------------------------------------------
-- Load Styles
for i, s in ipairs(TargetBot.Styles) do
  loadStyles(s)
end

-- Load Core
for i, c in ipairs(TargetBot.Core) do
  loadCore(c)
end

-- Load Extensions
for i, e in ipairs(TargetBot.Extensions) do
  loadExtensions(e)
end

-- Load Functions
for i, f in ipairs(TargetBot.Functions) do
  loadFunctions(f)
end

-- Load Main (ALWAYS LOAD LAST)
loadCore("Main")
--------------------------------------------------------------------------------
