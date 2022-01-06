-- Delete between these lines if you have these functions already in your scripts

walkButton = modules.game_luniabot.walkButton
lureButton = modules.game_luniabot.lureButton
atkButton = modules.game_luniabot.atkButton

function hasEffect(tile, effect)
    for i, fx in ipairs(tile:getEffects()) do
        if fx:getId() == effect then
            return true
        end
    end
    return false
end

function isReachablePosition(pos1, pos2)
    if (math.abs(pos1.x - pos2.x) <= 7) and (math.abs(pos1.y - pos2.y) <= 5) then

        local steps, result = g_map.findPath(pos1, pos2, 30, 2)
        if result == 0 then
            return true
        end
    end
    return false
end

function isReachableBox(pos1, pos2)
    if (math.abs(pos1.x - pos2.x) <= 7) and (math.abs(pos1.y - pos2.y) <= 5) then
        local neighbours = {
            { x = 0, y = -1, z = 0 },
            { x = -1, y = -1, z = 0 },
            { x = -1, y = 0, z = 0 },
            { x = -1, y = 1, z = 0 },
            { x = 0, y = 1, z = 0 },
            { x = 1, y = 1, z = 0 },
            { x = 1, y = 0, z = 0 },
            { x = 1, y = -1, z = 0 }
        }
        for k, v in pairs(neighbours) do
            local posN = { x = pos2.x + v.x, y = pos2.y + v.y, z = pos2.z + v.z }

            local steps, result = g_map.findPath(pos1, posN, 30, 2)
            if result == 0 then
                return true
            end
        end
    end
end
-- Delete end

useLunia = false

function changeWalk(val)
    if useLunia then
        walkButton:setChecked(val)
    else
        CaveBot.setOn(val)
    end
end
UI.Separator()
UI.Label("Collect Essences & Boxes - Open Invasion Portals")
local collecting = macro(500, "Collecting", function()
    for i, tile in ipairs(g_map.getTiles(posz())) do
        if (tile) then
            if (hasEffect(tile, 56)) then
                pPos = player:getPosition()
                itemPos = tile:getPosition()
                if (isReachablePosition(pPos, itemPos)) then
                    changeWalk(false);
                    autoWalk(tile:getPosition(), 100, { ignoreNonPathable = true });
                    schedule(3000, function()
                        changeWalk(true);
                    end);
                    return
                end
            end
            for u, item in ipairs(tile:getItems()) do
                if (item) then
                    if (item:getId() == 9586) then
                        pPos = player:getPosition()
                        itemPos = item:getPosition()

                        if (isReachableBox(pPos, itemPos)) then
                            changeWalk(false);
                            g_game.use(item)
                            autoWalk(tile:getPosition(), 100, { ignoreNonPathable = true });
                            schedule(2000, function()
                                changeWalk(true);
                            end);
                            return
                        end
                    end
                    if (item:getId() == 25058) then
                        -- Portals 25058
                        pPos = player:getPosition()
                        itemPos = item:getPosition()
                        if (isReachablePosition(pPos, itemPos)) then
                            changeWalk(false);
                            autoWalk(tile:getPosition(), 100, { ignoreNonPathable = true });
                            schedule(2000, function()
                                changeWalk(true);
                            end);
                            return
                        end
                    end
                    if (item:getId() == 21463) then
                        -- Essences 21463
                        pPos = player:getPosition()
                        itemPos = item:getPosition()
                        if (isReachablePosition(pPos, itemPos)) then
                            changeWalk(false);
                            autoWalk(tile:getPosition(), 100, { ignoreNonPathable = true })
                            schedule(3000, function()
                                changeWalk(true);
                            end);
                            return
                        end
                    end
                end
            end
        end
    end
end)
