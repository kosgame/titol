function onStepIn(cid, item, pos, fromPosition)
    local storage_global = 16591 -- whenever the next room you need to change the value!
    if getGlobalStorageValue(storage_global) == -1 then
        doPlayerSendTextMessage(cid, 25, 'Wszedles na 10 minut do pomieszczenia')
        setGlobalStorageValue(storage_global, 1)
        doTeleportThing(cid, {x = 31228, y = 32393, z = 7}) -- Position sqm see picture (welcome)
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