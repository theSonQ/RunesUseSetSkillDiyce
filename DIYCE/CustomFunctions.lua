-- Title: DIY Combat Engine
-- Version: 2.4.2
-- Description: Combat Engine to help with skill rotations, and maintaining buffs/debuffs for maximizing DPS.
-- Author: Ghost Wolf

local WHITE = "|cffffffff"
local SILVER = "|cffc0c0c0"
local GREEN = "|cff00ff00"
local LTBLUE = "|cffa0a0ff"

function DIYCE_DebugSkills(skillList)
    DEFAULT_CHAT_FRAME:AddMessage(GREEN.."Skill List:")
    
    for i,v in ipairs(skillList) do
        DEFAULT_CHAT_FRAME:AddMessage(SILVER.."  ["..WHITE..i..SILVER.."]: "..LTBLUE.."\" "..WHITE..v.name..LTBLUE.."\"  use = "..WHITE..(v.use and "true" or "false"))
    end

    DEFAULT_CHAT_FRAME:AddMessage(GREEN.."----------")
end

function DIYCE_DebugBuffList(buffList)
    DEFAULT_CHAT_FRAME:AddMessage(GREEN.."Buff List:")
    
    for k,v in pairs(buffList) do
        -- We ignore numbered entries because both the ID and name 
        -- are stored in the list. This avoids doubling the output.
        if type(k) ~= "number" then
            DEFAULT_CHAT_FRAME:AddMessage(SILVER.."  ["..WHITE..k..SILVER.."]:  "..LTBLUE.."id: "..WHITE..v.id..LTBLUE.."  stack: "..WHITE..v.stack..LTBLUE.."  time: "..WHITE..(v.time or "none"))
        end
    end
    
    DEFAULT_CHAT_FRAME:AddMessage(GREEN.."----------")    
end

local silenceList = {
		["Annihilation"] = true,
		["King Bug Shock"] = true,
		["Mana Rift"] = true,
		["Dream of Gold"] = true,
		["Flame"] = true,
		["Flame Spell"] = true,
		["Wave Bomb"] = true,
		["Silence"] = true,
		["Recover"] = true,
		["Restore Life"] = true,
		["Heal"] = true,
		["Curing Shot"] = true,
		["Leaves of Fire"] = true,
		["Urgent Heal"] = true,
		["Heavy Shelling"] = true,
		["Dark Healing"] = true,
						}	

local subList = {
		["Sharp Slash"] = true, -- 1st Boss DOD
		["Conjure Energy"] = true, -- 4th boss GC HM AOE
		["Cat Claw Whirlwind"] = true,  --1st boss RT AOE
		["Void Fire"] = true, --2nd boss RT AOE
                        }
						
arrowTime = 0
SlotRWB = 16 --Action Bar Slot # for Rune War Bow
SlotMNB = 17 --Action Bar Slot # for your Main Bow
local g_lastaction = ""
local g_cnt = 0

function CustomAction(action)
    if CD(action) then
        if IsShiftKeyDown() then Msg("- "..action) end
        g_lastaction = action
        CastSpellByName(action)
        return true
    else
        return false
    end
end

--The Potion function is for using in a macro either by itself or combined with the KillSequence function. 
--I used it with my Priest in combo with the PartyHealer Addon to make sure to use potions when I needed them most.
function Potion(healthpot,manapot)
    local Skill = {}
    local i = 0
	local phealth = PctH("player")
    local pctmana = PctM("player")
	healthpot = healthpot or 0
	manapot = manapot or 0
	Skill = {
	{ name = "Action: "..healthpot,		use = (phealth <= .70) },
	{ name = "Action: "..manapot,		use = (pctmana <= .40) },
			}
	MyCombat(Skill,arg1)
end

--Summon and dismiss a pet.
function Pet(petnum)
	if IsPetSummoned(petnum)
		then ReturnPet(petnum) 
	else SummonPet(petnum)
	end
end

--Summon and use the Warden Pet.
function WardenPet(arg1)
	local Skill = {}
	local pctEB1 = PctM("player")
	local pbuffs = BuffList("player")

	local SpiritOfTheOakActive = UnitExists("pet") and (UnitName("pet") == "Spirit of the Oak")
	local NatureCrystalActive = UnitExists("pet") and (UnitName("pet") == "Nature Crystal")
	
	Skill = {
		--{ name = "Summon Spirit of the Oak",			use = (not pbuffs["Heart of the Oak"]) and (not SpiritOfTheOakActive) and (pctEB1 >= .15) },
		--{ name = "Heart of the Oak",					use = SpiritOfTheOakActive and (not pbuffs["Heart of the Oak"]) and (pctEB1 >= .05) },
		{ name = "Summon Nature Crystal",				use = (not NatureCrystalActive) and (pctEB1 >= .15) },
			}	
	
	MyCombat(Skill, arg1)
end

--Summon and use the Priest Fairy.,
function PriestFairySequence(arg1)
	local Skill = {}
	local Skill2 = {}
	local i = 0
	local FairyExists = UnitExists("playerpet")
	local FairyBuffs = BuffList("playerpet")
	local combat = GetPlayerCombatState()

    --Determine Class-Combo
    mainClass, subClass = UnitClassToken( "player" )

	--Summon Fairy
	if (not FairyExists) and (not combat) then
		if mainClass == "AUGUR" then
			if subClass == "THIEF" then
				Skill = {
					{ name = "Shadow Fairy",			use = true },
						}
			elseif subClass == "RANGER" then
				Skill = {
					{ name = "Water Fairy",				use = true },
						}
			elseif subClass == "MAGE" then
				Skill = {
					{ name = "Wind Fairy",				use = true },
						}			
			elseif subClass == "KNIGHT" then
				Skill = {
					{ name = "Light Fairy",				use = true },
						}			
			elseif subClass == "WARRIOR" then
				Skill = {
					{ name = "Fire Fairy",				use = true },
						}
			end
		end
	end	
	
	--Cast Halo
	if FairyExists then
		if mainClass == "AUGUR" then
			if subClass == "THIEF" then
				if (not FairyBuffs[503459]) then
					if (arg1 == "v1") then
						Msg("- Activating Halo", 0, 1, 1)
					end
					Skill = {
						{ name = "Pet Skill: 5 (Wraith Halo)",	use = true },
							}
				end
			elseif subClass == "RANGER" then
				if (not FairyBuffs[503457]) then
					if (arg1 == "v1") then
						Msg("- Activating Halo", 0, 1, 1)
					end
					Skill = {
						{ name = "Pet Skill: 5 (Frost Halo)",	use = true },
							}
				end
			elseif subClass == "MAGE" then
				if (not FairyBuffs[503461]) then
					if (arg1 == "v1") then
						Msg("- Activating Halo", 0, 1, 1)
					end
					Skill = {
						{ name = "Pet Skill: 5 (Windrider Halo)",	use = true },
							}
				end
			elseif subClass == "KNIGHT" then
				if (not FairyBuffs[503507]) then
					if (arg1 == "v1") then
						Msg("- Activating Halo", 0, 1, 1)
					end
					Skill = {
						{ name = "Pet Skill: 5 (Devotion Halo)",	use = true },
							}
				end
			elseif subClass == "WARRIOR" then
				if (not FairyBuffs[503455]) then
					if (arg1 == "v1") then
						Msg("- Activating Halo", 0, 1, 1)
					end
					Skill = {
						{ name = "Pet Skill: 5 (Accuracy Halo)",	use = true },
							}
				end
			end
		
			--Cast Conceal
		if (not MyCombat(Skill, arg1)) then
			if (not FairyBuffs[503753]) then
				if (arg1 == "v1") then
					Msg("- Activating Conceal", 0, 1, 1)
				end
				Skill2 = {
					{ name = "Pet Skill: 6 (Conceal)",	use = true },
						}
			end
		end
		end
	end
	
	if (not MyCombat(Skill, arg1)) then
		MyCombat(Skill2, arg1)
	end
end

--The main function of DIYCE.
function KillSequence(arg1, mode, healthpot, manapot, Healslot, foodslot, speedpot, ragepot, HoTslot)
--arg1 = "v1" or "v2" for debugging
--mode = used for various purposes, such as setting custom sections for specific situation. (IE: Seige War/PvP)
--healthpot = # of actionbar slot for health potions
--manapot = # of actionbar slot for mana potions
--foodslot = # of actionbar slot for food (add more args for more foodslots if needed)

	local Skill = {}
	local Skill2 = {}
	local i = 0
		
	-- Player and target status.
	local combat = GetPlayerCombatState()
	local enemy = UnitCanAttack("player","target")
	local EnergyBar1 = UnitMana("player")
	local EnergyBar2 = UnitSkill("player")
	local pctEB1 = PctM("player")
	local pctEB2 = PctS("player")
	local tbuffs = BuffList("target")
	local pbuffs = BuffList("player")
	local tDead = UnitIsDeadOrGhost("target")
	local behind = (not UnitIsUnit("player", "targettarget"))
	local melee = GetActionUsable(13) -- # is your melee range spell slot number
	local a1,a2,a3,a4,a5,ASon = GetActionInfo(14)  -- # is your Autoshot slot number
	local ammo = (GetEquipSlotInfo(10) ~= nil)
	local _,_,_,_,RWB,_ = GetActionInfo( SlotRWB )
	local _,_,_,_,MNB,_ = GetActionInfo( SlotMNB )
	local phealth = PctH("player")
	local thealth = PctH("target")
	local LockedOn = UnitExists("target")
	local boss = UnitSex("target") > 2
	local elite = UnitSex("target") == 2
	local party = GetNumPartyMembers() >= 2
	local PsiPoints, PsiStatus = GetSoulPoint()
	local zoneid = (GetZoneID() % 1000)
    local SeigeWar = (zoneid == 402) -- The "Seige War" Zone
	
	--Determine Class-Combo
	mainClass, subClass = UnitClassToken( "player" )
	--main, second = UnitClass("player")

	--Silence Logic
	local tSpell,tTime,tElapsed = UnitCastingTime("target")
	local silenceThis = tSpell and silenceList[tSpell] and ((tTime - tElapsed) > 0.1)
	
	--Substitute Logic (for R/S combo)
	local subThis = tSpell and subList[tSpell] and ((tTime - tElapsed) > 0.1)
	
	--Potion & Food Checks
	healthpot = healthpot or 0
	manapot = manapot or 0
	speedpot = speedpot or 0
	foodslot = foodslot or 0

	--Equipment and Pet Protection
	if phealth <= .04 then
			--SwapEquipmentItem()		--Note: Remove the first double dash to re-enable equipment protection.
		for i=1,6 do
			if (IsPetSummoned(i) == true) then
				ReturnPet(i);
			end
		end        
	end

	--Check for level 1 mobs, if it is, drop target and acquire a new one.
	if (LockedOn and (UnitLevel("target") < 2)) then
		TargetNearestEnemy()
		return
	end
	
	--Begin Player Skill Sequences
	
		--Priest = AUGUR, Druid = DRUID, Mage = MAGE, Knight = KNIGHT, 
		--Scout = RANGER, Rogue = THIEF, Warden = WARDEN, Warrior = WARRIOR
		--Warlock = HARPSYN, Champion = PSYRON
		
				
if mainClass == "THIEF" and subClass == "MAGE" then

CreateDIYCETimer("SSBleed", 6.5) --Change the value between 6 -> 7.5 depending on your lag.
CreateDIYCETimer("LBBleed", 7.5) --Change the value between 7 ->  8.5 depending on your lag.

Skill = {
{ name = "Poison",						use = (not combat) and ((not pbuffs["Poisonous"]) or (pbuffs["Poisonous"].time <= 45)) },
}

if enemy then
Skill2 = {
{ name = "Silence",				                use = (silenceThis) },
{ name = "Throw",	                                        use = true },
{ name = "Wound Attack",use = (EnergyBar1 >= 35) and (((tbuffs[620313]) or (tbuffs[500654])) and (tbuffs[620314])) },
{ name = "Low Blow",					use = (EnergyBar1 >= 55) and ((tbuffs[620313]) or (tbuffs[500654])),	timer = "LBBleed" },
{ name = "Shadowstab",					use = (EnergyBar1 >= 20) and ((not tbuffs[620313]) and (not tbuffs[500654])),	timer = "SSBleed" },
{ name = "Combo Throw",	                        use = true },
{ name = "Day of Rain",	                                use = true },
}
end
	--End Player Skill Sequences
	
	if (arg1=="debugskills") then		--Used for printing the skill table, and true/false usability
		DIYCE_DebugSkills(Skill)
		DIYCE_DebugSkills(Skill2)
	elseif (arg1=="debugpbuffs") then	--Used for printing your buff names, and buffID
		DIYCE_DebugBuffList(pbuffs)
	elseif (arg1=="debugtbuffs") then	--Used for printing target buff names, and buffID
		DIYCE_DebugBuffList(tbuffs)
	elseif (arg1=="debugall") then		--Used for printing all of the above at the same time
		DIYCE_DebugSkills(Skill)
		DIYCE_DebugSkills(Skill2)
		DIYCE_DebugBuffList(pbuffs)
		DIYCE_DebugBuffList(tbuffs)
	end
	
	if (not MyCombat(Skill, arg1)) then
		MyCombat(Skill2, arg1)
	end
		
    --Select Next Enemy
	if (tDead) then
		TargetUnit("")
		g_lastaction = ""
		return
	end
	
	if SeigeWar then
		if (not LockedOn) or (not enemy) then
			for i=1,10 do
				if UnitIsPlayer("target") then
					break
				end
				TargetNearestEnemy()
				    StopDIYCETimer("LBBleed")
					StopDIYCETimer("SSBleed")
				return
			end
		end
	
	elseif (not SeigeWar) then
		if mainClass == "RANGER" and (not party) then		--To keep scouts from pulling mobs without meaning to.
			if (not LockedOn) or (not enemy) then
				TargetNearestEnemy()
						g_lastaction = ""
					StopDIYCETimer("LBBleed")
					StopDIYCETimer("SSBleed")
				return
			end
		elseif mainClass ~= "RANGER" then					--Let all other classes auto target.
			if (not LockedOn) or (not enemy) then
				TargetNearestEnemy()
						g_lastaction = ""
				    StopDIYCETimer("LBBleed")
					StopDIYCETimer("SSBleed")
				return
			end
		end
	end
end