local function new_onequip_blue(inst, owner)
    owner.AnimState:OverrideSymbol("swap_body", "torso_amulets", "blueamulet")

    inst.combatfreezing = function(attacker, data)
        if data.target and data.target.components.freezable then
            data.target.components.freezable:AddColdness(0.5)
            inst.components.fueled:DoDelta(-0.02 * inst.components.fueled.maxfuel) --lose 2% durability per hit
            data.target.components.freezable:SpawnShatterFX()
        end
    end

    inst:ListenForEvent("onhitother", inst.combatfreezing, owner)

    if inst.components.fueled then
        inst.components.fueled:StartConsuming()
    end

end

local function new_onunequip_blue(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_body")

    inst:RemoveEventCallback("onhitother", inst.combatfreezing, owner)

    if inst.components.fueled then
        inst.components.fueled:StopConsuming()
    end
end

AddPrefabPostInit("blueamulet", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.equippable:SetOnEquip(new_onequip_blue)
        inst.components.equippable:SetOnUnequip(new_onunequip_blue)
        inst.components.fueled:InitializeFuelLevel(GLOBAL.TUNING.TOTAL_DAY_TIME)
    end
end)