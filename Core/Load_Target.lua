local targetingTab = "Target"

setDefaultTab(targetingTab)
TargetBot = {}
TargetBot.Extensions = {}

importStyle("/Core/Target/target.otui")
importStyle("/Core/Target/creature_editor.otui")
dofile("/Core/Target/creature.lua")
dofile("/Core/Target/creature_attack.lua")
dofile("/Core/Target/creature_editor.lua")
dofile("/Core/Target/creature_priority.lua")
dofile("/Core/Target/walking.lua")
dofile("/Core/Target/AutoCastBuff.lua")
dofile("/Core/Target/Collecting.lua")
dofile("/Core/Target/MultiSpells.lua")

-- main targetbot file, must be last
dofile("/Core/Target/target.lua")
