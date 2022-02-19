CaveBot.Editor.Player = {}

local function addPlayerFunction(title, text)
  return table.insert(CaveBot.Editor.Player, {title, text:trim()})
end

addPlayerFunction("Check Capacity", [[
--Check Player Capacity <= x

if freecap() <= 5000 then
  CaveBot.gotoLabel("Sell Loot")
  return true
end

CaveBot.gotoLabel("Start")
return false
]])
