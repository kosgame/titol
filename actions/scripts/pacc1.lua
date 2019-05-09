function onUse(cid, item, frompos, item2, topos)
if item.itemid == 2298 then
local playerpos = getCreaturePosition(cid)
doRemoveItem(item.uid,1)
doPlayerAddPremiumDays(cid,30)
doSendMagicEffect(playerpos,12)
doPlayerSendTextMessage(cid,22,"Added 30 Days of Premium Account!")
end
end
