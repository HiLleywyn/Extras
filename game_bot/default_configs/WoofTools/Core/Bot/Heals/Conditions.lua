UI.Separator()

local conditionPanelName = "ConditionPanel"
local ui = setupUI([[
Panel
  height: 19

  BotSwitch
    id: title
    anchors.top: parent.top
    anchors.left: parent.left
    text-align: center
    width: 130
    !text: tr('Conditions Manager')

  Button
    id: conditionList
    anchors.top: prev.top
    anchors.left: prev.right
    anchors.right: parent.right
    margin-left: 3
    height: 17
    text: Setup

  ]])
ui:setId(conditionPanelName)

if not storage[conditionPanelName] then
  storage[conditionPanelName] = {
    enabled = false,
    curePosion = false,
    cureCurse = false,
    cureBleed = false,
    cureElectrify = false,
    cureParalyse = false,
    paralyseSpell = "utani hur",
    holdUtamo = false,
    holdUtana = false,
    holdUtura = false,
    uturaType = "",
    ignoreInPz = true,
  }
end

ui.title:setOn(storage[conditionPanelName].enabled)
ui.title.onClick = function(widget)
  storage[conditionPanelName].enabled = not storage[conditionPanelName].enabled
  widget:setOn(storage[conditionPanelName].enabled)
end

ui.conditionList.onClick = function(widget)
  conditionsWindow:show()
  conditionsWindow:raise()
  conditionsWindow:focus()
end



local rootWidget = g_ui.getRootWidget()
if rootWidget then
  conditionsWindow = g_ui.createWidget('ConditionsWindow', rootWidget)
  conditionsWindow:hide()

  -- text edits
  conditionsWindow.Cure.ParalyseSpell:setText(storage[conditionPanelName].paralyseSpell)
  conditionsWindow.Cure.ParalyseSpell.onTextChange = function(widget, text)
    storage[conditionPanelName].paralyseSpell = text
  end

  -- combo box
  conditionsWindow.Hold.UturaType:setOption(storage[conditionPanelName].uturaType)
  conditionsWindow.Hold.UturaType.onOptionChange = function(widget)
    storage[conditionPanelName].uturaType = widget:getCurrentOption().text
  end

  -- checkboxes
  conditionsWindow.Cure.CurePoison:setChecked(storage[conditionPanelName].curePoison)
  conditionsWindow.Cure.CurePoison.onClick = function(widget)
    storage[conditionPanelName].curePoison = not storage[conditionPanelName].curePoison
    widget:setChecked(storage[conditionPanelName].curePoison)
  end

  conditionsWindow.Cure.CureCurse:setChecked(storage[conditionPanelName].cureCurse)
  conditionsWindow.Cure.CureCurse.onClick = function(widget)
    storage[conditionPanelName].cureCurse = not storage[conditionPanelName].cureCurse
    widget:setChecked(storage[conditionPanelName].cureCurse)
  end

  conditionsWindow.Cure.CureBleed:setChecked(storage[conditionPanelName].cureBleed)
  conditionsWindow.Cure.CureBleed.onClick = function(widget)
    storage[conditionPanelName].cureBleed = not storage[conditionPanelName].cureBleed
    widget:setChecked(storage[conditionPanelName].cureBleed)
  end

  conditionsWindow.Cure.CureElectrify:setChecked(storage[conditionPanelName].cureElectrify)
  conditionsWindow.Cure.CureElectrify.onClick = function(widget)
    storage[conditionPanelName].cureElectrify = not storage[conditionPanelName].cureElectrify
    widget:setChecked(storage[conditionPanelName].cureElectrify)
  end

  conditionsWindow.Cure.CureParalyse:setChecked(storage[conditionPanelName].cureParalyse)
  conditionsWindow.Cure.CureParalyse.onClick = function(widget)
    storage[conditionPanelName].cureParalyse = not storage[conditionPanelName].cureParalyse
    widget:setChecked(storage[conditionPanelName].cureParalyse)
  end

  conditionsWindow.Hold.HoldUtamo:setChecked(storage[conditionPanelName].holdUtamo)
  conditionsWindow.Hold.HoldUtamo.onClick = function(widget)
    storage[conditionPanelName].holdUtamo = not storage[conditionPanelName].holdUtamo
    widget:setChecked(storage[conditionPanelName].holdUtamo)
  end

  conditionsWindow.Hold.HoldUtana:setChecked(storage[conditionPanelName].holdUtana)
  conditionsWindow.Hold.HoldUtana.onClick = function(widget)
    storage[conditionPanelName].holdUtana = not storage[conditionPanelName].holdUtana
    widget:setChecked(storage[conditionPanelName].holdUtana)
  end

  conditionsWindow.Hold.HoldUtura:setChecked(storage[conditionPanelName].holdUtura)
  conditionsWindow.Hold.HoldUtura.onClick = function(widget)
    storage[conditionPanelName].holdUtura = not storage[conditionPanelName].holdUtura
    widget:setChecked(storage[conditionPanelName].holdUtura)
  end

  conditionsWindow.Hold.IgnoreInPz:setChecked(storage[conditionPanelName].ignoreInPz)
  conditionsWindow.Hold.IgnoreInPz.onClick = function(widget)
    storage[conditionPanelName].ignoreInPz = not storage[conditionPanelName].ignoreInPz
    widget:setChecked(storage[conditionPanelName].ignoreInPz)
  end

  -- buttons
  conditionsWindow.closeButton.onClick = function(widget)
    conditionsWindow:hide()
  end
end

local utanaCast = nil
macro(500, function()
  if not storage[conditionPanelName].enabled or modules.game_cooldown.isGroupCooldownIconActive(2) then return end
  if storage[conditionPanelName].curePoison and isPoisioned() then say("Exana All")
  elseif storage[conditionPanelName].cureCurse and isCursed() then say("Exana All")
  elseif storage[conditionPanelName].cureBleed and isBleeding() then say("Exana All")
  elseif storage[conditionPanelName].cureElectrify and isEnergized() then say("Exana All")
  elseif (not storage[conditionPanelName].ignoreInPz or not isInPz()) and storage[conditionPanelName].holdUtura and not hasPartyBuff() then say(storage[conditionPanelName].uturaType)
  elseif (not storage[conditionPanelName].ignoreInPz or not isInPz()) and storage[conditionPanelName].holdUtana and (not utanaCast or (now - utanaCast > 120000)) then say("utana vid") utanaCast = now
  end
end)

macro(50, function()
  if not storage[conditionPanelName].enabled then return end
  if (not storage[conditionPanelName].ignoreInPz or not isInPz()) and storage[conditionPanelName].holdUtamo and not hasManaShield() then say("utamo vita")
  elseif storage[conditionPanelName].cureParalyse and isParalyzed() and not getSpellCoolDown(storage[conditionPanelName].paralyseSpell) then say(storage[conditionPanelName].paralyseSpell)
  end
end)
