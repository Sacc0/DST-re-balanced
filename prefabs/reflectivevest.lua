local seg_time = 30
local total_day_time = seg_time*16

GLOBAL.TUNING.REFLECTIVEVEST_PERISHTIME = total_day_time*10
GLOBAL.AllRecipes["reflectivevest"].ingredients = {
    Ingredient("pigskin", 2),
    Ingredient("feather_robin", 3),
    Ingredient("papyrus", 2)
}
local function doWarmMe(owner)
    owner.components.temperature:DoDelta(-1)
end

local function onequip(inst, owner)
    local skin_build = inst:GetSkinBuild()
    if skin_build ~= nil then
        owner:PushEvent("equipskinneditem", inst:GetSkinName())
        owner.AnimState:OverrideItemSkinSymbol("swap_body", skin_build, "swap_body", inst.GUID, "torso_reflective")
    else
        owner.AnimState:OverrideSymbol("swap_body", "torso_reflective", "swap_body")
    end
    inst.components.fueled:StartConsuming()
    if (inst.warming ~= nil) then
        inst.warming:Cancel()
    end
    inst.warming = owner:DoPeriodicTask(20, doWarmMe, nil, inst)
end

local function onunequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_body")
    inst.components.fueled:StopConsuming()

    local skin_build = inst:GetSkinBuild()
    if skin_build ~= nil then
        owner:PushEvent("unequipskinneditem", inst:GetSkinName())
    end
    if (inst.warming ~= nil) then
        inst.warming:Cancel()
        inst.warming = nil
    end
end

AddPrefabPostInit("reflectivevest", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.equippable:SetOnEquip(onequip)
        inst.components.equippable:SetOnUnequip(onunequip)
    end
end)




