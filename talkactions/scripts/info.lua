local config = {
        rateExperience = getConfigInfo('rateExperience'),
        rateSkill = getConfigInfo('rateSkill'),
        rateLoot = getConfigInfo('rateLoot'),
        rateMagic = getConfigInfo('rateMagic'),
        rateSpawn = getConfigInfo('rateSpawn'),
        protectionLevel = getConfigInfo('protectionLevel'),
        stages = getBooleanFromString(getConfigInfo('experienceStages'))
}
function onSay(cid, words, param, channel)
        local exp = config.rateExperience
        if(config.stages == TRUE) then
                exp = getExperienceStage(getPlayerLevel(cid))
        end
        guild = "None"
                name = getPlayerName(cid)
            level = getPlayerLevel(cid)
            access = getPlayerAccess(cid)
                version = "1.0"
                motto = "We keep the gaming feeling alive."
                local hours = math.ceil(getWorldUpTime() / 3600) - 1
        local minutes = math.ceil((getWorldUpTime() - (3600 * hours)) / 60)
        if minutes == 60 then
                minutes = 0
                hours = hours + 1
        end
        doPlayerPopupFYI(cid, "Welcome to Feragon Online \nServer Information:\n\nExperience rate: x" .. exp .. "\nSkills rate: x" .. config.rateSkill .. "\nLoot rate: x" .. config.rateLoot .. "\nMagic rate: x" .. config.rateMagic .. "\nSpawns rate: x" .. config.rateSpawn .. "\nProtection level: " .. config.protectionLevel .. "\n  \n\n You are Logged in as:\n Name: " .. name .."\n Level: " .. level .."\n Access: " .. access .."\n\n Server Version: " .. version .." \n Uptime:  ".. hours .."  hours and " .. minutes .." minutes.")
        return TRUE
end