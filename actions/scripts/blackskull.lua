function onUse(cid, item, fromPosition, itemEx, toPosition)
local sprawdzenie = db.getResult("SELECT `unjustified` FROM `killers` WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ")")
	if(sprawdzenie:getID() == -1) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Sorry, you don't have any frag!")
		return true
	end
	
	doCreatureSay(cid, "Frags sucesfully removed.", TALKTYPE_MONSTER)
	db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ")")
	doPlayerSetSkullEnd(cid, 0, SKULL_WHITE) 
	doTransformItem(item.uid, 2320)
	if(getCreatureSkullType(cid) >= 4) then
		doPlayerSetSkullEnd(cid, 0, SKULL_RED)
		doPlayerSetSkullEnd(cid, 0, SKULL_BLACK) 
	end
	return true
end