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

addon.author    = 'TeoTwawki'
addon.name      = 'getinfo'
addon.version   = '1.0'
addon.desc      = 'Prints out info about the current cursor target'
addon.link      = 'https://github.com/TeoTwawki/Teo-Ashita-addons'

require "common"

ashita.events.register('command', 'command_cb', function (e)
    --[[
    arg1 = command name
    arg2 = subcommand for extended data output
    arg3 = optional entity ID
    ]]
    local args = e.command:args()
    local target = AshitaCore:GetMemoryManager():GetTarget():GetServerId(0)
    local index  = AshitaCore:GetMemoryManager():GetTarget():GetTargetIndex(0)
    local entity = GetEntity(index)

    if #args >= 1 and args[1]:ieq('/getinfo') then
        if #args == 3 and tonumber(args[3]) then
            entity = GetEntity(bit.band(tonumber(args[3]), 0x0FFF))
        end

        if args[3] and not entity then
            print(string.format("Error: entity %s not found", args[3])) 
            return
        end

        if args[2]:any('?', 'help') or not entity then
            print("Usage:\n/getinfo optionalsubCommand optionalEntityID")
            print("Subcommands:\nlook")
            return
        end

        print(string.format("Name: %s  ID: %d  Index: %d", entity.Name, target, index))
        print(string.format("Speed: %d  Animation Speed  %d", entity.MovementSpeed * 10, entity.AnimationSpeed * 10))
        if #args >= 2 and args[2]:any('look') then
            print(string.format("Race ID: %i", entity.Race))
            print(string.format("Hair model: %i", entity.Look.Hair))
            print(string.format("Head model: %d", entity.Look.Head))
            print(string.format("Body model: %d", entity.Look.Body))
            print(string.format("Hand model: %d", entity.Look.Hands))
            print(string.format("Legs model: %d", entity.Look.Legs))
            print(string.format("Feet model: %d", entity.Look.Feet))
            print(string.format("Mainhand model: %d", entity.Look.Main))
            print(string.format("Offhand model ID: %d", entity.Look.Sub))
            print(string.format("Ranged model ID: %d", entity.Look.Ranged))
        end
    end

    return
end)