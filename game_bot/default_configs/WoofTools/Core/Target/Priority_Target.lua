TargetBot.Creature.calculatePriority = function(creature, config, path)
  -- config is based on creature_editor
  local priority = 0

  -- extra priority if it's current target
  -- if g_game.getAttackingCreature() == creature then
  --   priority = priority + 1
  -- end

  -- check if distance is fine, if not then attack only if already attacked
  if #path > config.maxDistance then
    return priority
  end

  -- add config priority
  priority = priority + config.priority

  -- Calculate priority based on monster level.
  local creatureName = creature:getName()
  if Libraries.Strings.getFirstNumber(creatureName) ~= nil then
    if Libraries.Strings.getFirstNumber(creatureName) >= 5000 then
      priority = priority + 5
    elseif Libraries.Strings.getFirstNumber(creatureName) <= 4750 then
      priority = priority + 4.7
    elseif Libraries.Strings.getFirstNumber(creatureName) <= 4500 then
      priority = priority + 4.5
    elseif Libraries.Strings.getFirstNumber(creatureName) <= 4250 then
      priority = priority + 4.2
    elseif Libraries.Strings.getFirstNumber(creatureName) <= 4000 then
      priority = priority + 4.0
    elseif Libraries.Strings.getFirstNumber(creatureName) <= 3750 then
      priority = priority + 3.7
    elseif Libraries.Strings.getFirstNumber(creatureName) <= 3500 then
      priority = priority + 3.5
    elseif Libraries.Strings.getFirstNumber(creatureName) <= 3250 then
      priority = priority + 3.2
    elseif Libraries.Strings.getFirstNumber(creatureName) <= 3000 then
      priority = priority + 3.0
    elseif Libraries.Strings.getFirstNumber(creatureName) <= 2750 then
      priority = priority + 2.7
    elseif Libraries.Strings.getFirstNumber(creatureName) <= 2500 then
      priority = priority + 2.5
    elseif Libraries.Strings.getFirstNumber(creatureName) <= 2250 then
      priority = priority + 2.2
    elseif Libraries.Strings.getFirstNumber(creatureName) <= 2000 then
      priority = priority + 2.0
    elseif Libraries.Strings.getFirstNumber(creatureName) <= 1750 then
      priority = priority + 1.7
    elseif Libraries.Strings.getFirstNumber(creatureName) <= 1500 then
      priority = priority + 1.5
    elseif Libraries.Strings.getFirstNumber(creatureName) <= 1250 then
      priority = priority + 1.2
    elseif Libraries.Strings.getFirstNumber(creatureName) <= 1000 then
      priority = priority + 1.0
    elseif Libraries.Strings.getFirstNumber(creatureName) <= 750 then
      priority = priority + 0.7
    elseif Libraries.Strings.getFirstNumber(creatureName) <= 500 then
      priority = priority + 0.5
    elseif Libraries.Strings.getFirstNumber(creatureName) <= 250 then
      priority = priority + 0.2
    else
      priority = priority
    end
  else
    priority = priority
  end

  -- Calculate priority based on monster distance.
  local path_length = #path
  if path_length == 1 then
    priority = priority + 5
  elseif path_length <= 2 then
    priority = priority + 2.0
  elseif path_length <= 3 then
    priority = priority + 1.5
  elseif path_length <= 4 then
    priority = priority + 1.0
  elseif path_length <= 5 then
    priority = priority + 0.9
  elseif path_length <= 6 then
    priority = priority + 0.8
  elseif path_length <= 7 then
    priority = priority + 0.7
  elseif path_length <= 8 then
    priority = priority + 0.6
  elseif path_length <= 9 then
    priority = priority + 0.5
  elseif path_length <= 10 then
    priority = priority + 0.4
  else
    priority = priority
  end

  -- Calculate priority based on monster health.
  if creature:getHealthPercent() < 5 then
    priority = priority + 2.5
  elseif creature:getHealthPercent() < 10 then
    priority = priority + 2.0
  elseif creature:getHealthPercent() < 20 then
    priority = priority + 1.5
  elseif creature:getHealthPercent() < 30 then
    priority = priority + 1.0
  elseif creature:getHealthPercent() < 40 then
    priority = priority + 0.9
  elseif creature:getHealthPercent() < 45 then
    priority = priority + 0.8
  elseif creature:getHealthPercent() < 50 then
    priority = priority + 0.7
  elseif creature:getHealthPercent() < 60 then
    priority = priority + 0.6
  elseif creature:getHealthPercent() < 70 then
    priority = priority + 0.5
  elseif creature:getHealthPercent() < 80 then
    priority = priority + 0.4
  elseif creature:getHealthPercent() < 90 then
    priority = priority + 0.3
  else
    priority = priority
  end
  return priority
end
