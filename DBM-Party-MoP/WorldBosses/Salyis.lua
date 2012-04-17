local mod	= DBM:NewMod("Salyis", "DBM-Party-MoP", 10)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 7504 $"):sub(12, -3))
--mod:SetCreatureID(50063)--Needs two IDs, one ofr Salyis and one for Galleon
--mod:SetModelID(41772)
--mod:SetZone(807)--Valley of the Four winds now?
--Not listed as a world boss anymore in latest patch EJ, was this boss moved?

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED"
)

