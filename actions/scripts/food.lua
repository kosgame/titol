function onUse(cid, item, fromPosition, itemEx, toPosition)
        if doPlayerRemoveMoney ( cid, 10) then
         doPlayerAddItem(cid,1294,10)
		 else
		 doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You don\'t have money.")
end
return true
end
