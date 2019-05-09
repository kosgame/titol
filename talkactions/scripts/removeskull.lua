-- Ile premium punktow kosztowac bedzie sci¹gniecie RSa
local COST = 50
-- "yes" lub "no" // czy ma usuwac rowniez fragi
local remove_frags = "yes"
-- efekt // liste efekektow mozna znalezc w /lib/constant.lua
local effect = CONST_ME_WATERSPLASH
function onSay(cid, words, param, channel)
    if getCreatureSkullType(cid) == SKULL_RED then
        local query = db.getResult("SELECT `premium_points` FROM `accounts` WHERE `id` = " .. getPlayerAccountId(cid) .. ";")
        local points = query:getDataInt("premium_points")
        if points >= COST then
            local update = db.executeQuery("UPDATE `accounts` SET `premium_points`= "..(points - COST).." WHERE `id`= " .. getPlayerAccountId(cid) .. "; ")
            if (update == true) then 
                db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ")")
                doPlayerSetSkullEnd(cid, 0, SKULL_RED)            
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Your red skull has been taken off!\nRemaining premium points: " .. (points - COST)) 
                doCreatureSetSkullType(cid, SKULL_NONE)
                doPlayerSetRedSkullTicks(cid, 0)
                if (remove_frags == "yes") then
                    doPlayerSetRedSkullTicks(cid, 0)
                    doCreatureSetSkullType(cid, SKULL_NONE)
                end
                doSendMagicEffect(getPlayerPosition(cid), effect)
            else
                doPlayerSendCancel(cid, "Database error")
            end
        else
            doPlayerSendCancel(cid, "You need " ..COST.. " premium points to remove red skull") 
        end
    else
        doPlayerSendCancel(cid, "You do not have red skull")
    end
    return TRUE
end
