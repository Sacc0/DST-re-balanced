GLOBAL.TUNING.OLDAGE_HEALTH_SCALE = 60 / 120
GLOBAL.TUNING.POCKETWATCH_SHADOW_DAMAGE = 75
GLOBAL.TUNING.WANDA_HUNGER = 150
GLOBAL.TUNING.POCKETWATCH_HEAL_HEALING = 16

local function onhealthchange(inst, data)
    local speedyboost = 1
    if inst.components.health:GetPercent()>0.25 then
        speedyboost = 1
    end
    if inst.components.health:GetPercent()<0.25 then
        speedyboost = 0.916

    end
    inst.components.locomotor.runspeed = GLOBAL.TUNING.WILSON_RUN_SPEED * speedyboost
end

    AddPrefabPostInit("wanda", function(inst)
        if GLOBAL.TheWorld.ismastersim then
            inst:ListenForEvent("healthdelta", onhealthchange)
        end
    end)