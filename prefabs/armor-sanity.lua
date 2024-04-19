local function new_OnTakeDamage(inst, damage_amount)
    local owner = inst.components.inventoryitem.owner
    if owner then
        local sanity = owner.components.sanity
        if sanity then
            sanity:DoDelta(-5, false)
        end
    end
end

AddPrefabPostInit("armor_sanity", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.armor.ontakedamage = new_OnTakeDamage
    end
end)

GLOBAL.TUNING.ARMOR_SANITY = 575