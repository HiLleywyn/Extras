function getTilesInRange(cPos, radius)
	local tiles = {}
	
	for x=-radius,radius do
		for y=-radius,radius do
			table.insert(tiles, g_map.getTile({x = (cPos.x + x), y = (cPos.y + y), z = cPos.z}))
		end
	end
	
	return tiles
end

function getTilesBetween(currentPosition, targetPosition)
	local tiles = {}
	local directions, result = findPath(currentPosition, targetPosition, getDistanceBetween(currentPosition, targetPosition), {ignoreNonPathable=false, ignoreNonWalkable=true, precision=1})

	if not directions then
		return tiles
	end

	for _, direction in pairs(directions) do
		if direction == 0 then
			currentPosition.y = currentPosition.y - 1
		elseif direction == 1 then
			currentPosition.x = currentPosition.x + 1
		elseif direction == 2 then
			currentPosition.y = currentPosition.y + 1
		elseif direction == 3 then
			currentPosition.x = currentPosition.x - 1
		elseif direction == 4 then
			currentPosition.y = currentPosition.y - 1
			currentPosition.x = currentPosition.x + 1
		elseif direction == 5 then
			currentPosition.y = currentPosition.y + 1
			currentPosition.x = currentPosition.x + 1
		elseif direction == 6 then
			currentPosition.y = currentPosition.y + 1
			currentPosition.x = currentPosition.x - 1
		elseif direction == 7 then
			currentPosition.y = currentPosition.y - 1
			currentPosition.x = currentPosition.x - 1
		else
			error("Attempted to evaluate an unknown direction (" .. direction .. ").")
		end

		table.insert(tiles, g_map.getTile(currentPosition))
	end

	return tiles
end

function canReach(creature, params)
	--function from candybot
	if not creature then
		return false
	end
	local myPos = player:getPosition()
	local otherPos = creature:getPosition()
	
	if not myPos or not otherPos then
		return false
	end

	local neighbours = {
		{x = 0, y = -1, z = 0},
		{x = -1, y = -1, z = 0},
		{x = -1, y = 0, z = 0},
		{x = -1, y = 1, z = 0},
		{x = 0, y = 1, z = 0},
		{x = 1, y = 1, z = 0},
		{x = 1, y = 0, z = 0},
		{x = 1, y = -1, z = 0}
	}

	for k,v in pairs(neighbours) do
		local checkPos = {x = myPos.x + v.x, y = myPos.y + v.y, z = myPos.z + v.z}

		if myPos.x == checkPos.x and myPos.y == checkPos.y and myPos.z == checkPos.z then
			return true
		end

		local steps, result = g_map.findPath(otherPos, checkPos, 30, params)
		if result == 0 then
			return true
		end
	end
	return false
end

function getSpecificTopUseThingFromTiles(tiles, condition)
	for _, tile in ipairs(tiles) do
		if tile and tile:getTopUseThing() then
			local thing = tile:getTopUseThing()
			local thingType = g_things.getThingType(thing:getId())

			if condition(thingType) then
				return thing
			end
		end
	end
	
	return nil
end

local toFollowPos = {}
local FollowActions = {
	Walk = 0,
	Use = 1,
	UseWith = 2
}
local doorsIds = { 8265, 7727, 5111, 8261, 8259, 5113, 1646 }
local followTimeOut = (now + 1500)
local isFollowing = false

mcrAutoFollow = macro(100, "Auto Follow", function()
	local followAction = FollowActions.Walk
	local useThing = nil
	local toUseWithItems = nil
	
	local target = getCreatureByName(storage.followLeader)
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

	if not target then
		useThing = getSpecificTopUseThingFromTiles(getTilesInRange(p, 1), function(thingType)
			if not thingType:isGround() and not thingType:isGroundBorder() and thingType:isNotMoveable() then
				if (thingType:isForceUse() and not thingType:isUsable() and thingType:getMinimapColor() == 210) --[[ ladder ]] or
				   (not thingType:isForceUse() and thingType:isUsable() and thingType:getMinimapColor() == 129) --[[ sewer ]] then
					return true
				end
			end
			
			if thingType:isGround() and not thingType:isGroundBorder() and thingType:isNotMoveable() and thingType:isForceUse() and thingType:isUsable() and thingType:getMinimapColor() == 210 --[[ ropehole ]] then
				toUseWithItems = {646, 3003} --ropes
				return true
			end
			
			return false
		end)
	else
		if not canReach(target, 16 --[[ ignoreCreatures ]]) then
			useThing = getSpecificTopUseThingFromTiles(getTilesBetween(player:getPosition(), p), function(thingType)
				if table.find(doorsIds, thingType:getId()) then
					return true
				end
				
				return false
			end)
			
			if not useThing then
				-- desperate attempt to get any doors nearby if no door was found until now
				useThing = getSpecificTopUseThingFromTiles(getTilesInRange(player:getPosition(), 2), function(thingType)
					if table.find(doorsIds, thingType:getId()) then
						return true
					end

					return false
				end)	
			end
		end	
	end

	if useThing and toUseWithItems then
		followAction = FollowActions.UseWith
	elseif useThing then
		followAction = FollowActions.Use
	end

	if followAction == FollowActions.Walk then
		if g_game.isAttacking() or not target or followTimeOut > now then
			if isFollowing then
				g_game.cancelFollow()
				isFollowing = false

				if followTimeOut <= now then
					followTimeOut = now + 1500
				end
			end
			
			if autoWalk(p, 20, {ignoreNonPathable=true, precision=1}) then
				delay(150)
			end
		else
			if not isFollowing or not g_game.isFollowing() then
				g_game.follow(target)
				isFollowing = true
			end
		end
	elseif followAction == FollowActions.Use then
		g_game.use(useThing)
		
		if isFollowing then
			g_game.cancelFollow()
			isFollowing = false
		end
		followTimeOut = now + 1500
		
		delay(250)
	elseif followAction == FollowActions.UseWith then
		local item = nil
		
		for _, toUseWithItem in pairs(toUseWithItems) do
			item = findItem(toUseWithItem)
			
			if item then
				break
			end
		end

		if item then
			usewith(item, useThing)
			
			followTimeOut = now + 1500
			delay(250)
		else
			modules.game_console.addTabText("Unable to use item with, since the container with one of the items isn't opened or you do not possess one of the the necessary items.",
											 modules.game_console.SpeakTypesSettings.channelOrange, modules.game_console.defaultTab);
			delay(2500)
		end
		
		if isFollowing then
			g_game.cancelFollow()
			isFollowing = false
		end
	end
end)

onCreaturePositionChange(function(creature, oldPos, newPos)
	if newPos == nil then
		return
	end
	
	if creature:getName() == storage.followLeader then
		toFollowPos[newPos.z] = newPos
	end
end)
UI.Label("Follow Player:")
txtToFollow = UI.TextEdit(storage.followLeader or "Please insert character name", function(widget, text) 
	storage.followLeader = text
end)