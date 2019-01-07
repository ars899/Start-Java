require("bwhitelist_simplerr")local config = BWhitelist.Config--[[

	██╗    ██╗ █████╗ ██████╗ ███╗   ██╗██╗███╗   ██╗ ██████╗ 
	██║    ██║██╔══██╗██╔══██╗████╗  ██║██║████╗  ██║██╔════╝ 
	██║ █╗ ██║███████║██████╔╝██╔██╗ ██║██║██╔██╗ ██║██║  ███╗
	██║███╗██║██╔══██║██╔══██╗██║╚██╗██║██║██║╚██╗██║██║   ██║
	╚███╔███╔╝██║  ██║██║  ██║██║ ╚████║██║██║ ╚████║╚██████╔╝
	 ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝ 
	                                                          
	If you are using a leak of BWhitelist, before you even bother to configure it, I warn you that the leak WILL NOT work.

	If you are willing to take the risk, you may be causing yourself a danger. SO DON'T DO IT.

	You can purchase the script on ScriptFodder.

	FRANÇAIS

	Si tu utilises un leak de BWhitelist, avant que tu te fasses chier à le configurer, je te préviens que ce leak NE MARCHERA PAS.

	Si tu tiens à prendre le risque, tu te poses un danger inutile. ALORS NE LE FAIS PAS.

	Tu peux acheter ce script sur ScriptFodder.

	------------------------------------------------------------------------------------------------------------------------------------------------------------------


	██████╗ ██╗    ██╗██╗  ██╗██╗████████╗███████╗██╗     ██╗███████╗████████╗     ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ 
	██╔══██╗██║    ██║██║  ██║██║╚══██╔══╝██╔════╝██║     ██║██╔════╝╚══██╔══╝    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ 
	██████╔╝██║ █╗ ██║███████║██║   ██║   █████╗  ██║     ██║███████╗   ██║       ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
	██╔══██╗██║███╗██║██╔══██║██║   ██║   ██╔══╝  ██║     ██║╚════██║   ██║       ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
	██████╔╝╚███╔███╔╝██║  ██║██║   ██║   ███████╗███████╗██║███████║   ██║       ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
	╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝   ╚═╝   ╚══════╝╚══════╝╚═╝╚══════╝   ╚═╝        ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝ 
	                                                                                                                             
	Disclaimer  : The developer is not here to help you with your configuration. If you are getting errors with your config file,
	              unfortunately you are alone.

	Disclaimer  : The default team cannot be whitelisted as this will cause problems with DarkRP.

	SteamID (64): SteamIDs is a way of uniquely identifying a Steam account. Every Steam account has one and they are all different.

	              A SteamID is styled like  : STEAM_0:1:40314158
	              A SteamID64 is styled like: 76561198040894045

	              You can find SteamIDs at various SteamID websites. I recommend my own, http://steamid.billyvenner.xyz or http://steamid.co.uk

	Explanations:

	 ██╗     ██████╗██╗  ██╗ █████╗ ████████╗ ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ 
	███║    ██╔════╝██║  ██║██╔══██╗╚══██╔══╝██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗
	╚██║    ██║     ███████║███████║   ██║   ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║
	 ██║    ██║     ██╔══██║██╔══██║   ██║   ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║
	 ██║    ╚██████╗██║  ██║██║  ██║   ██║   ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝
	 ╚═╝     ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ 
	                                                                                                  

	config.ChatCommand simply allows you to set the chat command for opening BWhitelist.

	Change it to whatever you want. By default, it is !bwhitelist. It is also case insensitive.


	██████╗     ███╗   ███╗ █████╗ ██╗  ██╗██████╗ ███████╗██████╗ ███╗   ███╗██╗████████╗████████╗███████╗██████╗  ██████╗██╗     ███████╗ █████╗ ██████╗ 
	╚════██╗    ████╗ ████║██╔══██╗╚██╗██╔╝██╔══██╗██╔════╝██╔══██╗████╗ ████║██║╚══██╔══╝╚══██╔══╝██╔════╝██╔══██╗██╔════╝██║     ██╔════╝██╔══██╗██╔══██╗
	 █████╔╝    ██╔████╔██║███████║ ╚███╔╝ ██████╔╝█████╗  ██████╔╝██╔████╔██║██║   ██║      ██║   █████╗  ██║  ██║██║     ██║     █████╗  ███████║██████╔╝
	██╔═══╝     ██║╚██╔╝██║██╔══██║ ██╔██╗ ██╔═══╝ ██╔══╝  ██╔══██╗██║╚██╔╝██║██║   ██║      ██║   ██╔══╝  ██║  ██║██║     ██║     ██╔══╝  ██╔══██║██╔══██╗
	███████╗    ██║ ╚═╝ ██║██║  ██║██╔╝ ██╗██║     ███████╗██║  ██║██║ ╚═╝ ██║██║   ██║      ██║   ███████╗██████╔╝╚██████╗███████╗███████╗██║  ██║██║  ██║
	╚══════╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝   ╚═╝      ╚═╝   ╚══════╝╚═════╝  ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝
	                                                                                                                                                       
	Set to true (on) to make it so that only MaxPermitted users can clear whitelists. "Leaders" (explained later) will still be able to remove people from whitelists.

	If this if false (off) "Leaders" will be able to clear whitelists.


	██████╗     ██████╗ ██╗      ██████╗  ██████╗ ███████╗███████╗██╗   ██╗██████╗ ██████╗  ██████╗ ██████╗ ████████╗
	╚════██╗    ██╔══██╗██║     ██╔═══██╗██╔════╝ ██╔════╝██╔════╝██║   ██║██╔══██╗██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝
	 █████╔╝    ██████╔╝██║     ██║   ██║██║  ███╗███████╗███████╗██║   ██║██████╔╝██████╔╝██║   ██║██████╔╝   ██║   
	 ╚═══██╗    ██╔══██╗██║     ██║   ██║██║   ██║╚════██║╚════██║██║   ██║██╔═══╝ ██╔═══╝ ██║   ██║██╔══██╗   ██║   
	██████╔╝    ██████╔╝███████╗╚██████╔╝╚██████╔╝███████║███████║╚██████╔╝██║     ██║     ╚██████╔╝██║  ██║   ██║   
	╚═════╝     ╚═════╝ ╚══════╝ ╚═════╝  ╚═════╝ ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   
	                                                                                                                 
	If true (on), if bLogs is detected on your server BWhitelist actions will be logged.

	You can leave this on even if you don't have bLogs.

	You can buy bLogs at http://billyslogs.xyz :)


	██╗  ██╗    ███╗   ███╗ █████╗ ██╗  ██╗██████╗ ███████╗██████╗ ███╗   ███╗██╗████████╗████████╗███████╗██████╗ ███████╗██╗  ██╗██╗██████╗ ██╗    ██╗██╗  ██╗██╗████████╗███████╗██╗     ██╗███████╗████████╗
	██║  ██║    ████╗ ████║██╔══██╗╚██╗██╔╝██╔══██╗██╔════╝██╔══██╗████╗ ████║██║╚══██╔══╝╚══██╔══╝██╔════╝██╔══██╗██╔════╝██║ ██╔╝██║██╔══██╗██║    ██║██║  ██║██║╚══██╔══╝██╔════╝██║     ██║██╔════╝╚══██╔══╝
	███████║    ██╔████╔██║███████║ ╚███╔╝ ██████╔╝█████╗  ██████╔╝██╔████╔██║██║   ██║      ██║   █████╗  ██║  ██║███████╗█████╔╝ ██║██████╔╝██║ █╗ ██║███████║██║   ██║   █████╗  ██║     ██║███████╗   ██║   
	╚════██║    ██║╚██╔╝██║██╔══██║ ██╔██╗ ██╔═══╝ ██╔══╝  ██╔══██╗██║╚██╔╝██║██║   ██║      ██║   ██╔══╝  ██║  ██║╚════██║██╔═██╗ ██║██╔═══╝ ██║███╗██║██╔══██║██║   ██║   ██╔══╝  ██║     ██║╚════██║   ██║   
	     ██║    ██║ ╚═╝ ██║██║  ██║██╔╝ ██╗██║     ███████╗██║  ██║██║ ╚═╝ ██║██║   ██║      ██║   ███████╗██████╔╝███████║██║  ██╗██║██║     ╚███╔███╔╝██║  ██║██║   ██║   ███████╗███████╗██║███████║   ██║   
	     ╚═╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝   ╚═╝      ╚═╝   ╚══════╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝╚═╝      ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝   ╚═╝   ╚══════╝╚══════╝╚═╝╚══════╝   ╚═╝   
	                                                                                                                                                                                                            
	config.MaxPermittedSkipWhitelist allows you to make it so MaxPermitted users skip whitelists.

	If true, when they try to join a whitelisted job, it will skip the whitelist and let them join it.


	███████╗    ███╗   ███╗ █████╗ ██╗  ██╗██████╗ ███████╗██████╗ ███╗   ███╗██╗████████╗████████╗███████╗██████╗ 
	██╔════╝    ████╗ ████║██╔══██╗╚██╗██╔╝██╔══██╗██╔════╝██╔══██╗████╗ ████║██║╚══██╔══╝╚══██╔══╝██╔════╝██╔══██╗
	███████╗    ██╔████╔██║███████║ ╚███╔╝ ██████╔╝█████╗  ██████╔╝██╔████╔██║██║   ██║      ██║   █████╗  ██║  ██║
	╚════██║    ██║╚██╔╝██║██╔══██║ ██╔██╗ ██╔═══╝ ██╔══╝  ██╔══██╗██║╚██╔╝██║██║   ██║      ██║   ██╔══╝  ██║  ██║
	███████║    ██║ ╚═╝ ██║██║  ██║██╔╝ ██╗██║     ███████╗██║  ██║██║ ╚═╝ ██║██║   ██║      ██║   ███████╗██████╔╝
	╚══════╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝   ╚═╝      ╚═╝   ╚══════╝╚═════╝ 
	                                                                                                               
	config.MaxPermitted users are "administrators" of BWhitelist.

	They can ban users from whitelists, see all whitelists, add anyone to a whitelist, remove anyone, you get the jist.

	It also allows them to edit some areas of the configuration and perform "super admin" like actions. For example, importing
	from other whitelist systems.

	Please make sure only trusted users are part of this group.

	Please follow the example below on how to add users to it.

	config.MaxPermitted = {

		"76561198040894045",   -- SteamID64
		"STEAM_0:1:40314158",  -- SteamID
		"superadmin",          -- Usergroup (works with all admin mods)
		TEAM_ADMIN_ON_DUTY,    -- TEAM_ variable (or the team's number for advanced users)

	}


	 ██████╗     ██████╗ ███████╗██████╗ ███╗   ███╗██╗███████╗███████╗██╗ ██████╗ ███╗   ██╗███████╗
	██╔════╝     ██╔══██╗██╔════╝██╔══██╗████╗ ████║██║██╔════╝██╔════╝██║██╔═══██╗████╗  ██║██╔════╝
	███████╗     ██████╔╝█████╗  ██████╔╝██╔████╔██║██║███████╗███████╗██║██║   ██║██╔██╗ ██║███████╗
	██╔═══██╗    ██╔═══╝ ██╔══╝  ██╔══██╗██║╚██╔╝██║██║╚════██║╚════██║██║██║   ██║██║╚██╗██║╚════██║
	╚██████╔╝    ██║     ███████╗██║  ██║██║ ╚═╝ ██║██║███████║███████║██║╚██████╔╝██║ ╚████║███████║
	 ╚═════╝     ╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
	                                                                                                
	config.Permissions is very like MaxPermitted but in a different structure and functionality.

	Permissions allows you to set what usergroups, SteamIDs and SteamID64s can edit specific whitelists.

	Remember: MaxPermitted users can edit ANY whitelist.

	An example of config.Permissions is below

	config.Permissions = {

		[TEAM_REGIMENT_COMMANDER] = {     --// "Leader"
			TEAM_REGIMENT_MEMBER,         --// "Member"
			TEAM_REGIMENT_UPPER_MEMBER,   --// "Member"
		},

		["superadmin"] = {

			TEAM_REGIMENT_MEMBER,
			TEAM_REGIMENT_UPPER_MEMBER,

		},

		["STEAM_0:1:40314158"] = {

			TEAM_REGIMENT_MEMBER,
			TEAM_REGIMENT_UPPER_MEMBER,

		},

		["76561198040894045"] = {

			TEAM_REGIMENT_MEMBER,
			TEAM_REGIMENT_UPPER_MEMBER,

		},

	}

	As you can see, I have labelled "Leader" and "Member".

	A Leader is a user who is permitted to edit the whitelist of the Members.

	A Leader can be a SteamID, SteamID64, usergroup, TEAM_ variable or a team's number (for advanced users).

	The Member MUST be a TEAM_ variable or a team's number.

	If you get an error here that is similar to "index of table is nil", it means that you are trying to use a TEAM_ variable that does not exist.


	████████╗██╗  ██╗ █████╗ ███╗   ██╗██╗  ██╗    ██╗   ██╗ ██████╗ ██╗   ██╗
	╚══██╔══╝██║  ██║██╔══██╗████╗  ██║██║ ██╔╝    ╚██╗ ██╔╝██╔═══██╗██║   ██║
	   ██║   ███████║███████║██╔██╗ ██║█████╔╝      ╚████╔╝ ██║   ██║██║   ██║
	   ██║   ██╔══██║██╔══██║██║╚██╗██║██╔═██╗       ╚██╔╝  ██║   ██║██║   ██║
	   ██║   ██║  ██║██║  ██║██║ ╚████║██║  ██╗       ██║   ╚██████╔╝╚██████╔╝
	   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ 
	                                                                          
	You've now configured BWhitelist. Thank you for purchasing!

	If you need any help (such as questions ABOUT the configuration and NOT errors please) then you can create a ticket for assistance.

]]

-- These are all just examples! You can change them as you wish

-- 1
	config.ChatCommand = "!bwhitelist"

-- 2
	config.MaxPermittedClear = true

-- 3
	config.bLogsSupport = true

-- 4
	config.MaxPermittedSkipWhitelist = true

-- 5
	config.MaxPermitted = {

		"76561198040894045",
		"STEAM_0:1:40314158",
		"superadmin",
		TEAM_ADMIN_ON_DUTY,

	}

-- 6
	config.Permissions = {

		["superadmin"] = {

			TEAM_CLONE_TROOPER,
			TEAM_YODA,

		},

		["STEAM_0:1:40314158"] = {

			TEAM_PADAWAN,

		},

		["76561198040894045"] = {

			TEAM_REGIMENT_MEMBER,
			TEAM_REGIMENT_LEADER,

		},

		--[TEAM_REGIMENT_LEADER] = {

		--	TEAM_REGIMENT_MEMBER,
			
		--}

	}

-- 7
	config.FailureText = "Вы не можете взять эту профессию!"