GLOBAL.TUNING.SHADOWWAXWELL_PROTECTOR_ATTACK_PERIOD_INACTIVE_LEADER = 3.6
GLOBAL.TUNING.SHADOWWAXWELL_PROTECTOR_ACTIVE_LEADER_RANGE = 6.5

AddComponentPostInit("book", function(self)
    local _old_interact = self.Interact

    function self:Interact(fn, reader, ...)
        local success, reason = _old_interact(self, fn, reader, ...)

        if success and reader.prefab == "waxwell" then
            self:ConsumeUse(2)
        end

        return success, reason
    end
end)