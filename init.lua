AddCSLuaFile("autorun/client/cl_init.lua")
AddCSLuaFile("autorun/client/config.lua")
include('autorun/client/config.lua')


resource.AddWorkshop("711953018")
resource.AddFile( "resource/fonts/big_noodle_titling.ttf" )
resource.AddFile( "resource/fonts/big_noodle_titling_oblique.ttf" )
resource.AddFile( "resource/fonts/oswald_light.ttf" )


util.AddNetworkString("LkAdvert")
util.AddNetworkString("SendAdvert")
net.Receive("LkAdvert",function(len, ply)

	local n = net.ReadTable()
	local str = lkCalloutsItems[tonumber(n["OptionNumber"])]["OnPress"]
	--print("str: " .. str)
	local options = n["Options"]

	for k, v in pairs(options) do
		str = string.Replace(str,v[1],tostring(v[2]))
	end

	str = string.Replace(str,"%Player", ply:Nick())

	local tempTable = {}
	tempTable["title"] = lkCalloutsItems[tonumber(n["OptionNumber"])]["PrintName"]
	tempTable["message"] = str
	--PrintTable(tempTable)

	net.Start("SendAdvert")
	net.WriteTable(tempTable)
	net.Broadcast()

end)


util.AddNetworkString("LkUseFail")
net.Receive('LkUseFail', function(length, ply)
	local msgVar = net.ReadString()
	DarkRP.notify(ply, 1, 3, "You are not able to use " .. msgVar .. "!")
end)

util.AddNetworkString("cannotClick")
net.Receive("cannotClick",function(len, ply)
	local tm = net.ReadString()
	DarkRP.notify(ply, 1, 3, "You are not able to use this for another " .. tm .. " secconds!")
end)

util.AddNetworkString("FailedAdvert")
net.Receive("FailedAdvert",function(len, ply)
	DarkRP.notify(ply, 1, 3, "You have not filled in the correct fields!")
end)