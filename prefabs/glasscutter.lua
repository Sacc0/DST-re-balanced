AddPrefabPostInit("glasscutter", function(inst)
    if GLOBAL.TheWorld.ismastersim then

        inst:AddComponent("damagetypebonus")
        inst.components.damagetypebonus:AddBonus("shadow_aligned", inst, 1.10294117647058823529411764705882)
    end
end)