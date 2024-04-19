local require = GLOBAL.require
require("recipe")

local AllRecipes = GLOBAL.AllRecipes
AllRecipes["blowdart_pipe"].numtogive = 4
AllRecipes["blowdart_fire"].numtogive = 4
AllRecipes["blowdart_yellow"].numtogive = 4
AllRecipes["blowdart_sleep"].numtogive = 4


AddPrefabPostInit("blowdart_fire", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.weapon:SetDamage(50)
    end
end)

AddPrefabPostInit("blowdart_sleep", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.weapon:SetDamage(25)
    end
end)