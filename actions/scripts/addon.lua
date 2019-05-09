function onUse(cid, item, fromPosition, itemEx, toPosition)

-- Storage IDs --

fcitizen     = 22942 
scitizen     = 22943

    addon = getPlayerStorageValue(cid,scitizen)
    if addon == -1 then
	if getPlayerItemCount(cid,11138) >= 1 then
	doPlayerRemoveItem(cid,11138,1)
	 doSendMagicEffect(getCreaturePosition(cid), 13)
	 doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Congratulations! you purchased full Warmaster Outfit!")
	 setPlayerStorageValue(cid,scitizen,1)
	             doPlayerAddOutfit(cid, 335, 3)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 336, 3)
			end
			return TRUE
			end
			end
			