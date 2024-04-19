local SpawnPrefab = GLOBAL.SpawnPrefab
local WHIP_DAMAGE = 44
local TUNING = GLOBAL.TUNING

local CRACK_MUST_TAGS = { "_combat" }
local CRACK_CANT_TAGS = { "player", "epic", "shadow", "shadowminion", "shadowchesspiece" }
local function supercrack(inst)
    local owner = inst.components.inventoryitem and inst.components.inventoryitem:GetGrandOwner() or nil
    local x,y,z = inst.Transform:GetWorldPosition()
    local ents = GLOBAL.TheSim:FindEntities(x,y,z, TUNING.WHIP_SUPERCRACK_RANGE, CRACK_MUST_TAGS, CRACK_CANT_TAGS)
    for i,v in ipairs(ents) do
        if v ~= owner and v.components.combat:HasTarget() then
            v.components.combat:DropTarget()
            if v.sg ~= nil and v.sg:HasState("hit")
                    and v.components.health ~= nil and not v.components.health:IsDead()
                    and not v.sg:HasStateTag("transform")
                    and not v.sg:HasStateTag("nointerrupt")
                    and not v.sg:HasStateTag("frozen")
            --and not v.sg:HasStateTag("attack")
            --and not v.sg:HasStateTag("busy")
            then

                if v.components.sleeper ~= nil then
                    v.components.sleeper:WakeUp()
                end
                v.sg:GoToState("hit")
                if v.components.hauntable ~= nil and v.components.hauntable.panicable then
                    v.components.hauntable:Panic(TUNING.BATTLESONG_PANIC_TIME)
                end
            end
        end
    end
end
local function new_onattack(inst, attacker, target)
    if target ~= nil and target:IsValid() then
        local chance =
        (target:HasTag("epic") and TUNING.WHIP_SUPERCRACK_EPIC_CHANCE) or
                (target:HasTag("monster") and TUNING.WHIP_SUPERCRACK_MONSTER_CHANCE) or
                TUNING.WHIP_SUPERCRACK_CREATURE_CHANCE

        local snap = SpawnPrefab("impact")

        local x, y, z = inst.Transform:GetWorldPosition()
        local x1, y1, z1 = target.Transform:GetWorldPosition()
        local angle = -math.atan2(z1 - z, x1 - x)
        snap.Transform:SetPosition(x1, y1, z1)
        snap.Transform:SetRotation(angle * GLOBAL.RADIANS)
        if math.random() < chance then
            snap.Transform:SetScale(3, 3, 3)
            if target.SoundEmitter ~= nil then
                target.SoundEmitter:PlaySound(inst.skin_sound_large or "dontstarve/common/whip_large")
            end
            inst:DoTaskInTime(0, supercrack)
        elseif target.SoundEmitter ~= nil then
            target.SoundEmitter:PlaySound(inst.skin_sound_small or "dontstarve/common/whip_small")
        end
    end
end

AddPrefabPostInit("whip", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.weapon:SetDamage(WHIP_DAMAGE)
        inst.components.weapon:SetOnAttack(new_onattack)
    end
end)