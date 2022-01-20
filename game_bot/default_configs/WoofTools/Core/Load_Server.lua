local serverTab = "Main"

setDefaultTab(serverTab)

Server = {}
Server.Extensions = {}

-- Import styles
importStyle("/Core/Server/Main_Server.otui")

-- Load scripts

-- Main_Server.lua must load last
dofile("/Core/Server/Main_Server.lua")
