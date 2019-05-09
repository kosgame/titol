local config = {
fireCost = 10000,
softCost = 10000
}

function onSay(cid, words, param, channel)

    if param == "!recharge" then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param! (soft or fire).")
        return TRUE
    end
    
    if param == "soft" then
        if getPlayerItemCount(cid, 6530) >= 1 then
            if doPlayerRemoveMoney(cid, config.softCost) then
                doPlayerRemoveItem(cid, 10021, 1)
                doPlayerAddItem(cid, 6132, 1, FALSE)
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You recharged your soft boots for "..config.softCost.." coins.")
            else
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need "..config.fireCost.." coins to recharge your soft boots.")
            end
        else
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need a worn soft boots to recharge it.")
        end
    elseif param == "fire" then        
        if getPlayerItemCount(cid, 9934) >= 1 then
            if doPlayerRemoveMoney(cid, config.fireCost) then
                doPlayerRemoveItem(cid, 10022, 1)
                doPlayerAddItem(cid, 9933, 1, FALSE)
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You recharged your firewalker boots for "..config.fireCost.." coins.")
            else
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need "..config.fireCost.." coins to recharge your firewalker boots.")
            end
        else
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need a worn firewalker boots to recharge it.")
        end
    end    
            
    return TRUE
    
end  