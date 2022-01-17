local switchesTab = "Main"

setDefaultTab(switchesTab)

Woof.Switches = {}

UI.Separator()

UI.Label("Control Switches")

UI.Separator()
Woof.Switches.StartCave = UI.Button("Start CaveBot", function() CaveBot.setOn() end)
Woof.Switches.StopCave = UI.Button("Stop CaveBot", function() CaveBot.setOff() end)

UI.Separator()

Woof.Switches.StartTargeting = UI.Button("Start Targeting", function() TargetBot.setOn() end)
Woof.Switches.StopTargeting = UI.Button("Stop Targeting", function() TargetBot.setOff() end)
