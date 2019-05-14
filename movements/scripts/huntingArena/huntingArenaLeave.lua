local arenasCoordinates = {
    [2512] = {
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
    [2512] = {
        global_storage = 16592
    }
}

function onStepIn(cid, item, pos, fromPosition)
    local uniqueId = item.actionid
    local j = uniqueId/10 - 251;

    if j>0 then
        arenasCoordinates[uniqueId] = {
            leftTop = { x = 30919-11*j, y = 31966, z = 7 },
            rightBottom = { x = 30925-11*j, y = 31972, z = 7 },
            wejscie = { x = 30922-11*j, y = 31971, z = 7 },
            wyjscie = { x = 30922-11*j, y = 31974, z = 7 },
            wyscieAwaryjne = { x = 30922-11*j, y = 31975, z = 7 },
            fieldToDoMonster = { x = 30919-11*j, y = 31966, z = 7 },
            spawnMonster = { x = 30922-11*j, y = 31971, z = 7 }
        }

        arenasStorages[uniqueId] = {
            global_storage = 16592+j
        }

    end

    doPlayerSendTextMessage(cid, 25, uniqueId)
    local myPositions = arenasCoordinates[uniqueId]
    local storage_global = arenasStorages[uniqueId]

    doPlayerSendTextMessage(cid, 5, 'left Top: ')
    doPlayerSendTextMessage(cid, 5, myPositions.leftTop.x)
    doPlayerSendTextMessage(cid, 5, 'right bot: ')
    doPlayerSendTextMessage(cid, 5, myPositions.rightBottom.x)
    if isPlayer(cid) then
        setGlobalStorageValue(storage_global.global_storage, -1)
        doTeleportThing(cid, myPositions.wyjscie) -- Position sqm see picture (end exp)
        doPlayerSendTextMessage(cid, 25, 'Zegnamy i zapraszamy ponownie!')
        --stopEvent(po_czasie)
        --stopEvent(teleport)
    end
    return true
end