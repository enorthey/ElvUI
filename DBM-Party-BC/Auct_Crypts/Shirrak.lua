local mod	= DBM:NewMod("Shirrak", "DBM-Party-BC", 7)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 315 $"):sub(12, -3))
mod:SetCreatureID(18371)
mod:SetModelID(18916)

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_CAST_START",
	"SPELL_AURA_APPLIED"
)
