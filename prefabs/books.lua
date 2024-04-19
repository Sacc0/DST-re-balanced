local require = GLOBAL.require
require("recipe")

local AllRecipes = GLOBAL.AllRecipes

GLOBAL.TUNING.BOOK_BEES_AMOUNT = 3
GLOBAL.TUNING.BOOK_MAX_GRUMBLE_BEES = 18

AllRecipes["book_moon"].ingredients = { Ingredient("papyrus", 2), Ingredient("alterguardianhatshard", 1) }
AllRecipes["book_bees"].ingredients = { Ingredient("papyrus", 2), Ingredient("royal_jelly", 1) }

AddPrefabPostInit("book_bees", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.finiteuses:SetMaxUses(5)
        inst.components.finiteuses:SetUses(5)
    end
end)

