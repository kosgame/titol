local config = {
    cost = 15000, -- Ile kosztuje naprawienie firewalker
    idfirewalker = 9933, -- ID firewalker
    idwornfirewalker = 10022 -- ID zepsutych firewalker    
    }
function onSay(cid, words, param)
local pos = getCreaturePosition(cid)
if getPlayerItemCount(cid, config.idwornfirewalker) >= 1 then
if getPlayerMoney(cid) >= config.cost then
doPlayerBuyItem(cid, config.idfirewalker, 1, config.cost, 1)
doPlayerRemoveItem(cid, config.idwornfirewalker, 1)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your firewalker boots has been repaired.")
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You don\'t have enough money!")
end
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You don\'t have worn firewalker boots and enough money!")
end
return TRUE
end  