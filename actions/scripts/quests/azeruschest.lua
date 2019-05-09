-- 10th mission by QuaS~ 

function onUse(cid, item, frompos, item2, topos) 

       if item.actionid == 58267 then 
           queststatus = getPlayerStorageValue(cid,102504) 
           if queststatus == -1 then 
               doPlayerSendTextMessage(cid,22,"You have found an Yalahari Mask.") 
               doPlayerAddItem(cid,9778,1) 
               setPlayerStorageValue(cid,102504,1) 
				if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 325, 2)
			doPlayerAddOutfit(cid, 325, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 324, 2)
			doPlayerAddOutfit(cid, 324, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
           else 
               doPlayerSendTextMessage(cid,22,"It is empty.") 
           end 
       elseif item.actionid == 58268 then 
           queststatus = getPlayerStorageValue(cid,102504) 
           if queststatus == -1 then 
               doPlayerSendTextMessage(cid,22,"You have found an Yalahari Armor.") 
               doPlayerAddItem(cid,9776,1) 
               setPlayerStorageValue(cid,102504,1) 
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 325, 2)
			doPlayerAddOutfit(cid, 325, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 324, 2)
			doPlayerAddOutfit(cid, 324, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
           else 
               doPlayerSendTextMessage(cid,22,"It is empty.") 
           end 
       elseif item.actionid == 58269 then 
           queststatus = getPlayerStorageValue(cid,102504) 
           if queststatus == -1 then 
               doPlayerSendTextMessage(cid,22,"You have found an Yalahari Leg Piece.") 
               doPlayerAddItem(cid,9777,1) 
               setPlayerStorageValue(cid,102504,1) 
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 325, 2)
			doPlayerAddOutfit(cid, 325, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 324, 2)
			doPlayerAddOutfit(cid, 324, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
           else 
               doPlayerSendTextMessage(cid,22,"It is empty.") 
           end 
    else 
        return 0 
       end 

       return 1 
end  