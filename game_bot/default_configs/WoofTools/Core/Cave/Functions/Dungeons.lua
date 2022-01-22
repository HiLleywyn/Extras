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
NPC.say("Magical Forest")
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
NPC.say("Desert")
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
NPC.say("Undead")
NPC.say("Bye")

return true
]])
