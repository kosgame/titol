function onSay(cid, words, param)
    local ids = {
            7636,   -- ID of small vial.
            7634,   -- ID of strong vial.
            7635    -- ID of great vial.
    }
    for i = 1, table.maxn(ids) do
        doPlayerRemoveItem(cid, ids[i], getPlayerItemCount(cid, ids[i]))
    end
    doSendMagicEffect(getPlayerPosition(cid), 2)
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Empty vials removed.")
               doSendMagicEffect(getPlayerPosition(cid), 2)
        return TRUE
end
   