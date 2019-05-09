function onStepIn(cid, item, pos)

local thais = {x=22983, y=21289, z=7}

    if item.actionid == 30033 then
        doPlayerSetTown(cid,18) 
		doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Zenit")
        end
    return 1
end  
