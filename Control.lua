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
UI.Label("WoofTools v2.0.4")
UI.Separator()
UI.Separator()
UI.Label("Support: Tether @ Evolunia")
UI.Separator()
UI.Separator()
UI.Label("Changelog:")
UI.Separator()
UI.Separator()
UI.Label("2.0.1")
UI.Label("Fixed an issue with Training Monk targeting.")
UI.Separator()
UI.Label("2.0.2")
UI.Label("Optimized Mana Training / Mana Shield for cooldowns. No more poofs!")
UI.Separator()
UI.Label("2.0.3")
UI.Label("Added Day/Night Layouts (Work in Progress).")
UI.Separator()
UI.Label("2.0.4")
UI.Label("Deleted Bot Server (Never used).")
UI.Separator()
UI.Separator()
