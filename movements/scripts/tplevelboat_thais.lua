function onStepIn(cid, item, pos)

local kurwatp = {x=32312, y=32210, z=6}
local backtp = {x=32353, y=32226, z=7}

   if getPlayerLevel(cid) >= 320 then
   if item.actionid == 50040 then
    doTeleportThing(cid,kurwatp)
    doSendMagicEffect(getCreaturePosition(cid),10)
 end
 else
    doTeleportThing(cid,backtp)
    doPlayerSendTextMessage(cid,25,"Only level 320 or higher are able to enter this portal.")
	doSendMagicEffect(getCreaturePosition(cid),2)
       end
   return 1
end 