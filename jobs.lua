--[[---------------------------------------------------------------------------
DarkRP custom jobs
---------------------------------------------------------------------------

This file contains your custom jobs.
This file should also contain jobs from DarkRP that you edited.

Note: If you want to edit a default DarkRP job, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the job to this file and edit it.

The default jobs can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/jobrelated.lua

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomJobFields


Add jobs under the following line:
---------------------------------------------------------------------------]]



TEAM_DEFAULT = DarkRP.createJob("Кадет", {
    color = Color(139, 69, 19),
    model = {"models/player/sgg/starwars/republiccommando/cloneadult.mdl",},
    description = [[Вы Кадет, ждите сержанта, что бы пройти обучение для получения класса Клон Солдат]],
    weapons = {"weapon_empty_hands"},
    command = "cadet",
    max = 0,
    salary = 10,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    PlayerLoadout = function(ply) ply:SetHealth (100) end,
    category = "Кадет",
})
 
TEAM_CLONETROOPER = DarkRP.createJob("Клон Солдат", {
   color = Color(205, 201, 201),
   model = {"models/player/sgg/starwars/clonetrooper_clean.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc15s","weapon_empty_hands", "weapon_752_dc15sa"},
   command = "clonetrooper",
   max = 0,
   salary = 20,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
   customCheck = function(ply) return CLIENT or
   table.HasValue({"CT"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
   end,
   CustomCheckFailMsg = "Вы не прошли тренеровку",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (500) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "CT",
})
 
TEAM_501stTrooper = DarkRP.createJob("501st Солдат", {
   color = Color(0, 0, 238),
   model = {"models/player/sgg/starwars/clonetrooper_501st.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc15sa","weapon_empty_hands", "weapon_752_dc15a", "weapon_752_dc15s"},
   command = "501sttrooper",
   max = 20,
   salary = 40,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"501st"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (1000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "501st",
})
 
 TEAM_501stCapral = DarkRP.createJob("501st Капрал", {
   color = Color(0, 0, 238),
   model = {"models/player/sgg/starwars/clonetrooper_501st.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc15sa","weapon_empty_hands", "weapon_752_dc15a", "weapon_752_dc15s"},
   command = "501stcapral",
   max = 10,
   salary = 45,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"501st"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (1500) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "501st",
})

TEAM_501stSergeant = DarkRP.createJob("501st Сержант", {
   color = Color(0, 0, 238),
   model = {"models/player/sgg/starwars/clonetrooper_501st.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc15sa","weapon_empty_hands", "weapon_752_dc15a", "weapon_752_dc15s"},
   command = "501stSergeant",
   max = 10,
   salary = 50,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"501st"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (2000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "501st",
})
 
TEAM_501stMedic = DarkRP.createJob("501st Медик", {
   color = Color(0, 0, 238),
   model = {"models/player/sgg/starwars/clonetrooper_neyo.mdl"},
   description = [[]],
   weapons = {"weapon_752_dl44","weapon_empty_hands","med_kit"},
   command = "501stmedic",
   max = 1,
   salary = 80,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"501st"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (4000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "501st",
})

TEAM_501stStSergeant = DarkRP.createJob("501st Старший Сержант", {
   color = Color(0, 0, 238),
   model = {"models/clones/clone327.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc17","weapon_empty_hands", "weapon_752_dlt19"},
   command = "501ststsergeant",
   max = 5,
   salary = 60,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"501st"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (2500) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "501st",
})
 
TEAM_501stLieutenant = DarkRP.createJob("501st Лейтенант", {
   color = Color(0, 0, 238),
   model = {"models/clones/clone327.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc17","weapon_empty_hands", "weapon_752_dlt19"},
   command = "501stlieutenant",
   max = 5,
   salary = 80,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"501st"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (4000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "501st",
})
 
TEAM_501stMajor = DarkRP.createJob("501st Майор", {
   color = Color(0, 0, 238),
   model = {"models/player/asgclonewars/trooper_501st_para/clonetrooper_501st_para.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc17","weapon_empty_hands", "weapon_752_dlt19"},
   command = "501stmajor",
   max = 3,
   salary = 100,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"501st"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (5000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "501st",
})
 
 TEAM_501stColonel = DarkRP.createJob("501st Подполковник", {
   color = Color(0, 0, 238),
   model = {"models/player/asgclonewars/trooper_501st_para/clonetrooper_501st_para.mdl"},
   description = [[]],
   weapons = {"weapon_752_dh17","weapon_empty_hands", "weapon_752_dlt19"},
   command = "501stcolonel",
   max = 1,
   salary = 150,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"501st"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (6000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "501st",
})
 
TEAM_501stCommander = DarkRP.createJob("501st Коммандир", {
   color = Color(0, 0, 238),
   model = {"models/clones/clonedavis.mdl"},
   description = [[]],
   weapons = {"weapon_752_dh17","weapon_empty_hands", "weapon_752_dlt19"},
   command = "501stcommander",
   max = 1,
   salary = 150,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"501st"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (8000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "501st",
})

TEAM_501stGeneral = DarkRP.createJob("501st Генерал", {
   color = Color(0, 0, 238),
   model = {"models/kriegsyntax/sw_752/anakin_est.mdl"},
   description = [[]],
   weapons = {"weapon_lightsaber","weapon_empty_hands","sswep_anakin"},
   command = "501stgeneral",
   max = 1,
   salary = 1000,
   admin = 2,
   vote = false,
   hasLicense = false,
   candemote = false,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"501st"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (20000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "501st",
})
 
TEAM_212thTrooper = DarkRP.createJob("212th Солдат", {
   color = Color(255, 215, 0),
   model = {"models/player/sgg/starwars/clonetrooper_212nd.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc15sa","weapon_empty_hands", "weapon_752_dc15a"},
   command = "212thtrooper",
   max = 5,
   salary = 40,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"212th"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (1000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "212th",
})

TEAM_212thCapral = DarkRP.createJob("212th Капрал", {
   color = Color(255, 215, 0),
   model = {"models/player/sgg/starwars/clonetrooper_212nd.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc15sa","weapon_empty_hands", "weapon_752_dc15a"},
   command = "212thcapral",
   max = 10,
   salary = 45,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"212th"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (1500) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "212th",
})
 
TEAM_212thSergeant = DarkRP.createJob("212th Сержант", {
   color = Color(255, 215, 0),
   model = {"models/player/sgg/starwars/clonetrooper_212nd.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc15sa","weapon_empty_hands", "weapon_752_dc15a", "weapon_752_dc15s"},
   command = "212thsergeant",
   max = 10,
   salary = 50,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"212th"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (2000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "212th",
})

TEAM_212thStSergent = DarkRP.createJob("212th Старший Сержант", {
   color = Color(255, 215, 0),
   model = {"models/player/sgg/starwars/clonetrooper_327th.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc17","weapon_empty_hands", "weapon_752_e11"},
   command = "212thstsergeant",
   max = 5,
   salary = 60,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"212th"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (2500) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "212th",
})
 
TEAM_212thMedic = DarkRP.createJob("212th Медик", {
   color = Color(255, 215, 0),
   model = {"models/player/sgg/starwars/clonetrooper_neyo.mdl"},
   description = [[]],
   weapons = {"weapon_752_dl44","weapon_empty_hands","med_kit"},
   command = "212thmedic",
   max = 1,
   salary = 80,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"212th"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (4000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   level = 0,
   category = "212th",
})

TEAM_212thLieutenant = DarkRP.createJob("212th Лейтенант", {
   color = Color(255, 215, 0),
   model = {"models/player/sgg/starwars/clonetrooper_327th.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc17","weapon_empty_hands", "weapon_752_e11"},
   command = "212thlieutenant",
   max = 5,
   salary = 80,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (4000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "212th",
})

TEAM_212thMajor = DarkRP.createJob("212th Майор", {
   color = Color(255, 215, 0),
   model = {"models/player/sgg/starwars/clonetrooper_bee.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc17","weapon_empty_hands", "weapon_752_e11"},
   command = "212thmajor",
   max = 3,
   salary = 100,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (5000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "212th",
})
 
TEAM_212thColonel = DarkRP.createJob("212th Подполковник", {
   color = Color(255, 215, 0),
   model = {"models/player/sgg/starwars/clonetrooper_bee.mdl"},
   description = [[]],
   weapons = {"weapon_752_dh17","weapon_empty_hands", "weapon_752_t21"},
   command = "212thcolonel",
   max = 1,
   salary = 150,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (6000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "212th",
})
 
TEAM_212thCommander = DarkRP.createJob("212th Коммандир", {
   color = Color(255, 215, 0),
   model = {"models/player/sgg/starwars/clonetrooper_bly.mdl"},
   description = [[]],
   weapons = {"weapon_752_dh17","weapon_empty_hands", "weapon_752_t21"},
   command = "212thcommander",
   max = 1,
   salary = 200,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (8000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "212th",
})

TEAM_212thGeneral = DarkRP.createJob("212th Генерал", {
   color = Color(255, 215, 0),
   model = {"models/f4t4l/shaak_ti/shaak_ti.mdl"},
   description = [[]],
   weapons = {"weapon_lightsaber","weapon_empty_hands"},
   command = "212thgeneral",
   max = 1,
   salary = 500,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
   -- CustomCheck
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (15000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "212th",
})
 
TEAM_41thTrooper = DarkRP.createJob("41th Солдат", {
   color = Color(0, 205, 0),
   model = {"models/player/sgg/starwars/clonetrooper_sky.mdl"},
   description = [[]],
   weapons = {"weapon_752_dsbp","weapon_empty_hands", "weapon_752_dc15a"},
   command = "41thtrooper",
   max = 20,
   salary = 40,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"41th"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (1000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "41-элитный отряд",
})
 
TEAM_41thCapral = DarkRP.createJob("41th Капрал", {
   color = Color(0, 205, 0),
   model = {"models/player/sgg/starwars/clonetrooper_sky.mdl"},
   description = [[]],
   weapons = {"weapon_752_dsbp","weapon_empty_hands", "weapon_752_dc15a"},
   command = "41thcapral",
   max = 10,
   salary = 45,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"41th"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (1500) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "41-элитный отряд",
})
 
TEAM_41thSergeant = DarkRP.createJob("41th Сержант", {
   color = Color(0, 205, 0),
   model = {"models/player/sgg/starwars/clonetrooper_sky.mdl"},
   description = [[]],
   weapons = {"weapon_752_dsbp","weapon_empty_hands", "weapon_752_dc15a", "weapon_camo"},
   command = "41thsergeant",
   max = 10,
   salary = 50,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"41th"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (2000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "41-элитный отряд",
})

TEAM_41thMedic = DarkRP.createJob("41th Медик", {
   color = Color(0, 205, 0),
   model = {"models/player/sgg/starwars/clonetrooper_neyo.mdl"},
   description = [[]],
   weapons = {"weapon_752_dl44","weapon_empty_hands","med_kit"},
   command = "41thmedic",
   max = 1,
   salary = 80,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"41th"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (4000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "41-элитный отряд",
})
 
TEAM_41thStSergeant = DarkRP.createJob("41th Старший Сержант", {
   color = Color(0, 205, 0),
   model = {"models/player/sgg/starwars/clonetrooper_gree.mdl"},
   description = [[]],
   weapons = {"weapon_752_dsbp","weapon_empty_hands", "weapon_752_dc15a", "weapon_752_dc17m_sn", "weapon_camo"},
   command = "41thstsergeant",
   max = 5,
   salary = 60,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"41th"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (2500) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "41-элитный отряд",
})
 
TEAM_41thLieutenant = DarkRP.createJob("41th Лейтенант", {
   color = Color(0, 205, 0),
   model = {"models/player/sgg/starwars/clonetrooper_gree.mdl"},
   description = [[]],
   weapons = {"weapon_752_dsbp","weapon_empty_hands", "weapon_752_dc15a", "weapon_752_dc17m_sn", "weapon_camo"},
   command = "41thlieutenant",
   max = 5,
   salary = 80,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"41th"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (4000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "41-элитный отряд",
})
 
TEAM_41thMajor = DarkRP.createJob("41th Майор", {
   color = Color(0, 205, 0),
   model = {"models/player/asgclonewars/trooper_rescue/clonetrooper_rescue.mdl"},
   description = [[]],
   weapons = {"weapon_752_dsbp","weapon_empty_hands", "weapon_752_dc15a", "weapon_752_dc17m_sn", "weapon_camo"},
   command = "41thmajor",
   max = 3,
   salary = 100,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"41th"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (5000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "41-элитный отряд",
})

TEAM_41thColonel = DarkRP.createJob("41th Подполковник", {
   color = Color(0, 205, 0),
   model = {"models/player/asgclonewars/trooper_rescue/clonetrooper_rescue.mdl"},
   description = [[]],
   weapons = {"weapon_752_se14c","weapon_empty_hands", "weapon_752_dc15a", "weapon_752_dc17m_sn", "weapon_camo"},
   command = "41thcolonel",
   max = 3,
   salary = 150,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"41th"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (6000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "41-элитный отряд",
})

TEAM_41thCommander = DarkRP.createJob("41th Коммандир", {
   color = Color(0, 205, 0),
   model = {"models/player/asgclonewars/trooper_442nd/clonetrooper_442nd.mdl"},
   description = [[]],
   weapons = {"weapon_752_se14c","weapon_empty_hands", "weapon_752_dc15a", "weapon_752_dc17m_sn", "weapon_camo"},
   command = "41thcommander",
   max = 3,
   salary = 200,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"41th"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (8000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "41-элитный отряд",
})

TEAM_41thGeneral = DarkRP.createJob("41th Генерал", {
   color = Color(0, 205, 0),
   model = {"models/player/nav/aayla.mdl"},
   description = [[]],
   weapons = {"weapon_lightsaber","weapon_empty_hands"},
   command = "41thgeneral",
   max = 3,
   salary = 500,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"41th"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (15000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "41-элитный отряд",
})
 
TEAM_104stTrooper = DarkRP.createJob("104st Солдат", {
   color = Color(178, 34, 34),
   model = {"models/player/sgg/starwars/clonetrooper_thire.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc17","weapon_empty_hands", "stunstick", "weapon_752_dc15s","weapon_cuff_elastic"},
   command = "104sttrooper",
   max = 20,
   salary = 40,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"104st"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (1000) end,
   category = "104-й батальон",
})

TEAM_104stCapral = DarkRP.createJob("104st Капрал", {
   color = Color(178, 34, 34),
   model = {"models/player/sgg/starwars/clonetrooper_thire.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc17","weapon_empty_hands", "stunstick", "weapon_752_dc15s","weapon_cuff_elastic"},
   command = "104stcapral",
   max = 10,
   salary = 45,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"104st"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (1500) end,
   category = "104-й батальон",
})

TEAM_104stSergeant = DarkRP.createJob("104st Сержант", {
   color = Color(178, 34, 34),
   model = {"models/player/sgg/starwars/clonetrooper_thire.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc17","weapon_empty_hands", "stunstick", "weapon_752_dc15s","weapon_cuff_elastic"},
   command = "104stsergeant",
   max = 10,
   salary = 50,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"104st"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (2000) end,
   category = "104-й батальон",
})

TEAM_104stMedic = DarkRP.createJob("104st Медик", {
   color = Color(178, 34, 34),
   model = {"models/player/sgg/starwars/clonetrooper_neyo.mdl"},
   description = [[]],
   weapons = {"weapon_752_dl44","weapon_empty_hands","weapon_cuff_elastic","med_kit"},
   command = "104stmedic",
   max = 1,
   salary = 80,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"104st"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (4000) end,
   category = "104-й батальон",
})

TEAM_104stStSergeant = DarkRP.createJob("104st Старший Сержант", {
   color = Color(178, 34, 34),
   model = {"models/player/asgclonewars/trooper_officer/clonetrooper_officer.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc17","weapon_empty_hands", "stunstick", "weapon_752_dc15s","weapon_cuff_elastic"},
   command = "104ststsergeant",
   max = 5,
   salary = 80,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"104st"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (2500) end,
   category = "104-й батальон",
})

TEAM_104stLieutenant = DarkRP.createJob("104st Лейтенант", {
   color = Color(178, 34, 34),
   model = {"models/player/asgclonewars/trooper_officer/clonetrooper_officer.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc17","weapon_empty_hands", "stunstick", "weapon_752_dc15s","weapon_cuff_elastic"},
   command = "104stlieutenant",
   max = 5,
   salary = 80,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"104st"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (4000) end,
   category = "104-й батальон",
})

TEAM_104stMajor = DarkRP.createJob("104st Майор", {
   color = Color(178, 34, 34),
   model = {"models/player/sgg/starwars/clonetrooper_arc_captain.mdl"},
   description = [[]],
   weapons = {"weapon_752_kyd21","weapon_empty_hands", "stunstick", "weapon_752_dc15s","weapon_cuff_elastic"},
   command = "104stmajor",
   max = 3,
   salary = 100,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"104st"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (5000) end,
   category = "104-й батальон",
})

TEAM_104stColonel = DarkRP.createJob("104st Подполковник", {
   color = Color(178, 34, 34),
   model = {"models/player/sgg/starwars/clonetrooper_arc_captain.mdl"},
   description = [[]],
   weapons = {"weapon_752_kyd21","weapon_empty_hands", "stunstick", "weapon_752_dc15s","weapon_cuff_elastic"},
   command = "104stcolonel",
   max = 1,
   salary = 150,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"104st"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (6000) end,
   category = "104-й батальон",
})

TEAM_104stCommander = DarkRP.createJob("104st Коммандир", {
   color = Color(178, 34, 34),
   model = {"models/player/sgg/starwars/clonetrooper_deviss.mdl"},
   description = [[]],
   weapons = {"weapon_752_kyd21","weapon_empty_hands", "stunstick", "weapon_752_dc15s","weapon_cuff_elastic"},
   command = "104stcommander",
   max = 1,
   salary = 200,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"104st"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (8000) end,
   category = "104-й батальон",
})

TEAM_104stGeneral = DarkRP.createJob("104st Генерал", {
   color = Color(178, 34, 34),
   model = {"models/jazzmcfly/jka/jtg/jtg.mdl"},
   description = [[]],
   weapons = {"weapon_lightsaber","weapon_empty_hands"},
   command = "104stgeneral",
   max = 1,
   salary = 500,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"104st"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (15000) end,
   category = "104-й батальон",
})
 
TEAM_ARCTrooper = DarkRP.createJob("ARC Солдат", {
   color = Color(0, 0, 139),
   model = {"models/player/sgg/starwars/clonetrooper_arc_defaut.mdl"},
   description = [[]],
   weapons = {"weapon_752_de10","weapon_empty_hands", "weapon_752_dc15a", "weapon_752_dc15s"},
   command = "arctrooper",
   max = 20,
   salary = 40,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ARC"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (1000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "ARC",
})

TEAM_ARCCapral = DarkRP.createJob("ARC Капрал", {
   color = Color(0, 0, 139),
   model = {"models/player/sgg/starwars/clonetrooper_arc_defaut.mdl"},
   description = [[]],
   weapons = {"weapon_752_de10","weapon_empty_hands", "weapon_752_dc15a", "weapon_752_dc15s"},
   command = "arccapral",
   max = 10,
   salary = 45,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ARC"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (1500) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "ARC",
})
 
TEAM_ARCSergeant = DarkRP.createJob("ARC Сержант", {
   color = Color(0, 0, 139),
   model = {"models/player/sgg/starwars/clonetrooper_arc_defaut.mdl"},
   description = [[]],
   weapons = {"weapon_752_de10","weapon_empty_hands", "weapon_752_dc15a", "weapon_752_dc15s", "weapon_752_e11"},
   command = "arcsergeant",
   max = 10,
   salary = 50,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ARC"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (2000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "ARC",
})

TEAM_ARCMedic = DarkRP.createJob("ARC Медик", {
   color = Color(0, 0, 139),
   model = {"models/player/sgg/starwars/clonetrooper_neyo.mdl"},
   description = [[]],
   weapons = {"weapon_752_dl44","weapon_empty_hands","med_kit"},
   command = "arcmedic",
   max = 1,
   salary = 80,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ARC"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (4000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "ARC",
})

TEAM_ARCStSergeant = DarkRP.createJob("ARC Старший Сержант", {
   color = Color(0, 0, 139),
   model = {"models/player/sgg/starwars/clonetrooper_arc_defaut.mdl"},
   description = [[]],
   weapons = {"weapon_752_de10","weapon_empty_hands", "weapon_752_dc15a", "weapon_752_dc15s", "weapon_752_e11", "weapon_swrc_det"},
   command = "arcstsergeant",
   max = 5,
   salary = 60,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ARC"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (2500) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "ARC",
})
 
TEAM_ARCLieutenant = DarkRP.createJob("ARC Лейтенант", {
   color = Color(0, 0, 139),
   model = {"models/player/sgg/starwars/clonetrooper_arc_soldier.mdl"},
   description = [[]],
   weapons = {"weapon_752_de10","weapon_empty_hands", "weapon_752_dc15a", "weapon_752_dc15s", "weapon_752_e11", "weapon_swrc_det"},
   command = "arclieutenant",
   max = 5,
   salary = 80,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ARC"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (4000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "ARC",
})
 
TEAM_ARCMajor = DarkRP.createJob("ARC Майор", {
   color = Color(0, 0, 139),
   model = {"models/player/sgg/starwars/clonetrooper_arc_soldier.mdl"},
   description = [[]],
   weapons = {"weapon_752_de10","weapon_empty_hands", "weapon_752_dc15a", "weapon_752_dc15s", "weapon_752_e11", "weapon_swrc_det"},
   command = "arcmajor",
   max = 3,
   salary = 100,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ARC"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "You have to join the ARC before you can use this job!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (5000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "ARC",
})
 
TEAM_ARCColonel = DarkRP.createJob("ARC Подполковник", {
   color = Color(0, 0, 139),
   model = {"models/player/sgg/starwars/clonetrooper_arc_soldier.mdl"},
   description = [[]],
   weapons = {"weapon_752_de10","weapon_empty_hands", "weapon_752_dc15a", "weapon_752_dc15s", "weapon_752_e11", "weapon_swrc_det"},
   command = "arccolonel",
   max = 1,
   salary = 150,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ARC"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "You have to join the ARC before you can use this job!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (6000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "ARC",
})
 
TEAM_ARCCommander = DarkRP.createJob("ARC Коммандир", {
   color = Color(0, 0, 139),
   model = {"models/player/sscmd/skullsquad_cmd_pm/skullsquad_cmd_pm.mdl"},
   description = [[]],
   weapons = {"weapon_752_de10","weapon_empty_hands", "weapon_752_dc15a", "weapon_752_dc15s", "weapon_752_e11", "weapon_swrc_det"},
   command = "arccommander",
   max = 1,
   salary = 200,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ARC"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "You have to join the ARC before you can use this job!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (8000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "ARC",
})

TEAM_ARCGeneral = DarkRP.createJob("ARC Генерал", {
   color = Color(0, 0, 139),
   model = {"models/kriegsyntax/sw_752/plokoon_est.mdl"},
   description = [[]],
   weapons = {"weapon_lightsaber","weapon_empty_hands"},
   command = "arcgeneral",
   max = 1,
   salary = 500,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ARC"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "You have to join the ARC before you can use this job!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (15000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "ARC",
})
 
TEAM_FLEETTrooper = DarkRP.createJob("Галактический Пехотинец Солдат", {
   color = Color(255, 20, 147),
   model = {"models/player/sgg/starwars/clonetrooper_marine.mdl"},
   description = [[]],
   weapons = {"weapon_752_elg3a", "weapon_752_dc15s","weapon_empty_hands", "weapon_flamer"},
   command = "ftrooper",
   max = 20,
   salary = 40,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"FLEET"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (1000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Галактическая Пехота",
})
 
TEAM_FLEETCapral = DarkRP.createJob("Галактический Пехотинец Капрал", {
   color = Color(255, 20, 147),
   model = {"models/player/sgg/starwars/clonetrooper_marine.mdl"},
   description = [[]],
   weapons = {"weapon_752_elg3a","weapon_empty_hands", "weapon_752_dc15s", "weapon_flamer"},
   command = "fcapral",
   max = 10,
   salary = 45,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"FLEET"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (1500) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Галактическая Пехота",
})

TEAM_FLEETSergeant = DarkRP.createJob("Галактический Пехотинец Сержант", {
   color = Color(255, 20, 147),
   model = {"models/player/sgg/starwars/clonetrooper_marine.mdl"},
   description = [[]],
   weapons = {"weapon_752_elg3a","weapon_empty_hands", "weapon_752_dc15s", "weapon_752_ihr", "weapon_flamer"},
   command = "fsergeant",
   max = 10,
   salary = 50,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"FLEET"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (2000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Галактическая Пехота",
})

TEAM_FLEETMedic = DarkRP.createJob("Галактический Пехотинец Медик", {
   color = Color(255, 20, 147),
   model = {"models/player/sgg/starwars/clonetrooper_neyo.mdl"},
   description = [[]],
   weapons = {"weapon_752_dl44","weapon_empty_hands","med_kit"},
   command = "fmedic",
   max = 1,
   salary = 80,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"FLEET"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (4000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Галактическая Пехота",
})

TEAM_FLEETStSergeant = DarkRP.createJob("Галактический Пехотинец Старший Сержант", {
   color = Color(255, 20, 147),
   model = {"models/player/sgg/starwars/clonetrooper_marine.mdl"},
   description = [[]],
   weapons = {"weapon_752_elg3a","weapon_empty_hands", "weapon_752_dc15s", "weapon_752_ihr", "weapon_flamer"},
   command = "fstsergeant",
   max = 5,
   salary = 60,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"FLEET"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (2500) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Галактическая Пехота",
})

TEAM_FLEETLieutenant = DarkRP.createJob("Галактический Пехотинец Лейтенант", {
   color = Color(255, 20, 147),
   model = {"models/player/sgg/starwars/clonetrooper_deviss3.mdl"},
   description = [[]],
   weapons = {"weapon_752_elg3a","weapon_empty_hands", "weapon_752_dc15s", "weapon_752_ihr", "weapon_flamer"},
   command = "flieutenant",
   max = 5,
   salary = 80,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"FLEET"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (4000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Галактическая Пехота",
})

TEAM_FLEETMajor = DarkRP.createJob("Галактический Пехотинец Майор", {
   color = Color(255, 20, 147),
   model = {"models/player/sgg/starwars/clonetrooper_deviss3.mdl"},
   description = [[]],
   weapons = {"weapon_752_elg3a","weapon_empty_hands", "weapon_752_dc15s", "weapon_752_ihr", "weapon_flamer"},
   command = "fmajor",
   max = 3,
   salary = 100,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"FLEET"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (5000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Галактическая Пехота",
})

TEAM_FLEETColonel = DarkRP.createJob("Галактический Пехотинец Подполковник", {
   color = Color(255, 20, 147),
   model = {"models/player/sgg/starwars/clonetrooper_deviss3.mdl"},
   description = [[]],
   weapons = {"weapon_752_elg3a","weapon_empty_hands", "weapon_752_dc15s", "weapon_752_ihr", "weapon_flamer"},
   command = "fcolonel",
   max = 1,
   salary = 150,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"FLEET"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (6000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Галактическая Пехота",
})

TEAM_FLEETCommander = DarkRP.createJob("Галактический Пехотинец Коммандир", {
   color = Color(255, 20, 147),
   model = {"models/player/sgg/starwars/clonetrooper_bacara.mdl"},
   description = [[]],
   weapons = {"weapon_752_elg3a","weapon_empty_hands", "weapon_752_dc15s", "weapon_752_ihr", "weapon_flamer"},
   command = "fcommander",
   max = 1,
   salary = 200,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"FLEET"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (8000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Галактическая Пехота",
})

TEAM_FLEETGeneral = DarkRP.createJob("Галактический Пехотинец Генерал", {
   color = Color(255, 20, 147),
   model = {"models/npc/ryan7259/mace_windu/mace_windu_player.mdl"},
   description = [[]],
   weapons = {"weapon_lightsaber","weapon_empty_hands"},
   command = "fgeneral",
   max = 1,
   salary = 500,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"FLEET"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (15000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Галактическая Пехота",
})

TEAM_ARFTrooper = DarkRP.createJob("ARF Солдат", {
   color = Color(91, 91, 91),
   model = {"models/player/sgt/sgt.mdl"},
   description = [[]],
   weapons = {"weapon_752_se14c","weapon_empty_hands", "weapon_752_ee3", "realistic_hook"},
   command = "arftrooper",
   max = 20,
   salary = 40,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ARF"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (1000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "ARF",
})

TEAM_ARFCapral = DarkRP.createJob("ARF Капрал", {
   color = Color(91, 91, 91),
   model = {"models/player/sgt/sgt.mdl"},
   description = [[]],
   weapons = {"weapon_752_se14c","weapon_empty_hands", "weapon_752_ee3", "realistic_hook"},
   command = "arfcapral",
   max = 10,
   salary = 45,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ARF"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (1500) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "ARF",
})

TEAM_ARFSergeant = DarkRP.createJob("ARF Сержант", {
   color = Color(91, 91, 91),
   model = {"models/player/sgt/sgt.mdl"},
   description = [[]],
   weapons = {"weapon_752_se14c","weapon_empty_hands", "weapon_752_ee3", "realistic_hook"},
   command = "arfsergeant",
   max = 10,
   salary = 50,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ARF"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (2000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "ARF",
})

TEAM_ARFMedic = DarkRP.createJob("ARF Медик", {
   color = Color(91, 91, 91),
   model = {"models/player/cmd/cmd.mdl"},
   description = [[]],
   weapons = {"weapon_752_dl44","weapon_empty_hands","med_kit"},
   command = "arfmedic",
   max = 1,
   salary = 80,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ARF"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (4000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "ARF",
})

TEAM_ARFStSergeant = DarkRP.createJob("ARF Старший Сержант", {
   color = Color(91, 91, 91),
   model = {"models/player/ltn/ltn.mdl"},
   description = [[]],
   weapons = {"weapon_752_se14c","weapon_empty_hands", "weapon_752_ee3", "realistic_hook"},
   command = "arfstsergeant",
   max = 5,
   salary = 60,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ARF"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (2500) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "ARF",
})

TEAM_ARFLieutenant = DarkRP.createJob("ARF Лейтенант", {
   color = Color(91, 91, 91),
   model = {"models/player/ltn/ltn.mdl"},
   description = [[]],
   weapons = {"weapon_752_se14c","weapon_empty_hands", "weapon_752_ee3", "realistic_hook"},
   command = "arflieutenant",
   max = 5,
   salary = 80,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ARF"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (4000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "ARF",
})

TEAM_ARFMajor = DarkRP.createJob("ARF Майор", {
   color = Color(91, 91, 91),
   model = {"models/player/cpt/cpt.mdl"},
   description = [[]],
   weapons = {"weapon_752_se14c","weapon_empty_hands", "weapon_752_ee3", "realistic_hook"},
   command = "arfmajor",
   max = 3,
   salary = 100,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ARF"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (5000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "ARF",
})

TEAM_ARFColonel = DarkRP.createJob("ARF Подполковник", {
   color = Color(91, 91, 91),
   model = {"models/player/cpt/cpt.mdl"},
   description = [[]],
   weapons = {"weapon_752_se14c","weapon_empty_hands", "weapon_752_ee3", "realistic_hook"},
   command = "arfcolonel",
   max = 1,
   salary = 150,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ARF"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (6000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "ARF",
})

TEAM_ARFCommander = DarkRP.createJob("ARF Коммандир", {
   color = Color(91, 91, 91),
   model = {"models/player/vcmd/vcmd.mdl"},
   description = [[]],
   weapons = {"weapon_752_se14c","weapon_empty_hands", "weapon_752_ee3", "realistic_hook"},
   command = "arfcommander",
   max = 1,
   salary = 200,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ARF"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (8000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "ARF",
})

TEAM_ARFGeneral = DarkRP.createJob("ARF Генерал", {
   color = Color(91, 91, 91),
   model = {"models/cultist_kun/sw/mm.mdl"},
   description = [[]],
   weapons = {"weapon_lightsaber","weapon_empty_hands"},
   command = "arfgeneral",
   max = 1,
   salary = 500,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ARF"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (15000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "ARF",
})

TEAM_WLFTrooper = DarkRP.createJob("WLF Солдат", {
   color = Color(153, 153, 153),
   model = {"models/wpclonetrooper.mdl"},
   description = [[]],
   weapons = {"weapon_752_dh17","weapon_empty_hands", "weapon_752_e5"},
   command = "wlftrooper",
   max = 20,
   salary = 40,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"WLF"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (1000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Волчья стая",
})

TEAM_WLFCapral = DarkRP.createJob("WLF Капрал", {
   color = Color(153, 153, 153),
   model = {"models/wpclonetrooper.mdl"},
   description = [[]],
   weapons = {"weapon_752_dh17","weapon_empty_hands", "weapon_752_e5"},
   command = "wlfcapral",
   max = 10,
   salary = 45,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"WLF"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (1500) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Волчья стая",
})

TEAM_WLFSergeant = DarkRP.createJob("WLF Сержант", {
   color = Color(153, 153, 153),
   model = {"models/wpclonetrooper2.mdl"},
   description = [[]],
   weapons = {"weapon_752_dh17","weapon_empty_hands", "weapon_752_e5"},
   command = "wlfsergeant",
   max = 10,
   salary = 50,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"WLF"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (2000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Волчья стая",
})

TEAM_WLFMedic = DarkRP.createJob("WLF Медик", {
   color = Color(153, 153, 153),
   model = {"models/player/sgg/starwars/clonetrooper_neyo.mdl"},
   description = [[]],
   weapons = {"weapon_752_dl44","weapon_empty_hands","med_kit"},
   command = "wlfmedic",
   max = 1,
   salary = 80,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"WLF"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (4000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Волчья стая",
})

TEAM_WLFStSergeant = DarkRP.createJob("WLF Старший Сержант", {
   color = Color(153, 153, 153),
   model = {"models/wpclonetrooper2.mdl"},
   description = [[]],
   weapons = {"weapon_752_dh17","weapon_empty_hands", "weapon_752_e5"},
   command = "wlfstsergeant",
   max = 5,
   salary = 60,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"WLF"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (2500) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Волчья стая",
})

TEAM_WLFLieutenant = DarkRP.createJob("WLF Лейтенант", {
   color = Color(153, 153, 153),
   model = {"models/wpclonetrooper4.mdl"},
   description = [[]],
   weapons = {"weapon_752_dh17","weapon_empty_hands", "weapon_752_e5"},
   command = "wlflieutenant",
   max = 5,
   salary = 80,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"WLF"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (4000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Волчья стая",
})

TEAM_WLFMajor = DarkRP.createJob("WLF Майор", {
   color = Color(153, 153, 153),
   model = {"models/wpclonetrooper3.mdl"},
   description = [[]],
   weapons = {"weapon_752_dh17","weapon_empty_hands", "weapon_752_e5"},
   command = "wlfmajor",
   max = 3,
   salary = 100,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"WLF"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (5000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Волчья стая",
})

TEAM_WLFColonel = DarkRP.createJob("WLF Подполковник", {
   color = Color(153, 153, 153),
   model = {"models/wpclonetrooper3.mdl"},
   description = [[]],
   weapons = {"weapon_752_dh17","weapon_empty_hands", "weapon_752_e5"},
   command = "wlfcolonel",
   max = 1,
   salary = 150,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"WLF"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (6000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Волчья стая",
})

TEAM_WLFCommander = DarkRP.createJob("WLF Коммандир", {
   color = Color(153, 153, 153),
   model = {"models/wolffe.mdl"},
   description = [[]],
   weapons = {"weapon_752_dh17","weapon_empty_hands", "weapon_752_e5"},
   command = "wlfcommander",
   max = 1,
   salary = 200,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"WLF"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (8000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Волчья стая",
})

TEAM_WLFGeneral = DarkRP.createJob("WLF Генерал", {
   color = Color(153, 153, 153),
   model = {"models/cultist_kun/sw/saesee_tiin.mdl"},
   description = [[]],
   weapons = {"weapon_lightsaber","weapon_empty_hands"},
   command = "wlfgeneral",
   max = 1,
   salary = 500,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"WLF"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (15000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Волчья стая",
})

TEAM_ENGRSTrooper = DarkRP.createJob("Инженер", {
   color = Color(238, 201, 0),
   model = {"models/player/sgg/starwars/clonetrooper_pilot.mdl"},
   description = [[]],
   weapons = {"weapon_752_westar34","weapon_empty_hands"},
   command = "engrstrooper",
   max = 10,
   salary = 80,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ENGRS"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (4000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Инженеры",
})

TEAM_ENGRSCommander = DarkRP.createJob("Старший Инженер", {
   color = Color(238, 201, 0),
   model = {"models/player/sgg/starwars/clonetrooper_arc_commander.mdl"},
   description = [[]],
   weapons = {"weapon_752_dh17","weapon_empty_hands"},
   command = "engrscommander",
   max = 1,
   salary = 100,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"ENGRS"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (5000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "Инженеры",
})

TEAM_RCBoss = DarkRP.createJob("RC Босс", {
   color = Color(255, 128, 0),
   model = {"models/player/sgg/starwars/clone_commando_38.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc15sa","weapon_empty_hands", "weapon_752_dc17m_br"},
   command = "rcboss",
   max = 1,
   salary = 300,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"RC"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (12000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "RC",
})

TEAM_RCFixer = DarkRP.createJob("RC Фиксер", {
   color = Color(255, 128, 0),
   model = {"models/player/sgg/starwars/clone_commando_40.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc15sa","weapon_empty_hands", "weapon_752_dc17m_br"},
   command = "rcfixer",
   max = 1,
   salary = 250,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"RC"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (9000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "RC",
})

TEAM_RCScorch = DarkRP.createJob("RC Скорч", {
   color = Color(255, 128, 0),
   model = {"models/player/sgg/starwars/clone_commando_62.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc15sa","weapon_empty_hands", "weapon_752_dc17m_br"},
   command = "rcscorch",
   max = 1,
   salary = 250,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"RC"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (9000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "RC",
})

TEAM_RCSev = DarkRP.createJob("RC Сев", {
   color = Color(255, 128, 0),
   model = {"models/player/sgg/starwars/clone_commando_07.mdl"},
   description = [[]],
   weapons = {"weapon_752_dc15sa","weapon_empty_hands", "weapon_752_dc17m_br"},
   command = "rcsev",
   max = 1,
   salary = 250,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
-- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"RC"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (9000) ply:GiveAmmo(9999, "item_ammo_ar2") end,
   category = "RC",
})

TEAM_C3PO = DarkRP.createJob("C3PO", {
   color = Color(139, 183, 15, 255),
   model = {"models/player/c3po.mdl","sswep_c3po_talk"},
   description = [[]],
   weapons = {"weapon_empty_hands"},
   command = "c3p0",
   max = 1,
   salary = 500,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
   -- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"C3PO"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (5000)end,
   category = "VIP",
})

TEAM_R2D2 = DarkRP.createJob("R2D2", {
   color = Color(25, 16, 130, 255),
   model = {"models/player/r2d2.mdl","sswep_r2d2"},
   description = [[]],
   weapons = {"weapon_empty_hands"},
   command = "r2d2",
   max = 1,
   salary = 500,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
   -- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"R2D2"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (5000) end,
   category = "VIP",
})

TEAM_CHEWIE = DarkRP.createJob("Чуббака", {
   color = Color(147, 229, 12, 255),
   model = {"models/player/chewie.mdl"},
   description = [[]],
   weapons = {"weapon_752_bowcaster","weapon_empty_hands","sswep_chewie"},
   command = "chewie",
   max = 1,
   salary = 500,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
   -- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"CHEWIE"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (10000) end,
   category = "VIP",
})

TEAM_BB8 = DarkRP.createJob("BB-8", {
   color = Color(62, 132, 7, 255),
   model = {"models/prawnmodels/starwars/bb-8.mdl"},
   description = [[]],
   weapons = {"weapon_empty_hands"},
   command = "bb8",
   max = 1,
   salary = 500,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
   -- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"BB8"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (5000) end,
   category = "VIP",
})

TEAM_EMPEROR = DarkRP.createJob("Палпатин", {
   color = Color(201, 24, 0, 255),
   model = {"models/jazzmcfly/jka/palpatine/palpatine.mdl"},
   description = [[]],
   weapons = {"weapon_lightsaber","weapon_empty_hands"},
   command = "emperor",
   max = 1,
   salary = 500,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
      -- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"EMPEROR"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (15000) end,
   category = "VIP",
})

TEAM_SAVAGE = DarkRP.createJob("Саваж Опресс", {
   color = Color(102, 124, 39, 255),
   model = {"models/syntheticgaming/characters/savageopress/savageopress.mdl"},
   description = [[]],
   weapons = {"weapon_lightsaber","weapon_empty_hands"},
   command = "savage",
   max = 1,
   salary = 500,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
      -- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"SAVAGE"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (15000) end,
   category = "VIP",
})


TEAM_YODA = DarkRP.createJob("Йода", {
   color = Color(0, 114, 11, 255),
   model = {"models/player/b4p/b4p_yoda.mdl"},
   description = [[]],
   weapons = {"weapon_lightsaber","weapon_empty_hands","sswep_yoda","sswep_dyoda"},
   command = "yoda",
   max = 1,
   salary = 500,
   admin = 0,
   vote = false,
   modelScale = 0.7,
   hasLicense = false,
   candemote = true,
      -- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"YODA"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (20000) end,
   category = "VIP",
})

TEAM_JAR = DarkRP.createJob("Джа-Джа", {
   color = Color(232, 139, 0, 255),
   model = {"models/player/techknow/jarjar.mdl"},
   description = [[]],
   weapons = {"weapon_752_ll30","weapon_empty_hands","sswep_jarjar"},
   command = "jarajr",
   max = 1,
   salary = 500,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
      -- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"JAR"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (1500) end,
   category = "VIP",
})


TEAM_JAWA = DarkRP.createJob("Джава", {
   color = Color(71, 10, 10, 255),
   model = {"models/player/b4p/b4p_jawa.mdl"},
   description = [[]],
   weapons = {"weapon_empty_hands","sswep_jawa"},
   command = "jawa",
   max = 0,
   salary = 15,
   admin = 0,
   vote = false,
   modelScale = 0.5,
   hasLicense = false,
   candemote = false,
   PlayerLoadout = function(ply) ply:SetHealth (300) end,
   category = "Джава",
})

TEAM_DOOKU = DarkRP.createJob("Граф Дуку", {
   color = Color(62, 91, 14, 255),
   model = {"models/kriegsyntax/sw_752/dooku_est.mdl"},
   description = [[]],
   weapons = {"weapon_lightsaber","weapon_empty_hands","sswep_dooku"},
   command = "dooku",
   max = 1,
   salary = 500,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
      -- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"DOOKU"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth (15000) end,
   category = "VIP",
})


TEAM_AHSOKATANO = DarkRP.createJob("Асока", {
   color = Color(0, 255, 0),
   model = {"models/jazzmcfly/jka/ashoka/jka_ashoka.mdl","sswep_ashoka"},
   description = [[]],
   weapons = {"weapon_lightsaber","weapon_empty_hands","repair_kit","weapon_752_ihr","weapon_cuff_elastic"},
   command = "ahsoka",
   max = 1,
   salary = 1000,
   admin = 2,
   vote = false,
   hasLicense = false,
   candemote = true,
      -- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"AHSOKATANO"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "Доступ к этому персонажу имеет только Админ!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth(25000) end,
   category = "Админ",
})

TEAM_FISTO = DarkRP.createJob("Кит Фисто", {
   color = Color(0, 84, 247, 255),
   model = {"models/player/nav/kitfisto.mdl"},
   description = [[]],
   weapons = {"weapon_lightsaber","weapon_empty_hands"},
   command = "fisto",
   max = 1,
   salary = 500,
   admin = 1,
   vote = false,
   hasLicense = false,
   candemote = true,
      -- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"FISTO"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth(15000) end,
   category = "VIP",
})

TEAM_PADAWANJ = DarkRP.createJob("Падаван Джедай", {
   color = Color(0, 84, 247, 255),
   model = {"models/grealms/characters/padawan/padawan_02.mdl"},
   description = [[]],
   weapons = {"weapon_lightsaber","weapon_empty_hands"},
   command = "vippadawanjedi",
   max = 0,
   salary = 200,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
      -- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"PADAWANJ"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth(5000) end,
   category = "Джедаи",
})

TEAM_MAITREJEDI = DarkRP.createJob("Мастер Джедаев", {
   color = Color(0, 84, 247, 255),
   model = {"models/grealms/characters/jedirobes/jedirobes_09.mdl"},
   description = [[]],
   weapons = {"weapon_lightsaber","weapon_empty_hands"},
   command = "vipmaitrejedi",
   max = 5,
   salary = 350,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
      -- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"MAITREJEDI"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth(10000) end,
   category = "Джедаи",
})

TEAM_CHEVALIERJEDI = DarkRP.createJob("Джедай Рыцарь", {
   color = Color(0, 84, 247, 255),
   model = {"models/player/x227man/mkotor_9.mdl"},
   description = [[]],
   weapons = {"weapon_lightsaber","weapon_empty_hands"},
   command = "vipchevalierjedi",
   max = 0,
   salary = 300,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = true,
      -- Code generated at: TheCodingBeast.com | DarkRP 2.5 Tools
customCheck = function(ply) return CLIENT or
   table.HasValue({"CHEVALIERJEDI"}, ply:GetNWString("usergroup")) or ply:IsAdmin()
end,
CustomCheckFailMsg = "У вас нет прав доступа!",
   medic = false,
   chief = false,
   mayor = false,
   hobo = false,
   cook = false,
   PlayerLoadout = function(ply) ply:SetHealth(7000) end,
   category = "Джедаи",
})







--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_DEFAULT


--[[---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------]]
GAMEMODE.CivilProtection = {
	[TEAM_POLICE] = true,
	[TEAM_CHIEF] = true,
	[TEAM_MAYOR] = true,
}

--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]
DarkRP.addHitmanTeam(TEAM_MOB)
