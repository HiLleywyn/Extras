setDefaultTab("Cave")

addSeparator()

cfgBracket = ""

function setBracket(i)
  storage.cfgBracket = lvlBrackets[i].cfg
  storage.cfgBracketNext = storage.cfgBracket
end

lvlBrackets = {
  [0] = {
    min = 0,
    max = 80,
    cfg = "/Configs/Cave/0",
    func = function() setBracket(0) end
  },
  [80] = {
    min = 80,
    max = 200,
    cfg = "/Configs/Cave/80",
    func = function() setBracket(80) end
  },
  [200] = {
    min = 200,
    max = 350,
    cfg = "/Configs/Cave/200",
    func = function() setBracket(200) end
  },
  [350] = {
    min = 350,
    max = 500,
    cfg = "/Configs/Cave/350",
    func = function() setBracket(350) end
  },
  [500] = {
    min = 500,
    max = 650,
    cfg = "/Configs/Cave/500",
    func = function() setBracket(500) end
  },
  [650] = {
    min = 650,
    max = 900,
    cfg = "/Configs/Cave/650",
    func = function() setBracket(650) end
  },
  [900] = {
    min = 900,
    max = 1100,
    cfg = "/Configs/Cave/900",
    func = function() setBracket(900) end
  },
  [1100] = {
    min = 1100,
    max = 1400,
    cfg = "/Configs/Cave/1100",
    func = function() setBracket(1100) end
  },
  [1400] = {
    min = 1400,
    max = 1700,
    cfg = "/Configs/Cave/1400",
    func = function() setBracket(1400) end
  },
  [1700] = {
    min = 1700,
    max = 1900,
    cfg = "/Configs/Cave/1700",
    func = function() setBracket(1700) end
  },
  [1900] = {
    min = 1900,
    max = 2000,
    cfg = "/Configs/Cave/1900",
    func = function() setBracket(1900) end
  },
  [2000] = {
    min = 2000,
    max = 9999,
    cfg = "/Configs/Cave/2000",
    func = function() setBracket(2000) end
  },
  ["Dungeons"] = {
    cfg = "/Configs/Cave/Dungeons",
    func = function() setBracket("Dungeons") end
  },
  ["Quests"] = {
    cfg = "/Configs/Cave/Quests",
    func = function() setBracket("Quests") end
  },
  ["Default"] = {
    cfg = "/Configs/Cave",
    func = function() setBracket("Default") end
  }
}

storage.cfgBracket = lvlBrackets["Default"].cfg
storage.cfgBracketNext = storage.cfgBracket

UI.Label("Load an individual waypoint folder.")
UI.Label("Can only load one at a time!")
UI.Label("Restart macros if changed.")
local a = macro(500, "0+", function() end)
if a.isOn() then
  lvlBrackets[0].func()
end

local b = macro(500, "80+", function() end)
if b.isOn() then
  lvlBrackets[80].func()
end

local c = macro(500, "200+", function() end)
if c.isOn() then
  lvlBrackets[200].func()
end

local d = macro(500, "350+", function() end)
if d.isOn() then
  lvlBrackets[350].func()
end

local e = macro(500, "500+", function() end)
if e.isOn() then
  lvlBrackets[500].func()
end

local f = macro(500, "650+", function() end)
if f.isOn() then
  lvlBrackets[650].func()
end

local g = macro(500, "900+", function() end)
if g.isOn() then
  lvlBrackets[900].func()
end

local h = macro(500, "1100+", function() end)
if h.isOn() then
  lvlBrackets[1100].func()
end

local i = macro(500, "1400+", function() end)
if i.isOn() then
  lvlBrackets[1400].func()
end

local j = macro(500, "1700+", function() end)
if j.isOn() then
  lvlBrackets[1700].func()
end

local k = macro(500, "1900+", function() end)
if k.isOn() then
  lvlBrackets[1900].func()
end

local l = macro(500, "2000+", function() end)
if l.isOn() then
  lvlBrackets[2000].func()
end

local m = macro(500, "Dungeons", function() end)
if m.isOn() then
  lvlBrackets["Dungeons"].func()
end

local n = macro(500, "Quests", function() end)
if n.isOn() then
  lvlBrackets["Quests"].func()
end

addSeparator()
UI.Label("Automatically load waypoints based on level.")
UI.Label("Restart macros if changed.")
local autoLoadWaypoints = macro(500, "Auto-Load Configs", function() end)
if autoLoadWaypoints.isOn() then
  if (lvl() >= lvlBrackets[0].min and lvl() < lvlBrackets[0].max) then
    lvlBrackets[0].func()
  elseif (lvl() >= lvlBrackets[80].min and lvl() < lvlBrackets[80].max) then
    lvlBrackets[80].func()
  elseif (lvl() >= lvlBrackets[200].min and lvl() < lvlBrackets[200].max) then
    lvlBrackets[200].func()
  elseif (lvl() >= lvlBrackets[350].min and lvl() < lvlBrackets[350].max) then
    lvlBrackets[350].func()
  elseif (lvl() >= lvlBrackets[500].min and lvl() < lvlBrackets[500].max) then
    lvlBrackets[500].func()
  elseif (lvl() >= lvlBrackets[650].min and lvl() < lvlBrackets[650].max) then
    lvlBrackets[650].func()
  elseif (lvl() >= lvlBrackets[900].min and lvl() < lvlBrackets[900].max) then
    lvlBrackets[900].func()
  elseif (lvl() >= lvlBrackets[1100].min and lvl() < lvlBrackets[1100].max) then
    lvlBrackets[1100].func()
  elseif (lvl() >= lvlBrackets[1400].min and lvl() < lvlBrackets[1400].max) then
    lvlBrackets[1400].func()
  elseif (lvl() >= lvlBrackets[1700].min and lvl() < lvlBrackets[1700].max) then
    lvlBrackets[1700].func()
  elseif (lvl() >= lvlBrackets[1900].min and lvl() < lvlBrackets[1900].max) then
    lvlBrackets[1900].func()
  elseif (lvl() >= lvlBrackets[2000].min and lvl() < lvlBrackets[2000].max) then
    lvlBrackets[2000].func()
  else
    lvlBrackets["Default"].func()
  end
end

addSeparator()
