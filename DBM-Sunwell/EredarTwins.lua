local mod	= DBM:NewMod("Twins", "DBM-Sunwell")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 386 $"):sub(12, -3))
mod:SetCreatureID(25165, 25166)
mod:SetModelID(23334)
mod:SetZone()
mod:SetUsedIcons(7, 8)

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_CAST_START",
	"SPELL_DAMAGE",
	"SPELL_MISSED",
	"CHAT_MSG_RAID_BOSS_EMOTE"
)

mod:SetBossHealthInfo(
	25165, L.Sacrolash,
	25166, L.Alythess
)

local warnPyro				= mod:NewSpellAnnounce(45230, 3)
local warnBlade				= mod:NewSpellAnnounce(45248, 3)
local warnBlow				= mod:NewTargetAnnounce(45256, 3)
local warnConflag			= mod:NewTargetAnnounce(45333, 3)
local warnNova				= mod:NewTargetAnnounce(45329, 3)

local specWarnConflag		= mod:NewSpecialWarningYou(45333)
local specWarnNova			= mod:NewSpecialWarningYou(45329)
local specWarnPyro			= mod:NewSpecialWarningDispel(45230)
local specWarnDarkTouch		= mod:NewSpecialWarningStack(45347, nil, 8)
local specWarnFlameTouch	= mod:NewSpecialWarningStack(45348, false, 5)

local timerBladeCD			= mod:NewCDTimer(11.5, 45248)
local timerBlowCD			= mod:NewCDTimer(20, 45256)
local timerConflagCD		= mod:NewCDTimer(31, 45333)
local timerNovaCD			= mod:NewCDTimer(31, 45329)
local timerConflag			= mod:NewCastTimer(3.5, 45333)
local timerNova				= mod:NewCastTimer(3.5, 45329)

local berserkTimer			= mod:NewBerserkTimer(360)

local soundConflag			= mod:NewSound(45333)

mod:AddBoolOption("HealthFrame", false)
mod:AddBoolOption("RangeFrame", true)
mod:AddBoolOption("NovaIcon", true)
mod:AddBoolOption("ConflagIcon", true)
mod:AddBoolOption("NovaWhisper", true, "announce")
mod:AddBoolOption("ConflagWhisper", false, "announce")

function mod:OnCombatStart(delay)
	berserkTimer:Start(-delay)
	if self.Options.RangeFrame then
		DBM.RangeCheck:Show()
	end
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(45230) and not args:IsDestTypePlayer() then
		warnPyro:Show()
		specWarnPyro:Show(args.destName)
	elseif args:IsSpellID(45347) and args:IsPlayer() then
		if (args.amount or 1) >= 8 then
			specWarnDarkTouch:Show(args.amount)
		end
	elseif args:IsSpellID(45348) and args:IsPlayer() then
		if (args.amount or 1) >= 5 then
			specWarnFlameTouch:Show(args.amount)
		end
	end
end

mod.SPELL_AURA_APPLIED_DOSE = mod.SPELL_AURA_APPLIED

function mod:SPELL_DAMAGE(sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellId)
	if spellId == 45256 then
		warnBlow:Show(destName)
		timerBlowCD:Start()
	end
end

function mod:SPELL_MISSED(sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellId)
	if spellId == 45256 then
		timerBlowCD:Start()
	end
end

function mod:SPELL_CAST_START(args)
	if args:IsSpellID(45248) then
		warnBlade:Show()
		timerBladeCD:Start()
	end
end

function mod:CHAT_MSG_RAID_BOSS_EMOTE(msg, _, _, _, target)
	if msg == L.Nova or msg:find(L.Nova) then
		warnNova:Show(target)
		timerNova:Start()
		timerNovaCD:Start()
		if target == UnitName("player") then
			specWarnNova:Show()
		end
		if self.Options.NovaIcon then
			self:SetIcon(target, 7, 5)
		end
		if IsRaidLeader() and self.Options.NovaWhisper then
			self:SendWhisper(L.NovaWhisper, target)
		end
	elseif msg == L.Conflag or msg:find(L.Conflag) then
		warnConflag:Show(target)
		timerConflag:Start()
		timerConflagCD:Start()
		if target == UnitName("player") then
			specWarnConflag:Show()
			soundConflag:Play()
		end
		if self.Options.ConflagIcon then
			self:SetIcon(target, 8, 5)
		end
		if IsRaidLeader() and self.Options.ConflagWhisper then
			self:SendWhisper(L.ConflagWhisper, target)
		end
	end
end
