local mod	= DBM:NewMod("DSTrash", "DBM-DragonSoul")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 7334 $"):sub(12, -3))
mod:SetModelID(39378)
mod:SetZone()

mod:RegisterEvents(
	"SPELL_CAST_START",
	"SPELL_DAMAGE",
	"SPELL_MISSED",
	"UNIT_DIED",
	"CHAT_MSG_MONSTER_YELL",
	"CHAT_MSG_MONSTER_SAY",
	"UNIT_SPELLCAST_SUCCEEDED"
)

local warnBoulder			= mod:NewTargetAnnounce(107597, 3)--This is morchok entryway trash that throws rocks at random poeple.
local warnDrakesLeft		= mod:NewAnnounce("DrakesLeft", 2, 61248)

local specWarnBoulder		= mod:NewSpecialWarningMove(107597)
local specWarnBoulderNear	= mod:NewSpecialWarningClose(107597)
local yellBoulder			= mod:NewYell(107597)
local specWarnFlames		= mod:NewSpecialWarningMove(105579)

local timerEoE				= mod:NewCastTimer(64, 46811, nil, nil, nil, 84358)
local timerDrakes			= mod:NewTimer(253, "TimerDrakes", 61248)
--Leave this timer for now, I think this is the same.
--it still seems timed, just ends earlier if you kill 15 drakes.
--No one knew it ended at 24 drakes before hotfix because timer always expired before any raid hit 24, so we often just saw the hard capped event limit.
--I suspect some shitty LFR group is still gonna hit timer limit before 15 drakes, so we'll see

mod:RemoveOption("HealthFrame")
mod:RemoveOption("SpeedKillTimer")

local antiSpam = 0
local drakesCount = 15

function mod:BoulderTarget(sGUID)
	local targetname, realm = nil
	for i=1, GetNumRaidMembers() do
		if UnitGUID("raid"..i.."target") == sGUID then
			targetname, realm = UnitName("raid"..i.."targettarget")
			break
		end
	end
	if not targetname then return end
	if realm then targetname = targetname.."-"..realm end
	warnBoulder:Show(targetname)
	if targetname == UnitName("player") then
		specWarnBoulder:Show()
		yellBoulder:Yell()
	else
		local uId = DBM:GetRaidUnitId(targetname)
		if uId then
			local x, y = GetPlayerMapPosition(uId)
			if x == 0 and y == 0 then
				SetMapToCurrentZone()
				x, y = GetPlayerMapPosition(uId)
			end
			local inRange = DBM.RangeCheck:GetDistance("player", x, y)
			if inRange and inRange < 6 then--Guessed, unknown, spelltip isn't informative.
				specWarnBoulderNear:Show(targetname)
			end
		end
	end
end

function mod:SPELL_CAST_START(args)
	if args:IsSpellID(107597) then -- this spell cast 3 sec. and use at target's cast end position. not begin.
		self:ScheduleMethod(3, "BoulderTarget", args.sourceGUID)
	end
end

function mod:SPELL_DAMAGE(sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellId)
	if spellId == 105579 and destGUID == UnitGUID("player") and GetTime() - antiSpam >= 3 then
		specWarnFlames:Show()
		antiSpam = GetTime()
	end
end
mod.SPELL_MISSED = mod.SPELL_DAMAGE

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	-- i doubt that we have still missing cids? needs review. Should be all.
	-- http://www.wowhead.com/search?q=twilight+assaulter
	if cid == 56249 or cid == 56250 or cid == 56251 or cid == 56252 or cid == 57281 or cid == 57795 then
		drakesCount = drakesCount - 1
		if drakesCount >= 0 then
			warnDrakesLeft:Show(drakesCount)
		end
		if drakesCount == 0 then
			self:SendSync("SkyrimEnded")
		end
	end
end

--	"<18.7> CHAT_MSG_MONSTER_YELL#It is good to see you again, Alexstrasza. I have been busy in my absence.#Deathwing###Notarget##0#0##0#3731##0#false", -- [1]
--	"<271.9> [UNIT_SPELLCAST_SUCCEEDED] Twilight Assaulter:Possible Target<nil>:target:Twilight Escape::0:109904", -- [11926]
function mod:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L.UltraxionTrash or msg:find(L.UltraxionTrash) then
		drakesCount = 15--Reset drakes here still in case no one running current dbm is targeting thrall
		timerDrakes:Start(253, GetSpellInfo(109904))--^^
	-- timer still remains even combat starts. so, cancels manually. (Probably for someone who wasn't present for first drake dying.
	elseif msg == L.UltraxionTrashEnded or msg:find(L.UltraxionTrashEnded) then
		self:SendSync("SkyrimEnded")
	end
end

function mod:CHAT_MSG_MONSTER_SAY(msg)
	if msg == L.EoEEvent or msg:find(L.EoEEvent) then
		self:SendSync("EoEPortal")--because SAY has a much smaller range then YELL, we sync it.
	end
end

--	"<101.5> CHAT_MSG_MONSTER_YELL#It is good to see you again, Alexstrasza. I have been busy in my absence.#Deathwing###Vounelli##0#0##0#3093##0#false", -- [1]
--	"<133.3> [UNIT_SPELLCAST_SUCCEEDED] Thrall:Possible Target<nil>:target:Ward of Earth::0:108161", -- [875]
function mod:UNIT_SPELLCAST_SUCCEEDED(uId, spellName)
	if spellName == GetSpellInfo(108161) then--Thrall starting drake event, comes much later then yell but is only event that triggers after a wipe to this trash.
		self:SendSync("Skyrim")
	elseif spellName == GetSpellInfo(109904) then
		self:SendSync("SkyrimEnded")
	end
end

function mod:OnSync(msg)
	if msg == "Skyrim" then
		drakesCount = 15--Reset drakes here too soo they stay accurate after wipes.
		timerDrakes:Start(231, GetSpellInfo(109904))
	elseif msg == "SkyrimEnded" then
		timerDrakes:Cancel()
	elseif msg == "EoEPortal" and timerEoE:GetTime() == 0 then--Why this starts more then once is beyond me, hopefully this fixes it.
		timerEoE:Start()
	end
end
