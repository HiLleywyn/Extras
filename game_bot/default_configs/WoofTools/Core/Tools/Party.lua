UI.Separator()

autoParty = macro(500, "Enable Auto-Party", function ()
  local inviteOne = getPlayerByName(storage.memberOne)
  local inviteTwo = getPlayerByName(storage.memberTwo)
  local inviteThree = getPlayerByName(storage.memberThree)

  if inviteOne:isPartyMember() then return end
  if inviteOne:getShield() == 2 then return end

  if inviteTwo:isPartyMember() then return end
  if inviteTwo:getShield() == 2 then return end

  if inviteThree:isPartyMember() then return end
  if inviteThree:getShield() == 2 then return end

  if inviteOne ~= nil then
    g_game.partyInvite(inviteOne:getId())
  end

  if inviteTwo ~= nil then
    g_game.partyInvite(inviteTwo:getId())
  end

  if inviteThree ~= nil then
    g_game.partyInvite(inviteThree:getId())
  end
end) -- autoParty

UI.Separator()
UI.Label("Auto-Party Members")
UI.Separator()

addTextEdit("memberOne", storage.memberOne or "memberOne", function(widget, text)
  storage.memberOne = text
end)

addTextEdit("memberTwo", storage.memberTwo or "memberTwo", function(widget, text)
  storage.memberTwo = text
end)

addTextEdit("memberThree", storage.memberThree or "memberThree", function(widget, text)
  storage.memberThree = text
end)
