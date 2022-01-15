setDefaultTab("Cave")

addSeparator()

cfgFloor = ""

function setFloor(i)
  storage.cfgFloor = floorLevel[i].cfg
  storage.cfgFloorNext = storage.cfgFloor
end

floorLevel = {
  [1] = {
    cfg = "/Configs/Cave/Floor_1",
    func = function() setFloor(1) end
  },
  [2] = {
    cfg = "/Configs/Cave/Floor_2",
    func = function() setFloor(2) end
  },
  [3] = {
    cfg = "/Configs/Cave/Floor_3",
    func = function() setFloor(3) end
  },
  ["Dungeons"] = {
    cfg = "/Configs/Cave/Dungeons",
    func = function() setFloor("Dungeons") end
  },
  ["Default"] = {
    cfg = "/Configs/Cave",
    func = function() setFloor("Default") end
  }
}

storage.cfgFloor = floorLevel["Default"].cfg
storage.cfgFloorNext = storage.cfgFloor

UI.Label("Load an individual waypoint folder.")
UI.Label("Can only load one at a time!")
UI.Label("Restart macros if changed.")

local a = macro(500, "Floor 1", function() end)
if a.isOn() then
  floorLevel[1].func()
end

local b = macro(500, "Floor 2", function() end)
if b.isOn() then
  floorLevel[2].func()
end

local c = macro(500, "Floor 3", function() end)
if c.isOn() then
  floorLevel[3].func()
end

local d = macro(500, "Dungeons", function() end)
if d.isOn() then
  floorLevel["Dungeons"].func()
end

addSeparator()
