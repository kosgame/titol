  function onAdvance(cid, skill, oldlevel, newlevel)
local cfg = {
        level = 45,
        item = 2160,
        count = 10,
        storage = 1234
}
        if(getPlayerStorageValue(cid, cfg.storage) ~= 1 and skill == SKILL__LEVEL and newlevel >= cfg.level) then
                doPlayerSendTextMessage(cid, 19, "You have recevied a reward because you reached level "..cfg.level..".")
                doPlayerSetStorageValue(cid, cfg.storage, 1)
                doPlayerAddItem(cid, cfg.item, cfg.count)
        end
        return true
end 