-- Inquisition Nexus

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 6669 then
   		queststatus = getPlayerStorageValue(cid,6669)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You Destroy a Shadow of Nexus. Go to the Thais on the items.")
   			setPlayerStorageValue(cid,6669,1)
   		else
   			doPlayerSendTextMessage(cid,22,"Nexus has Destroyed.")
   		end
	else
		return 0
   	end

   	return 1
end
