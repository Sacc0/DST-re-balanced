AddPrefabPostInit("beefalohat", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.insulator:SetInsulation(GLOBAL.TUNING.INSULATION_MED)
    end
end)
