AddPrefabPostInit("fishtacos", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.edible.healthvalue = 40
    end
end)