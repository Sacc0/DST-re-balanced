local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_body", "armor_sweatervest", "swap_body")
    inst.components.fueled:StartConsuming()
    owner:AddComponent("sanityaura")
    owner.components.sanityaura.aura = GLOBAL.TUNING.SANITYAURA_SMALL_TINY
end

local function onunequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_body")
    inst.components.fueled:StopConsuming()
    owner:RemoveComponent("sanityaura")
end

AddPrefabPostInit("sweatervest", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.equippable:SetOnEquip(onequip)
        inst.components.equippable:SetOnUnequip(onunequip)
    end
end)