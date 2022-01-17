local distance = 1
local amountOfMonsters = 1

local tauntMonsters = macro(5000, "Taunt Monsters",  function()
  if vocation() ~= 1 then return end
  local spell = "exeta res"
  if lvl() >= 400 then
    spell = "exeta mas res"
  end
  local specAmount = 0
  if not g_game.isAttacking() then
    return
  end
  for i,mob in ipairs(getSpectators()) do
    if (getDistanceBetween(player:getPosition(), mob:getPosition())  <= distance and mob:isMonster())  then
      specAmount = specAmount + 1
    end
  end
  if (specAmount >= amountOfMonsters) and mana() > 30 then
    say(spell)
  end
end)
