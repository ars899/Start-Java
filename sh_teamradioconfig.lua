TeamRadio = {}

--Addon Config
TeamRadio.Config = {}
TeamRadio.Config.GlobalRadio = {} -- Jobs who can talk to everybody
TeamRadio.radioChannel = {} -- DO NOT DELETE THIS LINE!

--Box
TeamRadio.Config.TextColor = Color(255, 255, 255)
TeamRadio.Config.TextBoxColor = Color(0, 0, 0, 180)

--Player
TeamRadio.Config.PlayerBoxColor = Color(52, 152, 219)
TeamRadio.Config.PlayerNameColor = Color(255, 255, 255)
TeamRadio.Config.KeyToTurnOn = IN_RELOAD
TeamRadio.Config.SwitchChannelKey = IN_ATTACK


--Channels will came here
TeamRadio.radioChannel[1] = {
	channelName = "501st", --Channel name
	channelColor = Color(0, 0, 238), --Channel color
	jobs = {"501st" } -- Channel jobs
}
TeamRadio.radioChannel[2] = {
	channelName = "212th", --Channel name
	channelColor = Color(255, 215, 0), --Channel color
	jobs = {"212th" } -- Channel jobs
}
TeamRadio.radioChannel[3] = {
	channelName = "41th", --Channel name
	channelColor = Color(0, 205, 0), --Channel color
	jobs = {"41th" } -- Channel jobs
}
TeamRadio.radioChannel[4] = {
	channelName = "104st", --Channel name
	channelColor = Color(178, 34, 34), --Channel color
	jobs = {"104st" } -- Channel jobs
}
TeamRadio.radioChannel[5] = {
	channelName = "ARC", --Channel name
	channelColor = Color(0, 0, 139), --Channel color
	jobs = {"ARC" } -- Channel jobs
}
TeamRadio.radioChannel[6] = {
	channelName = "Галактическая Пехота", --Channel name
	channelColor = Color(255, 20, 147), --Channel color
	jobs = {"Галактическая Пехота" } -- Channel jobs
}
TeamRadio.radioChannel[7] = {
	channelName = "ARF", --Channel name
	channelColor = Color(91, 91, 91), --Channel color
	jobs = {"ARF" } -- Channel jobs
}
TeamRadio.radioChannel[8] = {
	channelName = "Волчья стая", --Channel name
	channelColor = Color(153, 153, 153), --Channel color
	jobs = {"Волчья стая" } -- Channel jobs
}
TeamRadio.radioChannel[9] = {
	channelName = "Инженеры", --Channel name
	channelColor = Color(238, 201, 0), --Channel color
	jobs = {"Инженеры" } -- Channel jobs
}
TeamRadio.radioChannel[10] = {
	channelName = "RC", --Channel name
	channelColor = Color(255, 128, 0), --Channel color
	jobs = {"RCRC" } -- Channel jobs
}