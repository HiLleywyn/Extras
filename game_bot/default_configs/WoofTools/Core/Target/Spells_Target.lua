UI.Separator()

local distance = 4
local amountOfMonsters = 2
macro(1000, "Multi-Target Spells",  function()
    local specAmount = 0
    if not g_game.isAttacking() then
        return
    end
    for i,mob in ipairs(getSpectators()) do
        if (getDistanceBetween(player:getPosition(), mob:getPosition())  <= distance and mob:isMonster())  then
            specAmount = specAmount + 1
        end
    end
    if (specAmount >= amountOfMonsters) then
        say(storage.Spell2, 250)
    else
        say(storage.Spell1, 250)
    end
end)
UI.TextEdit(storage.Spell1 or "Exori Gran Pura", function(widget, text)
storage.Spell1 = text
end)
UI.TextEdit(storage.Spell2 or "Exevo Mas Frigo", function(widget, text)
storage.Spell2 = text
end)

UI.Separator()
