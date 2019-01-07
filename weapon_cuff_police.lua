

AddCSLuaFile()

SWEP.Base = "weapon_cuff_base"

SWEP.Category = "Handcuffs"
SWEP.Author = "Quintalos"
SWEP.Instructions = "Menottes très solides conçues pour la police."

SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.AdminSpawnable = true

SWEP.Slot = 3
SWEP.PrintName = "Menottes de Policier"

//
// Handcuff Vars
SWEP.CuffTime = 1.0 // Seconds to handcuff
SWEP.CuffSound = Sound( "buttons/lever7.wav" )

SWEP.CuffMaterial = "phoenix_storms/gear"
SWEP.CuffRope = "cable/cable2"
SWEP.CuffStrength = 1.4
SWEP.CuffRegen = 1.4
SWEP.RopeLength = 0
SWEP.CuffReusable = true

SWEP.CuffBlindfold = false
SWEP.CuffGag = false

SWEP.CuffStrengthVariance = 0.1 // Randomise strangth
SWEP.CuffRegenVariance = 0.1 // Randomise regen
