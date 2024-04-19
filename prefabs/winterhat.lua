AddRecipe2("winterhat",      {Ingredient("silk", 4), Ingredient("beefalowool", 4), Ingredient("manrabbit_tail", 1)},   GLOBAL.TECH.SCIENCE_TWO)
GLOBAL.AllRecipes["winterhat"].ingredients = {
    Ingredient("silk", 4),
    Ingredient("beefalowool", 4),
    Ingredient("manrabbit_tail", 1)
}
AddPrefabPostInit("winterhat", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.fueled:InitializeFuelLevel(GLOBAL.TUNING.WINTERHAT_PERISHTIME*2)
        inst.components.insulator:SetInsulation(GLOBAL.TUNING.INSULATION_LARGE)
        inst.components.equippable.dapperness = GLOBAL.TUNING.DAPPERNESS_SMALL
    end
end)
