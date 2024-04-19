AddPrefabPostInit("stuffedeggplant", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.edible.healthvalue = 30
        inst.components.edible.hungervalue = 56.25
    end
end)