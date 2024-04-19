GLOBAL.TUNING.WINONA_SPOTLIGHT_RADIUS = 4
GLOBAL.TUNING.WINONA_SPOTLIGHT_MAX_RANGE = 24
GLOBAL.TUNING.HUNGRY_BUILDER_DELTA = -5
GLOBAL.TUNING.HUNGRY_BUILDER_RESET_TIME = 20
GLOBAL.TUNING.WINONA_HEALTH = 175
GLOBAL.TUNING.WINONA_CATAPULT_ATTACK_PERIOD = 3
GLOBAL.TUNING.WINONA_CATAPULT_HEALTH = 375

local function onhungerchange(inst, data)
    local speedboost = 1
    if inst.components.hunger:GetPercent()>0.67 then
        speedboost = 1.083
    end
    if inst.components.hunger:GetPercent()<0.33 then
        speedboost = 0.916

    end
    inst.components.locomotor.runspeed = GLOBAL.TUNING.WILSON_RUN_SPEED * speedboost

    local efficiencyboost = 1
    if inst.components.hunger:GetPercent()>0.67 then
        efficiencyboost = 0.5
    end
    if inst.components.hunger:GetPercent()<0.33 then
        efficiencyboost = 2
    end
    inst.components.efficientuser:AddMultiplier(GLOBAL.ACTIONS.CHOP,   efficiencyboost, inst)
    inst.components.efficientuser:AddMultiplier(GLOBAL.ACTIONS.MINE,   efficiencyboost, inst)
    inst.components.efficientuser:AddMultiplier(GLOBAL.ACTIONS.HAMMER, efficiencyboost, inst)
    inst.components.efficientuser:AddMultiplier(GLOBAL.ACTIONS.DIG, efficiencyboost, inst)
    inst.components.efficientuser:AddMultiplier(GLOBAL.ACTIONS.TILL, efficiencyboost, inst)
    inst.components.efficientuser:AddMultiplier(GLOBAL.ACTIONS.TERRAFORM, efficiencyboost, inst)
    
    local workboost = 1
    if inst.components.hunger:GetPercent()>0.67 then
        workboost = 1.33
    end
    if inst.components.hunger:GetPercent()<0.33 then
        workboost = 0.75
    end
    inst.components.workmultiplier:AddMultiplier(GLOBAL.ACTIONS.CHOP,   workboost, inst)
    inst.components.workmultiplier:AddMultiplier(GLOBAL.ACTIONS.MINE,   workboost, inst)
    inst.components.workmultiplier:AddMultiplier(GLOBAL.ACTIONS.HAMMER, workboost, inst)
end

AddPrefabPostInit("winona", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst:AddComponent("efficientuser")
        inst:ListenForEvent("hungerdelta", onhungerchange)
        inst.components.hunger:SetRate(GLOBAL.TUNING.WILSON_HUNGER_RATE * 1.11)
        inst.components.health:SetMaxHealth(175)
    end
end)