function onEquip(cid, item, slot)
	setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) + 100)
	return true
end
 
function onDeEquip(cid, item, slot)
	setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) - 100)
	return true
end