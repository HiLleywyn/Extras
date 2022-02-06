TargetBot.Creature.attack = function(params, targets, isLooting) -- params {config, creature, danger, priority}
    if player:isWalking() then lastWalk = now end

local config = params.config
local creature = params.creature
local skulls_array = { 1, 2, 3, 4, 5, 6 }
local skull_black = 5
local skull_found = false

local distance = 6
local lowest_health = 101
local tNpc = nil


for _, spec in pairs(getSpectators()) do
    if spec:isMonster() then
        if getDistanceBetween(player:getPosition(), spec:getPosition()) <= distance then
            local pSkull = spec:getSkull()
            if table.find(skulls_array, pSkull) then
                tNpc = spec
                skull_found = true
                if pSkull == skull_black then
                    break
                end
            else
                if spec:getHealthPercent() < lowest_health and not skull_found then
                    lowest_health = spec:getHealthPercent()
                    tNpc = spec
                end
            end
        end
    end
end

if g_game.getAttackingCreature() ~= creature then
    local creatureName = creature:getName()
    if string.find(creatureName, "Training Monk") then
        g_game.attack(creature)
    else
        if getDistanceBetween(player:getPosition(), tNpc:getPosition()) <= distance then
            if (g_game.getAttackingCreature() ~= tNpc) then
                if skull_found or tNpc:getHealthPercent() <= lowest_health then
                    g_game.attack(tNpc)
                end
            end
        end
    end
end

if not isLooting then -- walk only when not looting
    TargetBot.Creature.walk(creature, config, targets)
end
end

TargetBot.Creature.walk = function(creature, config, targets)
    local cpos = creature:getPosition()
    local pos = player:getPosition()

    local isTrapped = true
    local pos = player:getPosition()
    local dirs = {{ - 1, 1}, {0, 1}, {1, 1}, { - 1, 0}, {1, 0}, { - 1, - 1}, {0, - 1}, {1, - 1}}
    for i = 1, #dirs do
        local tile = g_map.getTile({x = pos.x - dirs[i][1], y = pos.y - dirs[i][2], z = pos.z})
        if tile and tile:isWalkable(false) then
            isTrapped = false
        end
    end

    -- luring
    if TargetBot.canLure() and (config.lure or config.lureCavebot) and not (config.chase and creature:getHealthPercent() < 30) and not isTrapped then
        local monsters = 0
        if targets < config.lureCount then
            if config.lureCavebot then
                return TargetBot.allowCaveBot(300)
            else
                local path = findPath(pos, cpos, 5, {ignoreNonPathable = true, precision = 2})
                if path then
                    return TargetBot.walkTo(cpos, 10, {marginMin = 5, marginMax = 6, ignoreNonPathable = true})
                end
            end
        end
    end

    local currentDistance = findPath(pos, cpos, 10, {ignoreCreatures = true, ignoreNonPathable = true, ignoreCost = true})
    if config.chase and (creature:getHealthPercent() < 30 or not config.keepDistance) then
        if #currentDistance > 1 then
            return TargetBot.walkTo(cpos, 10, {ignoreNonPathable = true, precision = 1})
        end
    elseif config.keepDistance then
        if #currentDistance ~= config.keepDistanceRange and #currentDistance ~= config.keepDistanceRange + 1 then
            return TargetBot.walkTo(cpos, 10, {ignoreNonPathable = true, marginMin = config.keepDistanceRange, marginMax = config.keepDistanceRange + 1})
        end
    end

    if config.avoidAttacks then
        local diffx = cpos.x - pos.x
        local diffy = cpos.y - pos.y
        local candidates = {}
        if math.abs(diffx) == 1 and diffy == 0 then
            candidates = {{x = pos.x, y = pos.y - 1, z = pos.z}, {x = pos.x, y = pos.y + 1, z = pos.z}}
        elseif diffx == 0 and math.abs(diffy) == 1 then
            candidates = {{x = pos.x - 1, y = pos.y, z = pos.z}, {x = pos.x + 1, y = pos.y, z = pos.z}}
        end
        for _, candidate in ipairs(candidates) do
            local tile = g_map.getTile(candidate)
            if tile and tile:isWalkable() then
                return TargetBot.walkTo(candidate, 2, {ignoreNonPathable = true})
            end
        end
    end
end
