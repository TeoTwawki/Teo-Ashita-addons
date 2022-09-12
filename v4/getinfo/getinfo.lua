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
addon.version   = '1.1'
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

    if #args >= 1 and (args[1]:ieq('/getinfo') or args[1]:ieq('/gi')) then
        if #args == 3 and tonumber(args[3]) then
            if tonumber(args[3]) then
                entity = GetEntity(bit.band(tonumber(args[3]), 0x0FFF))
            end

            if args[3] and not entity then
                print(string.format("Error: entity %s not found", args[3]))
                return
            end
        end

        if #args >= 2 and args[2]:any('?', 'help') or not entity then
            print("Usage:\n/getinfo optionalsubCommand optionalEntityID")
            print("Subcommands:\nflags\nlook")
            return
        end

        local targetHex = string.upper(string.format("%08x", target))
        local indexHex  = string.upper(string.format("%04x", index))
        print(string.format("Name: %s  ID: %d (0x%s)  Index: %d (0x%s)", entity.Name, target, targetHex, index, indexHex))
        print(string.format("Speed: %f  Animation Speed  %d", entity.MovementSpeed * 10, entity.AnimationSpeed * 10))
        print(string.format("PosX: %f  PosY: %f  PosZ: %f", entity.Movement.LocalPosition.X, entity.Movement.LocalPosition.Y, entity.Movement.LocalPosition.Z))

        if #args >= 2 then
            if args[2]:any('flags') or args[3]:any('flags') then
                print(string.format("Flags0: %d", entity.Render.Flags0)) -- Main Render Flags
                print(string.format("Flags1: %d", entity.Render.Flags1)) -- Name Flags (Party, Away, Anon)
                print(string.format("Flags2: %d", entity.Render.Flags2)) -- Name Flags (Bazaar, GM Icon, etc.)
                print(string.format("Flags3: %d", entity.Render.Flags3)) -- Entity Flags (Shadow)
                print(string.format("Flags4: %d", entity.Render.Flags4)) -- Name Flags (Name Visibility)
                print(string.format("Flags5: %d", entity.Render.Flags5)) -- Geomancer Indi's
                print(string.format("Flags6: %d", entity.Render.Flags6)) -- Unknown
                print(string.format("Flags7: %d", entity.Render.Flags7)) -- Overhead Flags (Hi-word: Jump Emote, Model Visibility etc.) (Low-word: Job Mastery Stars, Party Seek Mastery Star, etc. [Low-Byte:] Timer of some sort.)
                print(string.format("Flags8: %d", entity.Render.Flags8)) -- Overhead Flags (Job mastery party.)
            end

            if args[2]:any('look') or args[3]:any('look') then
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
    end

    return
end)
