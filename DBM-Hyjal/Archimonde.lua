local mod	= DBM:NewMod("Archimonde", "DBM-Hyjal")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 334 $"):sub(12, -3))
mod:SetCreatureID(17968)
mod:SetModelID(20939)
mod:SetZone()
mod:SetUsedIcons(8)

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_CAST_START"
)

local warnGrip			= mod:NewTargetAnnounce(31972, 3)
local warnBurst			= mod:NewTargetAnnounce(32014, 3)
local warnFear			= mod:NewSpellAnnounce(31970, 3)

local timerFearCD		= mod:NewCDTimer(41, 31970)

local specWarnGrip		= mod:NewSpecialWarningYou(31972)
local specWarnBurst		= mod:NewSpecialWarningYou(32014)

local berserkTimer		= mod:NewBerserkTimer(600)

mod:AddBoolOption("BurstIcon", true)
mod:AddBoolOption("YellOnBurst", true, "announce")

function mod:BurstTarget()
	local targetname = self:GetBossTarget(17968)
	if not targetname then return end
	warnBurst:Show(targetname)
	if targetname == UnitName("player") then
		specWarnBurst:Show()
		if self.Options.YellOnBurst then
			SendChatMessage(L.YellBurst, "SAY")
		end
		if self.Options.BurstIcon then
			self:SetIcon(targetname, 8, 5)
		end
	end
end

function mod:OnCombatStart(delay)
	timerFearCD:Start(40-delay)
	berserkTimer:Start(-delay)
end


function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(31972) then
		warnGrip:Show(args.destName)
	end
end

function mod:SPELL_CAST_START(args)
	if args:IsSpellID(31970) then
		warnFear:Show()
		timerFearCD:Start()
	elseif args:IsSpellID(32014) then
		self:ScheduleMethod(0.2, "BurstTarget")
	end
end