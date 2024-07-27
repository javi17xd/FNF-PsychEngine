-- Script edited and added stuff by Bluespike (@FrideyNehgGuy on twitter)
-- Sky Remanifested

function onCreatePost()
        makeLuaSprite('borderL', 'aspect',0,0)
        addLuaSprite('borderL', false)
        setObjectCamera("borderL", "other")
        for i = 0, getProperty('opponentStrums.length') do -- do unvisible a opponent strumline
            setPropertyFromGroup('opponentStrums', i, 'visible', false);
        end
            
        if not middlescroll then -- moves notes to middle position
            for i = 0, getProperty('playerStrums.length') do
                setPropertyFromGroup('playerStrums', i, 'x', getPropertyFromGroup('playerStrums', i, 'x') - 320);
            end
        end
end

function onUpdate(elapsed)
    for i = 0, 9 do
        if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
            setPropertyFromGroup('unspawnNotes', i, 'visible', false)
        end
    end
end