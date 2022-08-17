--[[
    TEO DOES NOT CARE PUBLIC LICENSE
        Version 1, July 18 2016
    Copyright (C) 2016 TeoTwawki <https://github.com/TeoTwawki>

        Everyone is permitted to copy and distribute verbatim or modified copies
        of this license document, and changing it is allowed as long as the name is
        changed and you do not pretend it nor the associated code to be your original work.

    TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

    1. You may not represent the code this license applies to as your original work.
       This condition DOES NOT apply to any changes you make.

    2. Nothing! Do whatever you want!
       TEO DOES NOT CARE!
]]--

_addon.author   = "TeoTwawki"
_addon.name     = "id"
_addon.version  = "1.0"

require "common"

ashita.register_event("command", function(cmd, nType)
    local args = cmd:args()
    local target = AshitaCore:GetDataManager():GetTarget()
    local entity = AshitaCore:GetDataManager():GetEntity()

    if args[1] ~= "/id" or target == nil then
        return false
    else
        print(string.format("targetName: %s  targetID: %d  targetIndex: %d", entity:GetName(target:GetTargetIndex()), target:GetTargetServerId(), target:GetTargetIndex() ))
        return true
    end

    return false
end)
