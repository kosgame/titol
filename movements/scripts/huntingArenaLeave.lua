function onStepIn(cid, item, pos, fromPosition)
    local storage_global = 16591 -- whenever the next room you need to change the value!
    if isPlayer(cid) then
        setGlobalStorageValue(storage_global, -1)
        doTeleportThing(cid, {x = 31229, y = 32393, z = 7}) -- Position sqm see picture (end exp)
        doPlayerSendTextMessage(cid, 25, 'Zegnamy i zapraszamy ponownie!')
        stopEvent(po_czasie)
        stopEvent(teleport)
    end
    return true
end