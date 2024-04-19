AddPrefabPostInit("asparagussoup", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.edible.healthvalue = 30
        inst.components.edible.hungervalue = 25
        inst.components.edible.sanityvalue = 10
    end
end)