local config = {
	price = 10000,
	itemId = 2173
}

function onSay(cid, words, param)
	local count = 1
	if isNumber(param) == TRUE and param < 21 then
		count = param
	end
	
	if doPlayerRemoveMoney(cid, config.price * count) == TRUE then
		for i = 1, count do
			doPlayerAddItem(cid, config.itemId, 1)
			doSendMagicEffect(getPlayerPosition(cid), 12)
		end
	else
		doPlayerSendCancel(cid, "You need "..count * config.price.." gold to buy "..count.." AoL(s).")
		doSendMagicEffect(getPlayerPosition(cid), 2)
	end
	
	return TRUE
end
