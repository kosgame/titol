local waittime = 5 --Default (30 seconds)
local storage = 5576

function onSay(cid, words, param)

        if exhaustion.get(cid, storage) == FALSE then
                exhaustion.set(cid, storage, waittime)
        else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You have to wait " .. exhaustion.get(cid, storage) .. " seconds.") 
        return true
       end 

	local playerGuild = getPlayerGuildId(cid)
	if playerGuild > 0 then
		local playerGuildLevel = getPlayerGuildLevel(cid)
		if playerGuildLevel >= GUILDLEVEL_VICE then
			local players = getOnlinePlayers()
			local message = "*Guild* " .. getCreatureName(cid) .. " [" .. getPlayerLevel(cid) .. "]:\n" .. param;
			for i,playerName in ipairs(players) do
				local player = getPlayerByName(playerName);
				if getPlayerGuildId(player) == playerGuild then
					doPlayerSendTextMessage(player, MESSAGE_STATUS_WARNING, message);
				end
			end
			doPlayerSendCancel(cid, "Message sent to whole guild.");
		else
			doPlayerSendCancel(cid, "You have to be at least Vice-Leader to guildcast!");
		end
	else
		doPlayerSendCancel(cid, "Sorry, you're not in a guild.");
	end
	doPlayerSendTextMessage(cid, 25, words)
	return FALSE
end
