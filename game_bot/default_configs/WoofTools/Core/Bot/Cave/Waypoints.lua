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
  ["Move to DR"] = {
    waypoint = "/Configs/Cave/Dungeons/Move_to_DR"
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
  ["Toxic Dungeon"] = {
    floorOne = "/Configs/Cave/Dungeons/Toxic/1",
    floorTwo = "/Configs/Cave/Dungeons/Toxic/2",
    floorThree = "/Configs/Cave/Dungeons/Toxic/3",
    floorFour = "/Configs/Cave/Dungeons/Toxic/4",
    floorFive = "/Configs/Cave/Dungeons/Toxic/5",
    floorSix = "/Configs/Cave/Dungeons/Toxic/6",
    floorSeven = "/Configs/Cave/Dungeons/Toxic/7",
    floorEight = "/Configs/Cave/Dungeons/Toxic/8",
    floorNine = "/Configs/Cave/Dungeons/Toxic/9",
    floorTen = "/Configs/Cave/Dungeons/Toxic/10",
    floorEleven = "/Configs/Cave/Dungeons/Toxic/11",
    floorTwelve = "/Configs/Cave/Dungeons/Toxic/12",
  },
  ["Winter Dungeon"] = {
    floorOne = "/Configs/Cave/Dungeons/Winter/1",
    floorTwo = "/Configs/Cave/Dungeons/Winter/2",
    floorThree = "/Configs/Cave/Dungeons/Winter/3",
    floorFour = "/Configs/Cave/Dungeons/Winter/4",
    floorFive = "/Configs/Cave/Dungeons/Winter/5",
    floorSix = "/Configs/Cave/Dungeons/Winter/6",
    floorSeven = "/Configs/Cave/Dungeons/Winter/7",
    floorEight = "/Configs/Cave/Dungeons/Winter/8",
    floorNine = "/Configs/Cave/Dungeons/Winter/9",
    floorTen = "/Configs/Cave/Dungeons/Winter/10",
    floorEleven = "/Configs/Cave/Dungeons/Winter/11",
    floorTwelve = "/Configs/Cave/Dungeons/Winter/12",
  },
  ["Demonic Dungeon"] = {
    floorOne = "/Configs/Cave/Dungeons/Demonic/1",
    floorTwo = "/Configs/Cave/Dungeons/Demonic/2",
    floorThree = "/Configs/Cave/Dungeons/Demonic/3",
    floorFour = "/Configs/Cave/Dungeons/Demonic/4",
    floorFive = "/Configs/Cave/Dungeons/Demonic/5",
    floorSix = "/Configs/Cave/Dungeons/Demonic/6",
    floorSeven = "/Configs/Cave/Dungeons/Demonic/7",
    floorEight = "/Configs/Cave/Dungeons/Demonic/8",
    floorNine = "/Configs/Cave/Dungeons/Demonic/9",
    floorTen = "/Configs/Cave/Dungeons/Demonic/10",
    floorEleven = "/Configs/Cave/Dungeons/Demonic/11",
    floorTwelve = "/Configs/Cave/Dungeons/Demonic/12",
  },
  ["Blood Dungeon"] = {
    floorOne = "/Configs/Cave/Dungeons/Blood/1",
    floorTwo = "/Configs/Cave/Dungeons/Blood/2",
    floorThree = "/Configs/Cave/Dungeons/Blood/3",
    floorFour = "/Configs/Cave/Dungeons/Blood/4",
    floorFive = "/Configs/Cave/Dungeons/Blood/5",
    floorSix = "/Configs/Cave/Dungeons/Blood/6",
    floorSeven = "/Configs/Cave/Dungeons/Blood/7",
    floorEight = "/Configs/Cave/Dungeons/Blood/8",
    floorNine = "/Configs/Cave/Dungeons/Blood/9",
    floorTen = "/Configs/Cave/Dungeons/Blood/10",
    floorEleven = "/Configs/Cave/Dungeons/Blood/11",
    floorTwelve = "/Configs/Cave/Dungeons/Blood/12",
  },
  ["Wasteland Dungeon"] = {
    floorOne = "/Configs/Cave/Dungeons/Wasteland/1",
    floorTwo = "/Configs/Cave/Dungeons/Wasteland/2",
    floorThree = "/Configs/Cave/Dungeons/Wasteland/3",
    floorFour = "/Configs/Cave/Dungeons/Wasteland/4",
    floorFive = "/Configs/Cave/Dungeons/Wasteland/5",
    floorSix = "/Configs/Cave/Dungeons/Wasteland/6",
    floorSeven = "/Configs/Cave/Dungeons/Wasteland/7",
    floorEight = "/Configs/Cave/Dungeons/Wasteland/8",
    floorNine = "/Configs/Cave/Dungeons/Wasteland/9",
    floorTen = "/Configs/Cave/Dungeons/Wasteland/10",
    floorEleven = "/Configs/Cave/Dungeons/Wasteland/11",
    floorTwelve = "/Configs/Cave/Dungeons/Wasteland/12",
  },
  ["Aquatic Dungeon"] = {
    floorOne = "/Configs/Cave/Dungeons/Aquatic/1",
    floorTwo = "/Configs/Cave/Dungeons/Aquatic/2",
    floorThree = "/Configs/Cave/Dungeons/Aquatic/3",
    floorFour = "/Configs/Cave/Dungeons/Aquatic/4",
    floorFive = "/Configs/Cave/Dungeons/Aquatic/5",
    floorSix = "/Configs/Cave/Dungeons/Aquatic/6",
    floorSeven = "/Configs/Cave/Dungeons/Aquatic/7",
    floorEight = "/Configs/Cave/Dungeons/Aquatic/8",
    floorNine = "/Configs/Cave/Dungeons/Aquatic/9",
    floorTen = "/Configs/Cave/Dungeons/Aquatic/10",
    floorEleven = "/Configs/Cave/Dungeons/Aquatic/11",
    floorTwelve = "/Configs/Cave/Dungeons/Aquatic/12",
  },
  ["Void Dungeon"] = {
    floorOne = "/Configs/Cave/Dungeons/Void/1",
    floorTwo = "/Configs/Cave/Dungeons/Void/2",
    floorThree = "/Configs/Cave/Dungeons/Void/3",
    floorFour = "/Configs/Cave/Dungeons/Void/4",
    floorFive = "/Configs/Cave/Dungeons/Void/5",
    floorSix = "/Configs/Cave/Dungeons/Void/6",
    floorSeven = "/Configs/Cave/Dungeons/Void/7",
    floorEight = "/Configs/Cave/Dungeons/Void/8",
    floorNine = "/Configs/Cave/Dungeons/Void/9",
    floorTen = "/Configs/Cave/Dungeons/Void/10",
    floorEleven = "/Configs/Cave/Dungeons/Void/11",
    floorTwelve = "/Configs/Cave/Dungeons/Void/12",
  },
  ["Ruins Dungeon"] = {
    floorOne = "/Configs/Cave/Dungeons/Ruins/1",
    floorTwo = "/Configs/Cave/Dungeons/Ruins/2",
    floorThree = "/Configs/Cave/Dungeons/Ruins/3",
    floorFour = "/Configs/Cave/Dungeons/Ruins/4",
    floorFive = "/Configs/Cave/Dungeons/Ruins/5",
    floorSix = "/Configs/Cave/Dungeons/Ruins/6",
    floorSeven = "/Configs/Cave/Dungeons/Ruins/7",
    floorEight = "/Configs/Cave/Dungeons/Ruins/8",
    floorNine = "/Configs/Cave/Dungeons/Ruins/9",
    floorTen = "/Configs/Cave/Dungeons/Ruins/10",
    floorEleven = "/Configs/Cave/Dungeons/Ruins/11",
    floorTwelve = "/Configs/Cave/Dungeons/Ruins/12",
  },
  ["Crystal Caverns Dungeon"] = {
    floorOne = "/Configs/Cave/Dungeons/Crystal_Caverns/1",
    floorTwo = "/Configs/Cave/Dungeons/Crystal_Caverns/2",
    floorThree = "/Configs/Cave/Dungeons/Crystal_Caverns/3",
    floorFour = "/Configs/Cave/Dungeons/Crystal_Caverns/4",
    floorFive = "/Configs/Cave/Dungeons/Crystal_Caverns/5",
    floorSix = "/Configs/Cave/Dungeons/Crystal_Caverns/6",
    floorSeven = "/Configs/Cave/Dungeons/Crystal_Caverns/7",
    floorEight = "/Configs/Cave/Dungeons/Crystal_Caverns/8",
    floorNine = "/Configs/Cave/Dungeons/Crystal_Caverns/9",
    floorTen = "/Configs/Cave/Dungeons/Crystal_Caverns/10",
    floorEleven = "/Configs/Cave/Dungeons/Crystal_Caverns/11",
    floorTwelve = "/Configs/Cave/Dungeons/Crystal_Caverns/12",
  },
  ["Default"] = {
    folder = "/Configs/Cave",
    func = function() setWaypoints("Default") end
  }
}

UI.Label("Floor Setup")
UI.Label("Does not work with 'Auto-Dungeon' enabled.")
UI.Label("Restart macros if changed.")
UI.Separator()

toggleFloorOne = macro(500, "Floor 1", function() end)
if toggleFloorOne.isOn() then
  waypointsTable[1].func()
end

toggleFloorTwo = macro(500, "Floor 2", function() end)
if toggleFloorTwo.isOn() then
  waypointsTable[2].func()
end

toggleFloorThree = macro(500, "Floor 3", function() end)
if toggleFloorThree.isOn() then
  waypointsTable[3].func()
end

UI.Separator()
UI.Label("Auto-Dungeon Setup")
UI.Label("Does not work with 'Floor X' enabled.")
UI.Label("Restart macros if changed.")
UI.Separator()

toggleMoveToDR = macro(500, "Move to DR", function() end)
if toggleMoveToDR.isOn() then
  storage.loadedWaypoints = waypointsTable["Move to DR"].waypoint
else
  print("Invalid floor")
end

toggleMagicalForest = macro(500, "Magical Forest Dungeon", function() end)
if toggleMagicalForest.isOn() then
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

toggleDesert = macro(500, "Desert Dungeon", function() end)
if toggleDesert.isOn() then
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

toggleUndead = macro(500, "Undead Dungeon", function() end)
if toggleUndead.isOn() then
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

toggleToxic = macro(500, "Toxic Dungeon", function() end)
if toggleToxic.isOn() then
  onPlayerPositionChange(function(newPos, oldPos)
    if newPos.z == 1 then
      storage.loadedWaypoints = waypointsTable["Toxic Dungeon"].floorOne
    elseif newPos.z == 2 then
      storage.loadedWaypoints = waypointsTable["Toxic Dungeon"].floorTwo
    elseif newPos.z == 3 then
      storage.loadedWaypoints = waypointsTable["Toxic Dungeon"].floorThree
    elseif newPos.z == 4 then
      storage.loadedWaypoints = waypointsTable["Toxic Dungeon"].floorFour
    elseif newPos.z == 5 then
      storage.loadedWaypoints = waypointsTable["Toxic Dungeon"].floorFive
    elseif newPos.z == 6 then
      storage.loadedWaypoints = waypointsTable["Toxic Dungeon"].floorSix
    elseif newPos.z == 7 then
      storage.loadedWaypoints = waypointsTable["Toxic Dungeon"].floorSeven
    elseif newPos.z == 8 then
      storage.loadedWaypoints = waypointsTable["Toxic Dungeon"].floorEight
    elseif newPos.z == 9 then
      storage.loadedWaypoints = waypointsTable["Toxic Dungeon"].floorNine
    elseif newPos.z == 10 then
      storage.loadedWaypoints = waypointsTable["Toxic Dungeon"].floorTen
    elseif newPos.z == 11 then
      storage.loadedWaypoints = waypointsTable["Toxic Dungeon"].floorEleven
    elseif newPos.z == 12 then
      storage.loadedWaypoints = waypointsTable["Toxic Dungeon"].floorTwelve
    else
      print("Invalid floor")
    end
  end)
end

toggleWinter = macro(500, "Winter Dungeon", function() end)
if toggleWinter.isOn() then
  onPlayerPositionChange(function(newPos, oldPos)
    if newPos.z == 1 then
      storage.loadedWaypoints = waypointsTable["Winter Dungeon"].floorOne
    elseif newPos.z == 2 then
      storage.loadedWaypoints = waypointsTable["Winter Dungeon"].floorTwo
    elseif newPos.z == 3 then
      storage.loadedWaypoints = waypointsTable["Winter Dungeon"].floorThree
    elseif newPos.z == 4 then
      storage.loadedWaypoints = waypointsTable["Winter Dungeon"].floorFour
    elseif newPos.z == 5 then
      storage.loadedWaypoints = waypointsTable["Winter Dungeon"].floorFive
    elseif newPos.z == 6 then
      storage.loadedWaypoints = waypointsTable["Winter Dungeon"].floorSix
    elseif newPos.z == 7 then
      storage.loadedWaypoints = waypointsTable["Winter Dungeon"].floorSeven
    elseif newPos.z == 8 then
      storage.loadedWaypoints = waypointsTable["Winter Dungeon"].floorEight
    elseif newPos.z == 9 then
      storage.loadedWaypoints = waypointsTable["Winter Dungeon"].floorNine
    elseif newPos.z == 10 then
      storage.loadedWaypoints = waypointsTable["Winter Dungeon"].floorTen
    elseif newPos.z == 11 then
      storage.loadedWaypoints = waypointsTable["Winter Dungeon"].floorEleven
    elseif newPos.z == 12 then
      storage.loadedWaypoints = waypointsTable["Winter Dungeon"].floorTwelve
    else
      print("Invalid floor")
    end
  end)
end

toggleDemonic = macro(500, "Demonic Dungeon", function() end)
if toggleDemonic.isOn() then
  onPlayerPositionChange(function(newPos, oldPos)
    if newPos.z == 1 then
      storage.loadedWaypoints = waypointsTable["Demonic Dungeon"].floorOne
    elseif newPos.z == 2 then
      storage.loadedWaypoints = waypointsTable["Demonic Dungeon"].floorTwo
    elseif newPos.z == 3 then
      storage.loadedWaypoints = waypointsTable["Demonic Dungeon"].floorThree
    elseif newPos.z == 4 then
      storage.loadedWaypoints = waypointsTable["Demonic Dungeon"].floorFour
    elseif newPos.z == 5 then
      storage.loadedWaypoints = waypointsTable["Demonic Dungeon"].floorFive
    elseif newPos.z == 6 then
      storage.loadedWaypoints = waypointsTable["Demonic Dungeon"].floorSix
    elseif newPos.z == 7 then
      storage.loadedWaypoints = waypointsTable["Demonic Dungeon"].floorSeven
    elseif newPos.z == 8 then
      storage.loadedWaypoints = waypointsTable["Demonic Dungeon"].floorEight
    elseif newPos.z == 9 then
      storage.loadedWaypoints = waypointsTable["Demonic Dungeon"].floorNine
    elseif newPos.z == 10 then
      storage.loadedWaypoints = waypointsTable["Demonic Dungeon"].floorTen
    elseif newPos.z == 11 then
      storage.loadedWaypoints = waypointsTable["Demonic Dungeon"].floorEleven
    elseif newPos.z == 12 then
      storage.loadedWaypoints = waypointsTable["Demonic Dungeon"].floorTwelve
    else
      print("Invalid floor")
    end
  end)
end

toggleBlood = macro(500, "Blood Dungeon", function() end)
if toggleBlood.isOn() then
  onPlayerPositionChange(function(newPos, oldPos)
    if newPos.z == 1 then
      storage.loadedWaypoints = waypointsTable["Blood Dungeon"].floorOne
    elseif newPos.z == 2 then
      storage.loadedWaypoints = waypointsTable["Blood Dungeon"].floorTwo
    elseif newPos.z == 3 then
      storage.loadedWaypoints = waypointsTable["Blood Dungeon"].floorThree
    elseif newPos.z == 4 then
      storage.loadedWaypoints = waypointsTable["Blood Dungeon"].floorFour
    elseif newPos.z == 5 then
      storage.loadedWaypoints = waypointsTable["Blood Dungeon"].floorFive
    elseif newPos.z == 6 then
      storage.loadedWaypoints = waypointsTable["Blood Dungeon"].floorSix
    elseif newPos.z == 7 then
      storage.loadedWaypoints = waypointsTable["Blood Dungeon"].floorSeven
    elseif newPos.z == 8 then
      storage.loadedWaypoints = waypointsTable["Blood Dungeon"].floorEight
    elseif newPos.z == 9 then
      storage.loadedWaypoints = waypointsTable["Blood Dungeon"].floorNine
    elseif newPos.z == 10 then
      storage.loadedWaypoints = waypointsTable["Blood Dungeon"].floorTen
    elseif newPos.z == 11 then
      storage.loadedWaypoints = waypointsTable["Blood Dungeon"].floorEleven
    elseif newPos.z == 12 then
      storage.loadedWaypoints = waypointsTable["Blood Dungeon"].floorTwelve
    else
      print("Invalid floor")
    end
  end)
end

toggleWasteland = macro(500, "Wasteland Dungeon", function() end)
if toggleWasteland.isOn() then
  onPlayerPositionChange(function(newPos, oldPos)
    if newPos.z == 1 then
      storage.loadedWaypoints = waypointsTable["Wasteland Dungeon"].floorOne
    elseif newPos.z == 2 then
      storage.loadedWaypoints = waypointsTable["Wasteland Dungeon"].floorTwo
    elseif newPos.z == 3 then
      storage.loadedWaypoints = waypointsTable["Wasteland Dungeon"].floorThree
    elseif newPos.z == 4 then
      storage.loadedWaypoints = waypointsTable["Wasteland Dungeon"].floorFour
    elseif newPos.z == 5 then
      storage.loadedWaypoints = waypointsTable["Wasteland Dungeon"].floorFive
    elseif newPos.z == 6 then
      storage.loadedWaypoints = waypointsTable["Wasteland Dungeon"].floorSix
    elseif newPos.z == 7 then
      storage.loadedWaypoints = waypointsTable["Wasteland Dungeon"].floorSeven
    elseif newPos.z == 8 then
      storage.loadedWaypoints = waypointsTable["Wasteland Dungeon"].floorEight
    elseif newPos.z == 9 then
      storage.loadedWaypoints = waypointsTable["Wasteland Dungeon"].floorNine
    elseif newPos.z == 10 then
      storage.loadedWaypoints = waypointsTable["Wasteland Dungeon"].floorTen
    elseif newPos.z == 11 then
      storage.loadedWaypoints = waypointsTable["Wasteland Dungeon"].floorEleven
    elseif newPos.z == 12 then
      storage.loadedWaypoints = waypointsTable["Wasteland Dungeon"].floorTwelve
    else
      print("Invalid floor")
    end
  end)
end

toggleAquatic = macro(500, "Aquatic Dungeon", function() end)
if toggleAquatic.isOn() then
  onPlayerPositionChange(function(newPos, oldPos)
    if newPos.z == 1 then
      storage.loadedWaypoints = waypointsTable["Aquatic Dungeon"].floorOne
    elseif newPos.z == 2 then
      storage.loadedWaypoints = waypointsTable["Aquatic Dungeon"].floorTwo
    elseif newPos.z == 3 then
      storage.loadedWaypoints = waypointsTable["Aquatic Dungeon"].floorThree
    elseif newPos.z == 4 then
      storage.loadedWaypoints = waypointsTable["Aquatic Dungeon"].floorFour
    elseif newPos.z == 5 then
      storage.loadedWaypoints = waypointsTable["Aquatic Dungeon"].floorFive
    elseif newPos.z == 6 then
      storage.loadedWaypoints = waypointsTable["Aquatic Dungeon"].floorSix
    elseif newPos.z == 7 then
      storage.loadedWaypoints = waypointsTable["Aquatic Dungeon"].floorSeven
    elseif newPos.z == 8 then
      storage.loadedWaypoints = waypointsTable["Aquatic Dungeon"].floorEight
    elseif newPos.z == 9 then
      storage.loadedWaypoints = waypointsTable["Aquatic Dungeon"].floorNine
    elseif newPos.z == 10 then
      storage.loadedWaypoints = waypointsTable["Aquatic Dungeon"].floorTen
    elseif newPos.z == 11 then
      storage.loadedWaypoints = waypointsTable["Aquatic Dungeon"].floorEleven
    elseif newPos.z == 12 then
      storage.loadedWaypoints = waypointsTable["Aquatic Dungeon"].floorTwelve
    else
      print("Invalid floor")
    end
  end)
end

toggleVoid = macro(500, "Void Dungeon", function() end)
if toggleVoid.isOn() then
  onPlayerPositionChange(function(newPos, oldPos)
    if newPos.z == 1 then
      storage.loadedWaypoints = waypointsTable["Void Dungeon"].floorOne
    elseif newPos.z == 2 then
      storage.loadedWaypoints = waypointsTable["Void Dungeon"].floorTwo
    elseif newPos.z == 3 then
      storage.loadedWaypoints = waypointsTable["Void Dungeon"].floorThree
    elseif newPos.z == 4 then
      storage.loadedWaypoints = waypointsTable["Void Dungeon"].floorFour
    elseif newPos.z == 5 then
      storage.loadedWaypoints = waypointsTable["Void Dungeon"].floorFive
    elseif newPos.z == 6 then
      storage.loadedWaypoints = waypointsTable["Void Dungeon"].floorSix
    elseif newPos.z == 7 then
      storage.loadedWaypoints = waypointsTable["Void Dungeon"].floorSeven
    elseif newPos.z == 8 then
      storage.loadedWaypoints = waypointsTable["Void Dungeon"].floorEight
    elseif newPos.z == 9 then
      storage.loadedWaypoints = waypointsTable["Void Dungeon"].floorNine
    elseif newPos.z == 10 then
      storage.loadedWaypoints = waypointsTable["Void Dungeon"].floorTen
    elseif newPos.z == 11 then
      storage.loadedWaypoints = waypointsTable["Void Dungeon"].floorEleven
    elseif newPos.z == 12 then
      storage.loadedWaypoints = waypointsTable["Void Dungeon"].floorTwelve
    else
      print("Invalid floor")
    end
  end)
end

toggleRuins = macro(500, "Ruins Dungeon", function() end)
if toggleRuins.isOn() then
  onPlayerPositionChange(function(newPos, oldPos)
    if newPos.z == 1 then
      storage.loadedWaypoints = waypointsTable["Ruins Dungeon"].floorOne
    elseif newPos.z == 2 then
      storage.loadedWaypoints = waypointsTable["Ruins Dungeon"].floorTwo
    elseif newPos.z == 3 then
      storage.loadedWaypoints = waypointsTable["Ruins Dungeon"].floorThree
    elseif newPos.z == 4 then
      storage.loadedWaypoints = waypointsTable["Ruins Dungeon"].floorFour
    elseif newPos.z == 5 then
      storage.loadedWaypoints = waypointsTable["Ruins Dungeon"].floorFive
    elseif newPos.z == 6 then
      storage.loadedWaypoints = waypointsTable["Ruins Dungeon"].floorSix
    elseif newPos.z == 7 then
      storage.loadedWaypoints = waypointsTable["Ruins Dungeon"].floorSeven
    elseif newPos.z == 8 then
      storage.loadedWaypoints = waypointsTable["Ruins Dungeon"].floorEight
    elseif newPos.z == 9 then
      storage.loadedWaypoints = waypointsTable["Ruins Dungeon"].floorNine
    elseif newPos.z == 10 then
      storage.loadedWaypoints = waypointsTable["Ruins Dungeon"].floorTen
    elseif newPos.z == 11 then
      storage.loadedWaypoints = waypointsTable["Ruins Dungeon"].floorEleven
    elseif newPos.z == 12 then
      storage.loadedWaypoints = waypointsTable["Ruins Dungeon"].floorTwelve
    else
      print("Invalid floor")
    end
  end)
end

toggleCrystalCaverns = macro(500, "Crystal Caverns Dungeon", function() end)
if toggleCrystalCaverns.isOn() then
  onPlayerPositionChange(function(newPos, oldPos)
    if newPos.z == 1 then
      storage.loadedWaypoints = waypointsTable["Crystal Caverns Dungeon"].floorOne
    elseif newPos.z == 2 then
      storage.loadedWaypoints = waypointsTable["Crystal Caverns Dungeon"].floorTwo
    elseif newPos.z == 3 then
      storage.loadedWaypoints = waypointsTable["Crystal Caverns Dungeon"].floorThree
    elseif newPos.z == 4 then
      storage.loadedWaypoints = waypointsTable["Crystal Caverns Dungeon"].floorFour
    elseif newPos.z == 5 then
      storage.loadedWaypoints = waypointsTable["Crystal Caverns Dungeon"].floorFive
    elseif newPos.z == 6 then
      storage.loadedWaypoints = waypointsTable["Crystal Caverns Dungeon"].floorSix
    elseif newPos.z == 7 then
      storage.loadedWaypoints = waypointsTable["Crystal Caverns Dungeon"].floorSeven
    elseif newPos.z == 8 then
      storage.loadedWaypoints = waypointsTable["Crystal Caverns Dungeon"].floorEight
    elseif newPos.z == 9 then
      storage.loadedWaypoints = waypointsTable["Crystal Caverns Dungeon"].floorNine
    elseif newPos.z == 10 then
      storage.loadedWaypoints = waypointsTable["Crystal Caverns Dungeon"].floorTen
    elseif newPos.z == 11 then
      storage.loadedWaypoints = waypointsTable["Crystal Caverns Dungeon"].floorEleven
    elseif newPos.z == 12 then
      storage.loadedWaypoints = waypointsTable["Crystal Caverns Dungeon"].floorTwelve
    else
      print("Invalid floor")
    end
  end)
end

if storage.loadedWaypoints == nil then
  storage.loadedWaypoints = waypointsTable["Default"].folder
end

UI.Separator()
