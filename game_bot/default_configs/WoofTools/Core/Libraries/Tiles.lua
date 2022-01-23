--------------------------------------------------------------------------------
Libraries.Tiles = {}
--------------------------------------------------------------------------------
-- Tiles Library
--------------------------------------------------------------------------------
-- function to search if item of given ID can be found on certain tile
-- first argument is always ID
-- the rest of aguments can be:
-- - tile
-- - position
-- - or x,y,z coordinates as p1, p2 and p3
-- returns boolean
Libraries.Tiles.isOnTile = function(id, p1, p2, p3)
    if not id then return end
    local tile
    if type(p1) == "table" then
        tile = g_map.getTile(p1)
    elseif type(p1) ~= "number" then
        tile = p1
    else
        local p = getPos(p1, p2, p3)
        tile = g_map.getTile(p)
    end
    if not tile then return end

    local item = false
    if #tile:getItems() ~= 0 then
        for i, v in ipairs(tile:getItems()) do
            if v:getId() == id then item = true end
        end
    else
        return false
    end

    return item
end
--------------------------------------------------------------------------------
-- position is a special table, impossible to compare with normal one
-- this is translator from x,y,z to proper position value
-- returns position table
Libraries.Tiles.getPos = function(x, y, z)
    if not x or not y or not z then return nil end
    local pos = pos()
    pos.x = x
    pos.y = y
    pos.z = z

    return pos
end
--------------------------------------------------------------------------------
-- Landmark Tiles (Format: Y, X, Z)
Libraries.Tiles.Landmarks = {
  ["Temple"] = { ["y"] = 1042, ["x"] = 1032, ["z"] = 7 },
  ["Teleport Room"] = { ["y"] = 985, ["x"] = 1168, ["z"] = 7 },
  ["Depot"] = { ["y"] = 1042, ["x"] = 1050, ["z"] = 7 },
  ["Dungeon Room"] = { ["y"] = 825, ["x"] = 1166, ["z"] = 7 },
  ["Shops"] = { ["y"] = 1032, ["x"] = 1026, ["z"] = 7 },
  ["Quest Room One"] = { ["y"] = 1156, ["x"] = 985, ["z"] = 7 },
  ["Magical Forest Dungeon One"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Magical Forest Dungeon Two"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Magical Forest Dungeon Three"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Magical Forest Dungeon Four"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Magical Forest Dungeon Five"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Magical Forest Dungeon Six"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Magical Forest Dungeon Seven"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Magical Forest Dungeon Eight"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Magical Forest Dungeon Nine"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Magical Forest Dungeon Ten"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Magical Forest Dungeon Eleven"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Magical Forest Dungeon Twelve"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Desert Dungeon One"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Desert Dungeon Two"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Desert Dungeon Three"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Desert Dungeon Four"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Desert Dungeon Five"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Desert Dungeon Six"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Desert Dungeon Seven"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Desert Dungeon Eight"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Desert Dungeon Nine"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Desert Dungeon Ten"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Desert Dungeon Eleven"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Desert Dungeon Twelve"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Undead Dungeon One"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Undead Dungeon Two"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Undead Dungeon Three"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Undead Dungeon Four"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Undead Dungeon Five"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Undead Dungeon Six"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Undead Dungeon Seven"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Undead Dungeon Eight"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Undead Dungeon Nine"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Undead Dungeon Ten"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Undead Dungeon Eleven"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
  ["Undead Dungeon Twelve"] = { ["y"] = 0, ["x"] = 0, ["z"] = 0 },
}
--------------------------------------------------------------------------------
-- Portal Tiles (Format: Y, X, Z)
Libraries.Tiles.Portals = {
  ["Teleports Portal"] = { ["y"] = 1038, ["x"] = 1034, ["z"] = 7 },
  ["Trainers Portal"] = { ["y"] = 1037, ["x"] = 1034, ["z"] = 7 },
  ["Depot Portal"] = { ["y"] = 1036, ["x"] = 1034, ["z"] = 7 },
  ["Quests Portal"] = { ["y"] = 1030, ["x"] = 1036, ["z"] = 7 },
  ["Shops Portal"] = { ["y"] = 1030, ["x"] = 1038, ["z"] = 7 },
}
