local keywordHandler = KeywordHandler:new()
        local npcHandler = NpcHandler:new(keywordHandler)
        NpcSystem.parseParameters(npcHandler)
        
        
        
        -- OTServ event handling functions start
        function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
        function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
        function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
        function onThink() 						npcHandler:onThink() end
        -- OTServ event handling functions end
        
        
        -- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
        local travelNode = keywordHandler:addKeyword({'carlin'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32387, y=31820, z=6} })
        
	local travelNode = keywordHandler:addKeyword({'ab\'dendriel'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32734, y=31668, z=6} })
        
	local travelNode = keywordHandler:addKeyword({'thais'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32310, y=32210, z=6} })
        
	local travelNode = keywordHandler:addKeyword({'port hope'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32527, y=32784, z=6} })
        
	local travelNode = keywordHandler:addKeyword({'ankrahmun'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33092, y=32883, z=6} })

	local travelNode = keywordHandler:addKeyword({'liberty bay'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32285, y=32892, z=6} })

			
			local travelNode = keywordHandler:addKeyword({'cormaya'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33287, y=31955, z=6} })
			
			local travelNode = keywordHandler:addKeyword({'venore'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32954, y=32022, z=6} })

        
        keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Where do you want to go? To Thais, Carlin, Ab\'Dendriel, Venore, Port Hope, Ankrahmun, Liberty Bay or the isle Cormaya?'})
        keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m the captain of this sailing ship.'})
		keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m the captain of this sailing ship.'})
       

        npcHandler:addModule(FocusModule:new())