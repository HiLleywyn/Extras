Loot.Window = function(config, callback) -- callback = function(newConfig)
  config = config or {}

  local window = UI.createWindow('LootWindow')
  local values = {} -- (key, function returning value of key)

  window.name:setText(config.name or "")
  table.insert(values, {"name", function() return window.name:getText() end})

  local addScrollBar = function(id, title, min, max, defaultValue)
    local widget = UI.createWidget('LootWindowScrollBar', window.content.left)
    widget.scroll.onValueChange = function(scroll, value)
      widget.text:setText(title .. ": " .. value)
    end
    widget.scroll:setRange(min, max)
    if max-min > 1000 then
      widget.scroll:setStep(100)
    elseif max-min > 100 then
      widget.scroll:setStep(10)
    end
    widget.scroll:setValue(config[id] or defaultValue)
    widget.scroll.onValueChange(widget.scroll, widget.scroll:getValue())
    table.insert(values, {id, function() return widget.scroll:getValue() end})
  end

  local addTextEdit = function(id, title, defaultValue)
    local widget = UI.createWidget('LootWindowTextEdit', window.content.right)
    widget.text:setText(title)
    widget.textEdit:setText(config[id] or defaultValue or "")
    table.insert(values, {id, function() return widget.textEdit:getText() end})
  end

  local addCheckBox = function(id, title, defaultValue)
    local widget = UI.createWidget('LootWindowCheckBox', window.content.right)
    widget.onClick = function()
      widget:setOn(not widget:isOn())
    end
    widget:setText(title)
    if config[id] == nil then
      widget:setOn(defaultValue)
    else
      widget:setOn(config[id])
    end
    table.insert(values, {id, function() return widget:isOn() end})
  end

  local addItem = function(id, title, defaultItem)
    local widget = UI.createWidget('LootWindowItem', window.content.right)
    widget.text:setText(title)
    widget.item:setItemId(config[id] or defaultItem)
    table.insert(values, {id, function() return widget.item:getItemId() end})
  end

  window.cancel.onClick = function()
    Loot:destroy()
  end
  window.onEscape = window.cancel.onClick

  window.ok.onClick = function()
    local newConfig = {}
    for _, value in ipairs(values) do
      newConfig[value[1]] = value[2]()
    end
    if newConfig.name:len() < 1 then return end

    newConfig.regex = ""
    for part in string.gmatch(newConfig.name, "[^,]+") do
      if newConfig.regex:len() > 0 then
        newConfig.regex = newConfig.regex .. "|"
      end
      newConfig.regex = newConfig.regex .. "^" .. part:trim():lower():gsub("%*", ".*"):gsub("%?", ".?") .. "$"
    end

    Loot:destroy()
    callback(newConfig)
  end

  -- values
  addScrollBar("scrollBar", "scrollBar", 0, 3000, 200)
  addCheckBox("checkBox", "checkBox", true)
  addTextEdit("textEdit", "textEdit", "")
  addItem("item", "item:", 0)
end
