-- config for bot
CaveBot.Waypoints = {}
CaveBot.Waypoints.values = {}
CaveBot.Waypoints.default_values = {}
CaveBot.Waypoints.value_setters = {}

CaveBot.Waypoints.setup = function()
  CaveBot.Waypoints.ui = UI.createWidget("CaveBotWaypointsPanel")
  local ui = CaveBot.Waypoints.ui
  local add = CaveBot.Waypoints.add

  add("exampleA", "exampleA bool", false)
  add("exampleB", "exampleB int", 100)
  add("exampleC", "exampleC bool", false)
  add("exampleD", "exampleD bool", false)
  add("exampleE", "exampleE int", 400)
end

CaveBot.Waypoints.show = function()
  CaveBot.Waypoints.ui:show()
end

CaveBot.Waypoints.hide = function()
  CaveBot.Waypoints.ui:hide()
end

CaveBot.Waypoints.onConfigChange = function(configName, isEnabled, configData)
  for k, v in pairs(CaveBot.Waypoints.default_values) do
    CaveBot.Waypoints.value_setters[k](v)
  end
  if not configData then return end
  for k, v in pairs(configData) do
    if CaveBot.Waypoints.value_setters[k] then
      CaveBot.Waypoints.value_setters[k](v)
    end
  end
end

CaveBot.Waypoints.save = function()
  return CaveBot.Waypoints.values
end

CaveBot.Waypoints.add = function(id, title, defaultValue)
  if CaveBot.Waypoints.values[id] then
    return error("Duplicated config key: " .. id)
  end

  local panel
  local setter -- sets value
  if type(defaultValue) == "number" then
    panel = UI.createWidget("CaveBotWaypointsNumberValuePanel", CaveBot.Waypoints.ui)
    setter = function(value)
      CaveBot.Waypoints.values[id] = value
      panel.value:setText(value, true)
    end
    setter(defaultValue)
    panel.value.onTextChange = function(widget, newValue)
      newValue = tonumber(newValue)
      if newValue then
        CaveBot.Waypoints.values[id] = newValue
        CaveBot.save()
      end
    end
  elseif type(defaultValue) == "boolean" then
    panel = UI.createWidget("CaveBotWaypointsBooleanValuePanel", CaveBot.Waypoints.ui)
    setter = function(value)
      CaveBot.Waypoints.values[id] = value
      panel.value:setOn(value, true)
    end
    setter(defaultValue)
    panel.value.onClick = function(widget)
      widget:setOn(not widget:isOn())
      CaveBot.Waypoints.values[id] = widget:isOn()
      CaveBot.save()
    end
  else
    return error("Invalid default value of config for key " .. id .. ", should be number or boolean")
  end

  panel.title:setText(tr(title) .. ":")

  CaveBot.Waypoints.value_setters[id] = setter
  CaveBot.Waypoints.values[id] = defaultValue
  CaveBot.Waypoints.default_values[id] = defaultValue
end

CaveBot.Waypoints.get = function(id)
  if CaveBot.Waypoints.values[id] == nil then
    return error("Invalid CaveBot.Waypoints.get, id: " .. id)
  end
  return CaveBot.Waypoints.values[id]
end
