local function getCreaturesInRange(fromPosition, toPosition)
    local x, y, z = 0, 0, 0
    local creatures = {}
    for x = fromPosition.x, toPosition.x do
        for y = fromPosition.y, toPosition.y do
            for z = fromPosition.z, toPosition.z do
                local creature = getTopCreature({x = x, y = y, z = z}).uid
                if(creature > 0) then
                    table.insert(creatures, creature)
                end
            end
        end
    end
    return creatures
end

local function getMonstersInRange(fromPosition, toPosition)
    local creatures = getCreaturesInRange(fromPosition, toPosition)
    local monsters = {}
    for _, creature in ipairs(creatures) do
        if(isMonster(creature)) then
            table.insert(monsters, creature)
        end
    end
    return monsters
end

local SPECIAL_QUESTS = {2001}
local pos = {from = {x=32124, y=31855, z=8}, to = {x=32130, y=31861, z=8}} -- range of room needed to prevent the creation of more than one monster see a picture (x and y)
function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    local storage_global = 26545 -- whenever the next room you need to change the value!
    if isPlayer(cid) and getGlobalStorageValue(storage_global) == -1 then
        mons = getMonstersInRange(pos.from, pos.to)
        m = 0
        for i = 1, #mons do
            if getCreatureName(mons[i]) == 'Dragon' then -- Monster Name
                m = m + 1
            end
        end
        if m == 0 then
            doCreateMonster('Dragon', {x=31223, y=32395, z=7}) -- Monster name and respawn ! See picture ( respawn )
            return true
        else
            return doPlayerSendCancel(cid, 'Sorry, creature is now spawned.') and doTeleportThing(cid, fromPosition) and true
        end
    else
        return true
    end
end