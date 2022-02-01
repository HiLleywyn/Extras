CaveBot.Editor.Dungeons = {}

local function addDungeonFunction(title, text)
  return table.insert(CaveBot.Editor.Dungeons, {title, text:trim()})
end

addDungeonFunction("Join Magical Forest Dungeon", [[
--Join Magical Forest Dungeon

local npc = getCreatureByName("Dungeonslave", 10000)
if not npc then
  return false
end

Libraries.NPCs.scheduleNpcSay("Hi", 10000)
Libraries.NPCs.scheduleNpcSay("Magical Forest", 10000)
Libraries.NPCs.scheduleNpcSay("Bye", 10000)

return true
]])

addDungeonFunction("Join Desert Dungeon", [[
--Join Desert Dungeon
local npc = getCreatureByName("Dungeonslave", 10000)
if not npc then
  return false
end

Libraries.NPCs.scheduleNpcSay("Hi", 10000)
Libraries.NPCs.scheduleNpcSay("Desert", 10000)
Libraries.NPCs.scheduleNpcSay("Bye", 10000)

return true
]])

addDungeonFunction("Join Undead Dungeon", [[
--Join Undead Dungeon
local npc = getCreatureByName("Dungeonslave", 10000)
if not npc then
  return false
end

Libraries.NPCs.scheduleNpcSay("Hi", 10000)
Libraries.NPCs.scheduleNpcSay("Undead", 10000)
Libraries.NPCs.scheduleNpcSay("Bye", 1000

return true
]])
