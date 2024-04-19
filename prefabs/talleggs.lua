AddPrefabPostInit("talleggs", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.edible.healthvalue = 40
        inst.components.edible.hungervalue = 100
    end
end)