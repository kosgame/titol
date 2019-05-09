function onStepIn(cid, item, pos)

local thais = {x=22809, y=21126, z=7}

    if item.actionid == 30034 then
        doPlayerSetTown(cid,19) 
		doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Vinea")
        end
    return 1
end  
