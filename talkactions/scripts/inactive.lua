local function getLastLoginDiff(name)
if type(name) ~= "string" then
	return name
end
local res = db.getResult("SELECT `lastlogin` FROM `players` WHERE `name` = '"..name.."';")
	if res:getID() ~= -1 then
		return os.time()-res:getDataInt('lastlogin')
	end
end

local config = {
	useinactive = true,
	timeInDays = 14,
	buyeffect = CONST_ME_GIFT_WRAPS,
	canceleffect = CONST_ME_POFF,
	buy = getConfigValue('buyableAndSellableHouses'),
	prem = getConfigValue('houseNeedPremium'),
	houses = getConfigValue('housesPerAccount'),
	level = getConfigValue('levelToBuyHouse')
}


function onSay(cid, words, param, channel)
        --Credits: Lowak
	local pos,s,dir,account_houses = getPlayerPosition(cid),getPlayerPosition(cid),getCreatureLookDirection(cid),getHousesPerAccountByAccount(getPlayerAccountId(cid))
		pos.x = dir == 1 and pos.x+1 or dir == 3 and pos.x-1 or pos.x
		pos.y = dir == 0 and pos.y-1 or dir == 2 and pos.y+1 or pos.y
	local house = getHouseFromPos(pos)
	
	
	if not config.buy then
		return doSendMagicEffect(s,config.canceleffect)
	end
	if not house then
		return doSendMagicEffect(s,config.canceleffect) and doPlayerSendCancel(cid,"You have to be looking at door of flat you would like to purchase.")
	end
	local owner = getHouseOwner(house) > 0 and getPlayerNameByGUID(getHouseOwner(house)) or -1
	if getHouseInfo(house).guildHall then
		if getPlayerGuildRankId(cid) ~= 1 then
			return doSendMagicEffect(s,config.canceleffect) and doPlayerSendCancel(cid,"You have to be at least a guild leader to purchase a hall.")
		end
		if getGuildHallByGuildId(getPlayerGuildId(cid)) ~= nil then
			return doSendMagicEffect(s,config.canceleffect) and doPlayerSendCancel(cid,"Your guild rents already another hall.")
		end
	else
		if getHouseByPlayerGUID(getPlayerGUID(cid)) ~= nil then
			return doSendMagicEffect(s,config.canceleffect) and  doPlayerSendCancel(cid,"You already rent another house.")
		end
		if config.houses ~= 0 and account_houses >= config.houses then
			return doSendMagicEffect(s,config.canceleffect) and doPlayerSendCancel(cid,"You may own only "..config.houses.." house"..(config.houses == 1 and "" or "s").." per account.")
		end
		if not config.prem then
			return doSendMagicEffect(s,config.canceleffect) and doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUNEEDPREMIUMACCOUNT)
		end
		if getPlayerLevel(cid) < config.level then
			return doSendMagicEffect(s,config.canceleffect) and doPlayerSendCancel(cid,"You have to be at least Level "..config.level.." to purchase a house.")
		end
	end

	if getHouseOwner(house) == 0 or (getLastLoginDiff(owner) >= config.timeInDays*24*60*60 and config.useinactive) then
		if not doPlayerRemoveMoney(cid,getHousePrice(house)) then
			return doSendMagicEffect(s,config.canceleffect) and doPlayerSendCancel(cid,"You do not have enough money.")
		end
		
		setHouseOwner(house, getPlayerGUID(cid))
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have successfully bought this " .. (getHouseInfo(house).guildHall and "hall" or "house") .. ", remember to leave money at " .. (getHouseInfo(house).guildHall and "guild owner " or "") .. (getConfigValue('bankSystem') and "bank or " or "") .. "depot of this town for rent.\n" .. (getLastLoginDiff(owner) >= config.timeInDays*24*60*60 and "[Inactive]" or ""))
		return true
	else
		return doSendMagicEffect(s,config.canceleffect) and  doPlayerSendCancel(cid,"This flat is already owned by someone else.")
	end
	
	return true
end
