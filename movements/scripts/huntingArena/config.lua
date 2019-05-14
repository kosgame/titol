local arenasCoordinates = {
    arena2510 = {
        leftTop = {x = 30919, y = 31966, z = 7},
        rightBottom = {x = 30925, y = 31972, z = 7},
        wejscie = {x = 30922, y = 31971, z = 7},
        wyjscie = {x = 30919, y = 31974, z = 7},
        wyscieAwaryjne = {x = 30922, y = 31975, z = 7},
        fieldToDoMonster = {x = 30919, y = 31966, z = 7},
        spawnMonster = {x = 30922, y = 31971, z = 7}
    }
}
local arenasSotrages = {
    arena2510 = {
        global_storage = 16591
    }
}

function getArenaCoordinates(uniqueID)
    local id = uniqueID;
    local arenaName = "arena"..id;
    return arenasCoordinates[arenaName];
end

function getArenaStorage(uniqueID)
    local id = uniqueID;
    local arenaName = "arena"..id;
    return arenasSotrages[arenaName];
end