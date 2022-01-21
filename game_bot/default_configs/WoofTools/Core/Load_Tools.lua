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
-- Styles - /Core/Tools/Styles/
Tools.Styles = {
  --"Main",
}
--------------------------------------------------------------------------------
-- Core - /Core/Tools/
Tools.Core = {
  "Party",
}
--------------------------------------------------------------------------------
-- Local Loading Functions
--------------------------------------------------------------------------------
-- Load Styles
local function loadStyles(s)
  return importStyle("/Core/Tools/Styles/" .. s .. ".otui")
end

-- Load Core
local function loadCore(c)
  return dofile("/Core/Tools/" .. c .. ".lua")
end
--------------------------------------------------------------------------------
-- Load Styles, Core and Main
--------------------------------------------------------------------------------
-- Load Styles
for i, s in ipairs(Tools.Styles) do
  loadStyles(s)
end

-- Load Core
for i, c in ipairs(Tools.Core) do
  loadCore(c)
end

-- Load Main (ALWAYS LOAD LAST)
loadCore("Main")
--------------------------------------------------------------------------------
