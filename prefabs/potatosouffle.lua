AddPrefabPostInit("potatosouffle", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.edible.healthvalue = 50
        inst.components.edible.hungervalue = 62.5
        inst.components.edible.sanityvalue = 10
    end
end)