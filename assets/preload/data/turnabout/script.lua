local cutsceneCheck = true
function onCreatePost()
    setTimeBarColors('00FF00', '000000')
    setProperty('healthBar.visible', false)
    setProperty('timeBar.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('scoreTxt.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
    setProperty('botplayTxt.visible', false)
    setTextFont('timeTxt', 'ace attorney.otf')
    setTextFont('scoreTxt', 'ace attorney.otf')
    setTextFont('botplayTxt', 'ace attorney.otf')
    setProperty('scoreTxt.scale.x', getProperty('scoreTxt.scale.x')*1.5)
    setProperty('scoreTxt.scale.y', getProperty('scoreTxt.scale.y')*1.5)
    setProperty('timeTxt.scale.x', getProperty('timeTxt.scale.x')*1.5)
    setProperty('timeTxt.scale.y', getProperty('timeTxt.scale.y')*1.5)
    setProperty('botplayTxt.scale.x', getProperty('botplayTxt.scale.x')*1.5)
    setProperty('botplayTxt.scale.y', getProperty('botplayTxt.scale.y')*1.5)
    setProperty('scoreTxt.antialiasing', false)
    for i = 0, getProperty('playerStrums.length')-1 do
        setPropertyFromGroup('playerStrums', i, 'visible', false)
        setPropertyFromGroup('playerStrums', i, 'scale.x', 5)
        setPropertyFromGroup('playerStrums', i, 'scale.y', 5)
        setPropertyFromGroup('opponentStrums', i, 'scale.x', 5)
        setPropertyFromGroup('opponentStrums', i, 'scale.y', 5)
    end
    makeLuaSprite('courtroom', 'background/courtroom', 20, 0)
    scaleObject('courtroom', 4, 4)
    setProperty('courtroom.antialiasing', false)
    addLuaSprite('courtroom', true)
    setProperty('defaultCamZoom', 3)
    setProperty('camGame.zoom', 3)
    startTween('zoomOut', 'this', {defaultCamZoom = 0.98, ['camGame.zoom'] = 0.98}, 0.23, {ease = 'quartInOut', startDelay = 2, onComplete = 'onTweenCompleted'})
end

function onStepHit()
    if curStep > 18 and cutsceneCheck then
        setProperty('healthBar.visible', true)
        setProperty('timeBar.visible', true)
        setProperty('timeTxt.visible', true)
        setProperty('scoreTxt.visible', true)
        if botplay then
        setProperty('botplayTxt.visible', true)
        end
        setProperty('iconP1.visible', true)
        setProperty('iconP2.visible', true)
        for i = 0, getProperty('playerStrums.length')-1 do
            setPropertyFromGroup('playerStrums', i, 'visible', true)
        end
        removeLuaSprite('courtroom', false)
        cutsceneCheck = false
    elseif curStep == 1119 then
        loadGraphic('courtroom', 'background/courtroom happy', 256, 192)
        addAnimation('courtroom', 'idle', {0, 0, 0, 0, 0, 0,0,0,0, 1, 1, 1, 1,1,1,1, 2, 2}, 12, false)
        addLuaSprite('courtroom', true)
        playAnim('courtroom', 'idle', false)
        startTween('zoomIn', 'this', {defaultCamZoom = 1.05, ['camGame.zoom'] = 1.05}, 6, {ease = 'linear', onComplete = 'onTweenCompleted'})
        runTimer('jj', 1)
    end
end

function onTimerCompleted(tag)
    if tag == 'jj' then
        cameraFade('camGame', '000000', 3, true)
    end
end