local prefabs =
{
    "feather_robin_winter",
    "smallmeat"
}

AddPrefabPostInit("robin_winter", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.lootdropper:SetLoot({"feather_robin_winter"})
        inst.components.lootdropper:AddRandomLoot("smallmeat", 1)
        inst.components.lootdropper:AddRandomLoot("feather_robin_winter", 1)
        inst.components.lootdropper.numrandomloot = 1

    end
end)