local L

-------------------------
--  Blackrock Caverns  --
--------------------------
-- Rom'ogg Bonecrusher --
--------------------------
L = DBM:GetModLocalization("Romogg")

L:SetGeneralLocalization({
	name = "Rom'ogg Bonecrusher"
})

-------------------------------
-- Corla, Herald of Twilight --
-------------------------------
L = DBM:GetModLocalization("Corla")

L:SetGeneralLocalization({
	name = "Corla, Herald of Twilight"
})

L:SetWarningLocalization({
	WarnAdd		= "Add released"
})

L:SetOptionLocalization({
	WarnAdd		= "Warn when an add looses $spell:75608 buff"
})

-----------------------
-- Karsh SteelBender --
-----------------------
L = DBM:GetModLocalization("KarshSteelbender")

L:SetGeneralLocalization({
	name = "Karsh Steelbender"
})

L:SetTimerLocalization({
	TimerSuperheated 	= "Superheated Armor (%d)"
})

L:SetOptionLocalization({
	TimerSuperheated	= "Show timer for $spell:75846 duration"
})

------------
-- Beauty --
------------
L = DBM:GetModLocalization("Beauty")

L:SetGeneralLocalization({
	name = "Beauty"
})

-----------------------------
-- Ascendant Lord Obsidius --
-----------------------------
L = DBM:GetModLocalization("AscendantLordObsidius")

L:SetGeneralLocalization({
	name = "Ascendant Lord Obsidius"
})

L:SetOptionLocalization({
	SetIconOnBoss	= "Put an icon on the boss after $spell:76200 "
})

---------------------
--  The Deadmines  --
---------------------
-- Glubtok --
-------------
L = DBM:GetModLocalization("Glubtok")

L:SetGeneralLocalization({
	name = "Glubtok"
})

-----------------------
-- Helix Gearbreaker --
-----------------------
L = DBM:GetModLocalization("Helix")

L:SetGeneralLocalization({
	name = "Helix Gearbreaker"
})

---------------------
-- Foe Reaper 5000 --
---------------------
L = DBM:GetModLocalization("FoeReaper")

L:SetGeneralLocalization({
	name = "Foe Reaper 5000"
})

L:SetOptionLocalization{
	HarvestIcon		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(88495)
}

----------------------
-- Admiral Ripsnarl --
----------------------
L = DBM:GetModLocalization("Ripsnarl")

L:SetGeneralLocalization({
	name = "Admiral Ripsnarl"
})

----------------------
-- "Captain" Cookie --
----------------------
L = DBM:GetModLocalization("Cookie")

L:SetGeneralLocalization({
	name = "\"Captain\" Cookie"
})

----------------------
-- Vanessa VanCleef --
----------------------
L = DBM:GetModLocalization("Vanessa")

L:SetGeneralLocalization({
	name = "Vanessa VanCleef"
})

L:SetTimerLocalization({
	achievementGauntlet	= "Gauntlet"
})

------------------
--  Grim Batol  --
---------------------
-- General Umbriss --
---------------------
L = DBM:GetModLocalization("GeneralUmbriss")

L:SetGeneralLocalization({
	name 		= "General Umbriss"
})

L:SetOptionLocalization{
	PingBlitz	= "Ping the minimap when General Umbriss is about to blitz you"
}

L:SetMiscLocalization{
	Blitz		= "sets his eyes on |cFFFF0000(%S+)"
}

--------------------------
-- Forgemaster Throngus --
--------------------------
L = DBM:GetModLocalization("ForgemasterThrongus")

L:SetGeneralLocalization({
	name = "Forgemaster Throngus"
})

-------------------------
-- Drahga Shadowburner --
-------------------------
L = DBM:GetModLocalization("DrahgaShadowburner")

L:SetGeneralLocalization({
	name = "Drahga Shadowburner"
})

L:SetMiscLocalization{
	ValionaYell	= "Dragon, you will do as I command! Catch me!",	-- Yell when Valiona is incoming
	Add			= "%s Summons an",
	Valiona		= "Valiona"
}

------------
-- Erudax --
------------
L = DBM:GetModLocalization("Erudax")

L:SetGeneralLocalization({
	name = "Erudax"
})

----------------------------
--  Halls of Origination  --
----------------------------
-- Temple Guardian Anhuur --
----------------------------
L = DBM:GetModLocalization("TempleGuardianAnhuur")

L:SetGeneralLocalization({
	name = "Temple Guardian Anhuur"
})

---------------------
-- Earthrager Ptah --
---------------------
L = DBM:GetModLocalization("EarthragerPtah")

L:SetGeneralLocalization({
	name = "Earthrager Ptah"
})

L:SetMiscLocalization{
	Kill		= "Ptah... is... no more..."
}

--------------
-- Anraphet --
--------------
L = DBM:GetModLocalization("Anraphet")

L:SetGeneralLocalization({
	name = "Anraphet"
})

L:SetTimerLocalization({
	achievementGauntlet	= "Gauntlet"
})

L:SetMiscLocalization({
	Brann				= "Right, let's go! Just need to input the final entry sequence into the door mechanism... and..."
})

------------
-- Isiset --
------------
L = DBM:GetModLocalization("Isiset")

L:SetGeneralLocalization({
	name = "Isiset"
})

L:SetWarningLocalization({
	WarnSplitSoon	= "Split soon"
})

L:SetOptionLocalization({
	WarnSplitSoon	= "Show pre-warning for Split"
})

-------------
-- Ammunae --
------------- 
L = DBM:GetModLocalization("Ammunae")

L:SetGeneralLocalization({
	name = "Ammunae"
})

-------------
-- Setesh  --
------------- 
L = DBM:GetModLocalization("Setesh")

L:SetGeneralLocalization({
	name = "Setesh"
})

----------
-- Rajh --
----------
L = DBM:GetModLocalization("Rajh")

L:SetGeneralLocalization({
	name = "Rajh"
})

--------------------------------
--  Lost City of the Tol'vir  --
--------------------------------
-- General Husam --
-------------------
L = DBM:GetModLocalization("GeneralHusam")

L:SetGeneralLocalization({
	name = "General Husam"
})

------------------------------------
-- Siamat, Lord of the South Wind --
------------------------------------
L = DBM:GetModLocalization("Siamat")

L:SetGeneralLocalization({
	name = "Siamat"		-- "Siamat, Lord of the South Wind" --> Real name is too long :((
})

L:SetWarningLocalization{
	specWarnPhase2Soon	= "Phase 2 in 5 seconds"
}

L:SetTimerLocalization({
	timerPhase2 		= "Phase 2 Starts"
})

L:SetOptionLocalization{
	specWarnPhase2Soon	= "Show special warning for phase 2 soon (5 seconds)",
	timerPhase2 		= "Show timer for start of phase 2"
}

------------------------
-- High Prophet Barim --
------------------------
L = DBM:GetModLocalization("HighProphetBarim")

L:SetGeneralLocalization({
	name = "High Prophet Barim"
})

L:SetOptionLocalization{
	BossHealthAdds	= "Show health of adds in the Boss Health Frame"
}

L:SetMiscLocalization{
	BlazeHeavens		= "Blaze of the Heavens",
	HarbringerDarkness	= "Harbringer of Darkness"
}

--------------
-- Lockmaw --
--------------
L = DBM:GetModLocalization("Lockmaw")

L:SetGeneralLocalization({
	name = "Lockmaw"
})

L:SetOptionLocalization{
	RangeFrame	= "Show Range Frame (5 yards)"
}

----------
-- Augh --
----------
L = DBM:GetModLocalization("Augh")

L:SetGeneralLocalization({
	name = "Augh"		-- he is fightable after Lockmaw :o
})

-----------------------
--  Shadowfang Keep  --
-----------------------
-- Baron Ashbury --
-------------------
L = DBM:GetModLocalization("Ashbury")

L:SetGeneralLocalization({
	name = "Baron Ashbury"
})

-----------------------
-- Baron Silverlaine --
-----------------------
L = DBM:GetModLocalization("Silverlaine")

L:SetGeneralLocalization({
	name = "Baron Silverlaine"
})

--------------------------
-- Commander Springvale --
--------------------------
L = DBM:GetModLocalization("Springvale")

L:SetGeneralLocalization({
	name = "Commander Springvale"
})

L:SetTimerLocalization({
	TimerAdds		= "Next Adds"
})

L:SetOptionLocalization{
	TimerAdds		= "Show timer for Adds"
}

L:SetMiscLocalization{
	YellAdds		= "Repel the intruders!"
}

-----------------
-- Lord Walden --
-----------------
L = DBM:GetModLocalization("Walden")

L:SetGeneralLocalization({
	name = "Lord Walden"
})

L:SetWarningLocalization{
	specWarnCoagulant	= "Green Mix - Keep Moving!",	-- Green light
	specWarnRedMix		= "Red Mix - Do Not Move!"		-- Red light
}

L:SetOptionLocalization{
	RedLightGreenLight	= "Show special warnings for Red/Green movement queues"
}

------------------
-- Lord Godfrey --
------------------
L = DBM:GetModLocalization("Godfrey")

L:SetGeneralLocalization({
	name = "Lord Godfrey"
})

---------------------
--  The Stonecore  --
---------------------
-- Corborus --
-------------- 
L = DBM:GetModLocalization("Corborus")

L:SetGeneralLocalization({
	name = "Corborus"
})

L:SetWarningLocalization({
	WarnEmerge		= "Emerge",
	WarnSubmerge	= "Submerge"
})

L:SetTimerLocalization({
	TimerEmerge		= "Next Emerge",
	TimerSubmerge	= "Next Submerge"
})

L:SetOptionLocalization({
	WarnEmerge		= "Show warning for emerge",
	WarnSubmerge	= "Show warning for submerge",
	TimerEmerge		= "Show timer for emerge",
	TimerSubmerge	= "Show timer for submerge",
	CrystalArrow	= "Show DBM arrow when $spell:81634 is near you",
	RangeFrame		= "Show Range Frame (5 yards)"
})

-----------
-- Ozruk --
----------- 
L = DBM:GetModLocalization("Ozruk")

L:SetGeneralLocalization({
	name = "Ozruk"
})

--------------
-- Slabhide --
-------------- 
L = DBM:GetModLocalization("Slabhide")

L:SetGeneralLocalization({
	name = "Slabhide"
})

L:SetWarningLocalization({
	WarnAirphase			= "Airphase",
	WarnGroundphase			= "Groundphase",
	specWarnCrystalStorm	= "Crystal Storm - Take cover"
})

L:SetTimerLocalization({
	TimerAirphase			= "Next Airphase",
	TimerGroundphase		= "Next Groundphase"
})

L:SetOptionLocalization({
	WarnAirphase			= "Show warning when Slabhide lifts off",
	WarnGroundphase			= "Show warning when Slabhide lands",
	TimerAirphase			= "Show timer for next airphase",
	TimerGroundphase		= "Show timer for next groundphase",
	specWarnCrystalStorm	= "Show special warning for $spell:92265"
})

-------------------------
-- High Priestess Azil --
------------------------
L = DBM:GetModLocalization("HighPriestessAzil")

L:SetGeneralLocalization({
	name = "High Priestess Azil"
})

---------------------------
--  The Vortex Pinnacle  --
---------------------------
-- Grand Vizier Ertan --
------------------------
L = DBM:GetModLocalization("GrandVizierErtan")

L:SetGeneralLocalization({
	name = "Grand Vizier Ertan"
})

L:SetMiscLocalization{
	Retract		= "%s retracts her cyclone shield!"
}

--------------
-- Altairus --
-------------- 
L = DBM:GetModLocalization("Altairus")

L:SetGeneralLocalization({
	name = "Altairus"
})

L:SetOptionLocalization({
	BreathIcon	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(88308)
})

-----------
-- Asaad --
-----------
L = DBM:GetModLocalization("Asaad")

L:SetGeneralLocalization({
	name = "Asaad"
})

L:SetOptionLocalization({
	SpecWarnStaticCling	= "Show special warning for $spell:87618"
})

L:SetWarningLocalization({
	SpecWarnStaticCling	= "JUMP!"
})

---------------------------
--  The Throne of Tides  --
---------------------------
-- Lady Naz'jar --
------------------ 
L = DBM:GetModLocalization("LadyNazjar")

L:SetGeneralLocalization({
	name = "Lady Naz'jar"
})

-----======-----------
-- Commander Ulthok --
---------------------- 
L = DBM:GetModLocalization("CommanderUlthok")

L:SetGeneralLocalization({
	name = "Commander Ulthok"
})

-------------------------
-- Erunak Stonespeaker --
-------------------------
L = DBM:GetModLocalization("ErunakStonespeaker")

L:SetGeneralLocalization({
	name = "Erunak Stonespeaker"
})

------------
-- Ozumat --
------------ 
L = DBM:GetModLocalization("Ozumat")

L:SetGeneralLocalization({
	name = "Ozumat"
})

----------------
--  Zul'Aman  --
----------------
-- Nalorakk --
--------------
L = DBM:GetModLocalization("Nalorakk5")

L:SetGeneralLocalization{
	name = "Nalorakk (Bear)"
}

L:SetWarningLocalization{
	WarnBear		= "Bear Form",
	WarnBearSoon	= "Bear Form in 5 sec",
	WarnNormal		= "Normal Form",
	WarnNormalSoon	= "Normal Form in 5 sec"
}

L:SetTimerLocalization{
	TimerBear		= "Bear Form",
	TimerNormal		= "Normal Form"
}

L:SetOptionLocalization{
	WarnBear		= "Show warning for Bear form",
	WarnBearSoon	= "Show pre-warning for Bear form",
	WarnNormal		= "Show warning for Normal form",
	WarnNormalSoon	= "Show pre-warning for Normal form",
	TimerBear		= "Show timer for Bear form",
	TimerNormal		= "Show timer for Normal form",
	InfoFrame		= "Show info frame for players affected by $spell:42402"
}

L:SetMiscLocalization{
	YellBear 		= "You call on da beast, you gonna get more dan you bargain for!",
	YellNormal		= "Make way for Nalorakk!",
	PlayerDebuffs	= "Surge Debuff"
}

--------------
-- Akil'zon --
--------------
L = DBM:GetModLocalization("Akilzon5")

L:SetGeneralLocalization{
	name = "Akil'zon (Eagle)"
}

L:SetOptionLocalization{
	StormIcon	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(97300),
	RangeFrame	= "Show range frame (10 yards)",
	StormArrow	= "Show DBM Arrow for $spell:97300",
	SetIconOnEagle	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(97318)
}

L:SetMiscLocalization{
}

--------------
-- Jan'alai --
--------------
L = DBM:GetModLocalization("Janalai5")

L:SetGeneralLocalization{
	name = "Jan'alai (Dragonhawk)"
}

L:SetOptionLocalization{
	FlameIcon		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(43140)
}

L:SetMiscLocalization{
	YellBomb	= "I burn ya now!",
	YellHatchAll= "I show you strength... in numbers.",
	YellAdds	= "Where ma hatcha? Get to work on dem eggs!"
}

-------------
-- Halazzi --
-------------
L = DBM:GetModLocalization("Halazzi5")

L:SetGeneralLocalization{
	name = "Halazzi (Lynx)"
}

L:SetWarningLocalization{
	WarnSpirit	= "Spirit Phase",
	WarnNormal	= "Normal Phase"
}

L:SetOptionLocalization{
	WarnSpirit	= "Show warning for Spirit phase",
	WarnNormal	= "Show warning for Normal phase"
}

L:SetMiscLocalization{
	YellSpirit	= "I fight wit' untamed spirit....",
	YellNormal	= "Spirit, come back to me!"
}

-----------------------
-- Hexlord Malacrass --
-----------------------
L = DBM:GetModLocalization("Malacrass5")

L:SetGeneralLocalization{
	name = "Hexlord Malacrass"
}

L:SetTimerLocalization{
	TimerSiphon	= "%s: %s"
}

L:SetOptionLocalization{
	TimerSiphon	= "Show timer for $spell:43501"
}

L:SetMiscLocalization{
	YellPull	= "Da shadow gonna fall on you...."
}

-------------
-- Daakara --
-------------
L = DBM:GetModLocalization("Daakara")

L:SetGeneralLocalization{
	name = "Daakara"
}

L:SetTimerLocalization{
	timerNextForm	= "Next Form Change"
}

L:SetOptionLocalization{
	timerNextForm	= "Show timer for form changes.",
	InfoFrame		= "Show info frame for players affected by $spell:42402",
	ThrowIcon		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(97639),
	ClawRageIcon	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(97672)
}

L:SetMiscLocalization{
	PlayerDebuffs	= "Surge Debuff"
}

-----------------
--  Zul'Gurub  --
-------------------------
-- High Priest Venoxis --
-------------------------
L = DBM:GetModLocalization("Venoxis")

L:SetGeneralLocalization{
	name = "High Priest Venoxis"
}

L:SetOptionLocalization{
	SetIconOnToxicLink	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(96477),
	LinkArrow			= "Show DBM arrow when you are affected by $spell:96477"
}

------------------------
-- Bloodlord Mandokir --
------------------------
L = DBM:GetModLocalization("Mandokir")

L:SetGeneralLocalization{
	name = "Bloodlord Mandokir"
}

L:SetWarningLocalization{
	WarnRevive		= "%d ghosts remaining",
	SpecWarnOhgan	= "Ohgan revived! Attack now!" -- check this, i'm not good at English
}

L:SetOptionLocalization{
	WarnRevive		= "Announce how many ghost revive remaining",
	SpecWarnOhgan	= "Show warning when Ohgan is revived", -- check this, i'm not good at English
	SetIconOnOhgan	= "Put an icon on Ohgan when he revives" 
}

L:SetMiscLocalization{
	Ohgan		= "Ohgan"
}

------------
-- Zanzil --
------------
L = DBM:GetModLocalization("Zanzil")

L:SetGeneralLocalization{
	name = "Zanzil"
}

L:SetWarningLocalization{
	SpecWarnToxic	= "Get Toxic Torment"
}

L:SetOptionLocalization{
	SpecWarnToxic	= "Show special warning when you are missing $spell:96328 debuff",
	InfoFrame		= "Show info frame for players not affected by $spell:96328",
	SetIconOnGaze	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(96342)
}

L:SetMiscLocalization{
	PlayerDebuffs	= "No Toxic Torment"
}

----------------------------
-- High Priestess Kilnara --
----------------------------
L = DBM:GetModLocalization("Kilnara")

L:SetGeneralLocalization{
	name = "High Priestess Kilnara"
}

----------------------------
-- Jindo --
----------------------------
L = DBM:GetModLocalization("Jindo")

L:SetGeneralLocalization{
	name = "Jin'do the Godbreaker"
}

L:SetWarningLocalization{
	WarnBarrierDown	= "Hakkar's Chains Barrier Down - %d/3 left"
}

L:SetOptionLocalization{
	WarnBarrierDown	= "Announce when Hakkar's Chains barrier down",
	BodySlamIcon	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(97198)
}

L:SetMiscLocalization{
	Kill			= "You overstepped your bounds, Jin'do. You toy with powers that are beyond you. Have you forgotten who I am? Have you forgotten what I can do?!"
}

----------------------
-- Cache of Madness --
----------------------
-------------
-- Gri'lek --
-------------
--L= DBM:GetModLocalization(603)

L = DBM:GetModLocalization("CoMGrilek")

L:SetGeneralLocalization{
	name = "Gri'lek"
}

L:SetMiscLocalization({
	pursuitEmote	= "%s is chasing"
})

---------------
-- Hazza'rah --
---------------
--L= DBM:GetModLocalization(604)

L = DBM:GetModLocalization("CoMGHazzarah")

L:SetGeneralLocalization{
	name = "Hazza'rah"
}

--------------
-- Renataki --
--------------
--L= DBM:GetModLocalization(605)

L = DBM:GetModLocalization("CoMRenataki")

L:SetGeneralLocalization{
	name = "Renataki"
}

---------------
-- Wushoolay --
---------------
--L= DBM:GetModLocalization(606)

L = DBM:GetModLocalization("CoMWushoolay")

L:SetGeneralLocalization{
	name = "Wushoolay"
}

--------------------
--  World Bosses  --
-------------------------
-- Akma'hat --
-------------------------
L = DBM:GetModLocalization("Akmahat")

L:SetGeneralLocalization{
	name = "Akma'hat"
}

-----------
-- Garr --
----------
L = DBM:GetModLocalization("Garr")

L:SetGeneralLocalization{
	name = "Garr (Cata)"
}

----------------
-- Julak-Doom --
----------------
L = DBM:GetModLocalization("JulakDoom")

L:SetGeneralLocalization{
	name = "Julak-Doom"
}

L:SetOptionLocalization{
	SetIconOnMC	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(93621)
}

-----------
-- Mobus --
-----------
L = DBM:GetModLocalization("Mobus")

L:SetGeneralLocalization{
	name = "Mobus"
}

-----------
-- Xariona --
-----------
L = DBM:GetModLocalization("Xariona")

L:SetGeneralLocalization{
	name = "Xariona"
}

----------------
--  End Time  --
----------------------
-- Echo of Sylvanas --
----------------------
L = DBM:GetModLocalization("EchoSylvanas")

L:SetGeneralLocalization{
	name = "Echo of Sylvanas"
}

---------------------
-- Echo of Tyrande --
---------------------
L = DBM:GetModLocalization("EchoTyrande")

L:SetGeneralLocalization{
	name = "Echo of Tyrande"
}

-------------------
-- Echo of Jaina --
-------------------
L = DBM:GetModLocalization("EchoJaina")

L:SetGeneralLocalization{
	name = "Echo of Jaina"
}

L:SetTimerLocalization{
	TimerFlarecoreDetonate	= "Flarecore detonate"
}

L:SetOptionLocalization{
	TimerFlarecoreDetonate	= "Show timer for $spell:101927 detonate"
}

----------------------
-- Echo of Baine --
----------------------
L = DBM:GetModLocalization("EchoBaine")

L:SetGeneralLocalization{
	name = "Echo of Baine"
}

--------------
-- Murozond --
--------------
L = DBM:GetModLocalization("Murozond")

L:SetGeneralLocalization{
	name = "Murozond"
}

L:SetMiscLocalization{
	Kill		= "You know not what you have done. Aman'Thul... What I... have... seen..."
}

------------------------
--  Well of Eternity  --
------------------------
-- Peroth'arn --
----------------
L = DBM:GetModLocalization("Perotharn")

L:SetGeneralLocalization{
	name = "Peroth'arn"
}

L:SetMiscLocalization{
	Pull		= "No mortal may stand before me and live!"
}

-------------
-- Azshara --
-------------
L = DBM:GetModLocalization("Azshara")

L:SetGeneralLocalization{
	name = "Azshara"
}

L:SetWarningLocalization{
	WarnAdds	= "New adds soon"
}

L:SetTimerLocalization{
	TimerAdds	= "Next adds"
}

L:SetOptionLocalization{
	WarnAdds	= "Announce when new adds \"spawn\"",
	TimerAdds	= "Show timer till next adds \"spawn\""
}

L:SetMiscLocalization{
	Kill		= "Enough! As much as I adore playing hostess, I have more pressing matters to attend to."
}

-----------------------------
-- Mannoroth and Varo'then --
-----------------------------
L = DBM:GetModLocalization("Mannoroth")

L:SetGeneralLocalization{
	name = "Mannoroth & Varo'then"
}

L:SetTimerLocalization{
	TimerTyrandeHelp	= "Tyrande needs help"
}

L:SetOptionLocalization{
	TimerTyrandeHelp	= "Show timer till Tyrande needs help"
}

L:SetMiscLocalization{
	Kill		= "Malfurion, he has done it! The portal is collapsing!"
}

------------------------
--  Hour of Twilight  --
------------------------
-- Arcurion --
--------------
L = DBM:GetModLocalization("Arcurion")

L:SetGeneralLocalization{
	name = "Arcurion"
}

L:SetTimerLocalization{
	TimerCombatStart	= "Combat starts"
}

L:SetOptionLocalization{
	TimerCombatStart	= "Show timer for start of combat"
}

L:SetMiscLocalization{
	Event		= "Show yourself!",
	Pull		= "Twilight forces begin to appear around the canyons edges."
}

----------------------
-- Asira Dawnslayer --
----------------------
L = DBM:GetModLocalization("AsiraDawnslayer")

L:SetGeneralLocalization{
	name = "Asira Dawnslayer"
}

L:SetMiscLocalization{
	Pull		= "...and with that out of the way, you and your flock of fumbling friends are next on my list. Mmm, I thought you'd never get here!"
}

---------------------------
-- Archbishop Benedictus --
---------------------------
L = DBM:GetModLocalization("Benedictus")

L:SetGeneralLocalization{
	name = "Archbishop Benedictus"
}

L:SetTimerLocalization{
	TimerCombatStart	= "Combat starts"
}

L:SetOptionLocalization{
	TimerCombatStart	= "Show timer for start of combat"
}

L:SetMiscLocalization{
	Event		= "And now, Shaman, you will give the Dragon Soul to ME."
}