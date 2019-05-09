local waittime = 5
local storage = 5568

function onUse(cid, item, fromPosition, itemEx, toPosition)

 if exhaustion.get(cid, storage) == FALSE then
                exhaustion.set(cid, storage, waittime)
        else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You have to wait " .. exhaustion.get(cid, storage) .. " seconds.") 
        return true
       end  

	local firstPlayerPosition = {x = 32354, y = 32228, z = 8, stackpos = STACKPOS_TOP_CREATURE}
	local getFirstPlayer = getThingFromPos(firstPlayerPosition)
	local secondPlayerPosition = {x = 32356, y = 32228, z = 8, stackpos = STACKPOS_TOP_CREATURE}
	local getSecondPlayer = getThingFromPos(secondPlayerPosition)
	local arenaLevel = 120
	local firstPlayerLevel = getPlayerLevel(getFirstPlayer.uid)
	local secondPlayerLevel = getPlayerLevel(getSecondPlayer.uid)
	local newFirstPlayerPosition = {x = 32355, y = 32229, z = 13}
	local newSecondPlayerPosition = {x = 32360, y = 32229, z = 13}
	if(item.uid == 7001) then
		if(getFirstPlayer.itemid > 0 and getSecondPlayer.itemid > 0) then
			if(firstPlayerLevel >= arenaLevel and secondPlayerLevel >= arenaLevel) then
				for arenax = 32352, 32363 do
					for arenay = 32226, 32232 do
						local arenaPosition = {x=arenax, y=arenay, z=13, stackpos=253}
						local arenaCreature = getThingFromPos(arenaPosition)
						if(arenaCreature.itemid > 0 and isPlayer(arenaCreature.uid) == FALSE) then
							if(isMonster(arenaCreature.uid) == TRUE) then
								doRemoveCreature(arenaCreature.uid)
							end
						elseif(arenaCreature.itemid > 0 and isPlayer(arenaCreature.uid) == TRUE) then
							doPlayerSendCancel(cid, "Wait for current duel to end.")
							return TRUE
						end
					end
				end
				if(item.itemid == 1945) then
					doTransformItem(item.uid, 1946)
				elseif(item.itemid == 1946) then
					doTransformItem(item.uid, 1945)
				end
				doSendMagicEffect(firstPlayerPosition, 2)
				doSendMagicEffect(secondPlayerPosition, 2)
				doTeleportThing(getFirstPlayer.uid, newFirstPlayerPosition)
				doTeleportThing(getSecondPlayer.uid, newSecondPlayerPosition)
				doSendMagicEffect(newFirstPlayerPosition, 10)
				doSendMagicEffect(newSecondPlayerPosition, 10)
				doPlayerSendTextMessage(getFirstPlayer.uid, 18, "FIGHT!")
				doPlayerSendTextMessage(getSecondPlayer.uid, 18, "FIGHT!")
			else
				doPlayerSendCancel(cid, "Both fighters must have level 120.")
			end
		else
			doPlayerSendCancel(cid, "You need 2 players for a duel.")
		end
	end
	return TRUE
end