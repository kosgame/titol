function skinMonster(cid,item,skin)
local random = math.random(1,15)
if(random < 4) then
doPlayerAddItem(cid,skin,1)
doSendMagicEffect(getThingPos(item.uid), CONST_ME_MAGIC_GREEN)
else
doSendMagicEffect(getThingPos(item.uid), CONST_ME_BLOCKHIT)
end
doTransformItem(item.uid,item.itemid+1)
end
minotaurs = {3090, 2871, 2866, 2876}
lizards = {4259, 4262, 4256}
greendragons = {3104, 2844}
reddragons = {2881}
behemoth = {2931}
bonebeast = {3031}
cube = {7441, 7444, 7445}
cube2 = {7442}
function onUse(cid, item, fromPosition, itemEx, toPosition)
local random = math.random(1,10)
if isInArray(minotaurs, itemEx.itemid) == TRUE then
skinMonster(cid, itemEx, 5878)
elseif isInArray(lizards, itemEx.itemid) == TRUE then
skinMonster(cid, itemEx, 5876)
elseif isInArray(greendragons, itemEx.itemid) == TRUE then
skinMonster(cid, itemEx, 5877)
elseif isInArray(reddragons, itemEx.itemid) == TRUE then
skinMonster(cid, itemEx, 5948)
elseif isInArray(behemoth, itemEx.itemid) == TRUE then
skinMonster(cid, itemEx, 5893)
elseif isInArray(bonebeast, itemEx.itemid) == TRUE then
skinMonster(cid, itemEx, 5925)
elseif isInArray(cube, itemEx.itemid) == TRUE and random < 4 then
doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_HITAREA)
doTransformItem(itemEx.uid, itemEx.itemid + 1)
elseif isInArray(cube2, itemEx.itemid) == TRUE and random < 4 then
doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_HITAREA)
doTransformItem(itemEx.uid, itemEx.itemid + 2)
elseif (isInArray(cube, itemEx.itemid) == TRUE or isInArray(cube2, itemEx.itemid) == TRUE) and random > 4 then
doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_HITAREA)
doRemoveItem(itemEx.uid)
else
doPlayerSendCancel(cid,"Sorry, not possible.")
return TRUE
end
end 