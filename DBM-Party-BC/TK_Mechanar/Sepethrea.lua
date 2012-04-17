local mod = DBM:NewMod("Sepethrea", "DBM-Party-BC", 13)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 315 $"):sub(12, -3))

mod:SetCreatureID(19221)
mod:SetModelID(19166)
mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_CAST_START"
)