local woofTab = "Main"

setDefaultTab(woofTab)
Woof = {}

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
  "Load_Libraries",
  "Load_Bot"
}

for i, file in ipairs(luaFiles) do
  loadScript(file)
end

setDefaultTab("Main")

UI.Separator()
UI.Separator()
UI.Label("WoofTools v2.2.0")
UI.Separator()
UI.Separator()
UI.Label("Support: Tether @ Evolunia")
UI.Button("Evolunia Discord", function() g_platform.openUrl("https://discord.gg/fPd9hzuqpq") end)
UI.Button("Community GitHub", function() g_platform.openUrl("https://github.com/EvoluniaCommunity") end)
UI.Separator()
