UI.Separator()

macro(10000, "Auto-Cast Buff", function()
  say(storage.Buff, 10000)
end)
addTextEdit("Buff", storage.Buff or "Utito Gran Mas Frigo", function(widget, text)
  storage.Buff = text
end)
