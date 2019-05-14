

local arenasCoordinates = {
    [2510] = {
        leftTop= {x = 30919, y = 31966, z = 7},
        rightBottom = {x = 30925, y = 31972, z = 7},
        wejscie = {x = 30922, y = 31971, z = 7},
        wyjscie = {x = 30919, y = 31974, z = 7},
        wyscieAwaryjne = {x = 30922, y = 31975, z = 7},
        fieldToDoMonster = {x = 30919, y = 31966, z = 7},
        spawnMonster = {x = 30922, y = 31971, z = 7}
    }
    --[2510] = { {x = 30919, y = 31966, z = 7}, {x = 30925, y = 31972, z = 7}, {x = 30922, y = 31971, z = 7}, {x = 30919, y = 31974, z = 7}, {x = 30922, y = 31975, z = 7}, {x = 30919, y = 31966, z = 7}, {x = 30922, y = 31971, z = 7}}

}
local arenasStorages = {
    [2510] = {
        global_storage = 16592
    }
}

local function deleteMonster(cid, fromPosition, toPosition)
    local x, y, z = 0, 0, 0
    local checking= {x = fromPosition.x, y = fromPosition.y, z = fromPosition.z, stackpos = 253}
    local creatures = {}
    local items = {}
    local ileMonsterow = 0
    local ileitemow =0


    for x = fromPosition.x, toPosition.x do
        for y = fromPosition.y, toPosition.y do
            for z = fromPosition.z, toPosition.z do
                local creature = getTopCreature({x = x, y = y, z = z}).uid
                if(creature > 0) then
                    table.insert(creatures, creature)
                    ileMonsterow = ileMonsterow + 1
                end
                doCleanTile({x=x,y=y,z=z})

            end
        end
    end

    if ileMonsterow >0 then
        for _,c in pairs(creatures) do
            if isMonster(c) then
                doRemoveCreature(c)
            end
        end
    end

end

function onStepIn(cid, item, pos, fromPosition)
    local uniqueId = item.actionid
    local j = uniqueId/10 - 251;

    if j>0 then
        arenasCoordinates[uniqueId] = {
            leftTop = { x = 30919-11*j, y = 31966, z = 7 },
            rightBottom = { x = 30925-11*j, y = 31972, z = 7 },
            wejscie = { x = 30922-11*j, y = 31971, z = 7 },
            wyjscie = { x = 30919-11*j, y = 31974, z = 7 },
            wyscieAwaryjne = { x = 30922-11*j, y = 31975, z = 7 },
            fieldToDoMonster = { x = 30922-11*j, y = 31966, z = 7 },
            spawnMonster = { x = 30922-11*j, y = 31971, z = 7 }
        }

        arenasStorages[uniqueId] = {
            global_storage = 16592+j
        }
        doPlayerSendTextMessage(cid, 5, "elo petla")
        doPlayerSendTextMessage(cid, 5, j)
    end

    doPlayerSendTextMessage(cid, 5, uniqueId)
    local myPositions = arenasCoordinates[uniqueId]
    local storage_global = arenasStorages[uniqueId]


    doPlayerSendTextMessage(cid, 5, getGlobalStorageValue(storage_global.global_storage))
    if getGlobalStorageValue(storage_global.global_storage) == -1 then
        doPlayerSendTextMessage(cid, 25, 'Wszedles na 10 minut do pomieszczenia')
        setGlobalStorageValue(storage_global.global_storage, 1)

        local pos = {from = myPositions.leftTop, to = myPositions.rightBottom} -- range of room needed to prevent the creation of more than one monster see a picture (x and y)
        doPlayerSendTextMessage(cid, 5,"FROM X")
        doPlayerSendTextMessage(cid, 5, pos.from.x)
        doPlayerSendTextMessage(cid, 5,"Mabyc X")
        doPlayerSendTextMessage(cid, 5, myPositions.leftTop.x)

        doPlayerSendTextMessage(cid, 5,"From Y")
        doPlayerSendTextMessage(cid, 5, pos.from.y)

        doPlayerSendTextMessage(cid, 5,"To X")
        doPlayerSendTextMessage(cid, 5, pos.to.x)
        doPlayerSendTextMessage(cid, 5,"To Y")
        doPlayerSendTextMessage(cid, 5, pos.to.y)

        deleteMonster(cid, pos.from, pos.to);
        doTeleportThing(cid, myPositions.wejscie) -- teleport do srodka
        return addEvent(
                function()
                    if isPlayer(cid) and getGlobalStorageValue(storage_global) == 1 then
                        doTeleportThing(cid, myPositions.wyjscie)
                        doPlayerSendTextMessage(cid, 25, 'Czas minal')
                        return setGlobalStorageValue(storage_global, -1)
                    end
                end,
                2 * 60 * 1000, -- How long exp
                cid, storage_global.global_storage)
    else
        doTeleportThing(cid, fromPosition)
        return doPlayerSendTextMessage(cid, 25, 'Ktos juz sie znajduje w roomie lub nie posiadasz Vip Coin!')
    end
    return true
end