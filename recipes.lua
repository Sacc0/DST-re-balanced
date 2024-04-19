local require = GLOBAL.require
require("recipe")

local TechTree = require("techtree")
local TECH = GLOBAL.TECH
local Ingredient = GLOBAL.Ingredient
local AllRecipes = GLOBAL.AllRecipes
local STRINGS = GLOBAL.STRINGS
local CONSTRUCTION_PLANS = GLOBAL.CONSTRUCTION_PLANS
local CRAFTING_FILTERS = GLOBAL.CRAFTING_FILTERS

AllRecipes["blowdart_pipe"].numtogive = 4
AllRecipes["blowdart_fire"].numtogive = 4
AllRecipes["blowdart_yellow"].numtogive = 4
AllRecipes["blowdart_sleep"].numtogive = 4

AllRecipes["armorwood"].ingredients = {
    Ingredient("rope", 1),
    Ingredient("log", 7),
    Ingredient("charcoal", 2)
}

AllRecipes["footballhat"].ingredients = {
    Ingredient("pigskin", 1),
    Ingredient("rope", 2),
    Ingredient("rocks", 2)
}

AllRecipes["backpack"].ingredients = {
    Ingredient("cutgrass", 4),
    Ingredient("twigs", 4),
    Ingredient("rope", 2)
}

AllRecipes["icehat"].ingredients = {
    Ingredient("rope", 4),
    Ingredient("ice", 10)
}

AllRecipes["ruinshat"].ingredients = {
    Ingredient("thulecite", 4),
    Ingredient("nightmarefuel", 4),
    Ingredient("redgem", 1)
}

AllRecipes["winterhat"].ingredients = {
    Ingredient("silk", 4),
    Ingredient("beefalowool", 4),
    Ingredient("manrabbit_tail", 1)
}

AllRecipes["raincoat"].ingredients = {
    Ingredient("tentaclespots", 1),
    Ingredient("rope", 2),
    Ingredient("waxpaper", 1)
}

AllRecipes["nightsword"].ingredients = {
    Ingredient("livinglog", 2),
    Ingredient("nightmarefuel", 8)
}
AllRecipes["book_moon"].ingredients = { Ingredient("papyrus", 2), Ingredient("alterguardianhatshard", 1) }
AllRecipes["book_bees"].ingredients = { Ingredient("papyrus", 2), Ingredient("royal_jelly", 1) }