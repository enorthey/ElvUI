﻿if GetLocale() ~= "esES" and GetLocale() ~= "esMX" then return end

local L

-------------------------
--  Blackrock Caverns  --
--------------------------
-- Rom'ogg Bonecrusher --
--------------------------
L = DBM:GetModLocalization("Romogg")

L:SetGeneralLocalization({
	name = "Machacahuesos Rom'ogg"
})

-------------------------------
-- Corla, Herald of Twilight --
-------------------------------
L = DBM:GetModLocalization("Corla")

L:SetGeneralLocalization({
	name = "Corla, Heraldo del Crepúsculo"
})

L:SetWarningLocalization({
	WarnAdd		= "Se ha liberado un add"
})

L:SetOptionLocalization({
	WarnAdd		= "Avisar cuando un add pierde el bufo de $spell:75608"
})

-----------------------
-- Karsh SteelBender --
-----------------------
L = DBM:GetModLocalization("KarshSteelbender")

L:SetGeneralLocalization({
	name = "Karsh Doblacero"
})

L:SetTimerLocalization({
	TimerSuperheated 	= "Armadura sobrecalentada (%d)"
})

L:SetOptionLocalization({
	TimerSuperheated	= "Mostrar tiempo de duracion de $spell:75846"
})

------------
-- Beauty --
------------
L = DBM:GetModLocalization("Beauty")

L:SetGeneralLocalization({
	name = "Bella"
})

-----------------------------
-- Ascendant Lord Obsidius --
-----------------------------
L = DBM:GetModLocalization("AscendantLordObsidius")

L:SetGeneralLocalization({
	name = "Ascendiente Lord Obsidius"
})

L:SetOptionLocalization({
	SetIconOnBoss	= "Poner un icono en el boss después de $spell:76200"
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
	name = "Helix Rompengranajes"
})

---------------------
-- Foe Reaper 5000 --
---------------------
L = DBM:GetModLocalization("FoeReaper")

L:SetGeneralLocalization({
	name = "Siegaenemigos 5000"
})

L:SetOptionLocalization{
	HarvestIcon		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(88495)
}

----------------------
-- Admiral Ripsnarl --
----------------------
L = DBM:GetModLocalization("Ripsnarl")

L:SetGeneralLocalization({
	name = "Almirante Rasgagruñido"
})

----------------------
-- "Captain" Cookie --
----------------------
L = DBM:GetModLocalization("Cookie")

L:SetGeneralLocalization({
	name = "\"Capitán\" Cocinitas"
})

----------------------
-- Vanessa VanCleef --
----------------------
L = DBM:GetModLocalization("Vanessa")

L:SetGeneralLocalization({
	name = "Vanessa VanCleef"
})

L:SetTimerLocalization({
	achievementGauntlet	= "Vigorosa venganza VanCleef"
})

------------------
--  Grim Batol  --
---------------------
-- General Umbriss --
---------------------
L = DBM:GetModLocalization("GeneralUmbriss")

L:SetGeneralLocalization({
	name = "General Umbriss"
})

L:SetOptionLocalization{
	PingBlitz	= "Marcar en el minimapa cuando el General Umbriss vaya a atacarte con Ataque relámpago"
}

L:SetMiscLocalization{
	Blitz		= "fija la mirada |cFFFF0000(%S+)"
}

--------------------------
-- Forgemaster Throngus --
--------------------------
L = DBM:GetModLocalization("ForgemasterThrongus")

L:SetGeneralLocalization({
	name = "Maestro de forja Throngus"
})

-------------------------
-- Drahga Shadowburner --
-------------------------
L = DBM:GetModLocalization("DrahgaShadowburner")

L:SetGeneralLocalization({
	name = "Drahga Quemasombras"
})

L:SetMiscLocalization{
	ValionaYell	= "¡Dragón, harás lo que te ordeno! ¡Cógeme!",
	Add			= "%s Invoca un",
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
	name = "Guardian del templo Anhuur"
})

---------------------
-- Earthrager Ptah --
---------------------
L = DBM:GetModLocalization("EarthragerPtah")

L:SetGeneralLocalization({
	name = "Terracundo Ptah"
})

L:SetMiscLocalization{
	Kill		= "Se... acabó... Ptah..."
}

--------------
-- Anraphet --
--------------
L = DBM:GetModLocalization("Anraphet")

L:SetGeneralLocalization({
	name = "Anraphet"
})

L:SetTimerLocalization({
	achievementGauntlet	= "Velocidad de la luz"
})

L:SetMiscLocalization({
	Brann		= "¡Bien, vamos! Tan solo me falta introducir la secuencia final en el mecanismo de la puerta... y..."
})

------------
-- Isiset --
------------
L = DBM:GetModLocalization("Isiset")

L:SetGeneralLocalization({
	name = "Isiset"
})

L:SetWarningLocalization({
	WarnSplitSoon	= "División pronto"
})

L:SetOptionLocalization({
	WarnSplitSoon	= "Mostrar pre aviso para división"
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
-------------------
L = DBM:GetModLocalization("Siamat")

L:SetGeneralLocalization({
	name = "Siamat"
})

L:SetWarningLocalization{
	specWarnPhase2Soon	= "Fase 2 en 5 segundos"
}

L:SetTimerLocalization({
	timerPhase2 	= "Empieza la Fase 2"
})

L:SetOptionLocalization{
	specWarnPhase2Soon	= "Mostrar aviso epecial para fase 2 en breve (5 segundos)",
	timerPhase2 	= "Mostrar tiempo para el inicio de la fase 2"
}


------------------------
-- High Prophet Barim --
------------------------
L = DBM:GetModLocalization("HighProphetBarim")

L:SetGeneralLocalization({
	name = "Sumo Profeta Barim"
})

L:SetOptionLocalization{
	BossHealthAdds	= "Mostrar barra de vida de los adds"
}

L:SetMiscLocalization{
	BlazeHeavens		= "Llamarada de los cielos",
	HarbringerDarkness	= "Presagista de oscuridad"
}

--------------
-- Lockmaw --
--------------
L = DBM:GetModLocalization("Lockmaw")

L:SetGeneralLocalization({
	name = "Cierrafauce"
})

L:SetOptionLocalization{
	RangeFrame	= "Mostrar distancia (6 yardas)"
}

----------
-- Augh --
----------
L = DBM:GetModLocalization("Augh")

L:SetGeneralLocalization({
	name = "Augh"
})

-----------------------
--  Shadowfang Keep  --
-----------------------
-- Baron Ashbury --
-------------------
L = DBM:GetModLocalization("Ashbury")

L:SetGeneralLocalization({
	name = "Barón Ashbury"
})

-----------------------
-- Baron Silverlaine --
-----------------------
L = DBM:GetModLocalization("Silverlaine")

L:SetGeneralLocalization({
	name = "Barón Filargenta"
})

--------------------------
-- Commander Springvale --
--------------------------
L = DBM:GetModLocalization("Springvale")

L:SetGeneralLocalization({
	name = "Comandante Vallefont"
})

L:SetTimerLocalization({
	TimerAdds		= "Siguientes Adds"
})

L:SetOptionLocalization{
	TimerAdds		= "Mostrar tiempo para adds"
}

L:SetMiscLocalization{
	YellAdds		= "¡Repeled a los intrusos!"
}

-----------------
-- Lord Walden --
-----------------
L = DBM:GetModLocalization("Walden")

L:SetGeneralLocalization({
	name = "Lord Walden"
})

L:SetWarningLocalization{
	specWarnCoagulant	= "Mezcla verde. ¡Muévete!",	-- Green light
	specWarnRedMix		= "Mezcla roja. ¡No te muevas!"		-- Red light
}

L:SetOptionLocalization{
	RedLightGreenLight	= "Mostrar aviso especial para mezclas rojas/verdes"
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
	WarnEmerge	= "Emerge",
	WarnSubmerge	= "Se sumerge"
})

L:SetTimerLocalization({
	TimerEmerge	= "Siguiente Emerger",
	TimerSubmerge	= "Siguiente Sumergirse"
})

L:SetOptionLocalization({
	WarnEmerge	= "Mostrar aviso cuando emerge",
	WarnSubmerge	= "Mostrar aviso cuando se sumerge",
	TimerEmerge	= "Mostrar tiempo para que emerja",
	TimerSubmerge	= "Mostrar tiempo para que se sumerja",
	CrystalArrow	= "Mostrar una flecha cuando $spell:81634 esté cerca de ti",
	RangeFrame		= "Mostrar distancia (5 yardas)"

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
	name = "Pielpétrea"
})

L:SetWarningLocalization({
	WarnAirphase			= "Fase aerea",
	WarnGroundphase			= "Fase en tierra",
	specWarnCrystalStorm		= "Tormenta de Cristales - Protégete"
})

L:SetTimerLocalization({
	TimerAirphase			= "Siguiente Fase aerea",
	TimerGroundphase		= "Siguiente Fase en tierra"
})

L:SetOptionLocalization({
	WarnAirphase			= "Mostrar aviso cuando Pielpétrea despega",
	WarnGroundphase			= "Mostrar aviso cuando Pielpétrea aterriza",
	TimerAirphase			= "Mostrar tiempo para siguiente Fase aerea",
	TimerGroundphase		= "Mostrar tiempo para siguiente Fase en tierra",
	specWarnCrystalStorm		= "Mostrar aviso especial para $spell:92265"
})


-------------------------
-- High Priestess Azil --
------------------------
L = DBM:GetModLocalization("HighPriestessAzil")

L:SetGeneralLocalization({
	name = "Suma Sacerdotisa Azil"
})

---------------------------
--  The Vortex Pinnacle  --
---------------------------
-- Grand Vizier Ertan --
------------------------
L = DBM:GetModLocalization("GrandVizierErtan")

L:SetGeneralLocalization({
	name = "Gran visir Ertan"
})

L:SetMiscLocalization{
	Retract		= "¡%s retira su Escudo de ciclón!"
}

--------------
-- Altairus --
-------------- 
L = DBM:GetModLocalization("Altairus")

L:SetGeneralLocalization({
	name = "Altarius"
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
	SpecWarnStaticCling	= "Mostrar aviso especial para $spell:87618"
})

L:SetWarningLocalization({
	SpecWarnStaticCling	= "¡SALTA!"
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
	name = "Comandante Ulthok"
})

-------------------------
-- Erunak Stonespeaker --
-------------------------
L = DBM:GetModLocalization("ErunakStonespeaker")

L:SetGeneralLocalization({
	name = "Erunak Hablapiedra"
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
--  Nalorakk --
---------------
L = DBM:GetModLocalization("Nalorakk5")

L:SetGeneralLocalization{
	name = "Nalorakk"
}

L:SetWarningLocalization{
	WarnBear		= "Forma de oso",
	WarnBearSoon	= "Forma de oso en 5 seg",
	WarnNormal		= "Forma normal",
	WarnNormalSoon	= "Forma normal en 5 seg"
}

L:SetTimerLocalization{
	TimerBear		= "Oso",
	TimerNormal		= "Forma Normal"
}

L:SetOptionLocalization{
	WarnBear		= "Mostrar aviso para forma de Oso",
	WarnBearSoon	= "Mostrar pre-aviso para forma de Oso",
	WarnNormal		= "Mostrar aviso para forma de Normal",
	WarnNormalSoon	= "Mostrar preaviso para forma de Normal",
	TimerBear		= "Mostrar tiempo para forma de Oso",
	TimerNormal		= "Mostrar tiempo para forma Normal",
	InfoFrame		= "Mostrar información para jugadores a los que les afecta $spell:42402"
}

L:SetMiscLocalization{
	YellBear 	= "¡Si llamáis a la beh'tia, vais a recibir más de lo que eh'peráis!",
	YellNormal	= "¡Dejad paso al Nalorakk!",
	PlayerDebuffs	= "Debuff de Oleada"
}

---------------
--  Akil'zon --
---------------
L = DBM:GetModLocalization("Akilzon5")

L:SetGeneralLocalization{
	name = "Akil'zon"
}

L:SetOptionLocalization{
	StormIcon	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(43648),
	RangeFrame	= "Mostrar distancia",
	StormArrow	= "Mostrar flecha para $spell:97300",
	SetIconOnEagle	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(97318)
}

---------------
--  Jan'alai --
---------------
L = DBM:GetModLocalization("Janalai5")

L:SetGeneralLocalization{
	name = "Jan'alai"
}

L:SetOptionLocalization{
	FlameIcon		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(43140)
}

L:SetMiscLocalization{
	YellBomb	= "¡Ahora os quemaré!",
	YellHatchAll= "Os mostraré la fuerza... con números.",
	YellAdds	= "¿Dónde está mi criador? ¡A por los huevos!"
}

-------------
-- Halazzi --
-------------
L = DBM:GetModLocalization("Halazzi5")

L:SetGeneralLocalization{
	name = "Halazzi"
}

L:SetWarningLocalization{
	WarnSpirit	= "Fase de Espíritu",
	WarnNormal	= "Fase Normal"
}

L:SetOptionLocalization{
	WarnSpirit	= "Mostrar aviso para fase de Espíritu",
	WarnNormal	= "Mostrar aviso para fase Normal"
}

L:SetMiscLocalization{
	YellSpirit	= "Lucho con libertad de espíritu...",
	YellNormal	= "¡Espíritu, vuelve a mí!"
}

-----------------------
-- Hexlord Malacrass --
-----------------------
L = DBM:GetModLocalization("Malacrass5")

L:SetGeneralLocalization{
	name = "Señor aojador Malacrass"
}

L:SetTimerLocalization{
	TimerSiphon	= "%s: %s"
}

L:SetOptionLocalization{
	TimerSiphon	= "Mostrar tiempo para $spell:43501"
}

L:SetMiscLocalization{
	YellPull	= "Las sombras caerán sobre vosotros..."
}

-------------
-- Daakara --
-------------
L = DBM:GetModLocalization("Daakara")

L:SetGeneralLocalization{
	name = "Daakara"
}

L:SetTimerLocalization{
	timerNextForm	= "Siguiente cambio de forma"
}

L:SetOptionLocalization{
	timerNextForm	= "Mostrar tiempo para los cambios de forma.",
	InfoFrame		= "Mostrar información para jugadores a los que les afecta $spell:42402",
	ThrowIcon		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(97639),
	ClawRageIcon		= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(97672)
}

L:SetMiscLocalization{
	PlayerDebuffs	= "Debuff de Oleada"
}

-----------------
--  Zul'Gurub  --
-------------------------
-- High Priest Venoxis --
-------------------------
L = DBM:GetModLocalization("Venoxis")

L:SetGeneralLocalization{
	name = "Sumo sacerdote Venoxis"
}

L:SetOptionLocalization{
	SetIconOnToxicLink	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(96477),
	LinkArrow		= "Mostrar una flecha cuando te afecte $spell:96477"
}

--------------
-- Mandokir --
--------------
L = DBM:GetModLocalization("Mandokir")

L:SetGeneralLocalization{
	name = "Señor Sangriento Mandokir"
}

L:SetWarningLocalization{
	WarnRevive		= "%d fantasmas restantes",
	SpecWarnOhgan	= "¡Ohgan ha resucitado! ¡Ataca ahora!"
}

L:SetOptionLocalization{
	WarnRevive	= "Anunciar cuantas resurrecciones de fantasmas quedan",
	SpecWarnOhgan	= "Mostrar aviso cuando Ohgan es resucitado",
	SetIconOnOhgan	= "Poner un icono a Ohgan cuando resucite" 
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
	SpecWarnToxic	= "Coge Tormento tóxico"
}

L:SetOptionLocalization{
	SpecWarnToxic	= "Mostrar aviso especial cuando pierdas el debufo de $spell:96328",
	InfoFrame		= "Mostrar información de jugadores sin $spell:96328",
	SetIconOnGaze	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(96342)
}

L:SetMiscLocalization{
	PlayerDebuffs	= "Sin Tormento tóxico"
}

----------------------------
-- High Priestess Kilnara --
----------------------------
L = DBM:GetModLocalization("Kilnara")

L:SetGeneralLocalization{
	name = "Suma Sacerdotisa Kilnara"
}

----------------------------
-- Jindo --
----------------------------
L = DBM:GetModLocalization("Jindo")

L:SetGeneralLocalization{
	name = "Jin'do the Godbreaker"
}

L:SetWarningLocalization{
	WarnBarrierDown	= "Barrera de las cadenas de Hakkar eliminada - %d/3 restantes"
}

L:SetOptionLocalization{
	WarnBarrierDown	= "Anunciar cuando se elimine una barrera de cadenas",
	BodySlamIcon	= DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(97198)
}

L:SetMiscLocalization{
	Kill	= "Te has pasado de la raya, Jin'do. Juegas con poderes que van más allá de ti. ¿Acaso has olvidado quién soy? ¡¿Es que has olvidado lo que puedo hacer?!"
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
	pursuitEmote	= "%s está persiguiendo"
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
	name = "Julak Fatalidad"
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
	name = "Eco de Sylvanas"
}

---------------------
-- Echo of Tyrande --
---------------------
L = DBM:GetModLocalization("EchoTyrande")

L:SetGeneralLocalization{
	name = "Eco de Tyrande"
}

-------------------
-- Echo of Jaina --
-------------------
L = DBM:GetModLocalization("EchoJaina")

L:SetGeneralLocalization{
	name = "Eco de Jaina"
}

L:SetTimerLocalization{
	TimerFlarecoreDetonate	= "Detonación de Bengala del Núcleo"
}

L:SetOptionLocalization{
	TimerFlarecoreDetonate	= "Mostrar tiempo para detonación de $spell:101927"
}

----------------------
-- Echo of Baine --
----------------------
L = DBM:GetModLocalization("EchoBaine")

L:SetGeneralLocalization{
	name = "Echo de Baine"
}

--------------
-- Murozond --
--------------
L = DBM:GetModLocalization("Murozond")

L:SetGeneralLocalization{
	name = "Murozond"
}

L:SetMiscLocalization{
	Kill		= "No tenéis ni idea de lo que habéis hecho. Aman'Thul... Lo que... he... visto..."
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
	Pull		= "¡Ningún mortal que se enfrente a mí saldrá con vida!"
}

-------------
-- Azshara --
-------------
L = DBM:GetModLocalization("Azshara")

L:SetGeneralLocalization{
	name = "Azshara"
}

L:SetWarningLocalization{
	WarnAdds	= "Siguientes adds pronto"
}

L:SetTimerLocalization{
	TimerAdds	= "Siguientes adds"
}

L:SetOptionLocalization{
	WarnAdds	= "Anunciar cuando \"salgan\" nuevos adds",
	TimerAdds	= "Mostrar tiempo para que \"salgan\" nuevos adds"
}

L:SetMiscLocalization{
	Kill		= "Ya basta. Por mucho que me guste hacer de anfitriona, debo atender asuntos más urgentes."
}

-----------------------------
-- Mannoroth and Varo'then --
-----------------------------
L = DBM:GetModLocalization("Mannoroth")

L:SetGeneralLocalization{
	name = "Mannoroth y Varo'then"
}

L:SetTimerLocalization{
	TimerTyrandeHelp	= "Tyrande necesita ayuda"
}

L:SetOptionLocalization{
	TimerTyrandeHelp	= "Mostrar tiempo para que Tyrande necesite ayuda"
}

L:SetMiscLocalization{
	Kill		= "¡Malfurion... lo ha logrado! ¡El portal se desmorona!"
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
	TimerCombatStart	= "Empieza el combate"
}

L:SetOptionLocalization{
	TimerCombatStart	= "Mostrar tiempo para el inicio del combate"
}

L:SetMiscLocalization{
	Event		= "¡Muéstrate!",
	Pull		= "Las fuerzas Crepusculares comienzan a aparecer en los bordes de los cañones."
}

----------------------
-- Asira Dawnslayer --
----------------------
L = DBM:GetModLocalization("AsiraDawnslayer")

L:SetGeneralLocalization{
	name = "Asira Puñal del Alba"
}

L:SetMiscLocalization{
	Pull		= "... una vez liquidado eso, tú y ese rebaño de torpes amigos tuyos sois los siguientes en mi lista. ¡Mmm, creí que nunca llegarías!"
}


---------------------------
-- Archbishop Benedictus --
---------------------------
L = DBM:GetModLocalization("Benedictus")

L:SetGeneralLocalization{
	name = "Arzobispo Benedictus"
}

L:SetTimerLocalization{
	TimerCombatStart	= "Empieza el combate"
}

L:SetOptionLocalization{
	TimerCombatStart	= "Mostrar tiempo para el inicio del combate"
}

L:SetMiscLocalization{
	Event		= "Y ahora, chamán, me entregarás el Alma de dragón."
}
