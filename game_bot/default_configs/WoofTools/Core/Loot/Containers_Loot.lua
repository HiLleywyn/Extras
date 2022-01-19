UI.Separator()
UI.Label("Container Setup")
UI.Separator()
contPanelName = "renameContainers"
if type(storage[contPanelName]) ~= "table" then
  storage[contPanelName] = {
    enabled = true;
    purse = true;
    all = true;
    list = {
      {
        value = "Main",
        enabled = true,
        item = 9601,
        min = true,
      },
      {
        value = "Charms",
        enabled = true,
        item = 23396,
        min = true,
      },
      {
        value = "Lootbag",
        enabled = false,
        item = 30264,
        min = true,
      },
    }
  }
end

local renameContui = setupUI([[
Panel
  height: 38

  BotSwitch
    id: title
    anchors.top: parent.top
    anchors.left: parent.left
    text-align: center
    width: 130
    !text: tr('Minimise Containers')

  Button
    id: editContList
    anchors.top: prev.top
    anchors.left: prev.right
    anchors.right: parent.right
    margin-left: 3
    height: 17
    text: Setup

  Button
    id: reopenCont
    !text: tr('Reopen Containers')
    anchors.left: parent.left
    anchors.top: prev.bottom
    anchors.right: parent.right
    height: 17
    margin-top: 2
  ]])
renameContui:setId(contPanelName)

g_ui.loadUIFromString([[
BackpackName < Label
  background-color: alpha
  text-offset: 18 0
  focusable: true
  height: 16

  CheckBox
    id: enabled
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    width: 15
    height: 15
    margin-top: 2
    margin-left: 3

  $focus:
    background-color: #00000055

  Button
    id: state
    !text: tr('M')
    anchors.right: remove.left
    margin-right: 5
    width: 15
    height: 15

  Button
    id: remove
    !text: tr('x')
    !tooltip: tr('Remove')
    anchors.right: parent.right
    margin-right: 15
    width: 15
    height: 15

ContListsWindow < MainWindow
  !text: tr('Container Names')
  size: 435 166
  @onEscape: self:hide()

  TextList
    id: itemList
    anchors.left: parent.left
    anchors.top: parent.top
    size: 180 83
    margin-top: 3
    margin-bottom: 3
    margin-left: 3
    vertical-scrollbar: itemListScrollBar

  VerticalScrollBar
    id: itemListScrollBar
    anchors.top: itemList.top
    anchors.bottom: itemList.bottom
    anchors.right: itemList.right
    step: 14
    pixels-scroll: true

  VerticalSeparator
    id: sep
    anchors.top: parent.top
    anchors.left: itemList.right
    anchors.bottom: separator.top
    margin-top: 3
    margin-bottom: 6
    margin-left: 10

  Label
    id: lblName
    anchors.left: sep.right
    anchors.top: sep.top
    width: 70
    text: Name:
    margin-left: 10
    margin-top: 3

  TextEdit
    id: contName
    anchors.left: lblName.right
    anchors.top: sep.top
    anchors.right: parent.right

  Label
    id: lblCont
    anchors.left: lblName.left
    anchors.top: contName.bottom
    width: 70
    text: Container:
    margin-top: 20

  BotItem
    id: contId
    anchors.left: lblCont.right
    anchors.top: contName.bottom
    margin-top: 12

  Button
    id: addItem
    anchors.right: contName.right
    anchors.top: contName.bottom
    margin-top: 5
    text: Add
    width: 40
    font: cipsoftFont

  HorizontalSeparator
    id: separator
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.bottom: closeButton.top
    margin-bottom: 8

  CheckBox
    id: all
    anchors.left: parent.left
    anchors.bottom: parent.bottom
    text: Open All
    tooltip: Opens all containers in main backpack.
    width: 95
    height: 15
    margin-top: 2
    margin-left: 3

  CheckBox
    id: purse
    anchors.left: prev.right
    anchors.bottom: parent.bottom
    text: Open Charms
    tooltip: Opens the charm container.
    width: 95
    height: 15
    margin-top: 2
    margin-left: 3

  Button
    id: closeButton
    !text: tr('Close')
    font: cipsoftFont
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    size: 45 21
    margin-top: 15
]])

function findItemsInArray(t, tfind)
  local tArray = {}
  for x,v in pairs(t) do
    if type(v) == "table" then
      local aItem = t[x].item
      local aEnabled = t[x].enabled
      if aItem then
        if tfind and aItem == tfind then
          return x
        elseif not tfind then
          if aEnabled then
            table.insert(tArray, aItem)
          end
        end
      end
    end
  end
  if not tfind then return tArray end
end

local lstBPs
function openBackpacks()
  if not storage[contPanelName].all then
    lstBPs = findItemsInArray(storage[contPanelName].list)
  end

  for _, container in pairs(g_game.getContainers()) do g_game.close(container) end
  schedule(1000, function()
    bpItem = getBack()
    if bpItem ~= nil then
      g_game.open(bpItem)
    end
  end)

  schedule(2000, function()
    local delay = 1

    local nextContainers = {}
    containers = getContainers()
    for i, container in pairs(g_game.getContainers()) do
      for i, item in ipairs(container:getItems()) do
        if item:isContainer() then
          if item:isContainer() and storage[contPanelName].all or (lstBPs and table.contains(lstBPs,item:getId())) then
            table.insert(nextContainers, item)
          end
        end
      end
    end
    if #nextContainers > 0 then
      for i = 1, #nextContainers do
        schedule(delay, function()
          g_game.open(nextContainers[i], nil)
        end)
        delay = delay + 500
      end
    end

    if storage[contPanelName].purse then
      schedule(delay+200, function()
        local item = getPurse()
        if item then
          use(item)
        end
      end)
      -- only use this if you play evolunia or similar
    end
  end)

end

rootWidget = g_ui.getRootWidget()
if rootWidget then
  contListWindow = UI.createWindow('ContListsWindow', rootWidget)
  contListWindow:hide()

  renameContui.editContList.onClick = function(widget)
    contListWindow:show()
    contListWindow:raise()
    contListWindow:focus()
  end

  renameContui.reopenCont.onClick = function(widget)
    openBackpacks()
  end

  renameContui.title:setOn(storage[contPanelName].enabled)
  renameContui.title.onClick = function(widget)
    storage[contPanelName].enabled = not storage[contPanelName].enabled
    widget:setOn(storage[contPanelName].enabled)
  end

  contListWindow.closeButton.onClick = function(widget)
    contListWindow:hide()
  end

  contListWindow.purse.onClick = function(widget)
    storage[contPanelName].purse = not storage[contPanelName].purse
    contListWindow.purse:setChecked(storage[contPanelName].purse)
  end
  contListWindow.purse:setChecked(storage[contPanelName].purse)

  contListWindow.all.onClick = function(widget)
    storage[contPanelName].all = not storage[contPanelName].all
    contListWindow.all:setChecked(storage[contPanelName].all)
    label.enabled:setTooltip(storage[contPanelName].all and 'Opens all containers in main backpack.' or 'Opens listed containers from main backpack.')
  end
  contListWindow.all:setChecked(storage[contPanelName].all)

  local refreshContNames = function(tFocus)
    local storageVal = storage[contPanelName].list
    if storageVal and #storageVal > 0 then
      for i, child in pairs(contListWindow.itemList:getChildren()) do
        child:destroy()
      end
      for _, entry in pairs(storageVal) do
        local label = g_ui.createWidget("BackpackName", contListWindow.itemList)
        label.onMouseRelease = function()
          contListWindow.contId:setItemId(entry.item)
          contListWindow.contName:setText(entry.value)
        end
        label.enabled.onClick = function(widget)
          entry.enabled = not entry.enabled
          label.enabled:setChecked(entry.enabled)
          label.enabled:setTooltip(entry.enabled and 'Disable' or 'Enable')
          label.enabled:setImageColor(entry.enabled and '#00FF00' or '#FF0000')
        end
        label.remove.onClick = function(widget)
          table.removevalue(storage[contPanelName].list, entry)
          label:destroy()
        end
        label.state:setChecked(entry.min)
        label.state.onClick = function(widget)
          entry.min = not entry.min
          label.state:setChecked(entry.min)
          label.state:setColor(entry.min and '#00FF00' or '#FF0000')
          label.state:setTooltip(entry.min and 'Open Minimised' or 'Do not minimise')
        end

        label:setText(entry.value)
        label.enabled:setChecked(entry.enabled)
        label.enabled:setTooltip(entry.enabled and 'Disable' or 'Enable')
        label.enabled:setImageColor(entry.enabled and '#00FF00' or '#FF0000')
        label.state:setColor(entry.min and '#00FF00' or '#FF0000')
        label.state:setTooltip(entry.min and 'Open Minimised' or 'Do not minimise')

        if tFocus and entry.item == tFocus then
          tFocus = label
        end
      end
      if tFocus then contListWindow.itemList:focusChild(tFocus) end
    end
  end
  contListWindow.addItem.onClick = function(widget)
    local id = contListWindow.contId:getItemId()
    local trigger = contListWindow.contName:getText()

    if id > 100 and trigger:len() > 0 then
      local ifind = findItemsInArray(storage[contPanelName].list, id)
      if ifind then
        storage[contPanelName].list[ifind] = { item = id, value = trigger, enabled = storage[contPanelName].list[ifind].enabled, min = storage[contPanelName].list[ifind].min}
      else
        table.insert(storage[contPanelName].list, { item = id, value = trigger, enabled = true, min = false })
      end
      contListWindow.contId:setItemId(0)
      contListWindow.contName:setText('')
      contListWindow.contName:setColor('white')
      contListWindow.contName:setImageColor('#ffffff')
      contListWindow.contId:setImageColor('#ffffff')
      refreshContNames(id)
    else
      contListWindow.contId:setImageColor('red')
      contListWindow.contName:setImageColor('red')
      contListWindow.contName:setColor('red')
    end
  end
  refreshContNames()
end

onContainerOpen(function(container, previousContainer)
  if renameContui.title:isOn() then
    if not previousContainer then
      if not container.window then return end
      containerWindow = container.window
      containerWindow:setContentHeight(34)
      local storageVal = storage[contPanelName].list
      if storageVal and #storageVal > 0 then
        for _, entry in pairs(storageVal) do
          if entry.enabled and string.find(container:getContainerItem():getId(), entry.item) then
            if entry.min then
              containerWindow:minimize()
            end
            containerWindow:setText(entry.value)
          end
        end
      end
    end
  end
end)

openBackpacks()
UI.Separator()
