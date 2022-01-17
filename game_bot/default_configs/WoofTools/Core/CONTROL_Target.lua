local targetingTab = "Target"

setDefaultTab(targetingTab)
TargetBot = {}
TargetBot.Extensions = {}

--Styles
importStyle("/Core/Target/Target.otui")
importStyle("/Core/Target/Target.Editor.otui")

-- Core
dofile("/Core/Target/Target.Creature.lua")
dofile("/Core/Target/Target.Attack.lua")
dofile("/Core/Target/Target.Editor.lua")
dofile("/Core/Target/Target.Priority.lua")
dofile("/Core/Target/Target.Walk.lua")
dofile("/Core/Target/Target.Buff.lua")
dofile("/Core/Target/Target.AutoFollow.lua")
dofile("/Core/Target/Target.Taunt.lua")
dofile("/Core/Target/Target.Spells.lua")
-- Main must be last.
dofile("/Core/Target/Target.lua")
