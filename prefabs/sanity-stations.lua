local TUNING = GLOBAL.TUNING

AddPrefabPostInit("tent", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.sleepingbag.health_tick = TUNING.SLEEP_HEALTH_PER_TICK * 3
        inst.components.sleepingbag.hunger_tick = TUNING.SLEEP_HUNGER_PER_TICK * 1.5
        inst.components.sleepingbag.sanity_tick = TUNING.SLEEP_SANITY_PER_TICK * 2.5
    end
end)

AddPrefabPostInit("siestahut", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.sleepingbag.health_tick = TUNING.SLEEP_HEALTH_PER_TICK * 3
        inst.components.sleepingbag.hunger_tick = TUNING.SLEEP_HUNGER_PER_TICK / 2
        inst.components.sleepingbag.sanity_tick = TUNING.SLEEP_SANITY_PER_TICK * 2.5
    end
end)

AddPrefabPostInit("bedroll_furry", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.sleepingbag.health_tick = TUNING.SLEEP_HEALTH_PER_TICK * 2
        inst.components.sleepingbag.hunger_tick = TUNING.SLEEP_HUNGER_PER_TICK * 1.5
        inst.components.sleepingbag.sanity_tick = TUNING.SLEEP_SANITY_PER_TICK * 1.67
    end
end)

AddPrefabPostInit("bedroll_straw", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.sleepingbag.health_tick = TUNING.SLEEP_HEALTH_PER_TICK * 1
        inst.components.sleepingbag.hunger_tick = TUNING.SLEEP_HUNGER_PER_TICK * 1.5
        inst.components.sleepingbag.sanity_tick = TUNING.SLEEP_SANITY_PER_TICK * 1.33
    end
end)

AddPrefabPostInit("portabletent", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.sleepingbag.health_tick = TUNING.SLEEP_HEALTH_PER_TICK * 3
        inst.components.sleepingbag.hunger_tick = TUNING.SLEEP_HUNGER_PER_TICK * 1.5
        inst.components.sleepingbag.sanity_tick = TUNING.SLEEP_SANITY_PER_TICK * 2.5
    end
end)