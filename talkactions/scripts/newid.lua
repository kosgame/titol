  function onSay(cid, words, param, channel)
        if(param == '') then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires param.")
                return true
        end
        local t = string.explode(param, ",")
        t[1] = tonumber(t[1])
        if(not t[1]) then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires numeric param.")
                return true
        end
        if(t[1] >= 10544) then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Such item does not exist.")
                return true
        end
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your outfit has been turned into a "..getItemNameById(param)..".")
                  doSendMagicEffect(getCreaturePosition(cid), CONST_ME_SLEEP)
                    doSetItemOutfit(cid, param, -1)
        return true
end 