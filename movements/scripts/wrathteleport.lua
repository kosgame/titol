local back = {x=33083, y=31214, z=8}
local draken = {x=33094, y=31119, z=12}
local safe = {x=33212, y=31066, z=9}
local zao = {x=33137, y=31247, z=6}
local zlak = {x=33077, y=31218, z=8}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    if item.actionid == 7300 then
		doTeleportThing(cid,safe)
		doSendMagicEffect(getCreaturePosition(cid),47)
	elseif item.actionid == 7301 then
		doTeleportThing(cid,zao)
		doSendMagicEffect(getCreaturePosition(cid),47)
	elseif item.actionid == 7302 then
		doTeleportThing(cid,zlak)
		doSendMagicEffect(getCreaturePosition(cid),47)
     elseif item.actionid == 7304 then
		doTeleportThing(cid,draken)
		doSendMagicEffect(getCreaturePosition(cid),47)
      elseif item.actionid == 7305 then
		doTeleportThing(cid,back)
		doSendMagicEffect(getCreaturePosition(cid),47)
	else
		doTeleportThing(cid, fromPosition)
		doSendMagicEffect(getCreaturePosition(cid),47)
	end
end