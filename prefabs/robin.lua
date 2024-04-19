local prefabs =
{
    "feather_robin",
    "smallmeat"
}

AddPrefabPostInit("robin", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.lootdropper:SetLoot({"feather_robin"})
        inst.components.lootdropper:AddRandomLoot("smallmeat", 1)
        inst.components.lootdropper:AddRandomLoot("feather_robin", 1)
        inst.components.lootdropper.numrandomloot = 1

    end
end)