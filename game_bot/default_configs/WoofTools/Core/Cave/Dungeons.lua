cfgFloor = ""

function setDungeon(i)
  storage.cfgFloor = dungeonTable[i].cfg
  storage.cfgFloorNext = storage.cfgFloor
end

dungeonTable = {
  ["Desert Dungeon"] = {
    cfg = "/Configs/Cave/Dungeons/Desert",
    func = function() setDungeon("Desert Dungeon") end
  },
  ["Default"] = {
    cfg = "/Configs/Cave/Dungeons",
    func = function() setDungeon("Default") end
  }
}

storage.cfgFloor = dungeonTable["Default"].cfg
storage.cfgFloorNext = storage.cfgFloor

UI.Separator()
UI.Label("Auto-Dungeon Setup")
UI.Separator()

local autoDesert = macro(500, "Desert Auto-Dungeon", function() end)

if autoDesert.isOn() then
  local playerZ = pos().z
  say(playerZ)
  dungeonTable["Desert Dungeon"].func()
end

UI.Separator()
