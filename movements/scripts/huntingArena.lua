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
                doPlayerSendTextMessage(cid, 25, 'X:'..tostring(x)..' Y: '..tostring(y))
                doPlayerSendTextMessage(cid, 5, 'ITEM:'..tostring(item))
                local creature = getTopCreature({x = x, y = y, z = z}).uid
                if(creature > 0) then
                    doPlayerSendTextMessage(cid, 25, 'Dupa')
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
    local storage_global = 16591 -- whenever the next room you need to change the value!
    if getGlobalStorageValue(storage_global) == -1 then
        doPlayerSendTextMessage(cid, 25, 'Wszedles na 10 minut do pomieszczenia')
        setGlobalStorageValue(storage_global, 1)
        local pos = {from = {x = 31221, y = 32392, z = 7}, to = {x = 31224, y = 32395, z = 7}} -- range of room needed to prevent the creation of more than one monster see a picture (x and y)
        deleteMonster(cid, pos.from, pos.to);
        doTeleportThing(cid, {x = 31225, y = 32393, z = 7}) -- Position sqm see picture (welcome)
        return addEvent(function()
            if isPlayer(cid) and getGlobalStorageValue(storage_global) == 1 then
                doTeleportThing(cid, {x = 31225, y = 32393, z = 7}
                ) -- Position sqm see picture (end exp)
                doPlayerSendTextMessage(cid, 25, 'Czas minal')
                return setGlobalStorageValue(storage_global, -1)
            end end,
                10 * 60 * 1000, -- How long exp
                cid, storage_global)
    else
        doTeleportThing(cid, fromPosition)
        return doPlayerSendTextMessage(cid, 25, 'Ktos juz sie znajduje w roomie lub nie posiadasz Vip Coin!')
    end
    return true
end