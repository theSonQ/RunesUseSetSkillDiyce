function ch()
	local Skill = {}
	local i = 0
	local rage = UnitMana("player")
	local energy = UnitSkill("player")
	local tDead = UnitIsDeadOrGhost("target")
	local thealth = PctH("target")
	local LockedOn = UnitExists("target")
	local LockedOn = UnitExists("target")
	local tDeadrajd1 = UnitIsDeadOrGhost("raid1target")
	local enemy = UnitCanAttack("player","target")
	i=i+1; Skill[i] = { name = "Kuźnia", use = (not ChkBuff("player","Kuźnia")) }
	i=i+1; Skill[i] = { name = "Wzrost Runiczny", use = not ChkBuff("player","Runa Ochrony Sprzętu") or not ChkBuff("player","Runa Zwiększenia Ataku")}
	i=i+1; Skill[i] = { name = "Runiczny Puls", use = ChkBuff("player","Napęd Łańcuchowy") }
	i=i+1; Skill[i] = {name = "ID: 497759" , use = (ChkBuff("player","Tryb Demontażu")) and rage >= 10 }
	--i=i+1; Skill[i] = {name = "ID: 497759" , use = (ChkBuff("player","Tryb Demontażu")) and rage >= 10 }
	i=i+1; Skill[i] = { name = "Rzut", use = not tDead}
	i=i+1; Skill[i] = { name = "Nieustraszone Ciosy", use = (thealth < .45) }
	i=i+1; Skill[i] = { name = "Cieniste Pchnięcie", use = energy >= 20 }
	i=i+1; Skill[i] = { name = "Atak", use = not tDead }
	
	MyCombat(Skill,arg1)
   
   if (tDead) then
        TargetUnit("")
        return
    end
	
	  if (not LockedOn) or (not enemy) then
			if (raid) and (not tDeadrajd1) and enemy then
				TargetUnit("raid1target")
				return
			else
				TargetNearestEnemy()
				return
			end	
        end
end

function chmage()
local Skill = {}
	local i = 0
	local rage = UnitMana("player")
	local energy = UnitSkill("player")
	local tDead = UnitIsDeadOrGhost("target")
	local thealth = PctH("target")
	local LockedOn = UnitExists("target")
	local enemy = UnitCanAttack("player","target")
	local raid = GetNumRaidMembers() >= 1
	i=i+1; Skill[i] = { name = "Kuźnia", use = (not ChkBuff("player","Kuźnia")) }
	i=i+1; Skill[i] = { name = "Wzrost Runiczny", use = not ChkBuff("player","Runa Ochrony Sprzętu") or not ChkBuff("player","Runa Zwiększenia Ataku")}
	i=i+1; Skill[i] = { name = "Runiczny Puls", use = ChkBuff("player","Napęd Łańcuchowy") }
	i=i+1; Skill[i] = { name = "Porażenie Prądem", use = rage >= 20 and not ChkBuff("target","Porażenie Prądem")}
	i=i+1; Skill[i] = { name = "Uderzenie Przypływu Energii", use = rage >= 25 and ChkBuff("target","Porażenie Prądem") }
	i=i+1; Skill[i] = { name = "Nieustraszone Ciosy", use = (thealth < .45) }
	i=i+1; Skill[i] = { name = "Gwałtowny Rozrzut", use = not tDead }
	i=i+1; Skill[i] = { name = "Atak", use = not tDead }
	
	
   MyCombat(Skill,arg1)
   
   if (tDead) then
        TargetUnit("")
        return
    end
	
	  if (not LockedOn) or (not enemy) then
			if (raid) and (not tDeadrajd1) and enemy then
				TargetUnit("raid1target")
				return
			else
				TargetNearestEnemy()
				return
			end	
        end
end

function chwar()
	local Skill = {}
	local i = 0
	local rage = UnitMana("player")
	local energy = UnitSkill("player")
	local raid = GetNumRaidMembers() >= 1
	local tDead = UnitIsDeadOrGhost("target")
	local thealth = PctH("target")
	local LockedOn = UnitExists("target")
	local tDeadrajd1 = UnitIsDeadOrGhost("raid1target")
	local enemy = UnitCanAttack("player","target")
	
	i=i+1; Skill[i] = { name = "Kuźnia", use = (not ChkBuff("player","Kuźnia")) }
	i=i+1; Skill[i] = { name = "Wzrost Runiczny", use = not ChkBuff("player","Runa Ochrony Sprzętu") or not ChkBuff("player","Runa Zwiększenia Ataku")}
	i=i+1; Skill[i] = { name = "Runiczny Puls", use = ChkBuff("player","Napęd Łańcuchowy") }
	i=i+1; Skill[i] = { name = "Porażenie Prądem", use = rage >= 20 and not ChkBuff("target","Porażenie Prądem")}
	i=i+1; Skill[i] = { name = "Uderzenie Przypływu Energii", use = rage >= 25 and ChkBuff("target","Porażenie Prądem") }
	i=i+1; Skill[i] = { name = "Nieustraszone Ciosy", use = (thealth < .45) }
	i=i+1; Skill[i] = { name = "Uderzenie Łukowe", use = ChkBuff("target","Porażenie Prądem") and rage >= 5 }
	i=i+1; Skill[i] = { name = "Ulepszone Stłumienie", use = rage >= 20 }
	i=i+1; Skill[i] = { name = "Atak", use = not tDead }
	
	MyCombat(Skill,arg1)
   
   if (tDead) then
        TargetUnit("")
        return
    end
	
	  if (not LockedOn) or (not enemy) then
			if (raid) and (not tDeadrajd1) and enemy then
				TargetUnit("raid1target")
				return
			else
				TargetNearestEnemy()
				return
			end	
        end
end

function chlock()
	local Skill = {}
	local i = 0
	local rage = UnitMana("player")
	local energy = UnitSkill("player")
	local raid = GetNumRaidMembers() >= 1
	local tDead = UnitIsDeadOrGhost("target")
	local thealth = PctH("target")
	local LockedOn = UnitExists("target")
	local tDeadrajd1 = UnitIsDeadOrGhost("raid1target")
	local enemy = UnitCanAttack("player","target")
	
	i=i+1; Skill[i] = { name = "Kuźnia", use = (not ChkBuff("player","Kuźnia")) }
	i=i+1; Skill[i] = { name = "Tajemnica Kuźni Dusz", use = (not ChkBuff("player","Tajemnica Kuźni Dusz")) }
	i=i+1; Skill[i] = { name = "Wzrost Runiczny", use = not ChkBuff("player","Runa Ochrony Sprzętu") or not ChkBuff("player","Runa Zwiększenia Ataku")}
	i=i+1; Skill[i] = { name = "Runiczny Puls", use = ChkBuff("player","Napęd Łańcuchowy") }
	i=i+1; Skill[i] = { name = "Runiczny Syfon", use = (rage >= 10) and (energy >= 20) }
	i=i+1; Skill[i] = { name = "Uderzenie Mrocznej Energii", use = (rage >= 20) }
	i=i+1; Skill[i] = { name = "Szarża Wypaczenia", use = ((energy >= 30) and (not ChkBuff("player","Szarża Wypaczenia"))) }
	i=i+1; Skill[i] = { name = "Nieustraszone Ciosy", use = (thealth < .45) }
	i=i+1; Skill[i] = { name = "Atak", use = not tDead }
	
	MyCombat(Skill,arg1)
   
   if (tDead) then
        TargetUnit("")
        return
    end
	
	  if (not LockedOn) or (not enemy) then
			if (raid) and (not tDeadrajd1) and enemy then
				TargetUnit("raid1target")
				return
			else
				TargetNearestEnemy()
				return
			end	
        end
end