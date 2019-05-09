------------------------------------------------------------------------------*
----- [[> Automated Database Cleanup 1.1 Structure //By Cybermaster <]] ------|
-------------- [[> System 2.0 Revamped by Teh Maverick <3 <]] ----------------|
------------- [[>  Removal of empty accounts by darkaos :) <]] ---------------|
--------------- [[> Function getDBPlayersCount() by Elf <]] ------------------|
------------------------------------------------------------------------------|
------------------------------------------------------------------------------|
--- ~!READ THIS!~ ------------------------------------------------------------|
--- Be sure to back up your database and test this on your server first, -----|
--- I(Teh Maverick) cannot guarantee it will work the same for every core. ---|
--- It is very easy to test, with the log file and values that are printed ---|
-----------------------------------Enjoy!-------------------------------------|
------------------------------------------------------------------------------*
 
function countRowsWhereInTable(table, field, condition)
    local result = db.getResult("SELECT COUNT(" .. field .. ") as count FROM " .. table .. " WHERE " .. field .. " = '" .. condition .. "';")
    local tmp = result:getDataInt("count")
    result:free()
    return tmp
end
 
function getDBPlayersCount()
    local result = db.getResult("SELECT COUNT(id) as count FROM `players`;")
    local tmp = result:getDataInt("count")
    result:free()
    return tmp
end
 
function getDBAccountsCount()
    local result = db.getResult("SELECT COUNT(id) as count FROM `accounts`;")
    local tmp = result:getDataInt("count")
    result:free()
    return tmp
end
 
function onStartup()
	local DB_BEFORE = {players = getDBPlayersCount(), accounts = getDBAccountsCount()}
	local result,result1, ii, numPlayersToDelete, numAccountsDeleted, tmp = 0, 0, 0, 0, 0
	local pid, aid = {}, {}
	local dropCount = {players={},accounts={}}
 
	local config = {
		deleteAccountWithNoPlayers = true,
		cleanChildTables = true,
		printResult = true,
		saveResultToFile = true,
		logFileName = 'db_cleanup.txt'
	}
 
    --In each table, players with below specified level, and days of inactivity will be deleted from db on server startup
	local cleanup = {
		[1] = {level = 11, time = 5 * 24 * 60 * 60},
		[2] = {level = 20, time = 15 * 24 * 60 * 60},
		[3] = {level = 50, time = 30 * 24 * 60 * 60},
		[4] = {level = 100, time = 60 * 24 * 60 * 60},
		[5] = {level = 130, time = 90 * 24 * 60 * 60}
	}
 
	local childAttributeTables = {
		players = {
			[1] = {table = "`player_viplist`", idField = "`player_id`"},
			[2] = {table = "`player_storage`", idField = "`player_id`"},
			[3] = {table = "`player_spells`", idField = "`player_id`"},
			[4] = {table = "`player_skills`", idField = "`player_id`"},
			[5] = {table = "`player_namelocks`", idField = "`player_id`"},
			[6] = {table = "`player_items`", idField = "`player_id`"},
			[7] = {table = "`player_depotitems`", idField = "`player_id`"},
			[8] = {table = "`houses`", idField = "`owner`"},
			[9] = {table = "`house_auctions`", idField = "`player_id`"},
			[10] = {table = "`players`", idField = "`id`"} -- Keep this as the last item in the array
			--Note: `houses` and `bans` are in the DB triggers for TFS so don't worry about them.
			--Also I did not want to put killers, or deaths on here because that is historic data,
			--do so at your own risk.
		},
		accounts = {
			[1] = {table = "`accounts`", idField = "`id`"},
			[2] = {table = "`account_viplist`", idField = "`account_id`"}
		}
	}
 
	--Clean up all the players and player data
	for i = 1, #cleanup do
		result = db.getResult("SELECT `id`,`name`,`account_id` FROM `players` WHERE `level` < ".. cleanup[i].level .." AND `name` NOT IN('Account Manager', 'Sorcerer Sample', 'Druid Sample', 'Paladin Sample', 'Knight Sample', 'Rook Sample') AND `group_id` < 2 AND `lastlogin` < UNIX_TIMESTAMP() - ".. cleanup[i].time ..";")
		if(result:getID() ~= -1) then
			ii = 1
			repeat
				pid[ii] = result:getDataInt("id") -- list the players id into an array
				aid[ii] = result:getDataInt("account_id") -- list the account id of each player being removed into an array
				ii = ii + 1
			until not(result:next())
			result:free()
		end
		numPlayersToDelete = ii - 1
 
		--Drop players and their child table attribute data such as skills, items, etc.
		for j = 1, numPlayersToDelete do
 
			if(config.cleanChildTables) then
				for k = 1, #childAttributeTables.players do
					if childAttributeTables.players[k].table == "houses" then
						house = getHouseByPlayerGUID(pid[j])
						if house ~= 0 or house ~= nil then
							doCleanHouse(house)
							doUpdateHouseAuctions()
						end
					else
						dropCount.players[k] = ((dropCount.players[k] or 0) + countRowsWhereInTable(childAttributeTables.players[k].table, childAttributeTables.players[k].idField, pid[j]))
						db.executeQuery("DELETE FROM " .. childAttributeTables.players[k].table .. " WHERE " .. childAttributeTables.players[k].idField .. " = '" .. pid[j] .. "';")
					end
				end
			else
				db.executeQuery("DELETE FROM `players` WHERE `id` = '" .. pid[j] .. "';")
			end
		end
    end
 
	--Drop all the accounts that have 0 players linked to them (at the moment its only checking from the list of players removed)
	if config.deleteAccountWithNoPlayers then
		--This part was scripted by Darkhaos, modified/fixed by Teh Maverick --[[
		for acc = 1, #aid do
			result1 = db.getResult("SELECT `id` FROM `accounts` WHERE `id` = '" .. aid[acc] .. "';")
			if result1:getID() ~= -1 then -- check to make sure the account exists
				result1:free()
				for i = 1, #childAttributeTables.accounts do
					--Make sure there are no other players on the account
					result1 = db.getResult("SELECT COUNT(id) as count FROM `players` WHERE `account_id` = '" .. aid[acc] .. "';")
					tmp = result1:getDataInt("count")
					if(tmp <= 0) then
						--Remove accounts
						dropCount.accounts[i] = ((dropCount.accounts[i] or 0) + countRowsWhereInTable(childAttributeTables.accounts[i].table, childAttributeTables.accounts[i].idField, aid[acc]))
						db.executeQuery("DELETE FROM " .. childAttributeTables.accounts[i].table .. " WHERE " .. childAttributeTables.accounts[i].idField .. " = '" .. aid[acc] .. "';")
					end
				end
			end
		end
	end
	--]]
 
	--Print and Save results (configurable)
	local DB_NOW = {players = DB_BEFORE.players - getDBPlayersCount(), accounts = DB_BEFORE.accounts - getDBAccountsCount()}
	if DB_NOW.players > 0 or DB_NOW.accounts > 0 then
		local text = ">> [DBCLEANUP] " .. DB_NOW.players .. " inactive players" .. (config.deleteAccountWithNoPlayers and " and " .. DB_NOW.accounts .. " empty accounts" or "") .. " have been deleted from the database."
 
		--Write to console
		if config.printResult then
			print("")
			print(text)
			if config.cleanChildTables then
				--Write player info
				for i = 1,#dropCount.players do
					print("[!] --> Dropped: " .. dropCount.players[i] .. " from " .. childAttributeTables.players[i].table .. " table")
				end
				--Write account info
				if config.deleteAccountWithNoPlayers then
					for i = 1,#dropCount.accounts do
						print("[!] --> Dropped: " .. dropCount.accounts[i] .. " from " .. childAttributeTables.accounts[i].table .. " table")
					end
				end
				print("")
			end
		end
 
		--Write to file
		if config.saveResultToFile then
 
			local file = io.open("data/logs/"..config.logFileName, "a")
			file:write("[" .. os.date("%d %B %Y %X ", os.time()) .. "] " .. text .. "\n")
 
			if config.cleanChildTables then
				--Write player info
				for i = 1, #dropCount.players do
					file:write("[!] --> Dropped: " .. dropCount.players[i] .. " from " .. childAttributeTables.players[i].table .. " table\n")
				end
				--Write account info
				if config.deleteAccountWithNoPlayers then
					for i = 1, #dropCount.accounts do
						file:write("[!] --> Dropped: " .. dropCount.accounts[i] .. " from " .. childAttributeTables.accounts[i].table .. " table\n")
					end
				end
				file:write("\n")
			end
			file:close()
		end
	end
	return true
end