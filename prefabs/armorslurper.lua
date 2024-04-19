AddPrefabPostInit("armorslurper", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst:AddComponent("armor")
        inst.components.armor:InitCondition(GLOBAL.TUNING.ARMORSLURPER, GLOBAL.TUNING.ARMORGRASS_ABSORPTION)
    end
end)
