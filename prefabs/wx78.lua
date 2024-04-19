GLOBAL.TUNING.WX78_HEALTH = 120
GLOBAL.TUNING.WX78_HUNGER = 120
GLOBAL.TUNING.WX78_SANITY = 120

GLOBAL.TUNING.WX78_BEE_TICKPERIOD = 20
GLOBAL.TUNING.WX78_MINACCEPTABLEMOISTURE = 10
GLOBAL.TUNING.WX78_MIN_MOISTURE_DAMAGE = -1
GLOBAL.TUNING.WX78_TASERDAMAGE = 34
GLOBAL.TUNING.WX78_LIGHT_BASERADIUS = 4.5
GLOBAL.TUNING.WX78_LIGHT_EXTRARADIUS = 2


AddPrefabPostInit("wx78module_bee", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst:AddComponent("finiteuses")
        inst.components.finiteuses:SetMaxUses(8)
        inst.components.finiteuses:SetUses(8)
        inst.components.finiteuses:SetOnFinished(inst.Remove)

        return inst
    end
end)

AddPrefabPostInit("wx78module_maxhealth2", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.finiteuses:SetMaxUses(6)
        inst.components.finiteuses:SetUses(6)
        inst.components.finiteuses:SetOnFinished(inst.Remove)

        return inst
    end
end)

AddPrefabPostInit("wx78module_maxsanity", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.finiteuses:SetMaxUses(6)
        inst.components.finiteuses:SetUses(6)
        inst.components.finiteuses:SetOnFinished(inst.Remove)

        return inst
    end
end)

AddPrefabPostInit("wx78module_maxhunger", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.finiteuses:SetMaxUses(6)
        inst.components.finiteuses:SetUses(6)
        inst.components.finiteuses:SetOnFinished(inst.Remove)

        return inst
    end
end)

AddPrefabPostInit("wx78module_movespeed", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.finiteuses:SetMaxUses(2)
        inst.components.finiteuses:SetUses(2)
        inst.components.finiteuses:SetOnFinished(inst.Remove)

        return inst
    end
end)

AddPrefabPostInit("wx78module_movespeed2", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.finiteuses:SetMaxUses(3)
        inst.components.finiteuses:SetUses(3)
        inst.components.finiteuses:SetOnFinished(inst.Remove)

        return inst
    end
end)

AddPrefabPostInit("wx78module_taser", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.finiteuses:SetMaxUses(3)
        inst.components.finiteuses:SetUses(3)
        inst.components.finiteuses:SetOnFinished(inst.Remove)

        return inst
    end
end)

AddPrefabPostInit("wx78module_light", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.finiteuses:SetMaxUses(6)
        inst.components.finiteuses:SetUses(6)
        inst.components.finiteuses:SetOnFinished(inst.Remove)

        return inst
    end
end)
