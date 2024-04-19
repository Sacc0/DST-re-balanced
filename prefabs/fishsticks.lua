AddPrefabPostInit("fishsticks", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.edible.healthvalue = 20
    end
end)