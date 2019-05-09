function onUse(cid, item, fromPosition, itemEx, toPosition)
    if getCreatureSkullType(cid) == SKULL_RED then
				db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ")")
                doCreatureSetSkullType(cid,0)
                doPlayerSendTextMessage(cid,25,"Your frags and skull have been removed!")
                doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MAGIC_RED)
                doRemoveItem(item.uid, 1)
                                doPlayerSetSkullEnd(cid, 0, getPlayerSkullType(cid))

    else
        doPlayerSendCancel(cid, "You do not have a red skull.")
		doSendMagicEffect(getPlayerPosition(cid),2)
    end

    return TRUE
end  