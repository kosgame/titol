function onUse(cid, item, frompos, item2, topos)
if item.uid == 32145 then
 if item.itemid == 1946 then

 player1pos = {x=33091, y=31019, z=2, stackpos=253}
 player1 = getThingfromPos(player1pos)

 player2pos = {x=33092, y=31019, z=2, stackpos=253}
 player2 = getThingfromPos(player2pos)


  if player1.itemid > 0 and player2.itemid > 0 then

  player1level = getPlayerLevel(player1.uid)
  player2level = getPlayerLevel(player2.uid)


  questlevel = 100

  if player1level >= questlevel then

	  queststatus1 = getPlayerStorageValue(player1.uid,6300)
	  queststatus2 = getPlayerStorageValue(player2.uid,6300)
	  

	  if queststatus1 == -1 and queststatus2 == -1 then

	if 1==1 then
	demon1pos = {x=33072, y=31039, z=3}
        demon2pos = {x=33075, y=31039, z=3}
	
 
   doSummonCreature("Baron Brute", demon1pos)
   doSummonCreature("Tirecz", demon2pos)


	nplayer1pos = {x=33066, y=31039, z=3}
	nplayer2pos = {x=33066, y=31041, z=3}
	

   doSendMagicEffect(player1pos,2)
   doSendMagicEffect(player2pos,2)
   

   doTeleportThing(player1.uid,nplayer1pos)
   doTeleportThing(player2.uid,nplayer2pos)
   

	 doSendMagicEffect(nplayer1pos,10)
	 doSendMagicEffect(nplayer2pos,10)


	 doTransformItem(item.uid,1945)

	else
	 doPlayerSendCancel(cid,"Sorry, not possible.")
	end
   else
	doPlayerSendCancel(cid,"Sorry, not possible.")
   end
  else
  doPlayerSendCancel(cid,"Sorry, not possible.")
  end
  end
 if item.uid == 32145 then
 if item.itemid == 1945 then
doTransformItem(item.uid,1946) 




end
end
 return 1
end
end
end