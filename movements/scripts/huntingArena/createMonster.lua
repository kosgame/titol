local arenasCoordinates = {
    [2511] = {
        leftTop= {x = 30919, y = 31966, z = 7},
        rightBottom = {x = 30925, y = 31972, z = 7},
        wejscie = {x = 30922, y = 31971, z = 7},
        wyjscie = {x = 30919, y = 31974, z = 7},
        wyscieAwaryjne = {x = 30922, y = 31975, z = 7},
        fieldToDoMonster = {x = 30919, y = 31966, z = 7},
        spawnMonster = {x = 30922, y = 31971, z = 7}
    }
}
local arenasStorages = {
    [2511] = {
        global_storage = 16592
    }
}

local function getCreaturesInRange(fromPosition, toPosition)
    local x, y, z = 0, 0, 0
    local creatures = {}
    for x = fromPosition.x, toPosition.x do
        for y = fromPosition.y, toPosition.y do
            for z = fromPosition.z, toPosition.z do
                local creature = getTopCreature({x = x, y = y, z = z}).uid
                if(creature > 0) then
                    table.insert(creatures, creature)
                end
            end
        end
    end
    return creatures
end

local function getMonstersInRange(fromPosition, toPosition)
    local creatures = getCreaturesInRange(fromPosition, toPosition)
    local monsters = {}
    for _, creature in ipairs(creatures) do
        if(isMonster(creature)) then
            table.insert(monsters, creature)
        end
    end
    return monsters
end

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    local uniqueId = item.actionid
    local j = uniqueId/10 - 251;

    if j>0 then
        arenasCoordinates[uniqueId] = {
            leftTop = { x = 30922-11*j, y = 31966, z = 7 },
            rightBottom = { x = 30928-11*j, y = 31972, z = 7 },
            wejscie = { x = 30922-11*j, y = 31971, z = 7 },
            wyjscie = { x = 30922-11*j, y = 31974, z = 7 },
            wyscieAwaryjne = { x = 30922-11*j, y = 31975, z = 7 },
            fieldToDoMonster = { x = 30922-11*j, y = 31966, z = 7 },
            spawnMonster = { x = 30924-11*j, y = 31971, z = 7 }
        }

        arenasStorages[uniqueId] = {
            global_storage = 16592+j
        }
        doPlayerSendTextMessage(cid, 5, "elo petla")
        doPlayerSendTextMessage(cid, 5, j)
    end
    local storage_global = arenasStorages[item.actionid] -- whenever the next room you need to change the value!
    local myPositions = arenasCoordinates[item.actionid]
    local pos = {from = myPositions.leftTop, to = myPositions.rightBottom} -- range of room needed to prevent the creation of more than one monster see a picture (x and y)


    if isPlayer(cid) and getGlobalStorageValue(storage_global.global_storage) == 1 then

        mons = getMonstersInRange(pos.from, pos.to)
        m = 0
        for i = 1, #mons do

            if getCreatureName(mons[i]) == 'Dragon' then -- Monster Name
                m = m + 1
            end
        end
        if m == 0 then
            doCreateMonster('Dragon', myPositions.spawnMonster) -- Monster name and respawn ! See picture ( respawn )
            return true
        else
            return doPlayerSendCancel(cid, 'Sorry, creature is now spawned.') and true
        end
    else

        return true
    end
end