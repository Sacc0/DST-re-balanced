local function OnAttackOther(inst, data)
    if data.target ~= nil and data.target.components.curse ~= nil then
        data.target.components.curse:ApplyCurse(5)
    end
end

AddPrefabPostInit("shadow_knight", function(inst)
    if not GLOBAL.TheWorld.ismastersim then
        return
    end
    inst:ListenForEvent("onattackother", OnAttackOther)
end)
