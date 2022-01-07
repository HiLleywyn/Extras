configName = "Auto-Follow"

if not storage[configName] then storage[configName] = { player = 'Tether', distance = 0, precision = 1, ignoreNonPathable = true} end

local toFollowPos = {}
local followChange = macro(200, function() end)

UI.Label("Auto-Follow Player")
followTE = UI.TextEdit(storage[configName].player or "Tether", function(widget, newText)
  storage[configName].player = newText
end)

UI.Label("Follow Distance")
distance = UI.TextEdit(storage[configName].distance or "0", function(widget, newText)
  storage[configName].distance = tonumber(newText)
end)

UI.Label("Follow Precision")
distance = UI.TextEdit(storage[configName].precision or "1", function(widget, newText)
  storage[configName].precision = tonumber(newText)
end)

local toggleNonPathable = macro(200, "Ignore Non-Pathable", function() end)

if toggleNonPathable.isOn() then
  storage[configName].ignoreNonPathable = true
elseif toggleNonPathable.isOff() then
  storage[configName].ignoreNonPathable = false
end

  local followMacro = macro(20, "Follow", function()
    local target = getCreatureByName(storage[configName].player)

    if target then
      local tpos = target:getPosition()
      toFollowPos[tpos.z] = tpos
    end
    if player:isWalking() then
      return
    end
    local p = toFollowPos[posz()]
    if not p then
      return
    end
    if autoWalk(p, 20, { ignoreNonPathable = storage[configName].ignoreNonPathable, precision = storage[configName].precision, marginMin = storage[configName].distance, marginMax = storage[configName].distance}) then
      delay(100)
    end
  end)
  UI.Separator()
  onPlayerPositionChange(function(newPos, oldPos)
    if followChange:isOff() then return end
    if (g_game.isFollowing()) then
      tfollow = g_game.getFollowingCreature()

      if tfollow then
        if tfollow:getName() ~= storage[configName].player then
          followTE:setText(tfollow:getName())
          storage[configName].player = tfollow:getName()
        end
      end
    end
  end)

  onCreaturePositionChange(function(creature, newPos, oldPos)
    if creature:getName() == storage[configName].player and newPos then
    toFollowPos[newPos.z] = newPos
  end
end)
