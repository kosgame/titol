--[[CREDITS, , if you will use this script, do not remove.
*Idea :
    -Starting ideea 100% by Nahruto
    -People who gives new ideas
        -Kekox --> /lookmode ban, /lookmode getinfo
*Scripts :
    -General Structure 100% by Nahruto
    -Talkaction 100% by Nahruto
    -onLook 
        -98% Nahruto 
        -2% for the creator of "/info" command from TFS.
####    FIN        ####
Made and tested in TFS 0.3 beta 3    <3<3<3
]]

dofile("./Look.lua")

function onSay(cid, words, param)
    if getPlayerAccess(cid) >= nAccess or isInTable(otrosPlayers, getCreatureName(cid)) == TRUE then
        local Modo = Modos[param]
        if Modo then
            setPlayerStorageValue(cid, StorageValue, Modo)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Changed to mode " .. param .. ".")
        else
            doSendCancel(cid, CancelMessages[1])
        end    
    end
    return TRUE
end  