--------------------------------------------------------------------------------
Libraries.Tables = {}
--------------------------------------------------------------------------------
-- Tables Library
--------------------------------------------------------------------------------
-- Convert table to string.
Libraries.Tables.toString = function(table)
   if type(table) == 'table' then
      local s = '{ '
      for k,v in pairs(table) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. Libraries.Tables.toString(v) .. ','
      end
      return s .. '} '
   else
      return tostring(table)
   end
end
--------------------------------------------------------------------------------
