  local config = {
                levelReach = 400,
                points = 50
                }

function onAdvance(cid, skill, oldLevel, newLevel)

if(skill == SKILL__LEVEL and newLevel >= config.levelReach and getPlayerStorageValue(cid, 58563) == -1) then
        setPlayerStorageValue(cid, 58563, 1)
        db.executeQuery("UPDATE `accounts` SET `premium_points` = `premium_points`+"..config.points.." WHERE `id` = "..getPlayerAccountId(cid)..";")
		doPlayerSendTextMessage(cid,19,'You have reached level 400, you have received 50 premium points.')
end

return TRUE
end 