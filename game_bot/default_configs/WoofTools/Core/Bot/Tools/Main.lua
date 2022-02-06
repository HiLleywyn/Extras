UI.Separator()

macro(500, "Auto-Cast Haste", nil, function()
  if not hasHaste() and storage.autoHasteText:len() > 0 then
    if saySpell(storage.autoHasteText) then
      delay(5000)
    end
  end
end)
UI.TextEdit(storage.autoHasteText or "Utani Hur", function(widget, text)
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
local doorsIds = { 8265, 1629, 1632, 5129, 7727 }

function checkForDoors(pos)
  local tile = g_map.getTile(pos)
  if tile then
    local useThing = tile:getTopUseThing()
    if useThing and table.find(doorsIds, useThing:getId()) then
      g_game.use(useThing)
    end
  end
end
local autoOpenDoors = macro(200, "Auto-Open Doors", function() end)

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

local moneyIds = {3031, 3035, 3043, 16128, 16129, 28716}
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
--------------------------------------------------------------------------------
-- Auto-Advertise
--------------------------------------------------------------------------------
-- Auto-Advertise setup
UI.Label("Auto-Advertise Setup")
UI.Separator()
-- Advertise message "aM" to send.
UI.Label("Message")
UI.TextEdit(storage.aM or "I'm an advertisement.", function(widget, text)
  storage.aM = text
end)
-- Toggles where to send the Advertise message.
UI.Label("Channels")
aT = macro(120000, "Advertising", function() end) -- Advertising toggle.
wcT = macro(120000, "World Chat", function() end) -- World Chat toggle.
pT = macro(120000, "Polish", function() end) -- Polish toggle.
sT = macro(120000, "Say", function() end) -- Say toggle.
yT = macro(120000, "Yell", function() end) -- Yell toggle.
UI.Separator()
-- End Auto-Advertise setup

-- Main Auto-Advertise Macro
macro(120000, "Auto-Advertise", function()
  local aC = getChannelId("Advertising") -- Advertising channel
  local wcC = getChannelId("World Chat") -- World Chat channel
  local pC = getChannelId("Polish") -- Polish channel
  -- If Advertisement message "aM" is not blank.
  if storage.aM:len() > 0 then
    -- If Advertising channel toggle "aT" is on.
    if aT.isOn() then
      --If Advertising channel "aC" exists.
      if aC then
        -- Send Advertise message "aM" to Advertising channel "aC".
        sayChannel(aC, storage.aM)
      else -- Advertising channel "aC" does not exist or is unavailable.
        error("[Auto-Advertising]: Advertising channel is not available.")
      end
    end
    -- If World Chat channel toggle "wcT" is on.
    if wcT.isOn() then
      -- If World Chat channel "wcC" exists.
      if wcC then
        -- Send Advertise message "aM" to World Chat channel "wcC".
        sayChannel(wcC, storage.aM)
      else -- World Chat channel "wcC" does not exist or is unavailable.
        error("Auto-Advertising]: World Chat channel is not available.")
      end
    end
    -- If Polish channel toggle "pT" is on.
    if pT.isOn() then
      -- If Polish channel "pT" exists.
      if pC then
        -- Send Advertise message "aM" to Polish channel "pC".
        sayChannel(pC, storage.aM)
      else -- Polish channel "pT" does not exist or is unavailable.
        error("[Auto-Advertising]: Polish channel is not available.")
      end
    end
    -- If Say toggle "sT" is on.
    if sT.isOn() then
      -- Say Advertise message "aM".
      say(storage.aM)
    end
    -- If Yell toggle "yT" is on.
    if yT.isOn() then
      -- Yell Advertise message "aM".
      yell(storage.aM)
    end
  else -- Advertisement message "aM" is blank.
    error("[Auto-Advertising]: Advertisement message must not be blank.")
  end
  -- End Main Auto-Advertise Macro
end)

UI.Separator()
-- End Auto-Advertise
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- -- Auto-Fish
-- macro(1000, "Auto-Fish", function()
--   for _, tile in ipairs(g_map.getTiles(posz())) do
--     if table.contains({4596, 4597, 4598, 4599, 4600, 4601, 4602, 4603}, tile:getTopUseThing():getId()) and getDistanceBetween(pos(), tile:getPosition()) <= 7 then
--       useWith(3483, tile:getTopUseThing())
--     end
--   end
-- end)
-- UI.Separator()
-- -- End Auto-Fish
--------------------------------------------------------------------------------
