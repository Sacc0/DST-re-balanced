local function GetHeatFn(inst)
    if GLOBAL.TheWorld.state.temperature < 65 then
        local heats = { 70, 85, 100, 115 }
        inst.components.heater:SetThermics(true, false)
        return heats[inst.components.firefx.level] or 115
    else
        local heats = { 10, 20, 30, 40 }
        inst.components.heater:SetThermics(false, true)
        return -heats[inst.components.firefx.level] or -40
    end
end


local firelevels =
{
    {anim="level1", sound="dontstarve/common/nightlight", radius=4, intensity=.8, falloff=.33, colour = {253/255,179/255,179/255}, soundintensity=.1},
    {anim="level2", sound="dontstarve/common/nightlight", radius=5, intensity=.8, falloff=.33, colour = {253/255,179/255,179/255}, soundintensity=.3},
    {anim="level3", sound="dontstarve/common/nightlight", radius=6, intensity=.8, falloff=.33, colour = {253/255,179/255,179/255}, soundintensity=.6},
    {anim="level4", sound="dontstarve/common/nightlight", radius=7, intensity=.8, falloff=.33, colour = {253/255,179/255,179/255}, soundintensity=.8},
}

AddPrefabPostInit("nightlight_flame", function(inst)
    inst:AddTag("HASHEATER")
    if GLOBAL.TheWorld.ismastersim then
        inst:AddComponent("heater")
        inst.components.heater.heatfn = GetHeatFn
        inst.components.firefx.levels = firelevels
    end
end)