local mod	= DBM:NewMod("Ripsnarl", "DBM-Party-Cataclysm", 2)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 6499 $"):sub(12, -3))
mod:SetCreatureID(47626)
mod:SetModelID(35739)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
)