CaveBot.Editor.Dungeons = {}

local function addDungeonFunction(title, text)
  return table.insert(CaveBot.Editor.Dungeons, {title, text:trim()})
end

addDungeonFunction("Join Magical Forest Dungeon", [[
--Join Magical Forest Dungeon

local npc = getCreatureByName("Dungeonslave")
if not npc then
  return false
end

NPC.say("Hi")
NPC.say("Dungeon")
delay(200)

schedule(1000, function()
  NPC.say("Magical Forest")
end)

delay(1200)

NPC.say("Bye")

return true
]])

addDungeonFunction("Join Desert Dungeon", [[
--Join Desert Dungeon
local npc = getCreatureByName("Dungeonslave")
if not npc then
  return false
end

NPC.say("Hi")
NPC.say("Dungeon")
delay(200)

schedule(1000, function()
  NPC.say("Desert")
end)

delay(1200)

NPC.say("Bye")

return true
]])

addDungeonFunction("Join Undead Dungeon", [[
--Join Undead Dungeon
local npc = getCreatureByName("Dungeonslave")
if not npc then
  return false
end

NPC.say("Hi")
NPC.say("Dungeon")
delay(200)

schedule(1000, function()
  NPC.say("Undead")
end)

delay(1200)

NPC.say("Bye")

return true
]])
