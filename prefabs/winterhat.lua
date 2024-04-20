

AddPrefabPostInit("winterhat", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.fueled:InitializeFuelLevel(GLOBAL.TUNING.WINTERHAT_PERISHTIME*2)
        inst.components.insulator:SetInsulation(GLOBAL.TUNING.INSULATION_LARGE)
        inst.components.equippable.dapperness = GLOBAL.TUNING.DAPPERNESS_SMALL
    end
end)
