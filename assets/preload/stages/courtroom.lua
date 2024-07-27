function onCreate()
    makeLuaSprite('crBg', 'background/background', 0, 0)
    setProperty('crBg.antialiasing', false)
    scaleObject('crBg', 4, 4)

    makeLuaSprite('crJudge', 'background/background judjg', (getProperty('crBg.width')/2)-(128*4), 0 - getProperty('crBg.height'))
    setProperty('crJudge.antialiasing', false)
    scaleObject('crJudge', 4, 4)

    makeLuaSprite('benchL', 'background/court benches', 0, 0 + (getProperty('crBg.height')-44*4))
    setProperty('benchL.antialiasing', false)
    scaleObject('benchL', 4, 4)

    makeLuaSprite('benchR', 'background/court benches', getProperty('crBg.width')-(206*4), 0 + (getProperty('crBg.height')-44*4))
    setProperty('benchR.flipX', true)
    setProperty('benchR.antialiasing', false)
    scaleObject('benchR', 4, 4)

    addLuaSprite('crBg', false)
    addLuaSprite('crJudge', false)
    addLuaSprite('benchL', true)
    addLuaSprite('benchR', true)
    setProperty('cameraSpeed', 300) 
end