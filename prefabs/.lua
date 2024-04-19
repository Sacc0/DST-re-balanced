local prefabs =
{
    "livinglog",
    "monstermeat",
    "feather_crow",
    "bird_egg",
    "feather_robin",
    "feather_robin_winter",
    "plantmeat"
}

AddPrefabPostInit("leif", function(inst)
    if GLOBAL.TheWorld.ismastersim then
inst:AddComponent("lootdropper")
inst.components.lootdropper:SetLoot({"livinglog", "livinglog", "livinglog"})    
    inst.components.lootdropper:AddRandomLoot("feather_crow", 1)
    inst.components.lootdropper:AddRandomLoot("bird_egg", 1)
    inst.components.lootdropper:AddRandomLoot("feather_robin", 1)
    inst.components.lootdropper:AddRandomLoot("feather_robin_winter", 1)
    inst.components.lootdropper:AddRandomLoot("plantmeat", 2)
    inst.components.lootdropper:AddRandomLoot("livinglog", 0.8)
        inst.components.lootdropper.numrandomloot = 2
        
    end
end)

