
if CLIENT or SERVER then
   AddCSLuaFile( "shared.lua" )
end

SWEP.HoldType = "knife"

SWEP.PrintName = "Divii's Claws"
SWEP.Slot = 1
SWEP.ViewModelFlip		= false
SWEP.ViewModelFOV		= 74
SWEP.ViewModel          = "models/Divii/weapons/v_knife_t.mdl"
SWEP.WorldModel         = "models/weapons/w_knife_t.mdl"

SWEP.Author 		= "Divii" 
SWEP.Purpose		= "nigger it"
SWEP.Instructions	= "n1 m8"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.Category = "Divii's Claws (Wolverine)"
SWEP.DrawCrosshair      = true
SWEP.Primary.Damage         = 5000
SWEP.Primary.ClipSize       = -1
SWEP.Primary.DefaultClip    = -1
SWEP.Primary.Automatic      = true
SWEP.Primary.Delay = 0.001
SWEP.Primary.Ammo       = "none"

SWEP.Secondary.Damage         = 5000
SWEP.Secondary.ClipSize     = -1
SWEP.Secondary.DefaultClip  = -1
SWEP.Secondary.Automatic    = true
SWEP.Secondary.Ammo     = "none"
SWEP.Secondary.Delay = 0.02

SWEP.NoFlipOriginsPos = Vector(0, 0, 0)
SWEP.NoFlipOriginsAng = Vector(0, 0, 0)

function SWEP:Initialize()
	self:SetWeaponHoldType( self.HoldType )
end
--SWEP Primary Attack

function SWEP:PrimaryAttack()

local function SetFalseHolster( self )

--Set Holstering to true
self:SetNetworkedBool("CanHolster",false)
end

timer.Simple(0.01, function()
SetFalseHolster(self)
end)

local function SetTrueHolster( self )

--Set Holstering to true
self:SetNetworkedBool("CanHolster",true)
end

timer.Simple(1.3, function()
SetTrueHolster(self)
end)

local function SetIdle( self )

--Set Holstering to true
self:SendWeaponAnim( ACT_VM_IDLE)
timer.Create("IdleTimer", 1.2, 1, SendWeaponAnim, self, ACT_VM_IDLE) 
end

	self.Weapon:SendWeaponAnim( ACT_VM_HITCENTER )
	
	local tr = {}
	tr.start = self.Owner:GetShootPos()
	tr.endpos = self.Owner:GetShootPos() + ( self.Owner:GetAimVector() * 50 )
	tr.filter = self.Owner
	tr.mask = MASK_SHOT
	local trace = util.TraceLine( tr )

	self.Weapon:SetNextPrimaryFire(CurTime() + 1.21)
	self.Owner:SetAnimation( PLAYER_ATTACK1 )

	if ( trace.Hit ) then

		if trace.Entity:IsPlayer() or string.find(trace.Entity:GetClass(),"npc") or string.find(trace.Entity:GetClass(),"prop_ragdoll") then
			self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER)
			
local function KnifeStab( self )

--Stab something XD
	self:ShootBullet(69,1,0.01)
	self.Weapon:EmitSound( "weapons/imbrokeru_knife/knife_hit3.wav", 100, 100)
end

timer.Simple(0.2, function()
KnifeStab(self)
end)


		else
			self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER)
			
local function KnifeStab( self )

--Stab something XD
	self:ShootBullet(69,1,0.01)
	self.Weapon:EmitSound( "weapons/imbrokeru_knife/knife_hitwall1.wav", 100, 100)
	util.Decal("ManhackCut", trace.HitPos + trace.HitNormal, trace.HitPos - trace.HitNormal)
end

timer.Simple(0.2, function()
KnifeStab(self)
end)

		end
	else
		self.Weapon:EmitSound("weapons/imbrokeru_knife/knife_slash"..math.random(1,2)..".wav", 100, 100)
		self.Weapon:SendWeaponAnim(ACT_VM_MISSCENTER)
	end
end

function SWEP:SecondaryAttack() return
end

--Deploy SWEP

function SWEP:Deploy()
self:SetNetworkedBool("CanHolster",false) 
	self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
	self.Weapon:SetNextPrimaryFire(CurTime() + 1)
	self.Weapon:EmitSound("weapons/knife/knife_deploy1.wav", 50, 110 )

local function SetIdle( self )

--Set Idle Animation
self:SendWeaponAnim(ACT_VM_IDLE)
end

timer.Simple(1, function()
SetIdle(self)
end)
	
local function SetHolster( self )

--Set Holstering to true
self:SetNetworkedBool("CanHolster",true)
end

timer.Simple(1.1, function()
SetHolster(self)
end)

return true
end

function SWEP:Holster()

if self:GetNetworkedBool("CanHolster") then 
return true

else
return false

end
end