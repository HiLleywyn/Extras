--------------------------------------------------------------------------------
Libraries.NPCs = {}
--------------------------------------------------------------------------------
-- NPCs Library
--------------------------------------------------------------------------------
-- almost every talk action inside cavebot has to be done by using schedule
-- therefore this is simplified function that doesn't require to build a body for schedule function
Libraries.NPCs.scheduleNpcSay =  function(text, delay)
    if not text or not delay then return false end

    return schedule(delay, function() NPC.say(text) end)
end
--------------------------------------------------------------------------------
