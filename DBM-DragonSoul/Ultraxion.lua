local mod	= DBM:NewMod(331, "DBM-DragonSoul", nil, 187)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 7231 $"):sub(12, -3))
mod:SetCreatureID(55294)
mod:SetModelID(39099)
mod:SetZone()
mod:SetUsedIcons()

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START",
	"SPELL_CAST_SUCCESS",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED"
)

mod:RegisterEvents(
	"CHAT_MSG_MONSTER_SAY"
)

local warnHourofTwilightSoon		= mod:NewPreWarnAnnounce(109416, 15, 4)--Why 15? because this warning signals the best time to pop 1min CDs a second time. (ie lets say you a tank in HoT1 group, you SW, your SW will be usuable one more time before next HoT1, but when do you use it? 15 seconds before the 3rd HoT exactly, then it's stil up for 3rd HoT and still back off cd for HoT1)
local warnHourofTwilight			= mod:NewCountAnnounce(109416, 4)
local warnFadingLight				= mod:NewTargetCountAnnounce(110080, 3)

local specWarnHourofTwilight		= mod:NewSpecialWarningSpell(109416, nil, nil, nil, true)
local specWarnHourofTwilightN		= mod:NewSpecialWarning("specWarnHourofTwilightN", nil, false)
local specWarnFadingLight			= mod:NewSpecialWarningYou(110080)
local specWarnFadingLightOther		= mod:NewSpecialWarningTarget(110080, mod:IsTank())
local specWarnTwilightEruption		= mod:NewSpecialWarningSpell(106388, nil, nil, nil, true)

local timerCombatStart				= mod:NewTimer(35, "TimerCombatStart", 2457)
local timerUnstableMonstrosity		= mod:NewNextTimer(60, 106372, nil, mod:IsHealer())
local timerHourofTwilight			= mod:NewCastTimer(5, 109416)
local timerHourofTwilightCD			= mod:NewNextCountTimer(45.5, 109416)
local timerTwilightEruption			= mod:NewCastTimer(5, 106388)
local timerFadingLight				= mod:NewBuffFadesTimer(10, 110080)
local timerFadingLightCD			= mod:NewNextTimer(10, 110080)
local timerGiftofLight				= mod:NewNextTimer(80, 105896, nil, mod:IsHealer())
local timerEssenceofDreams			= mod:NewNextTimer(155, 105900, nil, mod:IsHealer())
local timerSourceofMagic			= mod:NewNextTimer(215, 105903, nil, mod:IsHealer())
local timerLoomingDarkness			= mod:NewBuffFadesTimer(120, 106498)
local timerRaidCDs					= mod:NewTimer(60, "timerRaidCDs", 2565, nil, false)--Does not need to be localized, has no option, uses ShowRaidCDs bool

local berserkTimer					= mod:NewBerserkTimer(360)--some players regard as Ultraxian mod not shows berserk Timer. so it will be better to use Generic Berserk Timer..

local FadingLightCountdown			= mod:NewCountdown(10, 110080)
local HourofTwilightCountdown		= mod:NewCountdown(45.5, 109416, mod:IsHealer())--can be confusing with Fading Light, only enable for healer. (healers no dot affect by Fading Light)

mod:AddBoolOption("ShowRaidCDs", false, "timer")--Off by default. This is for RAID cds not personal CDs. Shield wall is added because of 4pc bonus, it's assumed on heroic ultraxion you're tanks have 4pc.
mod:AddBoolOption("ShowRaidCDsSelf", false, "timer")--TODO, make a popup optiopn and combine this with other booleane
--Raid CDs will have following options: Don't show Raid CDs, Show only My Raid CDs, Show all raid CDs

mod:AddDropdownOption("ResetHoTCounter", {"Never", "Reset3", "Reset3Always"}, "Reset3", "announce")
mod:AddDropdownOption("SpecWarnHoTN", {"Never", "One", "Two", "Three"}, "Never", "announce")

local hourOfTwilightCount = 0
local fadingLightCount = 0
local fadingLightTargets = {}
local fadingLightSpam = 0

local function warnFadingLightTargets()
	warnFadingLight:Show(fadingLightCount, table.concat(fadingLightTargets, "<, >"))
	table.wipe(fadingLightTargets)
end

function mod:OnCombatStart(delay)
	table.wipe(fadingLightTargets)
	hourOfTwilightCount = 0
	fadingLightCount = 0
	fadingLightSpam = 0
	warnHourofTwilightSoon:Schedule(30.5)
	if self.Options.SpecWarnHoTN == "One" then
		specWarnHourofTwilightN:Schedule(40.5, GetSpellInfo(109416), hourOfTwilightCount+1)
	end
	timerHourofTwilightCD:Start(45.5-delay, 1)
	HourofTwilightCountdown:Start(45.5)
	timerGiftofLight:Start(-delay)
	timerEssenceofDreams:Start(-delay)
	timerSourceofMagic:Start(-delay)
	berserkTimer:Start(-delay)
end

function mod:OnCombatEnd()
end

function mod:SPELL_CAST_START(args)
	if args:IsSpellID(106371, 109415, 109416, 109417) then
		fadingLightCount = 0
		hourOfTwilightCount = hourOfTwilightCount + 1
		warnHourofTwilight:Show(hourOfTwilightCount)
		specWarnHourofTwilight:Show()
		if (self.Options.ResetHoTCounter == "Reset3" and self:IsDifficulty("heroic10", "heroic25") or self.Options.ResetHoTCounter == "Reset3Always") and hourOfTwilightCount == 3
		or self.Options.ResetHoTCounter == "Reset3" and self:IsDifficulty("normal10", "normal25", "lfr25") and hourOfTwilightCount == 2 then
			hourOfTwilightCount = 0
		end
		if self.Options.SpecWarnHoTN == "One" and hourOfTwilightCount == 0
		or self.Options.SpecWarnHoTN == "Two" and hourOfTwilightCount == 1
		or self.Options.SpecWarnHoTN == "Three" and hourOfTwilightCount == 2 then
			specWarnHourofTwilightN:Schedule(40.5, args.spellName, hourOfTwilightCount+1)
		end
		warnHourofTwilightSoon:Schedule(30.5)
		timerHourofTwilightCD:Start(45.5, hourOfTwilightCount+1)
		HourofTwilightCountdown:Start(45.5)
		if self:IsDifficulty("heroic10", "heroic25") then
			timerFadingLightCD:Start(13)
			timerHourofTwilight:Start(3)
		else
			timerFadingLightCD:Start(20)
			timerHourofTwilight:Start()
		end
	elseif args:IsSpellID(106388) then
		specWarnTwilightEruption:Show()
		timerTwilightEruption:Start()
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpellID(106372, 106376, 106377, 106378, 106379) then
		timerUnstableMonstrosity:Start()
	elseif args:IsSpellID(97462) and self:IsInCombat() and ((self.Options.ShowRaidCDs and not self.Options.ShowRaidCDsSelf) or (self.Options.ShowRaidCDs and self.Options.ShowRaidCDsSelf and UnitName("player") == args.sourceName)) then--Warrior Rallying Cry
		if UnitDebuff(args.sourceName, GetSpellInfo(106218)) then
			timerRaidCDs:Start(90, args.spellName, args.sourceName)
		else
			timerRaidCDs:Start(180, args.spellName, args.sourceName)
		end
	elseif args:IsSpellID(871) and self:IsInCombat() and ((self.Options.ShowRaidCDs and not self.Options.ShowRaidCDsSelf) or (self.Options.ShowRaidCDs and self.Options.ShowRaidCDsSelf and UnitName("player") == args.sourceName)) then--Warrior Shield Wall (4pc Assumed)
		if UnitDebuff(args.sourceName, GetSpellInfo(106218)) then
			timerRaidCDs:Start(60, args.spellName, args.sourceName)
		else
			timerRaidCDs:Start(120, args.spellName, args.sourceName)
		end
	elseif args:IsSpellID(62618) and self:IsInCombat() and ((self.Options.ShowRaidCDs and not self.Options.ShowRaidCDsSelf) or (self.Options.ShowRaidCDs and self.Options.ShowRaidCDsSelf and UnitName("player") == args.sourceName)) then--Paladin Divine Guardian (4pc assumed)
		if UnitDebuff(args.sourceName, GetSpellInfo(106218)) then
			timerRaidCDs:Start(60, args.spellName, args.sourceName)
		else
			timerRaidCDs:Start(120, args.spellName, args.sourceName)
		end
	elseif args:IsSpellID(55233) and self:IsInCombat() and ((self.Options.ShowRaidCDs and not self.Options.ShowRaidCDsSelf) or (self.Options.ShowRaidCDs and self.Options.ShowRaidCDsSelf and UnitName("player") == args.sourceName)) then--DK Vampric Blood (4pc assumed)
		if UnitDebuff(args.sourceName, GetSpellInfo(106218)) then
			timerRaidCDs:Start(30, args.spellName, args.sourceName)
		else
			timerRaidCDs:Start(60, args.spellName, args.sourceName)
		end
	elseif args:IsSpellID(22842) and self:IsInCombat() and ((self.Options.ShowRaidCDs and not self.Options.ShowRaidCDsSelf) or (self.Options.ShowRaidCDs and self.Options.ShowRaidCDsSelf and UnitName("player") == args.sourceName)) then--Druid Frenzied Regen (4pc assumed)
		if UnitDebuff(args.sourceName, GetSpellInfo(106218)) then
			timerRaidCDs:Start(90, args.spellName, args.sourceName)
		else
			timerRaidCDs:Start(180, args.spellName, args.sourceName)
		end
	elseif args:IsSpellID(98008) and self:IsInCombat() and ((self.Options.ShowRaidCDs and not self.Options.ShowRaidCDsSelf) or (self.Options.ShowRaidCDs and self.Options.ShowRaidCDsSelf and UnitName("player") == args.sourceName)) then--Shaman Spirit Link
		timerRaidCDs:Start(180, args.spellName, args.sourceName)
	elseif args:IsSpellID(62618) and self:IsInCombat() and ((self.Options.ShowRaidCDs and not self.Options.ShowRaidCDsSelf) or (self.Options.ShowRaidCDs and self.Options.ShowRaidCDsSelf and UnitName("player") == args.sourceName)) then--Priest Power Word: Barrior
		timerRaidCDs:Start(180, args.spellName, args.sourceName)
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(105925, 110068, 110069, 110070) then--Tank Only SpellIDS
		fadingLightCount = fadingLightCount + 1
		fadingLightTargets[#fadingLightTargets + 1] = args.destName
		if self:IsDifficulty("heroic10", "heroic25") and fadingLightCount < 3 then
			timerFadingLightCD:Start()
		elseif self:IsDifficulty("normal10", "normal25", "lfr25") and fadingLightCount < 2 then
			timerFadingLightCD:Start(15)
		end
		if (args:IsPlayer() or UnitDebuff("player", GetSpellInfo(105925))) and GetTime() - fadingLightSpam > 2 then--Sometimes the combatlog doesn't report all fading lights, so we perform an additional aura check 
			local _, _, _, _, _, duration, expires = UnitDebuff("player", args.spellName)--Find out what our specific fading light is
			specWarnFadingLight:Show()
			FadingLightCountdown:Start(duration-1)--For some reason need to offset it by 1 second to make it accurate but otherwise it's perfect
			timerFadingLight:Start(duration-1)
			fadingLightSpam = GetTime()
		else
			specWarnFadingLightOther:Show(args.destName)
		end
		self:Unschedule(warnFadingLightTargets)
		if self:IsDifficulty("lfr25") or self:IsDifficulty("heroic25") and #fadingLightTargets >= 7 or self:IsDifficulty("normal25") and #fadingLightTargets >= 4 or self:IsDifficulty("heroic10") and #fadingLightTargets >= 3 or self:IsDifficulty("normal10") and #fadingLightTargets >= 2 then
			warnFadingLightTargets()
		else
			self:Schedule(0.5, warnFadingLightTargets)
		end
	elseif args:IsSpellID(109075, 110078, 110079, 110080) then--Non Tank IDs
		fadingLightTargets[#fadingLightTargets + 1] = args.destName
		if (args:IsPlayer() or UnitDebuff("player", GetSpellInfo(109075))) and GetTime() - fadingLightSpam > 2 then
			local _, _, _, _, _, duration, expires = UnitDebuff("player", args.spellName)
			specWarnFadingLight:Show()
			FadingLightCountdown:Start(duration-1)
			timerFadingLight:Start(duration-1)
			fadingLightSpam = GetTime()
		end
		self:Unschedule(warnFadingLightTargets)
		if self:IsDifficulty("heroic25") and #fadingLightTargets >= 7 or self:IsDifficulty("normal25") and #fadingLightTargets >= 4 or self:IsDifficulty("heroic10") and #fadingLightTargets >= 3 or self:IsDifficulty("normal10") and #fadingLightTargets >= 2 then
			warnFadingLightTargets()
		else
			self:Schedule(0.5, warnFadingLightTargets)
		end
	elseif args:IsSpellID(106498) and args:IsPlayer() then
		timerLoomingDarkness:Start()
	end
end

function mod:CHAT_MSG_MONSTER_SAY(msg)
	if msg == L.Pull or msg:find(L.Pull) then
		timerCombatStart:Start()
	end
end
