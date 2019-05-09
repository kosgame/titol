function onUse(cid, item, frompos, item2, topos)
if item.itemid == 2307 then
local playerpos = getCreaturePosition(cid)
doRemoveItem(item.uid,1)
doPlayerAddPremiumDays(cid,1)
doSendMagicEffect(playerpos,12)
doPlayerSendTextMessage(cid,22,"Add to one days premium to your account!")
end
end
