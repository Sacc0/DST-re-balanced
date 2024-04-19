local function CLIENT_Wortox_HostileTest(inst, target)
	if target.HostileToPlayerTest ~= nil then
		return target:HostileToPlayerTest(inst)
	end
    return (target:HasTag("hostile") or target:HasTag("pig") or target:HasTag("catcoon"))
    and not target:HasTag("krampus")
        end