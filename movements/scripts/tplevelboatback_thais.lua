function onStepIn(cid, item, pos)

local kurwatp = {x=32346, y=32223, z=7}
local backtp = {x=32313, y=32213, z=6}

   if getPlayerLevel(cid) >= 320 then
   if item.actionid == 50039 then
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