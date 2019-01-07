-- Ripped functions from help forums and such
-- format_int : http://stackoverflow.com/questions/10989788/lua-format-integer

local function format_int(number)
	local _,_,minus,int,fraction = tostring(number):find("([-]?)(%d+)([.]?%d*)")
	int = int:reverse():gsub("(%d%d%d)","%1,")
	return minus .. int:reverse():gsub("^,","") .. fraction
end

BWhitelist.ShowAll = false

function BWhitelist:nets(m)
	net.Start("bwhitelist_" .. m)
end
function BWhitelist:netr(m,f)
	net.Receive("bwhitelist_" .. m,f)
end

function BWhitelist:hook(h,i,f)
	hook.Remove(h,"bwhitelist_" .. i)
	hook.Add(h,"bwhitelist_" .. i,f)
end
function BWhitelist:unhook(h,i)
	hook.Remove(h,"bwhitelist_" .. i)
end

function BWhitelist:chatprint(msg,typ)
	if (type(msg) ~= "string") then return end
	if (typ ~= nil) then if (type(typ) ~= "string") then return end end

	if (typ == "neutral" or typ == "none" or typ == nil) then
		chat.AddText(Color(255,255,255),"[",Color(0,255,255),"BWhitelist",Color(255,255,255),"] " .. msg)
	elseif (typ == "bad" or typ == "error") then
		chat.AddText(Color(255,255,255),"[",Color(255,0,0),"BWhitelist",Color(255,255,255),"] " .. msg)
	elseif (typ == "good" or typ == "success") then
		chat.AddText(Color(255,255,255),"[",Color(0,255,0),"BWhitelist",Color(255,255,255),"] " .. msg)
	else
		chat.AddText(Color(255,255,255),"[",Color(0,255,255),"BWhitelist",Color(255,255,255),"] " .. msg)
	end
end

function BWhitelist:IsUserGroup(ply,usergroup)
	if (ply:GetNWString("usergroup") == usergroup or ply:IsUserGroup(usergroup) or ply:GetUserGroup() == usergroup) then
		return true
	end
	return false
end

function BWhitelist:HasAccess(ply,teamx,cc)
	if (not IsValid(ply)) then return true end
	if (type(teamx) == "string") then
		for i,v in pairs(team.GetAllTeams()) do
			if (v.Name == teamx) then
				teamx = i
				break
			end
		end
	end
	if (cc) then
		if (BWhitelist.Config.MaxPermittedSkipWhitelist) then
			for i,v in pairs(BWhitelist.Config.MaxPermitted) do
				if (ply:Team() == v) then
					return true
				elseif (ply:SteamID() == v) then
					return true
				elseif (ply:SteamID64() == v) then
					return true
				elseif (BWhitelist:IsUserGroup(ply,v)) then
					return true
				end
			end
		end
	else
		for i,v in pairs(BWhitelist.Config.MaxPermitted) do
			if (ply:Team() == v) then
				return true
			elseif (ply:SteamID() == v) then
				return true
			elseif (ply:SteamID64() == v) then
				return true
			elseif (BWhitelist:IsUserGroup(ply,v)) then
				return true
			end
		end
	end
	for i,v in pairs(BWhitelist.Config.Permissions) do
		if (i == ply:Team()) then
			return table.HasValue(v,teamx)
		elseif (BWhitelist:IsUserGroup(ply,i)) then
			return table.HasValue(v,teamx)
		elseif (ply:SteamID() == i) then
			return table.HasValue(v,teamx)
		elseif (ply:SteamID64() == i) then
			return table.HasValue(v,teamx)
		end
	end
	return false
end

function BWhitelist:font(name,d)
	if (not d) then
		return "bwhitelist_" .. name
	else
		surface.CreateFont("bwhitelist_" .. name,d)
	end
end

function BWhitelist:timer(i,r,d,f)
	timer.Stop("bwhitelist_" .. i)
	timer.Create("bwhitelist_" .. i,r,d,f)
end
function BWhitelist:untimer(i)
	timer.Stop("bwhitelist_" .. i)
end

BWhitelist:font("roboto16",{
	font = "Roboto",
	size = 16,
})

if (IsValid(BWhitelist.Menu)) then
	BWhitelist.Menu:Close()
	BWhitelist:nets("closemenu")
	net.SendToServer()
end

local function mouse_pressed(menu,line,do_not_open)
	menu:AddOption(line:GetValue(1),function()
		SetClipboardText(line:GetValue(1))
	end):SetImage("icon16/user.png")
	w = menu:AddOption(line:GetValue(2),function()
		SetClipboardText(line:GetValue(2))
	end):SetImage("icon16/user.png")
	menu:AddSpacer()
	menu:AddOption("Remove from all whitelists",function()
		BWhitelist:nets("action")
			net.WriteString("remove_from_all")
			net.WriteString(line:GetValue(2))
		net.SendToServer()
		for i,v in pairs(BWhitelist.Whitelist.WhitelistData) do
			for key,value in pairs(v) do
				if (value.type == "steamid" and value.value == line:GetValue(2)) then
					table.remove(BWhitelist.Whitelist.WhitelistData[i],key)
					break
				end
			end
		end
	end):SetImage("icon16/delete.png")
	menu:AddOption("Add to all whitelists",function()
		BWhitelist:nets("action")
			net.WriteString("add_to_all")
			net.WriteString(line:GetValue(2))
		net.SendToServer()
		for i in pairs(BWhitelist.Whitelist.WhitelistData) do
			table.insert(BWhitelist.Whitelist.WhitelistData[i],{
				type = "steamid",
				value = line:GetValue(2),
			})
		end
	end):SetImage("icon16/add.png")
	w = menu:AddSubMenu("Add to whitelist")
	local d = false
	local sorted = {}
	for i in pairs(BWhitelist.Whitelist.WhitelistData) do
		table.insert(sorted,i)
	end
	table.sort(sorted)
	for _,v in pairs(sorted) do
		local i = v
		v = BWhitelist.Whitelist.WhitelistData[i]
		if (not table.HasValue(v,line:GetValue(2))) then
			d = true
			w:AddOption(i,function()
				BWhitelist:nets("action")
					net.WriteString("add_to_whitelist_steamid")
					net.WriteString(i)
					net.WriteString(line:GetValue(2))
				net.SendToServer()
				local plyx = player.GetBySteamID(line:GetValue(2))
				local nom
				if (IsValid(plyx)) then
					nom = plyx:Nick()
				end
				table.insert(BWhitelist.Whitelist.WhitelistData[i],{
					type = "steamid",
					value = line:GetValue(2),
					name = nom or "?",
				})
			end):SetImage("icon16/add.png")
		end
	end
	if (d == false) then
		d = w:AddOption("No enabled whitelists found")
		d:SetImage("icon16/emoticon_unhappy.png")
		function d:OnMousePressed() end
	end
	w = menu:AddSubMenu("Remove from whitelist")
	d = false
	sorted = {}
	for i in pairs(BWhitelist.Whitelist.WhitelistData) do
		table.insert(sorted,i)
	end
	table.sort(sorted)
	for _,v in pairs(sorted) do
		local i = v
		v = BWhitelist.Whitelist.WhitelistData[i]
		for _,x in pairs(v) do
			if (x.type == "steamid" and x.value == line:GetValue(2)) then
				if (BWhitelist:HasAccess(LocalPlayer(),i)) then
					d = true
					w:AddOption(i,function()
						BWhitelist:nets("action")
							net.WriteString("remove_from_whitelist_steamid")
							net.WriteString(i)
							net.WriteString(line:GetValue(2))
						net.SendToServer()
						for l,m in pairs(BWhitelist.Whitelist.WhitelistData[i]) do
							if (m.type == "steamid" and m.value == line:GetValue(2)) then
								table.remove(BWhitelist.Whitelist.WhitelistData[i],l)
							end
						end
					end):SetImage("icon16/delete.png")
				end
			end
		end
	end
	if (d == false) then
		d = w:AddOption("User is not whitelisted")
		d:SetImage("icon16/emoticon_unhappy.png")
		function d:OnMousePressed() end
	end

	if (not do_not_open) then menu:Open() end
end

BWhitelist:netr("menu",function()

	include("bwhitelist/config.lua")

	local admin_mode = net.ReadBool()

	local sent_whitelist = net.ReadBool()

	if (sent_whitelist) then

		local len = net.ReadDouble()
		local dat = net.ReadData(len)
		dat = util.Decompress(dat)

		BWhitelist.Whitelist = util.JSONToTable(dat)

	end

	local function listPressed(line)
		if (not IsValid(line)) then return end
		local menu = DermaMenu()

			local x
			if (line:GetValue(1) == "SteamID") then
				x = menu:AddOption(line:GetValue(3))
				function x:OnMousePressed() end
				x:SetImage("icon16/user.png")
			end
			x = menu:AddOption(line:GetValue(2))
			function x:OnMousePressed() end
			x:SetImage("icon16/user.png")

			menu:AddSpacer()

			menu:AddOption("Remove",function()
				BWhitelist.List:RemoveLine(line:GetID())
				if (#BWhitelist.List:GetLines() == 0) then
					BWhitelist.List:AddLine("","No entries found!")
				end
				BWhitelist:nets("action")
					if (line:GetValue(1) == "Usergroup") then
						net.WriteString("remove_from_whitelist_usergroup")
						for i,v in pairs(BWhitelist.Whitelist.WhitelistData[BWhitelist.Title:GetText()]) do
							if (v.type == "usergroup" and v.value == line:GetValue(2)) then
								table.remove(BWhitelist.Whitelist.WhitelistData[BWhitelist.Title:GetText()],i)
							end
						end
					elseif (line:GetValue(1) == "SteamID") then
						net.WriteString("remove_from_whitelist_steamid")
						for i,v in pairs(BWhitelist.Whitelist.WhitelistData[BWhitelist.Title:GetText()]) do
							if (v.type == "steamid" and v.value == line:GetValue(2)) then
								table.remove(BWhitelist.Whitelist.WhitelistData[BWhitelist.Title:GetText()],i)
							end
						end
					end
					net.WriteString(BWhitelist.Title:GetText())
					net.WriteString(line:GetValue(2))
				net.SendToServer()
			end):SetImage("icon16/delete.png")

			if (line:GetValue(1) == "SteamID") then
				menu:AddOption("Copy SteamID",function()
					SetClipboardText(line:GetValue(2))
				end):SetImage("icon16/page_copy.png")
				menu:AddOption("Copy Name",function()
					SetClipboardText(line:GetValue(3))
				end):SetImage("icon16/page_copy.png")
			else
				menu:AddOption("Copy Usergroup",function()
					SetClipboardText(line:GetValue(2))
				end):SetImage("icon16/page_copy.png")
			end

		menu:Open()
	end

	BWhitelist.IsSearching = false

	if (IsValid(BWhitelist.Menu)) then BWhitelist.Menu:Close() end

	BWhitelist.Menu = vgui.Create("BFrame")
	BWhitelist.Menu:SetTitle("BWhitelist")
	BWhitelist.Menu:SetSize(600,450)
	BWhitelist.Menu:Center()
	BWhitelist.Menu:MakePopup()
	BWhitelist.Menu:Configured()
	BWhitelist.Menu.OnClose = function()
		BWhitelist:untimer("refresh_playerlist")
	end
	BWhitelist.Menu.CloseButtonClicked = function()
		BWhitelist:nets("closemenu")
		net.SendToServer()
	end

	BWhitelist.RefreshButton = vgui.Create("DImageButton",BWhitelist.Menu)
	BWhitelist.RefreshButton:SetImage("data/bwhitelist/refresh.png")
	BWhitelist.RefreshButton:SetSize(8,8)
	BWhitelist.RefreshButton:AlignRight(26)
	BWhitelist.RefreshButton:AlignTop(7)
	BWhitelist.RefreshButton.DoClick = function()
		BWhitelist:nets("needrefresh")
		net.SendToServer()
		BWhitelist.Menu:Close()
	end

	if (admin_mode) then
		BWhitelist.Menu:SetTitle("BWhitelist | Admin Mode")
		BWhitelist.Menu:SetIcon("icon16/shield_add.png")
	else
		BWhitelist.Menu:SetTitle("BWhitelist | User Mode")
		BWhitelist.Menu:SetIcon("icon16/shield_delete.png")
	end

	BWhitelist.Tabs = vgui.Create("BTabs",BWhitelist.Menu)
	BWhitelist.Tabs:SetSize(BWhitelist.Menu:GetWide(),35)
	BWhitelist.Tabs:AlignTop(24)

	--// Jobs Tab //--

	BWhitelist.JobsTab = vgui.Create("BTabs_Panel",BWhitelist.Menu)
	BWhitelist.JobsTab:SetTabs(BWhitelist.Tabs)
	BWhitelist.JobsTab:SetSize(BWhitelist.Menu:GetWide(),BWhitelist.Menu:GetTall() - 24 - 35)

	local s = 25
	if (admin_mode) then
		s = 0
	end

	BWhitelist.Categories = vgui.Create("BCategories",BWhitelist.JobsTab)
	BWhitelist.Categories:SetSize(150,BWhitelist.JobsTab:GetTall() - s)
	BWhitelist.Categories:AlignBottom(s)

	if (not admin_mode) then
		BWhitelist.CheckboxBg = vgui.Create("DPanel",BWhitelist.JobsTab)
		BWhitelist.CheckboxBg:SetSize(150,25)
		BWhitelist.CheckboxBg:AlignBottom(0)
		BWhitelist.CheckboxBg.Paint = function(self)
			surface.SetDrawColor(Color(26,26,26))
			surface.DrawRect(0,0,self:GetWide(),self:GetTall())
		end
	end

	BWhitelist.Panel = vgui.Create("DPanel",BWhitelist.JobsTab)
	BWhitelist.Panel:SetSize(BWhitelist.JobsTab:GetWide() - 150,66 + 20)
	BWhitelist.Panel:AlignRight(0)
	BWhitelist.Panel:AlignTop(0)
	BWhitelist.Panel.Paint = function(self)
		surface.SetDrawColor(Color(242,242,242))
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())

		surface.SetDrawColor(Color(206,206,206))
		surface.DrawLine(0,self:GetTall() - 1,self:GetWide(),self:GetTall() - 1)
	end

	BWhitelist.Add = vgui.Create("BButton",BWhitelist.Panel)
	BWhitelist.Add:SetText("+ Add")
	BWhitelist.Add:SetSize(50,25)
	BWhitelist.Add:AlignRight(5)
	BWhitelist.Add:AlignBottom(5)
	BWhitelist.Add.DoClick = function()
		local menu = DermaMenu()

			menu:AddOption("SteamID/64",function()
				Billy_StringRequest("Add","Enter a SteamID or SteamID64","SteamID/SteamID64",function(text)
					if (text:find("STEAM_%d:%d:%d+") or text:find("7656%d+")) then
						for i,v in pairs(BWhitelist.List:GetLines()) do
							if (v:GetValue(2) == "No entries found!") then
								BWhitelist.List:RemoveLine(i)
							end
						end
						if (text:find("7656%d+")) then
							text = util.SteamIDFrom64(text)
						end
						local plyn
						local ply = player.GetBySteamID(text)
						if (IsValid(ply)) then
							plyn = ply:Nick()
						end
						local found = false
						for _,v in pairs(BWhitelist.Whitelist.WhitelistData[BWhitelist.Title:GetText()]) do
							if (v.type == "steamid" and v.value == text) then
								found = true
								break
							end
						end
						if (not found) then
							BWhitelist:nets("action")
								net.WriteString("add_to_whitelist_steamid")
								net.WriteString(BWhitelist.Title:GetText())
								net.WriteString(text)
							net.SendToServer()
							local w = BWhitelist.List:AddLine("SteamID",text,plyn or "?")
							function w:OnMousePressed()
								listPressed(w)
							end
							function w:OnCursorMoved() end
							table.insert(BWhitelist.Whitelist.WhitelistData[BWhitelist.Title:GetText()],{
								type = "steamid",
								value = text,
								name = plyn or "?",
							})
						end
					else
						Billy_Message("That wasn't a SteamID!","Invalid","Continue")
					end
				end,nil,"Add","Cancel")
			end):SetImage("icon16/add.png")

			menu:AddOption("Usergroup",function()
				Billy_StringRequest("Add","Enter a usergroup",nil,function(text)
					for i,v in pairs(BWhitelist.List:GetLines()) do
						if (v:GetValue(2) == "No entries found!") then
							BWhitelist.List:RemoveLine(i)
						end
					end
					local found = false
					for _,v in pairs(BWhitelist.Whitelist.WhitelistData[BWhitelist.Title:GetText()]) do
						if (v.type == "usergroup" and v.value == text) then
							found = true
							break
						end
					end
					if (not found) then
						local w = BWhitelist.List:AddLine("Usergroup",text,"")
						function w:OnMousePressed()
							listPressed(w)
						end
						function w:OnCursorMoved() end
						BWhitelist:nets("action")
							net.WriteString("add_to_whitelist_usergroup")
							net.WriteString(BWhitelist.Title:GetText())
							net.WriteString(text)
						net.SendToServer()
						table.insert(BWhitelist.Whitelist.WhitelistData[BWhitelist.Title:GetText()],{
							type = "usergroup",
							value = text,
						})
					end
				end,nil,"Add","Cancel")
			end):SetImage("icon16/add.png")

		menu:Open()
	end

	BWhitelist.ClearWhitelist = vgui.Create("BButton",BWhitelist.Panel)
	BWhitelist.ClearWhitelist:SetText("Clear whitelist")
	BWhitelist.ClearWhitelist:SetSize(100,25)
	BWhitelist.ClearWhitelist:AlignLeft(5)
	BWhitelist.ClearWhitelist:AlignBottom(5)
	BWhitelist.ClearWhitelist.DoClick = function()
		BWhitelist:nets("action")
			net.WriteString("clear_whitelist")
			net.WriteString(BWhitelist.Title:GetText())
		net.SendToServer()

		BWhitelist.Whitelist.WhitelistData[BWhitelist.Title:GetText()] = {}
		BWhitelist.List:Clear()
		BWhitelist.List:AddLine("","No entries found!")
	end
	if (BWhitelist.Config.MaxPermittedClear) then
		if (not admin_mode) then
			BWhitelist.ClearWhitelist:SetDisabled(true)
			BWhitelist.ClearWhitelist:SetIcon("icon16/shield.png")
			BWhitelist.ClearWhitelist.DoClick = nil
		end
	end

	BWhitelist.DisableWhitelist = vgui.Create("BButton",BWhitelist.Panel)
	BWhitelist.DisableWhitelist:SetText("Disable whitelist")
	BWhitelist.DisableWhitelist:SetSize(100,25)
	BWhitelist.DisableWhitelist:AlignLeft(110)
	BWhitelist.DisableWhitelist:AlignBottom(5)
	BWhitelist.DisableWhitelist.DoClick = function()
		local n = BWhitelist.Title:GetText()

		BWhitelist:nets("action")
			net.WriteString("disable_whitelist")
			net.WriteString(n)
		net.SendToServer()

		BWhitelist.Whitelist.WhitelistsEnabled[n] = nil
		BWhitelist.Whitelist.WhitelistData[n] = nil

		BWhitelist.Bg:Stop()
		BWhitelist.Bg:MoveTo(BWhitelist.Menu:GetWide() - BWhitelist.Bg:GetWide(),({BWhitelist.Bg:GetPos()})[2],0.5)
		BWhitelist.Bg.Text:SetText("Whitelist not enabled")
		BWhitelist.Bg.Text:SizeToContents()
		BWhitelist.Bg.Text:CenterHorizontal()
		BWhitelist.Bg.Text:CenterVertical(0.4)

		BWhitelist.Bg.EnableButton = vgui.Create("BButton",BWhitelist.Bg)
		BWhitelist.Bg.EnableButton:SetText("Enable Whitelist")
		BWhitelist.Bg.EnableButton:SetSize(100,25)
		BWhitelist.Bg.EnableButton:Center()
		BWhitelist.Bg.EnableButton.DoClick = function()
			BWhitelist:nets("action")
				net.WriteString("enable_whitelist")
				net.WriteString(n)
			net.SendToServer()

			BWhitelist.Whitelist.WhitelistsEnabled[n] = true
			BWhitelist.Whitelist.WhitelistData[n] = {}
			BWhitelist.Bg:Stop()
			BWhitelist.Bg:MoveTo(BWhitelist.JobsTab:GetWide(),({BWhitelist.Bg:GetPos()})[2],0.5)
		end
	end

	BWhitelist.Search = vgui.Create("BTextBox",BWhitelist.Panel)
	BWhitelist.Search:SetSize(BWhitelist.Panel:GetWide() - 40,25)
	BWhitelist.Search:AlignTop(25)
	BWhitelist.Search:AlignLeft(5)
	BWhitelist.Search:SetPlaceHolder("Search...")
	BWhitelist.Search:SetUpdateOnType(true)
	BWhitelist.Search.OnValueChange = function(_,newval)
		BWhitelist.List:Clear()
		if (newval == "") then
			BWhitelist.IsSearching = false
			BWhitelist.CancelButton:SetDisabled(true)
			BWhitelist.List.PopulateFunction(BWhitelist.List.Data)
		else
			BWhitelist.IsSearching = true
			BWhitelist.CancelButton:SetDisabled(false)
			if (not BWhitelist.LoadID) then
				BWhitelist.LoadID = 0
			else
				BWhitelist.LoadID = BWhitelist.LoadID + 1
			end
			local count = 0
			for _,v in pairs(BWhitelist.List.Data) do
				local allow = false
				if (v.type == "steamid") then
					if (newval:find("7656%d+")) then
						if (v.type == "steamid" and v.value:lower() == util.SteamIDFrom64(newval):lower()) then
							allow = true
						end
					else
						if (v.type == "steamid" and v.value:lower() == newval:lower()) then
							allow = true
						end
					end
					if (v.name) then
						if (v.name:lower():find(newval:lower())) then
							allow = true
						end
					end
					if (allow) then
						local w = BWhitelist.List:AddLine("SteamID",v.value,v.name or "?")
						function w:OnMousePressed()
							listPressed(w)
						end
						function w:OnCursorMoved() end
						count = count + 1
					end
				elseif (v.type == "usergroup") then
					if (v.value:lower():find(newval:lower())) then
						allow = true
					end
					if (allow) then
						local w = BWhitelist.List:AddLine("Usergroup",v.value,"")
						function w:OnMousePressed()
							listPressed(w)
						end
						function w:OnCursorMoved() end
						count = count + 1
					end
				end
			end
			if (count == 0) then
				BWhitelist.List:AddLine("Nothing found!","Enter a SteamID","or partial usergroup/name")
			end
			BWhitelist.EntryCount:SetText(count .. "/" .. #BWhitelist.List.Data .. " entries found")
			BWhitelist.EntryCount:SizeToContents()
			BWhitelist.EntryCount:CenterVertical()
		end
	end

	BWhitelist.CancelButton = vgui.Create("BButton",BWhitelist.Panel)
	BWhitelist.CancelButton:SetDisabled(true)
	BWhitelist.CancelButton:SetText("X")
	BWhitelist.CancelButton:SetSize(25,25)
	BWhitelist.CancelButton:AlignRight(5)
	BWhitelist.CancelButton:AlignTop(25)
	BWhitelist.CancelButton.DoClick = function()
		BWhitelist.IsSearching = false
		BWhitelist.Search:Clear()
		BWhitelist.List:Clear()
		BWhitelist.List.PopulateFunction(BWhitelist.List.Data)
	end
	BWhitelist.CancelButton.PaintOver = function()
		if (not IsValid(BWhitelist.CancelButton)) then return end
		if (BWhitelist.IsSearching) then
			BWhitelist.CancelButton:SetDisabled(false)
		else
			BWhitelist.CancelButton:SetDisabled(true)
		end
	end

	BWhitelist.Title = vgui.Create("BLabel",BWhitelist.Panel)
	BWhitelist.Title:SetText("")
	BWhitelist.Title:SizeToContents()
	BWhitelist.Title:AlignTop(5)
	BWhitelist.Title:CenterHorizontal()

	BWhitelist.List = vgui.Create("BListView",BWhitelist.JobsTab)
	BWhitelist.List:SetSize(BWhitelist.JobsTab:GetWide() - 150,BWhitelist.JobsTab:GetTall() - 66 - 20 - 35)
	BWhitelist.List:AlignRight(0)
	BWhitelist.List:AlignBottom(35)
	BWhitelist.List:AddColumn("Type"):SetFixedWidth(120)
	BWhitelist.List:AddColumn("Whitelisted")
	BWhitelist.List:AddColumn("Name")
	BWhitelist.List.PopulateFunction = function(tbl)
		if (not BWhitelist.LoadID) then
			BWhitelist.LoadID = 0
		else
			BWhitelist.LoadID = BWhitelist.LoadID + 1
		end
		local this_load = BWhitelist.LoadID
		local max = #tbl
		for i,v in pairs(tbl) do
			timer.Simple(0.01 * i,function()
				if (BWhitelist.LoadID ~= this_load) then return end
				if (not IsValid(BWhitelist.List)) then return end
				BWhitelist.EntryCount:SetText(format_int(i) .. "/" .. max .. " entries")
				BWhitelist.EntryCount:SizeToContents()
				BWhitelist.EntryCount:CenterVertical()
				BWhitelist.Title:SizeToContents()
				BWhitelist.Title:CenterHorizontal()
				local w = false
				if (v.type == "usergroup") then
					w = BWhitelist.List:AddLine("Usergroup",v.value,"")
				elseif (v.type == "steamid") then
					w = BWhitelist.List:AddLine("SteamID",v.value,v.name)
				end
				function w:OnMousePressed()
					listPressed(w)
				end
				function w:OnCursorMoved() end
			end)
		end
	end

	BWhitelist.Bg = vgui.Create("DPanel",BWhitelist.JobsTab)
	BWhitelist.Bg:SetSize(BWhitelist.JobsTab:GetWide() - 150,BWhitelist.JobsTab:GetTall() - 35)
	BWhitelist.Bg:AlignBottom(35)
	BWhitelist.Bg:AlignRight(0)
	BWhitelist.Bg.Paint = function(self)
		surface.SetDrawColor(Color(26,26,26))
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())
	end
	BWhitelist.Bg.Text = vgui.Create("DLabel",BWhitelist.Bg)
	BWhitelist.Bg.Text:SetTextColor(Color(255,255,255))
	BWhitelist.Bg.Text:SetFont(BWhitelist:font("roboto16"))
	BWhitelist.Bg.Text:SetText("Select a job on the left")
	BWhitelist.Bg.Text:SizeToContents()
	BWhitelist.Bg.Text:Center()

	BWhitelist.Panel2 = vgui.Create("DPanel",BWhitelist.JobsTab)
	BWhitelist.Panel2:SetSize(BWhitelist.JobsTab:GetWide() - BWhitelist.Categories:GetWide(),35)
	BWhitelist.Panel2:AlignBottom(0)
	BWhitelist.Panel2:AlignRight(0)
	BWhitelist.Panel2.Paint = function(self)
		surface.SetDrawColor(Color(26,26,26))
		surface.DrawRect(0,0,self:GetWide(),self:GetTall())
	end

	BWhitelist.SteamIDFinder = vgui.Create("BButton",BWhitelist.Panel2)
	BWhitelist.SteamIDFinder:SetText("SteamID Finder")
	BWhitelist.SteamIDFinder:SetSize(100,25)
	BWhitelist.SteamIDFinder:AlignBottom(5)
	BWhitelist.SteamIDFinder:AlignLeft(5)
	BWhitelist.SteamIDFinder.DoClick = function()
		http.Fetch("http://steamid.billyvenner.xyz",function()
			gui.OpenURL("http://steamid.billyvenner.xyz")
		end,function()
			gui.OpenURL("http://steamid.co.uk")
		end)
	end

	BWhitelist.EntryCount = vgui.Create("BLabel",BWhitelist.Panel2)
	BWhitelist.EntryCount:SetText("0/0 entries")
	BWhitelist.EntryCount:SizeToContents()
	BWhitelist.EntryCount:CenterVertical()
	BWhitelist.EntryCount:AlignLeft(112.5)
	BWhitelist.EntryCount:SetTextColor(Color(255,255,255))

	BWhitelist.RefreshWarning = vgui.Create("BLabel",BWhitelist.Panel2)
	BWhitelist.RefreshWarning:SetText("Whitelist was changed, please refresh")
	BWhitelist.RefreshWarning:SizeToContents()
	BWhitelist.RefreshWarning:CenterVertical()
	BWhitelist.RefreshWarning:AlignRight(7.5)
	BWhitelist.RefreshWarning:SetTextColor(Color(255,255,255))
	BWhitelist.RefreshWarning:SetVisible(false)

	local function categories()
		BWhitelist.Bg:Stop()
		BWhitelist.Bg:MoveTo(BWhitelist.Menu:GetWide() - BWhitelist.Bg:GetWide(),({BWhitelist.Bg:GetPos()})[2],0.5)
		if (IsValid(BWhitelist.Bg.EnableButton)) then
			BWhitelist.Bg.EnableButton:Remove()
		end
		BWhitelist.Bg.Text:SetText("Select a job on the left")
		BWhitelist.Bg.Text:SizeToContents()
		BWhitelist.Bg.Text:Center()
		BWhitelist.Categories:Clear()
		local function newitem(x)
			BWhitelist.Categories:NewItem(x.name,x.color,function(n,c,f)
				if (IsValid(BWhitelist.Bg.EnableButton)) then BWhitelist.Bg.EnableButton:Remove() end
				BWhitelist.RefreshWarning:SetVisible(false)
				BWhitelist.Bg.Text:SetText("")
				BWhitelist.Title:SetText(n)
				BWhitelist.Title:SizeToContents()
				BWhitelist.Title:AlignTop(5)
				BWhitelist.Title:CenterHorizontal()
				BWhitelist.List:Clear()
				if (BWhitelist:HasAccess(LocalPlayer(),x.name)) then
					if (BWhitelist.Whitelist.WhitelistsEnabled[n]) then
						BWhitelist.Bg:Stop()
						BWhitelist.Bg:MoveTo(BWhitelist.JobsTab:GetWide(),({BWhitelist.Bg:GetPos()})[2],0.5)
						BWhitelist.List.Data = BWhitelist.Whitelist.WhitelistData[n]
						BWhitelist.List.PopulateFunction(BWhitelist.List.Data)
						if (w == false) then
							BWhitelist.List:AddLine("","No entries found!")
						end
					else
						BWhitelist.Bg:Stop()
						BWhitelist.Bg:MoveTo(BWhitelist.Menu:GetWide() - BWhitelist.Bg:GetWide(),({BWhitelist.Bg:GetPos()})[2],0.5)
						BWhitelist.Bg.Text:SetText("Whitelist not enabled")
						BWhitelist.Bg.Text:SizeToContents()
						BWhitelist.Bg.Text:CenterHorizontal()
						BWhitelist.Bg.Text:CenterVertical(0.4)

						BWhitelist.Bg.EnableButton = vgui.Create("BButton",BWhitelist.Bg)
						BWhitelist.Bg.EnableButton:SetText("Enable Whitelist")
						BWhitelist.Bg.EnableButton:SetSize(100,25)
						BWhitelist.Bg.EnableButton:Center()
						BWhitelist.Bg.EnableButton.DoClick = function()
							BWhitelist:nets("action")
								net.WriteString("enable_whitelist")
								net.WriteString(n)
							net.SendToServer()

							BWhitelist.Whitelist.WhitelistsEnabled[n] = true
							BWhitelist.Whitelist.WhitelistData[n] = {}
							BWhitelist.Bg:Stop()
							BWhitelist.Bg:MoveTo(BWhitelist.JobsTab:GetWide(),({BWhitelist.Bg:GetPos()})[2],0.5)
						end
						BWhitelist.List:AddLine("","No entries found!")
					end
				else
					BWhitelist.Bg:Stop()
					BWhitelist.Bg:MoveTo(BWhitelist.Menu:GetWide() - BWhitelist.Bg:GetWide(),({BWhitelist.Bg:GetPos()})[2],0.5)
					BWhitelist.Bg.Text:SetText("No permission")
					BWhitelist.Bg.Text:SizeToContents()
					BWhitelist.Bg.Text:Center()
				end
			end,true)
		end
		if (DarkRP.getCategories) then
			for _,v in pairs(DarkRP.getCategories().jobs) do
				local m = false
				for index,x in pairs(RPExtraTeams) do
					if (index == (GAMEMODE or GM).DefaultTeam) then continue end
					if (x.category ~= v.name) then continue end
					if (BWhitelist.ShowAll == false and not BWhitelist:HasAccess(LocalPlayer(),x.name)) then continue end
					if (BWhitelist.ShowAll == false and GAMEMODE.DefaultTeam == x.team) then continue end
					if (not m) then m = true BWhitelist.Categories:NewCategory(v.name,v.color) end
					newitem(x)
				end
			end
		else
			for index,x in pairs(RPExtraTeams) do
				if (index == (GAMEMODE or GM).DefaultTeam) then continue end
				if (BWhitelist.ShowAll == false and not BWhitelist:HasAccess(LocalPlayer(),x.name)) then continue end
				if (BWhitelist.ShowAll == false and GAMEMODE.DefaultTeam == x.team) then continue end
				newitem(x)
			end
		end
		
	end categories()

	if (not admin_mode) then

		BWhitelist.Checkbox = vgui.Create("DCheckBoxLabel",BWhitelist.JobsTab)
		BWhitelist.Checkbox:SetText("Show all")
		BWhitelist.Checkbox:SetValue(BWhitelist.ShowAll)
		BWhitelist.Checkbox.Label:SetFont("roboto16")
		BWhitelist.Checkbox:AlignBottom(5)
		BWhitelist.Checkbox.Label:SizeToContents()
		BWhitelist.Checkbox.Label:SetTextColor(Color(255,255,255))
		BWhitelist.Checkbox:SizeToContents()
		BWhitelist.Checkbox:SetPos(75 - (BWhitelist.Checkbox:GetWide() / 2),({BWhitelist.Checkbox:GetPos()})[2])
		function BWhitelist.Checkbox:OnChange()
			BWhitelist.ShowAll = BWhitelist.Checkbox:GetChecked()
			categories()
		end

	end

	--// Players Tab //--

	BWhitelist.PlayersTab = vgui.Create("BTabs_Panel",BWhitelist.Menu)
	BWhitelist.PlayersTab:SetTabs(BWhitelist.Tabs)
	BWhitelist.PlayersTab:SetSize(BWhitelist.Menu:GetWide(),BWhitelist.Menu:GetTall() - 24 - 35)

	BWhitelist.PlayersList = vgui.Create("BListView",BWhitelist.PlayersTab)
	BWhitelist.PlayersList:Dock(FILL)
	BWhitelist.PlayersList:AddColumn("Name")
	BWhitelist.PlayersList:AddColumn("SteamID")
	for _,v in pairs(player.GetAll()) do
		local n = BWhitelist.PlayersList:AddLine(v:Nick(),v:SteamID())
		function n:OnMousePressed()
			local menu = DermaMenu()
			mouse_pressed(menu,n)
		end
		function n:OnCursorMoved() end
	end
	BWhitelist:timer("refresh_playerlist",2,0,function()
		if (not IsValid(BWhitelist.PlayersList)) then
			BWhitelist:untimer("refresh_playerlist")
			return
		end
		local found = {}
		for _,v in pairs(BWhitelist.PlayersList:GetLines()) do
			local ply = player.GetBySteamID(v:GetValue(2))
			if (not IsValid(ply)) then
				BWhitelist.PlayersList:RemoveLine(v:GetID())
			else
				found[ply] = true
			end
		end
		for _,v in pairs(player.GetAll()) do
			if (not found[v]) then
				local n = BWhitelist.PlayersList:AddLine(v:Nick(),v:SteamID())
				function n:OnMousePressed()
					local menu = DermaMenu()
					mouse_pressed(menu,n)
				end
				function n:OnCursorMoved() end
			end
		end
	end)

	BWhitelist.Tabs:AddTab("Jobs",BWhitelist.JobsTab)
	BWhitelist.Tabs:AddTab("Players",BWhitelist.PlayersTab)

	if (admin_mode) then

		--// Admin Tab //--

		BWhitelist.AdminTab = vgui.Create("BTabs_Panel",BWhitelist.Menu)
		BWhitelist.AdminTab:SetTabs(BWhitelist.Tabs)
		BWhitelist.AdminTab:SetSize(BWhitelist.Menu:GetWide(),BWhitelist.Menu:GetTall() - 24 - 35)
		BWhitelist.Tabs:AddTab("Admin",BWhitelist.AdminTab)

		local nordahlbutton = vgui.Create("BButton",BWhitelist.AdminTab)
		nordahlbutton:SetText("Import from Nordahl's Whitelisting")
		nordahlbutton:SetSize(225,30)
		nordahlbutton:AlignLeft(5)
		nordahlbutton:AlignTop(5)
		nordahlbutton.DoClick = function()
			BWhitelist:nets("action")
				net.WriteString("import_from_nordahl")
			net.SendToServer()
			nordahlbutton:SetDisabled(true)
		end

	end

	hook.Run("bwhitelist_menu_open")

end)

local error_codes = {
	"Couldn't find Nordahl's Whitelist Job System whitelist file!",
	"The Nordahl's Whitelist Job System whitelist file is corrupted",
	"Successfully imported!",
}
BWhitelist:netr("zwhitelist_error",function()
	local error_code = net.ReadDouble()
	local err = error_codes[error_code]
	if (err) then
		Billy_Message(err,"BWhitelist | Importing","OK")
	else
		Billy_Message("An unknown error occured with trying to import","BWhitelist | Importing Error","OK")
	end
end)

BWhitelist:netr("exists",function()
	Billy_Message("That entry already exists in the whitelist!","BWhitelist | Exists","OK")
end)

BWhitelist:netr("no_permission",function()
	Billy_Message("You don't have permission to edit any whitelists!","BWhitelist | No permission","OK")
end)

local wdict = {
	"You are whitelisted and you have been allowed into this job!",
	"Because you are in Admin Mode, you have been allowed into this job!",
}
BWhitelist:netr("whitelist_success",function()
	local dict_id = net.ReadDouble()
	BWhitelist:chatprint(wdict[dict_id],"good")
end)

concommand.Add("bwhitelist",function()
	BWhitelist:nets("menu")
	net.SendToServer()
end)

properties.Add("whitelistingmenu",{
	Order = 0,
	MenuLabel = "Whitelisting Menu",
	MenuIcon = "icon16/shield.png",
	Filter = function(self,ent,ply)
		if (not IsValid(ent)) then return end
		if (not ent:IsPlayer()) then return end
		if (BWhitelist:HasAccess(LocalPlayer(),team.GetName(ply:Team()))) then
			return true
		end
		return true
	end,
	Action = function() end,
	MenuOpen = function(self,option,ent)
		local submenu = option:AddSubMenu()
		if (BWhitelist.Whitelist) then
			local line = {}
			local line_val = {ent:Nick(),ent:SteamID()}
			function line:GetValue(i)
				return line_val[i]
			end
			mouse_pressed(submenu,line,true)
		else
			submenu:AddOption("Open BWhitelist first",function()
				BWhitelist:nets("menu")
				net.SendToServer()
			end):SetIcon("icon16/delete.png")
		end
	end,
})

BWhitelist:netr("updatewhitelist",function()
	BWhitelist:print("Whitelist updated.","good")
	local l = net.ReadDouble()
	local dat = net.ReadData(l)
	dat = util.Decompress(dat)
	dat = util.JSONToTable(dat)
	BWhitelist.Whitelist = dat

	if (IsValid(BWhitelist.Menu)) then
		BWhitelist.RefreshWarning:SetVisible(true)
	end
end)

BWhitelist:netr("areyouopen",function()
	if (IsValid(BWhitelist.Menu)) then
		BWhitelist:nets("areyouopen")
		net.SendToServer()
	end
end)

BWhitelist:netr("sendpng",function()
	BWhitelist:netr("sendpng",function()
		local name = net.ReadString()
		local pngsize = net.ReadDouble()
		local png = net.ReadData(pngsize)
		png = util.Decompress(png)
		file.Write("bwhitelist/" .. name .. ".png",png)
	end)
	local files = {"refresh"}
	local do_not_have = {}
	for _,v in pairs(files) do
		if (not file.Exists("bwhitelist/" .. v .. ".png","DATA")) then
			table.insert(do_not_have,v)
		end
	end
	if (#do_not_have == 0) then return end
	BWhitelist:nets("sendpng")
		net.WriteTable(do_not_have)
	net.SendToServer()
end)

BWhitelist:netr("whitelistedmsg",function(l,ply)
	local whitelisted = net.ReadBool()
	local teamn_ = net.ReadString()
	if (whitelisted) then
		BWhitelist:chatprint("You were just whitelisted to \"" .. teamn_ .. "\"!","good")
	else
		BWhitelist:chatprint("You were just removed from the whitelist for \"" .. teamn_ .. "\".","bad")
	end
end)