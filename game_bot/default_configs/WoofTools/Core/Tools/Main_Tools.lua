UI.Separator()

macro(500, "Auto-Cast Haste", nil, function()
    if not hasHaste() and storage.autoHasteText:len() > 0 then
      if saySpell(storage.autoHasteText) then
        delay(5000)
      end
    end
  end)
UI.TextEdit(storage.autoHasteText or "utani hur", function(widget, text)
    storage.autoHasteText = text
end)

UI.Separator()

macro((5 * 60000), "Auto-Eat Food", function()
  if not storage.foodItems[1] then return end
  -- search for food in containers
  for _, container in pairs(g_game.getContainers()) do
    for __, item in ipairs(container:getItems()) do
      for i, foodItem in ipairs(storage.foodItems) do
        if item:getId() == foodItem.id then
          return g_game.use(item)
        end
      end
    end
  end
  -- can't find any food, try to eat random item using hotkey
  local toEat = storage.foodItems[math.random(1, #storage.foodItems)]
  if toEat then g_game.useInventoryItem(toEat.id) end
end)

if type(storage.foodItems) ~= "table" then
  storage.foodItems = {6574}
end

local foodContainer = UI.Container(function(widget, items)
  storage.foodItems = items
end, true)
foodContainer:setHeight(35)
foodContainer:setItems(storage.foodItems)

UI.Separator()

local wsadWalking = modules.game_walking.wsadWalking
local doorsIds = { 8265, 1629, 1632, 5129 }

function checkForDoors(pos)
  local tile = g_map.getTile(pos)
  if tile then
    local useThing = tile:getTopUseThing()
    if useThing and table.find(doorsIds, useThing:getId()) then
      g_game.use(useThing)
    end
  end
end
local autoOpenDoors = macro(500, "Auto-Open Doors", function() end)

if autoOpenDoors.isOn() then
  onKeyPress(function(keys)
    local pos = player:getPosition()
    if keys == 'Up' or (wsadWalking and keys == 'W') then
      pos.y = pos.y - 1
    elseif keys == 'Down' or (wsadWalking and keys == 'S') then
      pos.y = pos.y + 1
    elseif keys == 'Left' or (wsadWalking and keys == 'A') then
      pos.x = pos.x - 1
    elseif keys == 'Right' or (wsadWalking and keys == 'D') then
      pos.x = pos.x + 1
    end
    checkForDoors(pos)
  end)
end

UI.Separator()

macro(3000, "Auto-Train Mana",  function()
  if (hppercent() > 50) then
  say(storage.ManatrainText)
end
end)
UI.TextEdit(storage.ManatrainText or "Utevo Mana", function(widget, text)
  storage.ManatrainText = text
end)

local moneyIds = {3031, 3035, 3043, 16128, 16129} -- gold coin, platinium coin
macro(1000, "Auto-Exchange Money", function()
  local containers = g_game.getContainers()
  for index, container in pairs(containers) do
    if not container.lootContainer then -- ignore monster containers
      for i, item in ipairs(container:getItems()) do
        if item:getCount() == 100 then
          for m, moneyId in ipairs(moneyIds) do
            if item:getId() == moneyId then
              return g_game.use(item)
            end
          end
        end
    end
    end
  end
end)

UI.Separator()

macro(60000, "Trade Message", function()
  local trade = getChannelId("advertising")
  if not trade then
    trade = getChannelId("trade")
  end
  if trade and storage.autoTradeMessage:len() > 0 then
    sayChannel(trade, storage.autoTradeMessage)
  end
end)
UI.TextEdit(storage.autoTradeMessage or "Evolunia is awesome!", function(widget, text)
  storage.autoTradeMessage = text
end)

UI.Separator()

macro(1000, "Auto-Fish", function()
  for _, tile in ipairs(g_map.getTiles(posz())) do
    if table.contains({4596, 4597, 4598, 4599, 4600, 4601, 4602, 4603}, tile:getTopUseThing():getId()) and getDistanceBetween(pos(), tile:getPosition()) <= 7 then
      useWith(3483, tile:getTopUseThing())
    end
  end
end)

UI.Separator()
