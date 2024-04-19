local prefabs =
{
    "log",
    "mosquito",
    "twigs",
}

AddPrefabPostInit("marsh_tree", function(inst)
    if GLOBAL.TheWorld.ismastersim then
inst.components.lootdropper:SetLoot({"twigs"})    
    inst.components.lootdropper:AddRandomLoot("log", 3)
    inst.components.lootdropper:AddRandomLoot("twigs", 5)
    inst.components.lootdropper:AddRandomLoot("mosquito", 2)
        inst.components.lootdropper.numrandomloot = 1
        
    end
end)
