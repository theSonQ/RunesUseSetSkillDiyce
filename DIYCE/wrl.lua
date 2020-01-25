function wrl()
local Skill = {}
	local i = 0
	local focus = UnitMana("player")
	local rage = UnitSkill("player")
	local tDead = UnitIsDeadOrGhost("target")
	local PsiPoints, PsiStatus = GetSoulPoint()
	local pctEB1 = PctM("player")--
    local pctEB2 = PctS("player")--
	--i=i+1; Skill[i] = {name = "Ostrze Siły Woli", use = (PsiPoints == 6)}--sprawdzic
	--i=i+1; Skill[i] = {name = "Pocięta Świadomość", use = ((PsiPoints >= 2) and ((pctEB2 >= .05)) and ChkBuff("player","Ostrze Siły Woli"))}--sprawdzic
	--i=i+1; Skill[i] = {name = "Klątwa Osłabienia", use = ((focus >= 20) and (not ChkBuff("target","Osłabiono")) )}
	i=i+1; Skill[i] = {name = "Porażenie Prądem", use = ((rage >= 20) and (not ChkBuff("target","Porażenie Prądem")))}
	i=i+1; Skill[i] = {name = "Szarża Wypaczenia", use = ((focus >= 30) and (ChkBuff("target","Osłabiono")) and (not ChkBuff("player","Szarża Wypaczenia"))) }
	--i=i+1; Skill[i] = {name = "Zakłopotanie", use = ((focus >= 20) and (ChkBuff("target","Osłabiono")))}
	i=i+1; Skill[i] = {name = "Cios Skradania Serc", use = (focus < 81)}
	--i=i+1; Skill[i] = {name = "Porażenie Prądem", use = ((rage >= 20) and (not ChkBuff("target","Porażenie Prądem")))}
	i=i+1; Skill[i] = {name = "Uderzenia Przypływu Energii", use = ((rage >= 30) and (ChkBuff("target","Porażenie Prądem")))}
	i=i+1; Skill[i] = {name = "Psychiczne Strzały", use = not tDead}
	
	   MyCombat(Skill,arg1)
   
   if (tDead) then
        TargetUnit("")
        return
    end
	
end

function pocieta()
local Skill = {}
	local i = 0
	local focus = UnitMana("player")
	local rage = UnitSkill("player")
	local tDead = UnitIsDeadOrGhost("target")
	local PsiPoints, PsiStatus = GetSoulPoint()
	local pctEB1 = PctM("player")--
    local pctEB2 = PctS("player")--
	i=i+1; Skill[i] = {name = "Sublimacja Szału", use = (PsiPoints < 6) and (rage == 100)}--sprawdzic
	i=i+1; Skill[i] = {name = "Ostrze Siły Woli", use = (PsiPoints == 6)}--sprawdzic
	i=i+1; Skill[i] = {name = "Pocięta Świadomość", use = ((PsiPoints >= 2) and ((pctEB2 >= .05)) and ChkBuff("player","Ostrze Siły Woli"))}--sprawdzic
	
	   MyCombat(Skill,arg1)
   
   if (tDead) then
        TargetUnit("")
        return
    end
	
end

function wrlmage()
local Skill = {}
	local i = 0
	local focus = UnitMana("player")
	local rage = UnitSkill("player")
	local tDead = UnitIsDeadOrGhost("target")
	local PsiPoints, PsiStatus = GetSoulPoint()
	local pctEB1 = PctM("player")--chyba psi
    local pctEB2 = PctS("player")--chyba po uzyciu konstr lub ostrza
	i=i+1; Skill[i] = {name = "Ognista Ochrona", use = not ChkBuff("player","Płonąca Bariera")}--sprawdzic
	i=i+1; Skill[i] = {name = "Ostrze Siły Woli", use = (PsiPoints == 6)}--sprawdzic
	i=i+1; Skill[i] = {name = "Cios Płonącego Serca", use = not tDead }
	i=i+1; Skill[i] = {name = "Ciąg Znamienia Duszy", use = ((PsiPoints >= 1) and ((pctEB2 >= .05)) and ChkBuff("player","Ostrze Siły Woli"))}
	--i=i+1; Skill[i] = {name = "Klątwa Osłabienia", use = ((focus >= 20) and (not ChkBuff("target","Osłabiono")) )}
	i=i+1; Skill[i] = {name = "Szarża Wypaczenia", use = ((focus >= 30) and (ChkBuff("target","Osłabiono")) and (not ChkBuff("player","Szarża Wypaczenia"))) }
	--i=i+1; Skill[i] = {name = "Zakłopotanie", use = ((focus >= 20) and (ChkBuff("target","Osłabiono")))}
	i=i+1; Skill[i] = {name = "Cios Skradania Serc", use = (focus < 81)}
	i=i+1; Skill[i] = {name = "Kula Ognia", use = not tDead}
	i=i+1; Skill[i] = {name = "Psychiczne Strzały", use = not tDead}
	
	   MyCombat(Skill,arg1)
   
   if (tDead) then
        TargetUnit("")
        return
    end
	
end