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
_addon.author   = 'TeoTwawki'
_addon.name     = 'datadumper'
_addon.version  = '1.0.0'

require 'common'

ashita.register_event("command", function(cmd, nType)
    local args = cmd:args();
    if (#args < 2 or args[1] ~= "/datadumper") then
        return false;
    end

    if
        string.lower(args[2]) == 'areas' or
        string.lower(args[2]) == 'zones' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(_addon.path .. '\\output\\zones.txt', 'w')
        f:write('Zone = ID\n')
        for x = 0, 0x12F do
            local name = AshitaCore:GetResourceManager():GetString('zones', x)
            if name == nil or string.len(name) == 0 then
                name = '.'
            end
            f:write(string.format('%s = %d,\n', string.upper(name), x))
        end
        f:close()
        print('Zone name data has been exported to ' .. _addon.path .. '\output\\zones.txt')
    end

    if
        string.lower(args[2]) == 'buffs' or
        string.lower(args[2]) == 'effects' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(_addon.path .. '\\output\\effects.txt', 'w')
        f:write('EFFECT = ID\n')
        for x = 0, 0x300 do
            local name = AshitaCore:GetResourceManager():GetString('statusnames', x)
            if name == nil or string.len(name) == 0 then
                name = '.'
            end
            f:write(string.format('%s = %d,\n', string.upper(name), x))
        end
        f:close()
        print('Status effects data has been exported to ' .. _addon.path .. '\output\\effects.txt')
    end

    if
        string.lower(args[2]) == 'errors' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(_addon.path .. '\\output\\error_strings.txt', 'w')
        f:write('ERROR_STRING = ID\n')
        for x = 0, 0xFF do
            local name = AshitaCore:GetResourceManager():GetString('errors', x)
            if name == nil or string.len(name) == 0 then
                name = '.'
            end
            f:write(string.format('%s = %d,\n', string.upper(name), x))
        end
        f:close()
        print('Error string data has been exported to ' .. _addon.path .. '\output\\error_strings.txt')
    end

    if
        string.lower(args[2]) == 'mobskills' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(_addon.path .. '\\output\\mobskills.txt', 'w')
        f:write('ID (Offset by 256) skill name\n')
        for x = 0, 0x12FF do
            local name = AshitaCore:GetResourceManager():GetString('mobskills', x)
            if name == nil or string.len(name) == 0 then
                name = '.'
            end
            f:write(string.format('%d (%d) %s\n', x + 256, x, name))
        end
        f:close()
        print('mobskill data has been exported to ' .. _addon.path .. '\output\\mobskills.txt')
    end

    if
        string.lower(args[2]) == 'mounts' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(_addon.path .. '\\output\\mounts.txt', 'w')
        f:write('NAME = ID -- Description comment\n')
        for x = 0, 0x7F do
            local name = AshitaCore:GetResourceManager():GetString('mountsname', x)
            local desc = AshitaCore:GetResourceManager():GetString('mountsdesc', x)
            if name == nil or string.len(name) == 0 then
                break
            end
            if desc == nil or string.len(desc) == 0 then
                desc = ''
            end
            f:write(string.format('%s = %d, -- %s\n', string.upper(name), x, desc))
        end
        f:close()
        print('Mount data has been exported to ' .. _addon.path .. '\output\\mounts.txt')
    end

    if
        string.lower(args[2]) == 'regions' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(_addon.path .. '\\output\\regions.txt', 'w')
        f:write('REGION = ID\n')
        for x = 0, 0x7F do
            local name = AshitaCore:GetResourceManager():GetString('regions', x)
            if name == nil or string.len(name) == 0 then
                break
            end
            f:write(string.format('%s = %d,\n', string.upper(name), x))
        end
        f:close()
        print('Region data has been exported to ' .. _addon.path .. '\output\\regions.txt')
    end

    if
        string.lower(args[2]) == 'titles' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(_addon.path .. '\\output\\titles.txt', 'w')
        f:write('TITLE = ID\n')
        for x = 0, 0x800 do
            local name = AshitaCore:GetResourceManager():GetString('titles', x)
            if name == nil or string.len(name) == 0 then
                name = '.'
            end
            f:write(string.format('%s = %d,\n', string.upper(name), x))
        end
        f:close()
        print('Title data has been exported to ' .. _addon.path .. '\output\\titles.txt')
    end

    if
        string.lower(args[2]) == 'keyitems' or
        string.lower(args[2]) == 'all'
    then
        local f = io.open(_addon.path .. '\\output\\keyitems.txt', 'w')
        f:write('KI = ID\n')
        for x = 0, 0x1000 do
            local name = AshitaCore:GetResourceManager():GetString('keyitems', x)
            if name == nil or string.len(name) == 0 then
                name = '.'
            end
            f:write(string.format('%s = %d,\n', string.upper(name), x))
        end
        f:close()
        print('Keyitem data has been exported to ' .. _addon.path .. '\output\\keyitems.txt\n')
    end

    return true
end)
