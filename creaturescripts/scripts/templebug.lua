function onLogin(cid)
	if getPlayerLastLoginSaved(cid) == 0 then
		local p = getArea(getTownTemplePosition(getPlayerTown(cid)), 5, 5)
		doTeleportThing(cid, p[math.random(#p)])
	end
	return true
end