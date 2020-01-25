function odpalki()
local Skill = {}
   local i = 0
   local energy = UnitMana("player")
   local behind = (not UnitIsUnit("player", "targettarget"))
   local LockedOn = UnitExists("target")
   local enemy = UnitCanAttack("player","target")
   local raid = GetNumRaidMembers() >= 1
   local tDeadrajd1 = UnitIsDeadOrGhost("raid1target")
   local tDead = UnitIsDeadOrGhost("target")
   
   i=i+1; Skill[i] = { name = "Action: 38 (Wyjątkowa Kanapka z Kawiorem Przyrządzona przez Pomoc Domową)", use = (not(ChkBuff("player","Kanapka z Kawiorem")))}
   i=i+1; Skill[i] = { name = "Informator", use = (energy > 1)}
   i=i+1; Skill[i] = { name = "Action: 17 (Nieznany Wybór)", use = (energy > 20)}
   i=i+1; Skill[i] = { name = "Action: 16 (Eliksir Wymierania)", use = (energy > 1)}
   i=i+1; Skill[i] = { name = "Action: 15 (Silny Stymulant)", use = (energy > 1)}
   i=i+1; Skill[i] = { name = "Szał Zabójcy", use = (energy > 1)}

   
   MyCombat(Skill,arg1)
   
end


function rsthief()
   local Skill = {}
   local i = 0
   local energy = UnitMana("player")
   local behind = (not UnitIsUnit("player", "targettarget"))
   local LockedOn = UnitExists("target")
   local enemy = UnitCanAttack("player","target")
   local raid = GetNumRaidMembers() >= 1
   local tDeadrajd1 = UnitIsDeadOrGhost("raid1target")
   local tDead = UnitIsDeadOrGhost("target")
   
   
   i=i+1; Skill[i] = { name = "Cios w Ranę", use = (ChkBuff("target","Krwawienie") and (ChkBuff("target","Poważna Rana")) and (energy > 34))}
   i=i+1; Skill[i] = { name = "Cieniste Pchnięcie", use = ((not ChkBuff("target","Krwawienie")) and (energy > 20)) }
   i=i+1; Skill[i] = { name = "Cios Poniżej Pasa", use = (energy > 35)}
   i=i+1; Skill[i] = { name = "Złodziej Energii", use = (energy < 36)}
   i=i+1; Skill[i] = { name = "Atak", use = (energy<36) and (not tDead) }
  

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


function rmage()
   local Skill = {}
   local i = 0
   local energy = UnitMana("player")
   local behind = (not UnitIsUnit("player", "targettarget"))
   local LockedOn = UnitExists("target")
   local enemy = UnitCanAttack("player","target")
   local raid = GetNumRaidMembers() >= 1
   local tDeadrajd1 = UnitIsDeadOrGhost("raid1target")
   local tDead = UnitIsDeadOrGhost("target")
   
   i=i+1; Skill[i] = { name = "Cios w Ranę", use = (ChkBuff("player","Premedytacja") and ChkBuff("target","Krwawienie") and (ChkBuff("target","Poważna Rana")) and (energy > 34))}
   i=i+1; Skill[i] = { name = "Cios w Ranę", use = (ChkBuff("target","Krwawienie") and (ChkBuff("target","Poważna Rana")) and (energy > 34))}
   i=i+1; Skill[i] = { name = "Cieniste Pchnięcie", use = ((not ChkBuff("target","Krwawienie")) and (energy > 70)) }
   i=i+1; Skill[i] = { name = "Cios Poniżej Pasa", use = ((not ChkBuff("target","Poważna Rana")) and (energy > 65))}
   i=i+1; Skill[i] = { name = "Cios Poniżej Pasa", use = (energy > 85)}
   i=i+1; Skill[i] = { name = "Atak", use = (energy<36) and (not tDead) }
  

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

function rmage2()
   local Skill = {}
   local i = 0
   local energy = UnitMana("player")
   local behind = (not UnitIsUnit("player", "targettarget"))
   local LockedOn = UnitExists("target")
   local enemy = UnitCanAttack("player","target")
   local raid = GetNumRaidMembers() >= 1
   local tDeadrajd1 = UnitIsDeadOrGhost("raid1target")
   local tDead = UnitIsDeadOrGhost("target")
   
   i=i+1; Skill[i] = { name = "Cios w Ranę", use = (ChkBuff("player","Premedytacja") and ChkBuff("target","Krwawienie") and (ChkBuff("target","Poważna Rana")) and (energy > 34))}
   i=i+1; Skill[i] = { name = "Cios w Ranę", use = (ChkBuff("target","Krwawienie") and (ChkBuff("target","Poważna Rana")) and (energy > 34))}
   i=i+1; Skill[i] = { name = "Cieniste Pchnięcie", use = ((not ChkBuff("target","Krwawienie")) and (energy > 70)) }
   i=i+1; Skill[i] = { name = "Cios Poniżej Pasa", use = ((not ChkBuff("target","Poważna Rana")) and (energy > 65))}
   i=i+1; Skill[i] = { name = "Cios Poniżej Pasa", use = (energy > 85)}
   i=i+1; Skill[i] = { name = "Rzut", use = (not tDead)}
   i=i+1; Skill[i] = { name = "Podwójny Rzut", use = (not tDead)}
   i=i+1; Skill[i] = { name = "Atak", use = (energy<36) and (not tDead) }
  

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

function rslast()
   local Skill = {}
   local i = 0
   local energy = UnitMana("player")
   local behind = (not UnitIsUnit("player", "targettarget"))
   local LockedOn = UnitExists("target")
   local enemy = UnitCanAttack("player","target")
   local raid = GetNumRaidMembers() >= 1
   local tDeadrajd1 = UnitIsDeadOrGhost("raid1target")
   local tDead = UnitIsDeadOrGhost("target")
   
   
   i=i+1; Skill[i] = { name = "Cios w Ranę", use = (ChkBuff("target","Krwawienie") and (ChkBuff("target","Poważna Rana")) and (energy > 34))}
   
 

   MyCombat(Skill,arg1)
   
   
end

function Zwiad(arg2)
	local Skill = {}  
    local i = 0
	local AS_slot = arg2
	local boss = UnitSex("target") > 2
	local enemy = UnitCanAttack("player","target")
	local tbuffs = BuffList("target")
	local focus = UnitMana("player")
    local energy = UnitSkill("player")
	local a1,a2,a3,a4,a5,ASon = GetActionInfo(AS_slot)
	local tDead = UnitIsDeadOrGhost("target")
	local LockedOn = UnitExists("target")
	local raid = GetNumRaidMembers() >= 1
    local tDeadrajd1 = UnitIsDeadOrGhost("raid1target")
	
	mainClass, subClass = UnitClassToken( "player" )

	if mainClass == "RANGER" and subClass == "THIEF" then
                
            --Combat
		Skill ={
	{ name = "Przebijająca Strzała", 		use = (enemy and (not boss)) },
	{ name = "Odbity Strzał",	        		use = (enemy and (not boss)) },	
	{ name = "Automatyczny Strzał",              use = (enemy and (not ASon) and (not boss)) },
	{ name = "Strzała Osłabiająca",    	use = (enemy and boss and (not ChkBuff("target","Strzała Osłabiająca")) and (energy >= 30))},
	{ name = "Automatyczny Strzał",              use = (enemy and (not ASon)) },  
	{ name = "Słaby Punkt",						use = (enemy and (focus >= 30)) },
	{ name = "Salwa",        							use = enemy },
	{ name = "Wampiryczne Strzały", 				use = (enemy and (focus >= 20)) },
	{ name = "Zatrute Ukąszenie",      			use = (enemy and ChkBuff("target","Wampiryczne Strzały") and (energy >= 30)) },
	{ name = "Odbity Strzał",	        		use = enemy },
	{ name = "Przebijająca Strzała", 		use = enemy },
	{ name = "Strzał",           				use = enemy },
			}
			
		end
    --End Player Skill Sequences
       
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

function lotrzwiad()
	local Skill = {}
   local i = 0
   local energy = UnitMana("player")
   local behind = (not UnitIsUnit("player", "targettarget"))
   local LockedOn = UnitExists("target")
   local enemy = UnitCanAttack("player","target")
   local raid = GetNumRaidMembers() >= 1
   local tDeadrajd1 = UnitIsDeadOrGhost("raid1target")
   local tDead = UnitIsDeadOrGhost("target")
   local energy = UnitMana("player")
   local focus = UnitSkill("player")
	
	mainClass, subClass = UnitClassToken( "player" )

	if mainClass == "THIEF" and subClass == "RANGER" then
                
            --Combat
		Skill ={
	{ name = "Wampiryczne Strzały", 				use = (enemy and (focus >= 20)) },
	{ name = "Strzał",           				use = enemy },
	{	name = "Cios w Ranę", use = (ChkBuff("target","Krwawienie") and (ChkBuff("target","Poważna Rana")) and (energy > 34))},
    { name = "Cieniste Pchnięcie", use = ((not ChkBuff("target","Krwawienie")) and (energy > 20)) },
   { name = "Cios Poniżej Pasa", use = (energy > 35)},
			}
			
		end
    --End Player Skill Sequences
       
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

function Zwiadwoj(arg2)
	local Skill = {}  
    local i = 0
	local AS_slot = arg2
	local boss = UnitSex("target") > 2
	local enemy = UnitCanAttack("player","target")
	local tbuffs = BuffList("target")
	local focus = UnitMana("player")
    local rage = UnitSkill("player")
	local a1,a2,a3,a4,a5,ASon = GetActionInfo(AS_slot)
	local tDead = UnitIsDeadOrGhost("target")
	local LockedOn = UnitExists("target")
	local raid = GetNumRaidMembers() >= 1
    local tDeadrajd1 = UnitIsDeadOrGhost("raid1target")
	
	mainClass, subClass = UnitClassToken( "player" )

	if mainClass == "RANGER" and subClass == "WARRIOR" then
                
            --Combat
		Skill ={
	{ name = "Salwa", 		use = (enemy and (not boss)) },
	{ name = "Przebijająca Strzała", 		use = (enemy and (not boss)) },
	{ name = "Odbity Strzał",	        		use = (enemy and (not boss)) },	
	{ name = "Automatyczny Strzał",              use = (enemy and (not ASon) and (not boss)) },
	{ name = "Strzał", 		use = (enemy and (not boss)) },
	{ name = "Ustalenie Celu",    	use = (enemy and (not tbuffs[502920]) and (focus >= 30))},
	{ name = "Automatyczny Strzał",              use = (enemy and (not ASon)) },  
	{ name = "Salwa",        							use = enemy },
	{ name = "Strzał",           				use = enemy },
	{ name = "Odbity Strzał",	        		use = enemy },
	{ name = "Przebijająca Strzała", 		use = enemy },
	{ name = "Wampiryczne Strzały", 				use = (enemy and (focus >= 20)) },
	{ name = "Skupienie Umysłu", 				use = (enemy and (rage >= 30)) },
			}
			
		end
    --End Player Skill Sequences
       
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

function Zwiad2(arg2)
	local Skill = {}  
    local i = 0
	local AS_slot = arg2
	local boss = UnitSex("target") > 2
	local enemy = UnitCanAttack("player","target")
	local tbuffs = BuffList("target")
	local focus = UnitMana("player")
    local energy = UnitSkill("player")
	local a1,a2,a3,a4,a5,ASon = GetActionInfo(AS_slot)
	local tDead = UnitIsDeadOrGhost("target")
	local LockedOn = UnitExists("target")
	local raid = GetNumRaidMembers() >= 1
    local tDeadrajd1 = UnitIsDeadOrGhost("raid1target")
	
	mainClass, subClass = UnitClassToken( "player" )

	if mainClass == "RANGER" and subClass == "THIEF" then
                
            --Combat
		Skill ={
	{ name = "Automatyczny Strzał",              use = (enemy and (not ASon)) },  
	{ name = "Przebijająca Strzała", 		use = (enemy and (not boss)) },
	{ name = "Odbity Strzał",	        		use = (enemy and (not boss)) },	
	{ name = "Salwa",        							use = enemy },
	{ name = "Słaby Punkt",						use = (enemy and (focus >= 30)) },
	{ name = "Wampiryczne Strzały", 				use = (enemy and (focus >= 20)) },
	{ name = "Zatrute Ukąszenie",      			use = (enemy and ChkBuff("target","Wampiryczne Strzały") and (energy >= 30)) },
	{ name = "Strzał",           				use = enemy },
			}
			
		end
    --End Player Skill Sequences
       
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

function Zwiad3(arg2)
	local Skill = {}  
    local i = 0
	local AS_slot = arg2
	local boss = UnitSex("target") > 2
	local enemy = UnitCanAttack("player","target")
	local tbuffs = BuffList("target")
	local focus = UnitMana("player")
    local energy = UnitSkill("player")
	local a1,a2,a3,a4,a5,ASon = GetActionInfo(AS_slot)
	local tDead = UnitIsDeadOrGhost("target")
	local LockedOn = UnitExists("target")
	local raid = GetNumRaidMembers() >= 1
    local tDeadrajd1 = UnitIsDeadOrGhost("raid1target")
	
	mainClass, subClass = UnitClassToken( "player" )

	if mainClass == "RANGER" and subClass == "THIEF" then
                
            --Combat
		Skill ={
	{ name = "Automatyczny Strzał",              use = (enemy and (not ASon)) },  
	{ name = "Salwa",        							use = enemy },
	{ name = "Wampiryczne Strzały", 				use = (enemy and (focus >= 20)) },
	{ name = "Zatrute Ukąszenie",      			use = (enemy and ChkBuff("target","Wampiryczne Strzały") and (energy >= 30)) },
	{ name = "Przebijająca Strzała", 		use = (enemy and (not boss)) },
	{ name = "Odbity Strzał",	        		use = (enemy and (not boss)) },	
	{ name = "Strzał",           				use = enemy },
			}
			
		end
    --End Player Skill Sequences
       
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
	
function rsthief1()
   local Skill = {}
   local i = 0
   local energy = UnitMana("player")
   local focus = UnitSkill("player")
   local behind = (not UnitIsUnit("player", "targettarget"))
   local LockedOn = UnitExists("target")
   local enemy = UnitCanAttack("player","target")
   local raid = GetNumRaidMembers() >= 1
   local tDeadrajd1 = UnitIsDeadOrGhost("raid1target")
   local tDead = UnitIsDeadOrGhost("target")
   
   
   
   i=i+1; Skill[i] = { name = "Cios w Ranę", use = (ChkBuff("target","Krwawienie") and (ChkBuff("target","Poważna Rana")) and (energy > 34))}
   i=i+1; Skill[i] = { name = "Cieniste Pchnięcie", use = ((not ChkBuff("target","Krwawienie")) and (energy > 20)) }
   i=i+1; Skill[i] = { name = "Cios Poniżej Pasa", use = (energy > 35)}
   i=i+1; Skill[i] = { name = "Wampiryczne Strzały", use = (energy<36) }
   i=i+1; Skill[i] = { name = "Strzał", use = (energy<36) }
   i=i+1; Skill[i] = { name = "Atak", use = (energy<36) and (not tDead) }

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

function rkthief()
   local Skill = {}
   local i = 0
   local energy = UnitMana("player")
   local mana = UnitSkill("player")
   local behind = (not UnitIsUnit("player", "targettarget"))
   local LockedOn = UnitExists("target")
   local enemy = UnitCanAttack("player","target")
   local raid = GetNumRaidMembers() >= 1
   local tDeadrajd1 = UnitIsDeadOrGhost("raid1target")
   local tDead = UnitIsDeadOrGhost("target")
   
   
   i=i+1; Skill[i] = { name = "Cios w Ranę", use = (ChkBuff("target","Krwawienie") and (ChkBuff("target","Poważna Rana")) and (energy > 34))}
   i=i+1; Skill[i] = { name = "Cieniste Pchnięcie", use = ((not ChkBuff("target","Krwawienie")) and (energy > 20)) }
   i=i+1; Skill[i] = { name = "Cios Poniżej Pasa", use = (energy > 29)}
   i=i+1; Skill[i] = { name = "Osłabiebie Pancerza", use = (energy < 20) and (mana > 20)}
   i=i+1; Skill[i] = { name = "Święty Cios", use = (energy < 20) and (mana > 120)}
   i=i+1; Skill[i] = { name = "Atak", use = (energy<25) and (not tDead) }
  

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


function woj()   
   	local Skill = {}  
    local i = 0
	local rage = UnitMana("player")
	local focus = UnitSkill("player")
	local behind = (not UnitIsUnit("player", "targettarget"))
	local LockedOn = UnitExists("target")
	local tbuffs = BuffList("target")
	local enemy = UnitCanAttack("player","target")
	local a1,a2,a3,a4,a5,ASon = GetActionInfo(AS_slot)
	local raid = GetNumRaidMembers() >= 1
	local tDeadrajd1 = UnitIsDeadOrGhost("raid1target")
    local tDead = UnitIsDeadOrGhost("target")

   i=i+1; Skill[i] = { name = "Próbny Atak", 		 use = ((not ChkBuff("target","Wrażliwość")) and (rage > 20 ))}
   i=i+1; Skill[i] = { name = "Odsłonięta Flanka",	 use = (ChkBuff("target","Wrażliwość") and (energy > 10)) }
   i=i+1; Skill[i] = { name = "Cięcie", 			 use = ((not ChkBuff("target","Krwawienie")) and (rage > 25 ))}
   i=i+1; Skill[i] = { name = "Atak Taktyczny",		 use = (ChkBuff("target","Krwawienie") and (energy > 15))}
   i=i+1; Skill[i] = { name = "Łamacz Czaszek",		 use = (focus > 30)} --30fokusu
   i=i+1; Skill[i] = { name = "Ostatnia Bitwa",  	 use = (rage >= 25) and PctH("target") < 29}
   i=i+1; Skill[i] = { name = "Atak",				 use = (focus < 25) and (rage < 15) and (not tDead)}
  --i=i+1; Skill[i] = { name = "Rana na Cel",   		 use = (focus > 80) and (not boss)} -- 30 fokusu

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
   