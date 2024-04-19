
local TUNING = GLOBAL.TUNING
local SpawnPrefab = GLOBAL.SpawnPrefab
local PI = GLOBAL.PI
local function StopRattleTask(inst)
    if inst.rattletask ~= nil then
        inst.rattletask:Cancel()
        inst.rattletask = nil
    end
end

local function StopRattling(inst)
    inst.rattling = false
    inst.nextrattletime = nil
    StopRattleTask(inst)
end

local prefabs =
{
    "bramblefx_trap",
}

local TARGET_CANT_TAGS = { "insect", "playerghost" }
local TARGET_ONEOF_TAGS = { "character", "animal", "monster" }
local function SpawnBees(inst, target)
    inst.SoundEmitter:PlaySound("dontstarve/bee/beemine_explo")
    if target == nil or not target:IsValid() then
        target = FindEntity(inst, 25, nil, nil, TARGET_CANT_TAGS, TARGET_ONEOF_TAGS)
    end
    if target ~= nil then
        for i = 1, TUNING.BEEMINE_BEES do
            local bee = SpawnPrefab(inst.beeprefab)
            if bee ~= nil then
                local x, y, z = inst.Transform:GetWorldPosition()
                local dist = math.random()
                local angle = math.random() * 2 * PI
                bee.Physics:Teleport(x + dist * math.cos(angle), y, z + dist * math.sin(angle))
                if bee.components.combat ~= nil then
                    bee.components.combat:SetTarget(target)
                end
            end
        end
        target:PushEvent("coveredinbees")
    end
end

local function DoExplode(self)
    local explosiverange = 5
    local stacksize = self.inst.components.stackable ~= nil and self.inst.components.stackable:StackSize() or 1
    local totaldamage = self.explosivedamage * stacksize
    local x, y, z = self.inst.Transform:GetWorldPosition()
    -- Players are off limits now
    local ents = TheSim:FindEntities(x, y, z, explosiverange, nil, { "INLIMBO", "player" })
    for i, v in ipairs(ents) do
        if v ~= self.inst and v:IsValid() and not v:IsInLimbo() then
            if v.components.workable ~= nil and v.components.workable:CanBeWorked() then
                v.components.workable:WorkedBy(self.inst, self.buildingdamage)
            end
                --Recheck valid after work
                if v:IsValid() and not v:IsInLimbo() then
                    if self.lightonexplode and
                    v.components.fueled == nil and
                    v.components.burnable ~= nil and
                    not v.components.burnable:IsBurning() and
                    not v:HasTag("burnt") then
                        v.components.burnable:Ignite()
                    end
                    if v.components.combat ~= nil then
                        v.components.combat:GetAttacked(self.inst, totaldamage, nil)
                    end
                    v:PushEvent("explosion", { explosive = self.inst })
                end
        end
    end
end

local function new_OnExplode(inst)
    StopRattling(inst)
    if inst.spawntask ~= nil then
        return
    end
    inst.components.workable:SetWorkable(false)
    inst.AnimState:PlayAnimation("explode")
    inst.SoundEmitter:PlaySound("dontstarve/bee/beemine_launch")
    inst:AddComponent("explosive")
	inst.components.explosive.explosivedamage = 100
    inst.components.explosive.explosiverange = 0
	inst.components.explosive.lightonexplode = false
    DoExplode(inst.components.explosive)

    inst.spawntask = inst:DoTaskInTime(9 * GLOBAL.FRAMES, SpawnBees, inst.components.mine:GetTarget())
    inst:ListenForEvent("animover", inst.Remove)
    inst:RemoveComponent("inventoryitem")
    inst:RemoveComponent("mine")
    inst.persists = false
    inst.Physics:SetActive(false)
end

AddPrefabPostInit("beemine", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.mine:SetOnExplodeFn(new_OnExplode)
    end
end)