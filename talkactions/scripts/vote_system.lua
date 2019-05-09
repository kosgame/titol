--Vote System by Vooden
function vote_clean()
         setGlobalStorageValue(9955, 0)
         setGlobalStorageValue(2222, 0)
         setGlobalStorageValue(2223, 0)
return 1
end
function vote_end()
         doBroadcastMessage("Wyniki glosowania to : "..getGlobalStorageValue(2222).." glosow na tak i "..getGlobalStorageValue(2223).." glosow na nie.")
	   addEvent(vote_clean, 2000)
         return 1
end
function onSay(cid, words, param)
local vote_end_time = 60 -- czas glosowania
         if getGlobalStorageValue(9955) ~= 1 then
                    if words == '/vote' then
                       addEvent(vote_end, vote_end_time * 1000)
                       doBroadcastMessage(""..param.." Aby zaglosowac uzyj !tak lub !nie .")
                       setGlobalStorageValue(9955, 1)
                    end
         end
     if getGlobalStorageValue(9955) == 1 then    
         if words == '!tak' and getPlayerStorageValue(cid,7236) <= os.time() then
           setGlobalStorageValue(2222, getGlobalStorageValue(2222) + 1)
           doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Zaglosowales na tak.')
           setPlayerStorageValue(cid,7236, os.time()+(vote_end_time))
         elseif words == '!nie' and getPlayerStorageValue(cid,7236) <= os.time() then
           setGlobalStorageValue(2223, getGlobalStorageValue(2223) + 1)
           doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Zaglosowales na nie.')
           setPlayerStorageValue(cid,7236, os.time()+(vote_end_time))
         elseif getPlayerStorageValue(cid,7236) >= os.time() then
           doPlayerSendCancel(cid,"Juz glosowales") 
         end
     else
         doPlayerSendCancel(cid,"Glosowanie nie zostalo rozpoczete.")
     end    
return 1
end
