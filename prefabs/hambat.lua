AddPrefabPostInit("hambat", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.perishable:SetPerishTime(GLOBAL.TUNING.PERISH_FASTISH)
    end
end)