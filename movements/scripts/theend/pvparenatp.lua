function onStepIn(cid, item, fromPosition, itemEx, toPosition)
local playerPosition = getPlayerPosition(cid) 
local newPosition = {x=32350, y=32230, z=8}
local gethp = getCreatureHealth(cid)
local getmaxhp = getCreatureMaxHealth(cid)
local add = getmaxhp - gethp
	if(item.actionid == 7709) then
		getThingfromPos(playerPosition) 
		doSendMagicEffect(playerPosition,2) 
		doTeleportThing(cid,newPosition) 
		doSendMagicEffect(newPosition,10)
		doCreatureAddHealth(cid, add, TRUE)
		doRemoveCondition(cid, CONDITION_INFIGHT)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You have escaped.")
	end
return TRUE
end