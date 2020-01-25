function abi()
	--Kierunek = 490342
	--"Sys490342_name" = "Kierunek"
	local Skill = {}
	local i = 0
	local mana = UnitMana("player")
	local rage = UnitSkill("player")
	local tDead = UnitIsDeadOrGhost("target")
	--i=i+1; Skill[i] = {name = "ID: 497759" , use = not tDead}
	i=i+1; Skill[i] = {name = "ID: 497759" , use = (ChkBuff("player","Tryb Demontażu")) and mana >= 10 }
	--i=i+1; Skill[i] = {name = "ID: 490342" , use = not tDEAD}--"Kierunek otchlani"
	i=i+1; Skill[i] = {name = "Atak" , use = not tDead}

	   MyCombat(Skill,arg1)
   
   if (tDead) then
        TargetUnit("")
        return
    end
end
