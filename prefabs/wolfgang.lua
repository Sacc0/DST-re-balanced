
GLOBAL.TUNING.MIGHTINESS_DRAIN_MULT_SLOW = 0.33
GLOBAL.TUNING.MIGHTINESS_DRAIN_MULT_NORMAL = 0.5
GLOBAL.TUNING.MIGHTINESS_DRAIN_MULT_FAST = 1
GLOBAL.TUNING.MIGHTINESS_DRAIN_MULT_FASTEST = 2
GLOBAL.TUNING.MIGHTINESS_DRAIN_MULT_STARVING = 4

GLOBAL.TUNING.WOLFGANG_MIGHTINESS_ATTACK_GAIN_GIANT = 1.5

local function OnAttacked(inst, data)
    if data.attacker ~= nil and data.attacker.components.combat ~= nil then
        local damage = data.attacker.components.combat.defaultdamage
        if damage ~= nil and damage > 0 then
            inst.components.mightiness:DoDelta(-damage/12)
        end
    end
end

AddPrefabPostInit("wolfgang", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst:ListenForEvent("attacked", OnAttacked)
    end
end)
