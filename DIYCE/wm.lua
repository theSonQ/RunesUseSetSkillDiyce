function stunwm()
	local Skill = {}
	local i = 0
	local mana = UnitMana("player")
	local rage = UnitSkill("player")
	local tDead = UnitIsDeadOrGhost("target")
	i=i+1; Skill[i] = {name = "Próbny Atak", use = rage >= 20 and not ChkBuff("target","Wrażliwość")}
	i=i+1; Skill[i] = {name = "Odsłonięta Flanka", use = rage >= 10 and ChkBuff("target","Wrażliwość")}
	i=i+1; Skill[i] = {name = "Grom", use = rage >= 15 and ChkBuff("target","Osłabienie")}
	i=i+1; Skill[i] = {name = "Atak" , use = not tDead}

	   MyCombat(Skill,arg1)
   
   if (tDead) then
        TargetUnit("")
        return
    end
end
