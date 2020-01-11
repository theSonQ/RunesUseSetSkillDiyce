for x,tbl in ipairs(Skill) do
		if Skill[x].use then
			if string.find(Skill[x].name, "Action:") then
				action = tonumber((string.gsub(Skill[x].name, "(Action:)( *)(%d+)(.*)", "%3")))
				_1,actioncd = GetActionCooldown(action)
				actiondef,_1,actioncnt = GetActionInfo(action)
				if GetActionUsable(action) and (actioncd == 0) and (actiondef ~= nil) and (actioncnt > 0) then
					if talktome then Msg("- "..Skill[x].name) end
					UseAction(action)
					return true
				end
			elseif string.find(Skill[x].name, "Custom:") then
				action = string.gsub(Skill[x].name, "(Custom:)( *)(.*)", "%3")
				if CustomAction(action) then
					return true
				end
			elseif string.find(Skill[x].name, "Item:") then
				action = string.gsub(Skill[x].name, "(Item:)( *)(.*)", "%3")
				if talktome then Msg("- "..Skill[x].name) end
				UseItemByName(action)
				return true
			elseif CD(Skill[x].name) then
				if talktome then Msg("- "..Skill[x].name) end
				CastSpellByName(Skill[x].name)
				return true
			elseif string.find(Skill[x].name, "ID: ") then                           --dopisane
				action = string.gsub(Skill[x].name,"(ID:)( *)(.*)", "Sys%3_name")      --dopisane
				CastSpellByName(TEXT(action))                                          --dopisane
			end
		end
	end
