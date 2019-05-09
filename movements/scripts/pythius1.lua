function onStepIn(cid, item, pos)

local tam = {x=32560, y=31404, z=15}

    if item.actionid == 15185 then
		doTeleportThing(cid,tam)
        doSendMagicEffect(getCreaturePosition(cid),17)
		local tp = doRemoveItem(item.uid, 1387)
        end
    return 1
end  