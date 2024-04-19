AddPrefabPostInit("flowersalad", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.edible.healthvalue = 60
    end
end)