GLOBAL.TUNING.BOOK_BEES_AMOUNT = 3
GLOBAL.TUNING.BOOK_MAX_GRUMBLE_BEES = 18

AddPrefabPostInit("book_bees", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.finiteuses:SetMaxUses(5)
        inst.components.finiteuses:SetUses(5)
    end
end)

