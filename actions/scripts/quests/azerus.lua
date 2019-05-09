-- Yalahar 10th mission By QuaS~~

-- Config --
local BlindField = {x=32781, y=31157, z=10, stackpos=1} 
-- Map checking --
local topLeft = {x=32776, y=31159, z=10} 
local buttomRight = {x=32790, y=31176, z=10} 
-- Position Of TP --
local tp = {x=32783, y=31175, z=10} 
-- Position of Gllobus
local glo = {x=32783, y=31166, z=10} 
-- end --

local function mapArea(fromPos, toPos, stack)
	-- Area iterator by Colandus.
	local pos = {x=fromPos.x, y=fromPos.y-1, z=fromPos.z}
	return function()
		if (pos.y < toPos.y) then
			pos.y = pos.y+1
		elseif (pos.x <= toPos.x) then
			pos.y = fromPos.y
			pos.x = pos.x+1
		else
			pos.x = fromPos.x
			pos.y = fromPos.y
			pos.z = pos.z+1
		end
		if (pos.x <= toPos.x and pos.y <= toPos.y or pos.z < toPos.z) then
			if (stack == nil) then
				return pos
			else
				pos.stackpos = stack
				return pos, getTopCreature(pos).uid
			end
		end
	end
end


local function getMonstersfromArea(fromPos, toPos)
	local monsters = {}
	for _, thing in mapArea(fromPos, toPos, 253) do
		if isMonster(thing) == TRUE then
			table.insert(monsters, thing)
		end
	end
	local bfm = getTopCreature(BlindField).uid
	if isMonster(bfm) == TRUE then
		table.insert(monsters, bfm)
	end
	return monsters
end

local function FirstWave()
	doSummonCreature("Rift Worm", {x= glo.x - 4,y=glo.y,z=glo.z})
	doSummonCreature("Rift Worm", {x= glo.x + 4,y=glo.y,z=glo.z})
	doSummonCreature("Rift Worm", {x=glo.x,y=glo.y + 4,z=glo.z})
	doSummonCreature("Rift Worm", {x=glo.x,y=glo.y - 4,z=glo.z})
	doSummonCreature("Rift Worm", {x=glo.x,y=glo.y + 5,z=glo.z})
	doSummonCreature("Azerus", {x=glo.x,y=glo.y - 5,z=glo.z})
end

local function SecondWave()
	local monsters1 = getMonstersfromArea(topLeft, buttomRight)
	for _, monster in pairs(monsters1) do
		if getCreatureName(monster) == "Azerus" then
			doRemoveCreature(monster)
		end
	end
	doSummonCreature("Azerus1", {x=glo.x,y=glo.y - 5,z=glo.z})
	doSummonCreature("Rift Brood", {x= glo.x - 4,y=glo.y,z=glo.z})
	doSummonCreature("Rift Brood", {x= glo.x + 4,y=glo.y,z=glo.z})
	doSummonCreature("Rift Brood", {x=glo.x,y=glo.y + 4,z=glo.z})
	doSummonCreature("Rift Brood", {x=glo.x,y=glo.y - 4,z=glo.z})
	doSummonCreature("Rift Brood", {x=glo.x,y=glo.y + 5,z=glo.z})
end

local function ThirdWave()
	local monsters1 = getMonstersfromArea(topLeft, buttomRight)
	for _, monster in pairs(monsters1) do
		if getCreatureName(monster) == "Azerus" then
			doRemoveCreature(monster)
		end
	end
	doSummonCreature("Azerus2", {x= glo.x - 5,y=glo.y,z=glo.z})
	doSummonCreature("Rift Scythe", {x= glo.x - 4,y=glo.y,z=glo.z})
	doSummonCreature("Rift Scythe", {x= glo.x + 4,y=glo.y,z=glo.z})
end

local function ThirdWave1() -- with 2s delay
	doSummonCreature("Rift Scythe", {x=glo.x,y=glo.y + 4,z=glo.z})
	doSummonCreature("Rift Scythe", {x=glo.x,y=glo.y - 4,z=glo.z})
	doSummonCreature("Rift Scythe", {x=glo.x,y=glo.y + 5,z=glo.z})
end

local function FourthWave()
	local monsters1 = getMonstersfromArea(topLeft, buttomRight)
	for _, monster in pairs(monsters1) do
		if getCreatureName(monster) == "Azerus" then
			doRemoveCreature(monster)
		end
	end
	doSummonCreature("Azerus3", {x= glo.x - 5,y=glo.y,z=glo.z})
	doSummonCreature("War Golem", {x= glo.x - 4,y=glo.y,z=glo.z})
	doSummonCreature("War Golem", {x= glo.x + 4,y=glo.y,z=glo.z})
	doSummonCreature("War Golem", {x=glo.x,y=glo.y - 4,z=glo.z})
	doSummonCreature("War Golem", {x=glo.x,y=glo.y + 4,z=glo.z})
end

local function Glllobe()
	doItemSetAttribute(getTileItemById(glo,9767).uid, "aid", 58261)
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.actionid == 58261 then
		doItemSetAttribute(item.uid, "aid", 58263)
		if getTileItemById(tp,1387).uid > 0 then
			doRemoveItem(getTileItemById(tp,1387).uid)
		end
		addEvent(FirstWave, 0)
		addEvent(SecondWave, 10000)
		addEvent(ThirdWave, 20000)
		addEvent(ThirdWave1, 24000)
		addEvent(FourthWave, 38000)
		addEvent(Glllobe, 900000)
	elseif item.actionid == 58263 then
		doCreatureSay(cid, "You have to wait some time before this globe will charge.", TALKTYPE_ORANGE_1, false, cid, getThingPos(cid))
	end
	return true
end