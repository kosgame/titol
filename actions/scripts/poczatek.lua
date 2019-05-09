function onUse(cid, item, frompos, item2, topos)
local nagroda = 2160
local iloscnagrody = 10
local reward = nagroda, iloscnagrody
local lvl = 50
local effect = {od = 28, to = 31}
local queststorage = 51137
local storagevalute = 1
effectloss = math.random(effect.od, effect.to)
local effectloss2 = math.random(effect.od, effect.to)
local effectno = 2
playerlvl = getPlayerLevel(cid)
playerpos = getPlayerPosition(cid)
playerstorage = getPlayerStorageValue(cid,queststorage)
capnagroda = getItemWeightById(2160,5)
capplayer = getPlayerFreeCap(cid)
if playerstorage == -1 then
		if playerlvl >= lvl then
			if capplayer >= capnagroda then
						doPlayerAddItem(cid,2160, iloscnagrody)
						doPlayerSendTextMessage(cid,25,"You have found a 10 crystal coins.")
						doSendMagicEffect(playerpos, effectloss2)
						setPlayerStorageValue(cid,queststorage,storagevalute)
			else
				doPlayerSendTextMessage(cid,25,"You dont have cap for the prize.")
				doSendMagicEffect(playerpos, effectno)
			end
		else
				doPlayerSendTextMessage(cid,25,"You need level 50 to get prize.")
				doSendMagicEffect(playerpos, effectno)
		end
	else
		doPlayerSendTextMessage(cid,25,"It is empty.")
		doSendMagicEffect(playerpos, effectno)
	end
	return true
end