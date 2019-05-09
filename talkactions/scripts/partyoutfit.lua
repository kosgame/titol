local config = {
	exhaustionInSeconds = 30,
        storage = 34535
}

function onSay(cid, words, param)
        if(exhaustion.check(cid, config.storage) == TRUE) then
                doPlayerSendCancel(cid, "You can change outfit only 1 time per " .. config.exhaustionInSeconds .. " seconds.")
                return TRUE
        end

        local members = getPartyMembers(cid)
        if(members == FALSE) then
                doPlayerSendCancel(cid, "Sorry, you're not in a party.")
                return TRUE
        end

	local lastN = table.maxn(members)
	if(lastN <= 1) then
		doPlayerSendCancel(cid, "No party members in range.")
		return TRUE
	end

	if(members[lastN] ~= cid) then
		doPlayerSendCancel(cid, "You have to be a party leader.")
		return TRUE
	end
	table.remove(members, lastN)

        local outfit = getCreatureOutfit(cid)
        local message = "*Party* Your outfit has been changed by leader. (" .. getCreatureName(cid) .. ")"
        local count = 0
        local tmp = {}
        for i, tid in ipairs(members) do
		tmp = outfit
		if(canPlayerWearOutfit(tid, outfit.lookType, outfit.lookAddons) ~= TRUE) then
			local tidOutfit = getCreatureOutfit(tid)
 			tmp.lookType = tidOutfit.lookType
                        tmp.lookAddons = tidOutfit.lookAddons
		end

		doSendMagicEffect(getCreaturePosition(tid), 66)
                doCreatureChangeOutfit(tid, tmp)
                doPlayerSendTextMessage(tid, MESSAGE_INFO_DESCR, message)
                count = count + 1
        end

        exhaustion.set(cid, config.storage, config.exhaustionInSeconds)
        doPlayerSendCancel(cid, "Party members outfit has been changed. (Total: " .. count .. ")")
        return TRUE
end