-- load all otui files, order doesn't matter
local configName = modules.game_bot.contentsPanel.config:getCurrentOption().text

local configFiles = g_resources.listDirectoryFiles("/Core/" .. configName .. "/Core", true, false)
for i, file in ipairs(configFiles) do
  local ext = file:split(".")
  if ext[#ext]:lower() == "ui" or ext[#ext]:lower() == "otui" then
    g_ui.importStyle(file)
  end
end

local function loadScript(name)
  return dofile("/Core/" .. name .. ".lua")
end

-- here you can set manually order of scripts
-- libraries should be loaded first
local luaFiles = {
  "Load_Cave",
  "Load_Target",
  "Load_Tools",
  "Load_Heals",
  "Load_Loot"
}

for i, file in ipairs(luaFiles) do
  loadScript(file)
end
setDefaultTab("Main")

UI.Separator()
UI.Separator()
UI.Label("WoofTools v2.0.2")
UI.Separator()
UI.Separator()
UI.Label("Changelog:")
UI.Separator()
UI.Label("2.0.1")
UI.Label("Fixed an issue with Training Monk targeting.")
UI.Separator()
UI.Label("2.0.2")
UI.Label("New Tools:")
UI.Label("Auto-Follow Players")
UI.Label(" ")
UI.Label("Tool Updates:")
UI.Label("Added ability to load a single level room's waypoint configs.")
UI.Label("Changed the max lure in target editor from 5 to 20.")
UI.Label(" ")
UI.Label("UI/Layout:")
UI.Label("Started work on day/night auto-layouts.")
UI.Label("Lee's (TrainorCreations) Loot/Green Text channels added to the game_bot module.")
UI.Label(" ")
UI.Label("Other:")
UI.Label("Reworked auto mana training cooldown timer to stop the poofs.")
UI.Label("Deleted bot server to attempt to fix random freezing issue.")
UI.Separator()
UI.Label("Support: Tether @ Evolunia")
UI.Separator()
