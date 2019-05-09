local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end


		if msgcontains(msg, 'spy report') then
        selfSay('Those god darn Black Knights are thiefs I tell ya, they stole my spy report could you help return it?')
        talk_state = 1
		elseif msgcontains(msg, 'yes') and talk_state == 1 then
            selfSay('Please go to the Dark Knights catherdral and find my spy report then come back to me and say prize.')
                talk_state = 2
		elseif msgcontains(msg, 'prize') and getPlayerItemCount(cid,2345) >= 1 and getPlayerStorageValue(cid,87640) == -1 then
			if doPlayerTakeItem(cid,2345,1) == 0 then
            selfSay('Thank you very much! Ill give ya 300k experience for returning it!')
					setPlayerStorageValue(cid,87640,1)
			doPlayerAddExp(cid, 300000)
			doSendMagicEffect(getPlayerPosition(cid), 27)
					talk_state = 3

		elseif msgcontains(msg, 'prize') and talk_state == 2 and getPlayerStorageValue(cid,87640) == 1 then
            selfSay('You have already done this quest!')
elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 3) then
			selfSay('Good Bye. |PLAYERNAME|!')
			talk_state = 0
		end
end
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())