local targetingTab = "Target"

setDefaultTab(targetingTab)
TargetBot = {}
TargetBot.Extensions = {}

--Styles
importStyle("/Core/Target/Main_Target.otui")
importStyle("/Core/Target/Editor_Target.otui")

-- Core
dofile("/Core/Target/Creature_Target.lua")
dofile("/Core/Target/Attack_Target.lua")
dofile("/Core/Target/Editor_Target.lua")
dofile("/Core/Target/Priority_Target.lua")
dofile("/Core/Target/Walk_Target.lua")
dofile("/Core/Target/Buff_Target.lua")
dofile("/Core/Target/Spells_Target.lua")

-- Main must be last.
dofile("/Core/Target/Main_Target.lua")
