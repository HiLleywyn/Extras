setDefaultTab("Cave")

addSeparator()

cfgBracket = ""

lvlBrackets = {
  [0] = {
    min = 0,
    max = 80,
    cfg = "/Configs/Cave/0" --func = function() say("It worked.") end
  },
  [80] = {
    min = 80,
    max = 200,
    cfg = "/Configs/Cave/80"
  },
  [200] = {
    min = 200,
    max = 350,
    cfg = "/Configs/Cave/200"
  },
  [350] = {
    min = 350,
    max = 500,
    cfg = "/Configs/Cave/350",

  },
  [500] = {
    min = 500,
    max = 650,
    cfg = "/Configs/Cave/500"
  },
  [650] = {
    min = 650,
    max = 900,
    cfg = "/Configs/Cave/650"
  },
  [900] = {
    min = 900,
    max = 1100,
    cfg = "/Configs/Cave/900"
  },
  [1100] = {
    min = 1100,
    max = 1400,
    cfg = "/Configs/Cave/1100"
  },
  [1400] = {
    min = 1400,
    max = 1600,
    cfg = "/Configs/Cave/1400"
  },
  ["Default"] = {
    cfg = "/Configs/Cave"
  }
}
local autoLoadWaypoints = macro(500, "Auto-Load Configs", function() end)
UI.Label("Load only your level bracket's waypoint configs.")
UI.Label("Restart macros if changed.")
if autoLoadWaypoints.isOn() then
  if (lvl() >= 1 and lvl() < 80) then
    storage.cfgBracket = lvlBrackets[0].cfg
    storage.cfgBracketNext = storage.cfgBracket
  elseif (lvl() >= 80 and lvl() < 200) then
    storage.cfgBracket = lvlBrackets[80].cfg
    storage.cfgBracketNext = storage.cfgBracket
  elseif (lvl() >= 200 and lvl() < 350) then
    storage.cfgBracket = lvlBrackets[200].cfg
    storage.cfgBracketNext = storage.cfgBracket
  elseif (lvl() >= 350 and lvl() < 500) then
    storage.cfgBracket = lvlBrackets[350].cfg
    storage.cfgBracketNext = storage.cfgBracket
  elseif (lvl() >= 500 and lvl() < 650) then
    storage.cfgBracket = lvlBrackets[500].cfg
    storage.cfgBracketNext = storage.cfgBracket
  elseif (lvl() >= 650 and lvl() < 900) then
    storage.cfgBracket = lvlBrackets[650].cfg
    storage.cfgBracketNext = storage.cfgBracket
  elseif (lvl() >= 900 and lvl() < 1100) then
    storage.cfgBracket = lvlBrackets[900].cfg
    storage.cfgBracketNext = storage.cfgBracket
  elseif (lvl() >= 1100 and lvl() < 1400) then
    storage.cfgBracket = lvlBrackets[1100].cfg
    storage.cfgBracketNext = storage.cfgBracket
  elseif (lvl() >= 1400 and lvl() < 1500) then
    storage.cfgBracket = lvlBrackets[1400].cfg
    storage.cfgBracketNext = storage.cfgBracket
  else
    storage.cfgBracket = lvlBrackets["Default"].cfg
    storage.cfgBracketNext = storage.cfgBracket
  end
else
  storage.cfgBracket = lvlBrackets["Default"].cfg
  storage.cfgBracketNext = storage.cfgBracket
end

addSeparator()
