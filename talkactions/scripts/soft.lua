local config = {
    cost = 15000, -- Ile kosztuje naprawienie softow
    idsoft = 2640, -- ID softow
    idwornsoft = 10021 -- ID zepsutych softow    
    }
function onSay(cid, words, param)
local pos = getCreaturePosition(cid)
if getPlayerItemCount(cid, config.idwornsoft) >= 1 then
if getPlayerMoney(cid) >= config.cost then
doPlayerBuyItem(cid, config.idsoft, 1, config.cost, 1)
doPlayerRemoveItem(cid, config.idwornsoft, 1)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your soft boots has been repaired.")
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You don\'t have enough money!")
end
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You don\'t have worn soft boots and enough money!")
end
return TRUE
end  