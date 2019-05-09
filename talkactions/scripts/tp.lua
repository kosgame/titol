function onSay(p, words, param)
local t = string.explode(param, ",")
local pos = {x = t[1], y = t[2], z = t[3]}
if(doTeleportThing(p, pos) == true) then
doSendMagicEffect(getCreaturePosition(p), CONST_ME_TELEPORT)
else
doSendMagicEffect(getCreaturePosition(p), CONST_ME_POFF)
end
return 1
end