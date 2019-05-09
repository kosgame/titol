 --[[
        Offline player to player item trader (Auction System) by vDk
                Script version: 1.1b
]]--
local config = {
        levelRequiredToAdd = 20,
        maxOffersPerPlayer = 3,
        SendOffersOnlyInPZ = false,
        blocked_items = {2165, 2152, 2148, 2160, 2166, 2167, 2168, 2169, 2202, 2203, 2204, 2205, 2206, 2207, 2208, 2209, 2210, 2211, 2212, 2213, 2214, 2215, 2343, 2433, 2640, 6132, 6300, 6301, 9932, 9933}
        }
function onSay(cid, words, param, channel)
        if(param == '') then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires param.")
                return true
        end
       
        local t = string.explode(param, ",")
        if(t[1] == "add") then
                if((not t[2]) or (not t[3]) or (not t[4])) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires param.")
                        return true
                end
               
                if(not tonumber(t[3]) or (not tonumber(t[4]))) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You don't set valid price or items count.")
                        return true
                end
               
                if(string.len(t[3]) > 7 or (string.len(t[4]) > 3)) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "This price or item count is too high.")
                        return true
                end
               
                local item = getItemIdByName(t[2], false)
                if(not item) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Item wich such name does not exists.")
                        return true
                end
               
                if(getPlayerLevel(cid) < config.levelRequiredToAdd) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You don't have required (" .. config.levelRequiredToAdd .. ") level.")
                        return true
                end
                               
                if(isInArray(config.blocked_items, item)) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "This item is blocked.")
                        return true
                end
               
                if(getPlayerItemCount(cid, item) < (tonumber(t[4]))) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, you don't have this item.")
                        return true
                end
               
                local check = db.getResult("SELECT `id` FROM `auction_system` WHERE `player` = " .. getPlayerGUID(cid) .. ";")
                if(check:getID() == -1) then
                elseif(check:getRows(true) >= config.maxOffersPerPlayer) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry you can't add more offers (max. " .. config.maxOffersPerPlayer .. ")")
                        return true
                end
                               
                if(config.SendOffersOnlyInPZ) then    
                        if(not getTilePzInfo(getPlayerPosition(cid))) then
                                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You must be in PZ area when you add offert to database.")
                                return true
                        end
                end
           
                if(tonumber(t[4]) < 1 or (tonumber(t[3]) < 1)) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have to type a number higher than 0.")
                        return true
                end
       

                doPlayerRemoveItem(cid, item, (tonumber(t[4])))
                db.executeQuery("INSERT INTO `auction_system` (`player`, `item_name`, `item_id`, `count`, `cost`, `date`) VALUES (" .. getPlayerGUID(cid) .. ", \"" .. t[2] .. "\", " .. getItemIdByName(t[2]) .. ", " .. t[4] .. ", " .. t[3] ..", " .. os.time() .. ")")
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You successfully add " .. t[4] .." " .. t[2] .." for " .. t[3] .. " gps to offerts database.")
        end
       
        if(t[1] == "buy") then
                if(not tonumber(t[2])) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Wrong ID.")
                        return true
                end
               
                local buy = db.getResult("SELECT * FROM `auction_system` WHERE `id` = " .. (tonumber(t[2])) .. ";")
                if(buy:getID() ~= -1) then
                        if(getPlayerMoney(cid) < buy:getDataInt("cost")) then
                                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You don't have enoguh GP.")
                                                                buy:free()
                                return true
                        end
                       
                        if(getPlayerName(cid) == getPlayerNameByGUID(buy:getDataInt("player"))) then
                                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, you can't buy your own items.")
                                                                buy:free()
                                return true
                        end
                       
                        if(isItemStackable((buy:getDataString("item_id")))) then
                                doPlayerAddItem(cid, buy:getDataString("item_id"), buy:getDataInt("count"))
                        else
                                for i = 1, buy:getDataInt("count") do
                                        doPlayerAddItem(cid, buy:getDataString("item_id"), 1)
                                end
                        end
                       
                        doPlayerRemoveMoney(cid, buy:getDataInt("cost"))
                        db.executeQuery("DELETE FROM `auction_system` WHERE `id` = " .. t[2] .. ";")
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You buy " .. buy:getDataInt("count") .. " ".. buy:getDataString("item_name") .. " for " .. buy:getDataInt("cost") .. " gps!")
                       
                        local seller = getPlayerByNameWildcard(getPlayerNameByGUID(buy:getDataInt("player")))
                        if(seller) then
                                doPlayerAddMoney(seller, buy:getDataInt("cost"))
                                doPlayerSendTextMessage(seller, MESSAGE_INFO_DESCR, "Someone buy your " .. buy:getDataString("item_name") .. ". You get " .. buy:getDataInt("cost") .. " gps.")
                        else
                                db.executeQuery("UPDATE `players` SET `auction_balance` = `auction_balance` + " .. buy:getDataInt("cost") .. " WHERE `id` = " .. buy:getDataInt("player") .. ";")
                        end
                        buy:free()
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Wrong ID.")
                end
        end
       
        if(t[1] == "remove") then
                if((not tonumber(t[2]))) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Wrong ID.")
                        return true
                end
               
                local delete = db.getResult("SELECT * FROM `auction_system` WHERE `id` = " .. (tonumber(t[2])) .. ";")        
                if(delete:getID() ~= -1) then
                        if(getPlayerGUID(cid) == delete:getDataInt("player")) then
                                db.executeQuery("DELETE FROM `auction_system` WHERE `id` = " .. t[2] .. ";")
                                if(isItemStackable(delete:getDataString("item_id"))) then
                                        doPlayerAddItem(cid, delete:getDataString("item_id"), delete:getDataInt("count"))
                                else
                                        for i = 1, delete:getDataInt("count") do
                                                doPlayerAddItem(cid, delete:getDataString("item_id"), 1)
                                        end
                                end
                                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your offert has been deleted from offerts database.")
                        else
                                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "This is not your offert!")
                        end
                                                delete:free()
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Wrong ID.")
                end
        end
        return true
end