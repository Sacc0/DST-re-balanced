if GLOBAL.TheNet:GetIsClient() then
    return
end

local custom_loot_table = {
    short = {
        guaranteed = { },
        random = { { "killerbee", 0.5 }, { "twigs", 0.5 }, { "log", 1 } }
    },
    normal = {
        guaranteed = { "log" },
        random = { { "bird_egg", 0.1 }, { "log", 1 } }
    },
    tall = {
        guaranteed = { "log", "log", "twigs", "pinecone" },
        random = { { "bird_egg", 0.5 }, { "rottenegg", 0.5 }, { "crow", 0.5 }, { "pinecone", 1 } }
    },
    old = {
        guaranteed = { "twigs", "pinecone", "pinecone" },
        random = { { "rottenegg", 0.1 }, { "pinecone", 1 } }
    },
    burnt = {
        guaranteed = { "coal" },
        random = { { "coal", 1 }, { "coal", 0.5 }, { "feather_crow", 0.5 } }
    },
    haunted = {
        guaranteed = { "terrorbeak" },
        random = {}
    }
}


local function SetRandomLoot(self, random)
    self.inst.components.lootdropper:SetLootSetupFn(function(lootdropper)
        for i = 1, #random do
            lootdropper:AddRandomLoot(random[i][1], random[i][2])
        end
        lootdropper.numrandomloot = 1
    end)
end

local SetLootOld

local function SetLoot(self, loots)
    local names = { "short", "normal", "tall", "old" }
    local random = {}

    if (self.inst:HasTag("burnt")) then
        random = custom_loot_table["burnt"].random
        loots = custom_loot_table["burnt"].guaranteed

    elseif (self.inst:HasTag("haunted")) then
        random = custom_loot_table["haunted"].random
        loots = custom_loot_table["haunted"].guaranteed

    else
        random = custom_loot_table[names[self.inst.components.growable.stage]].random
        loots = custom_loot_table[names[self.inst.components.growable.stage]].guaranteed
    end

    SetRandomLoot(self, random)
    SetLootOld(self, loots)
end

AddPrefabPostInit("evergreen", function(inst)
    if not GLOBAL.TheWorld.ismastersim then
        return
    end

    SetLootOld = inst.components.lootdropper.SetLoot
    inst.components.lootdropper.SetLoot = SetLoot

end)