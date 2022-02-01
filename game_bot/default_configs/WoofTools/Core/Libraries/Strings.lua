--------------------------------------------------------------------------------
Libraries.Strings = {}
--------------------------------------------------------------------------------
-- Strings Library
--------------------------------------------------------------------------------
-- Return first word string
-- String = String to find word from.
-- Start: Position to start from in the word.
Libraries.Strings.getFirstWord = function(string, start)
    return string.sub(string, 1, string.len(start)) == start
end
--------------------------------------------------------------------------------
-- Return number in text or nil
Libraries.Strings.getFirstNumber = function(text)
    local n = nil
    if string.match(text, "%d+") then n = tonumber(string.match(text, "%d+")) end
    return n
end
--------------------------------------------------------------------------------
-- Sends white info message.
Libraries.Strings.whiteInfoMessage = function(text)
    return modules.game_textmessage.displayGameMessage(text)
end
--------------------------------------------------------------------------------
-- Sends white status message.
Libraries.Strings.statusMessage = function(text, logInConsole)
    return not logInConsole and modules.game_textmessage.displayFailureMessage(text) or modules.game_textmessage.displayStatusMessage(text)
end
--------------------------------------------------------------------------------
-- Sends red status message.
Libraries.Strings.broadcastMessage = function(text)
    return modules.game_textmessage.displayBroadcastMessage(text)
end
--------------------------------------------------------------------------------
