UI.Separator()

loadedWaypoints = ""

function setWaypoints(i)
  storage.loadedWaypoints = waypointsTable[i].folder
end

waypointsTable = {
  [1] = {
    folder = "/Configs/Cave/Floor_1",
    func = function() setWaypoints(1) end
  },
  [2] = {
    folder = "/Configs/Cave/Floor_2",
    func = function() setWaypoints(2) end
  },
  [3] = {
    folder = "/Configs/Cave/Floor_3",
    func = function() setWaypoints(3) end
  },
  ["Magical Forest Dungeon"] = {
    floorOne = "/Configs/Cave/Dungeons/Magical_Forest/1",
    floorTwo = "/Configs/Cave/Dungeons/Magical_Forest/2",
    floorThree = "/Configs/Cave/Dungeons/Magical_Forest/3",
    floorFour = "/Configs/Cave/Dungeons/Magical_Forest/4",
    floorFive = "/Configs/Cave/Dungeons/Magical_Forest/5",
    floorSix = "/Configs/Cave/Dungeons/Magical_Forest/6",
    floorSeven = "/Configs/Cave/Dungeons/Magical_Forest/7",
    floorEight = "/Configs/Cave/Dungeons/Magical_Forest/8",
    floorNine = "/Configs/Cave/Dungeons/Magical_Forest/9",
    floorTen = "/Configs/Cave/Dungeons/Magical_Forest/10",
    floorEleven = "/Configs/Cave/Dungeons/Magical_Forest/11",
    floorTwelve = "/Configs/Cave/Dungeons/Magical_Forest/12",
  },
  ["Desert Dungeon"] = {
    floorOne = "/Configs/Cave/Dungeons/Desert/1",
    floorTwo = "/Configs/Cave/Dungeons/Desert/2",
    floorThree = "/Configs/Cave/Dungeons/Desert/3",
    floorFour = "/Configs/Cave/Dungeons/Desert/4",
    floorFive = "/Configs/Cave/Dungeons/Desert/5",
    floorSix = "/Configs/Cave/Dungeons/Desert/6",
    floorSeven = "/Configs/Cave/Dungeons/Desert/7",
    floorEight = "/Configs/Cave/Dungeons/Desert/8",
    floorNine = "/Configs/Cave/Dungeons/Desert/9",
    floorTen = "/Configs/Cave/Dungeons/Desert/10",
    floorEleven = "/Configs/Cave/Dungeons/Desert/11",
    floorTwelve = "/Configs/Cave/Dungeons/Desert/12",
  },
  ["Undead Dungeon"] = {
    floorOne = "/Configs/Cave/Dungeons/Undead/1",
    floorTwo = "/Configs/Cave/Dungeons/Undead/2",
    floorThree = "/Configs/Cave/Dungeons/Undead/3",
    floorFour = "/Configs/Cave/Dungeons/Undead/4",
    floorFive = "/Configs/Cave/Dungeons/Undead/5",
    floorSix = "/Configs/Cave/Dungeons/Undead/6",
    floorSeven = "/Configs/Cave/Dungeons/Undead/7",
    floorEight = "/Configs/Cave/Dungeons/Undead/8",
    floorNine = "/Configs/Cave/Dungeons/Undead/9",
    floorTen = "/Configs/Cave/Dungeons/Undead/10",
    floorEleven = "/Configs/Cave/Dungeons/Undead/11",
    floorTwelve = "/Configs/Cave/Dungeons/Undead/12",
  },
  ["Default"] = {
    folder = "/Configs/Cave",
    func = function() setWaypoints("Default") end
  }
}

UI.Label("Load an individual waypoint folder.")
UI.Label("Can only load one at a time!")
UI.Label("Restart macros if changed.")

local a = macro(500, "Floor 1", function() end)
if a.isOn() then
  waypointsTable[1].func()
end

local b = macro(500, "Floor 2", function() end)
if b.isOn() then
  waypointsTable[2].func()
end

local c = macro(500, "Floor 3", function() end)
if c.isOn() then
  waypointsTable[3].func()
end

local d = macro(500, "Magical Forest Dungeon", function() end)
if d.isOn() then
  onPlayerPositionChange(function(newPos, oldPos)
    if newPos.z == 1 then
      storage.loadedWaypoints = waypointsTable["Magical Forest Dungeon"].floorOne
    elseif newPos.z == 2 then
      storage.loadedWaypoints = waypointsTable["Magical Forest Dungeon"].floorTwo
    elseif newPos.z == 3 then
      storage.loadedWaypoints = waypointsTable["Magical Forest Dungeon"].floorThree
    elseif newPos.z == 4 then
      storage.loadedWaypoints = waypointsTable["Magical Forest Dungeon"].floorFour
    elseif newPos.z == 5 then
      storage.loadedWaypoints = waypointsTable["Magical Forest Dungeon"].floorFive
    elseif newPos.z == 6 then
      storage.loadedWaypoints = waypointsTable["Magical Forest Dungeon"].floorSix
    elseif newPos.z == 7 then
      storage.loadedWaypoints = waypointsTable["Magical Forest Dungeon"].floorSeven
    elseif newPos.z == 8 then
      storage.loadedWaypoints = waypointsTable["Magical Forest Dungeon"].floorEight
    elseif newPos.z == 9 then
      storage.loadedWaypoints = waypointsTable["Magical Forest Dungeon"].floorNine
    elseif newPos.z == 10 then
      storage.loadedWaypoints = waypointsTable["Magical Forest Dungeon"].floorTen
    elseif newPos.z == 11 then
      storage.loadedWaypoints = waypointsTable["Magical Forest Dungeon"].floorEleven
    elseif newPos.z == 12 then
      storage.loadedWaypoints = waypointsTable["Magical Forest Dungeon"].floorTwelve
    else
      print("Invalid floor")
    end
  end)
end

local e = macro(500, "Desert Dungeon", function() end)
if e.isOn() then
  onPlayerPositionChange(function(newPos, oldPos)
    if newPos.z == 1 then
      storage.loadedWaypoints = waypointsTable["Desert Dungeon"].floorOne
    elseif newPos.z == 2 then
      storage.loadedWaypoints = waypointsTable["Desert Dungeon"].floorTwo
    elseif newPos.z == 3 then
      storage.loadedWaypoints = waypointsTable["Desert Dungeon"].floorThree
    elseif newPos.z == 4 then
      storage.loadedWaypoints = waypointsTable["Desert Dungeon"].floorFour
    elseif newPos.z == 5 then
      storage.loadedWaypoints = waypointsTable["Desert Dungeon"].floorFive
    elseif newPos.z == 6 then
      storage.loadedWaypoints = waypointsTable["Desert Dungeon"].floorSix
    elseif newPos.z == 7 then
      storage.loadedWaypoints = waypointsTable["Desert Dungeon"].floorSeven
    elseif newPos.z == 8 then
      storage.loadedWaypoints = waypointsTable["Desert Dungeon"].floorEight
    elseif newPos.z == 9 then
      storage.loadedWaypoints = waypointsTable["Desert Dungeon"].floorNine
    elseif newPos.z == 10 then
      storage.loadedWaypoints = waypointsTable["Desert Dungeon"].floorTen
    elseif newPos.z == 11 then
      storage.loadedWaypoints = waypointsTable["Desert Dungeon"].floorEleven
    elseif newPos.z == 12 then
      storage.loadedWaypoints = waypointsTable["Desert Dungeon"].floorTwelve
    else
      print("Invalid floor")
    end
  end)
end

local f = macro(500, "Undead Dungeon", function() end)
if f.isOn() then
  onPlayerPositionChange(function(newPos, oldPos)
    if newPos.z == 1 then
      storage.loadedWaypoints = waypointsTable["Undead Dungeon"].floorOne
    elseif newPos.z == 2 then
      storage.loadedWaypoints = waypointsTable["Undead Dungeon"].floorTwo
    elseif newPos.z == 3 then
      storage.loadedWaypoints = waypointsTable["Undead Dungeon"].floorThree
    elseif newPos.z == 4 then
      storage.loadedWaypoints = waypointsTable["Undead Dungeon"].floorFour
    elseif newPos.z == 5 then
      storage.loadedWaypoints = waypointsTable["Undead Dungeon"].floorFive
    elseif newPos.z == 6 then
      storage.loadedWaypoints = waypointsTable["Undead Dungeon"].floorSix
    elseif newPos.z == 7 then
      storage.loadedWaypoints = waypointsTable["Undead Dungeon"].floorSeven
    elseif newPos.z == 8 then
      storage.loadedWaypoints = waypointsTable["Undead Dungeon"].floorEight
    elseif newPos.z == 9 then
      storage.loadedWaypoints = waypointsTable["Undead Dungeon"].floorNine
    elseif newPos.z == 10 then
      storage.loadedWaypoints = waypointsTable["Undead Dungeon"].floorTen
    elseif newPos.z == 11 then
      storage.loadedWaypoints = waypointsTable["Undead Dungeon"].floorEleven
    elseif newPos.z == 12 then
      storage.loadedWaypoints = waypointsTable["Undead Dungeon"].floorTwelve
    else
      print("Invalid floor")
    end
  end)
end

if storage.loadedWaypoints == nil then
  storage.loadedWaypoints = waypointsTable["Default"].folder
end

UI.Separator()
