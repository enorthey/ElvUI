local mod	= DBM:NewMod("ShaOfDoubt", "DBM-Party-MoP", 1)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 7497 $"):sub(12, -3))
mod:SetCreatureID(56439)
--mod:SetModelID(40904)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_SUCCESS",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED"
)


local warnWitherWill			= mod:NewSpellAnnounce(120236, 3)
local warnTouchofNothingness	= mod:NewTargetAnnounce(106113, 4)
local warnBoundsOfReality		= mod:NewSpellAnnounce(117665, 3)

local specwarnTouchOfNothingness= mod:NewSpecialWarningDispel(106113, mod:IsHealer())

local timerWitherWillCD			= mod:NewCDTimer(6, 120236)--6-10 second variations.
local timerTouchofNothingnessCD	= mod:NewNextTimer(19.5, 106113)
local timerTouchofNothingness	= mod:NewTargetTimer(30, 106113)
local timerBoundsOfRealityCD	= mod:NewNextTimer(60, 117665)
local timerBoundsOfReality		= mod:NewBuffFadesTimer(30, 117665)

function mod:OnCombatStart(delay)
	timerWitherWillCD:Start(-delay)
	timerTouchofNothingnessCD:Start(13-delay)
	timerBoundsOfReality:Start(22-delay)
end

function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpellID(106736, 120236) then
		warnWitherWill:Show()
		timerWitherWillCD:Start()
	elseif args:IsSpellID(106113) then--Start Cd here in case it's resisted
		timerTouchofNothingnessCD:Start()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(117665) then
		timerBoundsOfReality:Show()
		timerWitherWillCD:Cancel()
		timerTouchofNothingnessCD:Cancel()
		timerBoundsOfReality:Start()
		timerBoundsOfRealityCD:Start()
	elseif args:IsSpellID(106113) then
		warnTouchofNothingness:Show(args.destName)
		specwarnTouchOfNothingness:Show(args.destName)
		timerTouchofNothingness:Start(args.destName)
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args:IsSpellID(117665) then
		timerBoundsOfReality:Cancel()
	elseif args:IsSpellID(106113) then
		timerTouchofNothingness:Cancel(args.destName)
	end
end
