function onSay(cid, words, param)
if(getPlayerBlessing(cid,1)) then
			doPlayerSendCancel(cid,'You are blessed!')
		elseif(doPlayerRemoveMoney(cid,100000)) then
			for b=1,5 do
				doPlayerAddBlessing(cid,b)
			end
			doSendMagicEffect(getThingPosition(cid),CONST_ME_HOLYDAMAGE)
			doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have been blessed by the gods!')
		else
			doSendMagicEffect(getThingPosition(cid),CONST_ME_POFF)
			doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,"You need 10 crystal coin to get blessed!")
		end
	return 1
end