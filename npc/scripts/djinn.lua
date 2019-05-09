-- Made by Coltain13 // Coltain --
-- If you use or edit, please give credit to me --
 
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end
 
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
 
local node1 = keywordHandler:addKeyword({'enchanted'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Sorry but I will not buy anything that is enchanted.'})
 
local node2 = keywordHandler:addKeyword({'ghdghg'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I will buy any axe weapons.'})
 
shopModule:addSellableItem({'beastslayer axe', 'beastslayeraxe'},		3962, 1500,		'beastslayer axe')
shopModule:addSellableItem({'dragon lance', 'dragonlance'},				2414, 9000,		'dragon lance')
shopModule:addSellableItem({'fire axe', 'fireaxe'},						2432, 8000,		'fire axe')
shopModule:addSellableItem({'guardian halberd', 'guardianhalberd'},		2427, 8000,		'guardian halberd')
shopModule:addSellableItem({'knight axe', 'knightaxe'},					2430, 2000,		'knight axe')
shopModule:addSellableItem({'obsidian lance', 'obsidianlance'},			2425, 500,		'obsidian lance')
shopModule:addSellableItem({'war axe', 'waraxe'},						2454, 9000,		'war axe')
-- Keep these here so they don't mix up keywords
shopModule:addSellableItem({'axe', 'axe'},								2386, 10,		'axe')
--
 
local node3 = keywordHandler:addKeyword({'tgdgdfg'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I will buy any club weapons.'})

shopModule:addSellableItem({'amber staff', 'amberstaff'},				7426, 8000,		'amber staff')
shopModule:addSellableItem({'brutetamer\'s staff', 'brutetamers staff'},7379, 1500,		'brutetamer\'s staff')
shopModule:addSellableItem({'clerical mace', 'clericalmace'},			2423, 540,		'clerical mace')
shopModule:addSellableItem({'dragon hammer', 'dragonhammer'},			2434, 2000,		'dragon hammer')
shopModule:addSellableItem({'dragonbone staff', 'dragonbonestaff'},		7430, 3000,		'dragonbone staff')
shopModule:addSellableItem({'furry club', 'furryclub'},					7432, 1000,		'furry club')
shopModule:addSellableItem({'lunar staff', 'lunarstaff'},				7424, 5000,		'lunar staff')
shopModule:addSellableItem({'sapphire hammer', 'sapphire hammer'},		7437, 7000,		'sapphire hammer')
shopModule:addSellableItem({'skull staff', 'skullstaff'},				2436, 8000,		'skull staff')
shopModule:addSellableItem({'taurus mace', 'taurusmace'},				7425, 500,		'taurus mace')
shopModule:addSellableItem({'war hammer', 'warhammer'},					2391, 1200,		'war hammer')
-- Keep these here so they don't mix up keywords
shopModule:addSellableItem({'mace', 'mace'},							2398, 30,		'mace')
shopModule:addSellableItem({'club', 'club'},							2382, 1,		'club')
shopModule:addSellableItem({'staff', 'staff'},							2401, 40,		'staff')
 
--
 
 
local node4 = keywordHandler:addKeyword({'lhjhju'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I will buy every sword.'})
 
shopModule:addSellableItem({'bright sword', 'brightsword'},				2407, 8000,		'bright sword')
shopModule:addSellableItem({'broadsword', 'broad sword'},				2413, 500,		'broadsword')
shopModule:addSellableItem({'demonrage sword', 'demonragesword'},		7382, 15000,		'demonrage sword')
shopModule:addSellableItem({'fire sword', 'firesword'},					2392, 4000,		'fire sword')
shopModule:addSellableItem({'giant sword', 'giantsword'},				2393, 17000,		'giant sword')
shopModule:addSellableItem({'ice rapier', 'icerapier'},					2396, 1000,		'ice rapier')
shopModule:addSellableItem({'serpent sword', 'serpentsword'},			2409, 900,		'serpent sword')
shopModule:addSellableItem({'spike sword', 'spikesword'},				2383, 1000,		'spike sword')
shopModule:addSellableItem({'wyvern fang', 'wyvernfang'},				7408, 1500,		'wyvern fang')
-- Keep these here so they don't mix up keywords
shopModule:addSellableItem({'sword', 'sword'},							2376, 25,		'sword')
shopModule:addSellableItem({'sabre', 'sabre'},							2385, 10,		'sabre')
shopModule:addSellableItem({'machete', 'machete'},						2420, 50,		'machete')
shopModule:addSellableItem({'longsword', 'longsword'},					2397, 51,		'longsword')
shopModule:addSellableItem({'knife', 'knife'},							2403, 5,		'knife')
shopModule:addSellableItem({'dagger', 'dagger'},						2379, 2,		'dagger')
--
 
local node6 = keywordHandler:addKeyword({'loghjghj'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I will your wands.'})
 
shopModule:addSellableItem({'wand of cosmic energy', 'woce'},			2189, 2000,		'wand of cosmic energy')
shopModule:addSellableItem({'wand of inferno', 'woi'},					2187, 3000,		'wand of inferno')


local node8 = keywordHandler:addKeyword({'lojhfhhf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I will buy all armors.'})
 
-- Keep these here so they don't mix up keywords
shopModule:addSellableItem({'mammoth fur cape', 'mammothfur'},			7463, 6000,		'mammoth fur cape')
shopModule:addSellableItem({'magma coat', 'magmacoat'},					7899, 35000,		'magma coat')
--
 
shopModule:addSellableItem({'blue robe', 'bluerobe'},					2656, 10000,		'blue robe')
shopModule:addSellableItem({'crown armor', 'crownarmor'},				2487, 12000	,		'crown armor')
shopModule:addSellableItem({'dragon scale mail', 'dsm'},				2492, 40000,		'dragon scale mail')
shopModule:addSellableItem({'knight armor', 'knightarmor'},				2476, 5000,		'knight armor')
shopModule:addSellableItem({'noble armor', 'nobalearmor'},				2486, 9000,		'noble armor') 
 
local node9 = keywordHandler:addKeyword({'fsdfeeerrf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I will buy all helmets.'})
 
shopModule:addSellableItem({'crown helmet', 'crownhelmet'},				2491, 2500,		'crown helmet')
shopModule:addSellableItem({'crusader helmet', 'crusaderhelmet'},		2497, 6000,		'crusader helmet')
shopModule:addSellableItem({'royal helmet', 'rh'},						2498, 30000,		'royal helmet')
shopModule:addSellableItem({'warrior helmet', 'warriorhelmet'},			2475, 5000,		'warrior helmet')

local node10 = keywordHandler:addKeyword({'fgrrtrtrrre'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I will buy all legs.'}) 
 
-- Keep these here so they don't mix up keywords
shopModule:addSellableItem({'crown legs', 'crownlegs'},				2488, 12000,		'crown legs')
shopModule:addSellableItem({'knight legs', 'knightlegs'},			2477, 5000,		'knight legs')
shopModule:addSellableItem({'plate legs', 'platelegs'},				2647, 500,		'plate legs')
--

local node11 = keywordHandler:addKeyword({'botjs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I will buy all boots.'}) 
 
-- Keep these here so they don't mix up keywords
shopModule:addSellableItem({'boots of haste', 'boh'},				2195, 30000,		'boots of haste')
shopModule:addSellableItem({'fur boots', 'furboots'},				7457, 2000,		'fur boots')
shopModule:addSellableItem({'steel boots', 'steelboots'},			2645, 30000,		'steel boots')
--

 
local node12 = keywordHandler:addKeyword({'skkkkkkknbbs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I will buy all shields.'})
 
shopModule:addSellableItem({'crown shield', 'crownshield'},			2519, 8000,		'crown shield')
shopModule:addSellableItem({'dragon shield', 'dragonshield'},		2516, 4000,		'dragon shield')
shopModule:addSellableItem({'guardian shield', 'guardianshield'},	2515, 2000,		'guardian shield')
shopModule:addSellableItem({'tower shield', 'towershield'},			2528, 8000,		'tower shield')
shopModule:addSellableItem({'vampire shield', 'vampireshield'},		2534, 15000,		'vampire shield')
 


npcHandler:addModule(FocusModule:new())
 