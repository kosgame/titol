function onAdvance(cid, skill, oldLevel, newLevel)

local _SETUP = {
        level = 60,                            
        type = MESSAGE_STATUS_CONSOLE_ORANGE,   
        text = "You have been promoted to " .. getVocationInfo(getPlayerVocation(cid)).name .. ".",                        
}

        if skill == SKILL__LEVEL and newLevel >= _SETUP.level and getPlayerPromotionLevel(cid) == 0 then
                doPlayerSetPromotionLevel(cid, 1)
                doPlayerSendTextMessage(cid, _SETUP.type, _SETUP.text)
                doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
                doCreatureAddMana(cid, getCreatureMaxMana(cid) - getCreatureMana(cid))
        end
        return true
end