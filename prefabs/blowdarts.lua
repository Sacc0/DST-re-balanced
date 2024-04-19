AddPrefabPostInit("blowdart_fire", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.weapon:SetDamage(50)
    end
end)

AddPrefabPostInit("blowdart_sleep", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.weapon:SetDamage(25)
    end
end)