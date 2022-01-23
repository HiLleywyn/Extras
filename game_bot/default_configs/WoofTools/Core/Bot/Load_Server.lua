--------------------------------------------------------------------------------
-- Main Server Loader
--------------------------------------------------------------------------------
local serverTab = "Main"
setDefaultTab(serverTab)
Server = {}
Server.Extensions = {}
--------------------------------------------------------------------------------
-- Styles and Scripts to Load
--------------------------------------------------------------------------------
-- Styles - /Core/Bot/Server/Styles/
Server.Styles = {
  "Main"
}
--------------------------------------------------------------------------------
-- Core - /Core/Bot/Server/
Server.Core = {
}
--------------------------------------------------------------------------------
-- Functions - /Core/Bot/Server/Functions/
Server.Functions = {
}
--------------------------------------------------------------------------------
-- Extensions - /Core/Bot/Server/Extensions/
Server.Extensions = {
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Local Loading Functions
--------------------------------------------------------------------------------
-- Load Styles
local function loadStyles(s)
  return importStyle("/Core/Bot/Server/Styles/" .. s .. ".otui")
end

-- Load Core
local function loadCore(c)
  return dofile("/Core/Bot/Server/" .. c .. ".lua")
end

-- Load Extensions
local function loadExtensions(e)
  return dofile("/Core/Bot/Server/Extensions/" .. e .. ".lua")
end

-- Load Functions
local function loadFunctions(f)
  return dofile("/Core/Bot/Server/Functions/" .. f .. ".lua")
end

--------------------------------------------------------------------------------
-- Load Styles, Core, Functions, Extensions and Main
--------------------------------------------------------------------------------
-- Load Styles
for i, s in ipairs(Server.Styles) do
  loadStyles(s)
end

-- Load Core
for i, c in ipairs(Server.Core) do
  loadCore(c)
end

-- Load Extensions
for i, e in ipairs(Server.Extensions) do
  loadExtensions(e)
end

-- Load Functions
for i, f in ipairs(Server.Functions) do
  loadFunctions(f)
end

-- Load Main (ALWAYS LOAD LAST)
loadCore("Main")
--------------------------------------------------------------------------------
