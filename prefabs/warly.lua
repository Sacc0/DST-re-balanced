GLOBAL.TUNING.WARLY_SAME_OLD_COOLDOWN = 1200

AddPrefabPostInit("warly", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.eater:SetAbsorptionModifiers(1.15, 1.15, 1.15)
    end
end)
