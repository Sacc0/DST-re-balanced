local Curse = Class(function(self, inst)
    self.inst = inst
    self.remaining_time = 0
    self.task = nil
end)

function Curse:ApplyCurse(time)
    self.inst.components.talker:Say("Wait what, i got cursed!")
    if self.task ~= nil then
        self.task:Cancel()
    end
    self.remaining_time = time > self.remaining_time and time or self.remaining_time
    self.task = self.inst:DoPeriodicTask(1, function(_)
        if self.remaining_time == 0 then
            self.task:Cancel()
            return
        end
        self.inst.components.health:DoDelta(-3)
        self.remaining_time = self.remaining_time - 1
    end)
end

return Curse