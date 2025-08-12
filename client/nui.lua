function ShowTextUI(text, position, type, duration, icon, permanent)
    local options = {
        position = position or 'center',
        type = type or 'default',
        duration = duration or 0,
        icon = icon,
        permanent = permanent or false
    }
    
    SendNUIMessage({
        action = 'show',
        text = text,
        options = options
    })
end

function HideTextUI()
    SendNUIMessage({
        action = 'hide'
    })
end

exports('ShowTextUI', ShowTextUI)
exports('HideTextUI', HideTextUI)

RegisterCommand('test_textui', function(source, args, rawCommand)
    local positions = {'center', 'middle-left', 'middle-right', 'top-left', 'top-center', 'top-right'}
    local types = {'default', 'success', 'warning', 'error', 'info', 'purple', 'pink', 'cyan', 'orange'}
    local icons = {
        default = 'fas fa-info-circle',
        success = 'fas fa-check-circle',
        warning = 'fas fa-exclamation-triangle',
        error = 'fas fa-times-circle',
        info = 'fas fa-info-circle',
        purple = 'fas fa-star',
        pink = 'fas fa-heart',
        cyan = 'fas fa-water',
        orange = 'fas fa-fire'
    }
    
    if args[1] then
        local testType = args[1]:lower()
        
        if testType == 'all' then
            for i, pos in ipairs(positions) do
                local randomType = types[math.random(#types)]
                ShowTextUI('Test ' .. pos .. ' position', pos, randomType, 5000, icons[randomType], false)
                Wait(1000)
            end
        elseif testType == 'hide' then
            HideTextUI()
        elseif testType == 'single' then
            local randomPos = positions[math.random(#positions)]
            local randomType = types[math.random(#types)]
            ShowTextUI('Single test: ' .. randomPos, randomPos, randomType, 3000, icons[randomType])
        elseif testType == 'icons' then
            for i, iconType in ipairs(types) do
                ShowTextUI(iconType:upper() .. ' with icon', 'center', iconType, 2000, icons[iconType], false)
                Wait(2500)
            end
        elseif testType == 'colors' then
            for i, colorType in ipairs(types) do
                ShowTextUI(colorType:upper() .. ' color variant', 'center', colorType, 2500, icons[colorType], false)
                Wait(3000)
            end
        elseif testType == 'permanent' then
            ShowTextUI('This is a PERMANENT text UI!', 'center', 'info', 0, icons.info, true)
        elseif testType == 'temporary' then
            ShowTextUI('This will disappear in 5 seconds', 'middle-right', 'warning', 5000, icons.warning, false)
        else
            for _, pos in ipairs(positions) do
                if pos == testType then
                    ShowTextUI('Testing ' .. pos .. ' position!', pos, 'info', 4000, icons.info)
                    return
                end
            end
        end
    end
end, false)
