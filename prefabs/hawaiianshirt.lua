local seg_time = 30
local total_day_time = seg_time*16

GLOBAL.TUNING.HAWAIIANSHIRT_PERISHTIME = total_day_time*20

AddPrefabPostInit("hawaiianshirt", function(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst.components.insulator:SetInsulation(GLOBAL.TUNING.INSULATION_LARGE*1.25)
        inst.components.equippable.dapperness = GLOBAL.TUNING.DAPPERNESS_MED_LARGE
        inst.components.insulator:SetSummer()
    end
end)