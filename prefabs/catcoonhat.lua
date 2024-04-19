local TUNING = GLOBAL.TUNING

AddPrefabPostInit("catcoonhat", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.fueled:InitializeFuelLevel(TUNING.CATCOONHAT_PERISHTIME+(TUNING.CATCOONHAT_PERISHTIME/2))
        inst.components.insulator:SetInsulation(TUNING.INSULATION_MED)
    end
end)