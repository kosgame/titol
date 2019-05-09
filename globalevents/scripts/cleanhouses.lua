local config = { 
    days = 14,
    log = true,
    file = getDataDir() .. "/logs/cleanhouses.txt"
}    
local ns_query =[[ SELECT houses.owner,houses.id,players.name FROM houses
                LEFT JOIN players ON players.id=houses.owner
                WHERE players.lastlogin < (UNIX_TIMESTAMP() - ]] ..config.days.. [[*24*60*60)
                AND
                players.world_id =]] .. getConfigValue("worldId")

function onStartup(_time)

    local house = db.getResult(ns_query)
    local logs = " :: Houses cleaned:\n\n"
    if house:getID() ~= -1 then
        repeat
            logs = logs .. getHouseInfo(house:getDataInt('id')).name ..", owned by " .. house:getDataString('name') .. "\n"
            setHouseOwner(house:getDataInt('id'), 0)
        until not house:next()
        house:free()
    else
        logs = logs .. "There were no houses to clean."
    end
    if config.log then
        doWriteLogFile(config.file, logs)
    end
    addEvent(doSaveServer, 1000)
end