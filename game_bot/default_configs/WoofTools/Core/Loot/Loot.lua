UI.Separator()
UI.Label("Loot Tools")
UI.Separator()
local clearAutoLoot = macro(500, "Auto-Clear Loot", function() end)
local sellLoot = macro(1000, "Auto-Sell Loot", function()
  if not getContainer(0) then
    use(getBack())
  end
  for i, creature in ipairs(g_map.getSpectatorsInRange(pos(), false, 3, 3)) do
    if creature:getName() == 'Lootslave' and getDistanceBetween(creature:getPosition(), pos()) < 4 and modules.game_npctrade.npcWindow and not modules.game_npctrade.npcWindow:isVisible() then
      NPC.say('hi')
      NPC.say('trade')
      return
    elseif modules.game_npctrade.npcWindow:isVisible() and modules.game_npctrade.npcWindow.sellAllButton:isEnabled() then
      NPC.sellAll()
      return
    end
  end
end)

sellLoot.setOff()
onAddThing(function(tile, thing)
  if thing:isCreature() and thing:getName() == 'Lootslave' then
    sellLoot.setOn()
  elseif modules.game_npctrade.npcWindow:isVisible() and not modules.game_npctrade.npcWindow.sellAllButton:isEnabled() then
    sellLoot.setOff()
    NPC.closeTrade()
  end
end)

onRemoveThing(function(tile, thing)
  if sellLoot.isOn() and thing:isCreature() and thing:getName() == 'Lootslave' then
    sellLoot.setOff()
  end
end)

UI.Button(
  "Show AutoLoot",
  function()
    say("!autoloot show")
  end
)

UI.Button(
  "Open Loot Bag",
  function()
    say("!lootbag")
  end
)
UI.Separator()

UI.Separator()
UI.Label("Other Loot")
UI.Label("(Doesn't erase loot list.)")
UI.Separator()
for _, item in ipairs(Loot.Other) do
  UI.Separator()
  UI.Label(item.name)
  for _, list in ipairs(item.lists) do
    UI.Button(
      list.name,
      function()
        itemArray = list.loot
        for key, value in ipairs(itemArray) do
          say("!autoloot add, " .. value)
        end
      end
    )
  end
end

UI.Separator()


UI.Separator()
UI.Label("Monster Loot")
UI.Separator()
for _, item in ipairs(Loot.Monsters) do
  UI.Separator()
  UI.Label(item.name)
  for _, list in ipairs(item.lists) do
    UI.Button(
      list.name,
      function()
        if clearAutoLoot.isOn() then
          say("!autoloot clear")
        end
        itemArray = list.loot
        for key, value in ipairs(itemArray) do
          say("!autoloot add, " .. value)
        end
      end
    )
  end
end
UI.Separator()
