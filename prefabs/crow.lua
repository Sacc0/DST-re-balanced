local prefabs =
{
    "feather_crow",
    "smallmeat"
}

AddPrefabPostInit("crow", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.lootdropper:SetLoot({"feather_crow"})
        inst.components.lootdropper:AddRandomLoot("smallmeat", 1)
        inst.components.lootdropper:AddRandomLoot("feather_crow", 1)
        inst.components.lootdropper.numrandomloot = 1

    end
end)