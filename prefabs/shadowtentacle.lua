local function OnAttackOther(inst, data)
    if data.target ~= nil and data.target.components.curse ~= nil then
        data.target.components.curse:ApplyCurse(8)
    end
end

AddPrefabPostInit("bigshadowtentacle", function(inst)
    if not GLOBAL.TheWorld.ismastersim then
        return
    end
    inst:ListenForEvent("onattackother", OnAttackOther)
end)

