local TUNING = GLOBAL.TUNING

local buff = 1.20

local item = function(i) return i.prefab == "beefalohat" end
local itemfound = function(equip)
    for k,v in pairs(giver.components.inventory.equipslots) do
        if item(v) then
            return v
        end
    end
end

local function OnBrushed(inst, doer, numprizes)
    if numprizes > 0 and inst.components.domesticatable ~= nil then
        if itemfound ~= nil then
            inst.components.domesticatable:DeltaDomestication(TUNING.BEEFALO_DOMESTICATION_BRUSHED_DOMESTICATION*buff)
            inst.components.domesticatable:DeltaObedience(TUNING.BEEFALO_DOMESTICATION_BRUSHED_OBEDIENCE*buff)
        else
            inst.components.domesticatable:DeltaDomestication(TUNING.BEEFALO_DOMESTICATION_BRUSHED_DOMESTICATION)
            inst.components.domesticatable:DeltaObedience(TUNING.BEEFALO_DOMESTICATION_BRUSHED_OBEDIENCE)
        end
    end
end

local function OnGetItemFromPlayer(inst, giver, item)
    if inst.components.eater:CanEat(item) then
        if itemfound ~= nil then
            item.components.edible.hungervalue = item.components.edible.hungervalue*buff
        end
        inst.components.eater:Eat(item, giver)
    end
end


AddPrefabPostInit("beefalo.lua", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.brushable:SetOnBrushed(OnBrushed)
        inst.components.trader.onaccept = OnGetItemFromPlayer
    end
end)