--[[
    TEO DOES NOT CARE PUBLIC LICENSE
        Version 1, July 18 2016
    Copyright (C) 2021 TeoTwawki <https://github.com/TeoTwawki>

       Everyone is permitted to copy and distribute verbatim or modified copies of this
       license document, and changing it is allowed as long as the name is changed and
       you neither claim nor imply it or the associated code to be your original work.

    TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

    1. You may not represent the license or code this license applies to as your original work.
       This condition DOES NOT apply to any changes you make.

    2. Nothing! Do whatever you want!
       TEO DOES NOT CARE!
]]--
addon.author    = 'TeoTwawki'
addon.name      = 'datadumper'
addon.version   = '2.0'
addon.desc      = 'Dumps misc info from client into test files'
addon.link      = 'https://github.com/TeoTwawki/Teo-Ashita-addons'

require 'common'

ashita.events.register('command', 'command_cb', function (e)
    local args = e.command:args()
    if (#args < 2 or args[1] ~= "/datadumper") then
        return false;
    end

    if
        string.lower(args[2]) == 'areas' or
        string.lower(args[2]) == 'zones' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(addon.path .. '\\output\\zones.txt', 'w')
        f:write('Zone = ID\n')
        for x = 0, 0x12F do
            local name = AshitaCore:GetResourceManager():GetString('zones.names', x)
            if name == nil or string.len(name) == 0 then
                name = '.'
            end
            f:write(string.format('%s = %d,\n', string.upper(name), x))
            f:write(string.format('%s = %d, -- %s\n', string.upper(name), x, desc))
        end
        f:close()
        print('Zone name data has been exported to ' .. addon.path .. '\\output\\zones.txt')
    end

    if
        string.lower(args[2]) == 'buffs' or
        string.lower(args[2]) == 'effects' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(addon.path .. '\\output\\effects.txt', 'w')
        f:write('EFFECT = ID\n')
        for x = 0, 0x300 do
            local name = AshitaCore:GetResourceManager():GetString('buffs.names', x)
            if name == nil or string.len(name) == 0 then
                name = '.'
            end
            f:write(string.format('%s = %d,\n', string.upper(name), x))
        end
        f:close()
        print('Status effects data has been exported to ' .. addon.path .. '\\output\\effects.txt')
    end

    if
        string.lower(args[2]) == 'emote' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(addon.path .. '\\output\\emotes.txt', 'w')
        for x = 0, 1023 do
            local emote = AshitaCore:GetResourceManager():GetString('emotes', x)
            if emote ~= nil and string.len(emote) > 0 then
                f:write(string.format('%s\n', string.upper(emote)))
            end
        end
        f:close()
        print('Emote data has been exported to ' .. addon.path .. '\\output\\emotes.txt')
    end

    if
        string.lower(args[2]) == 'actionmessages' or
        string.lower(args[2]) == 'actmes' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(addon.path .. '\\output\\action_messages.txt', 'w')
        f:write('ID = ACTION_MESSAGE\n')
        for x = 0, 1023 do
            local name = AshitaCore:GetResourceManager():GetString('action.messages', x)
            if name ~= nil and string.len(name) > 0 then
                f:write(string.format('%d = %s,\n', x, string.upper(name)))
            end
        end
        f:close()
        print('Action message data has been exported to ' .. addon.path .. '\\output\\action_messages.txt')
    end

    if
        string.lower(args[2]) == 'command' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(addon.path .. '\\output\\command.txt', 'w')
        for x = 0, 0xFF do
            local text = AshitaCore:GetResourceManager():GetString('commands.help', x)
            if text ~= nil and string.len(text) > 0 then
                f:write(string.format('%s\n\n', string.upper(text)))
            end
        end
        f:close()
        print('Help command data has been exported to ' .. addon.path .. '\\output\\commands.txt')
    end

    --[[ WIP: worked in older version
    if
        string.lower(args[2]) == 'errors' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(addon.path .. '\\output\\error_strings.txt', 'w')
        f:write('ERROR_STRING = ID\n')
        for x = 0, 0xFF do
            local name = AshitaCore:GetResourceManager():GetString('errors', x)
            if name == nil or string.len(name) == 0 then
                name = '.'
            end
            f:write(string.format('%s = %d,\n', string.upper(name), x))
        end
        f:close()
        print('Error string data has been exported to ' .. addon.path .. '\\output\\error_strings.txt')
    end
    ]]

    if
        string.lower(args[2]) == 'ability' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(addon.path .. '\\output\\abilities.txt', 'w')
        f:write('Ability name = Ability ID\nDescription\n\n')
        for x = 0, 0x16FF do
            local name = AshitaCore:GetResourceManager():GetString('abilities.names', x)
            local desc = AshitaCore:GetResourceManager():GetString('abilities.descriptions', x)
            if name ~= nil and string.len(name) > 0 then
                f:write(string.format('%s = %d,\n%s\n\n', string.upper(name), x, desc))
            end
        end
        f:close()
        print('Ability data has been exported to ' .. addon.path .. '\\output\\abilities.txt')
    end

    if
        string.lower(args[2]) == 'spells' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(addon.path .. '\\output\\spells.txt', 'w')
        f:write('Spell name = Spell ID\nDescription\n\n')
        for x = 0, 1023 do
            local name = AshitaCore:GetResourceManager():GetString('spells.names', x)
            local desc = AshitaCore:GetResourceManager():GetString('spells.descriptions', x)
            if name ~= nil and string.len(name) > 0 then
                f:write(string.format('%s = %d,\n%s\n\n', string.upper(name), x, desc))
            end
        end
        f:close()
        print('Spell data has been exported to ' .. addon.path .. '\\output\\spells.txt')
    end

    if
        string.lower(args[2]) == 'mobskills' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(addon.path .. '\\output\\mobskills.txt', 'w')
        f:write('ID (Offset by 256) skill name\n')
        for x = 0, 0x12FF do
            local name = AshitaCore:GetResourceManager():GetString('monsters.abilities', x)
            if name == nil or string.len(name) == 0 then
                name = '.'
            end
            f:write(string.format('%d (%d) %s\n', x + 256, x, name))
        end
        f:close()
        print('mobskill data has been exported to ' .. addon.path .. '\\output\\mobskills.txt')
    end

    if
        string.lower(args[2]) == 'monsters' or
        string.lower(args[2]) == 'wanted' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(addon.path .. '\\output\\wanted_monsters.txt', 'w')
        f:write('ID = Monster Type (For soul plates)\n')
        for x = 0, 0x1FF do
            local name = AshitaCore:GetResourceManager():GetString('monsters.groups', x)
            if name == nil or string.len(name) == 0 then
                name = '.'
            end
            f:write(string.format('%d = %s\n', x, name))
        end
        f:close()
        print('Monster type data has been exported to ' .. addon.path .. '\\output\\wanted_monsters.txt')
    end

    --[[ WIP: Rom\165\77.dat
    if string.lower(args[2]) == 'ecosystems' or string.lower(args[2]) == 'all' then
        local f = io.open(addon.path .. '\\output\\ecosystems.txt', 'w')
        f:write('ID = Monster Type\n')
        for x = 63, 81 do
            local name = AshitaCore:GetResourceManager():GetString('monsters.groups', x)
            if name == nil or string.len(name) == 0 then
                name = '.'
            end
            f:write(string.format('%d = %s\n', x, name))
        end
        f:close()
        print('Ecosystem data has been exported to ' .. addon.path .. '\\output\\ecosystems.txt')
    end
    ]]

    if
        string.lower(args[2]) == 'mounts' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(addon.path .. '\\output\\mounts.txt', 'w')
        f:write('NAME = ID -- Description comment\n')
        for x = 0, 0x7F do
            local name = AshitaCore:GetResourceManager():GetString('mounts.names', x)
            local desc = AshitaCore:GetResourceManager():GetString('mounts.descriptions', x)
            if name == nil or string.len(name) == 0 then
                break
            end
            if desc == nil or string.len(desc) == 0 then
                desc = ''
            end
            f:write(string.format('%s = %d, -- %s\n', string.upper(name), x, desc))
        end
        f:close()
        print('Mount data has been exported to ' .. addon.path .. '\\output\\mounts.txt')
    end

    if
        string.lower(args[2]) == 'regions' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(addon.path .. '\\output\\regions.txt', 'w')
        f:write('REGION = ID\n')
        for x = 0, 0x7F do
            local name = AshitaCore:GetResourceManager():GetString('regions', x)
            if name == nil or string.len(name) == 0 then
                break
            end
            f:write(string.format('%s = %d,\n', string.upper(name), x))
        end
        f:close()
        print('Region data has been exported to ' .. addon.path .. '\\output\\regions.txt')
    end

    if
        string.lower(args[2]) == 'titles' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(addon.path .. '\\output\\titles.txt', 'w')
        f:write('TITLE = ID\n')
        for x = 0, 0x800 do
            local name = AshitaCore:GetResourceManager():GetString('titles', x)
            if name == nil or string.len(name) == 0 then
                name = '.'
            end
            f:write(string.format('%s = %d,\n', string.upper(name), x))
        end
        f:close()
        print('Title data has been exported to ' .. addon.path .. '\\output\\titles.txt')
    end

    if
        string.lower(args[2]) == 'keyitems' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(addon.path .. '\\output\\keyitems.txt', 'w')
        f:write('KI = ID\n')
        for x = 0, 0x1000 do
            local name = AshitaCore:GetResourceManager():GetString('keyitems.names', x);
            if name == nil or string.len(name) == 0 then
                name = '.'
            end
            f:write(string.format('%s = %d,\n', string.upper(name), x))
        end
        f:close()
        print('Keyitem data has been exported to ' .. addon.path .. '\\output\\keyitems.txt\n')
    end

    return true
end)
