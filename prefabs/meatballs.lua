
AddPrefabPostInit("meatballs", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.edible.hungervalue = 50
    end
end)