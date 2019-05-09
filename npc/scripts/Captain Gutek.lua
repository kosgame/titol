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
		
        
	local travelNode = keywordHandler:addKeyword({'ab dendriel'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32734, y=31668, z=6} })
        
	local travelNode = keywordHandler:addKeyword({'edron'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33173, y=31764, z=6} })
			
			local travelNode = keywordHandler:addKeyword({'venore'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32954, y=32022, z=6} })
        	
        
	local travelNode = keywordHandler:addKeyword({'port hope'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32527, y=32784, z=6} })

	local travelNode = keywordHandler:addKeyword({'svargrond'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32341, y=31108, z=6} })


	local travelNode = keywordHandler:addKeyword({'liberty bay'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32285, y=32892, z=6} })
	
		local travelNode = keywordHandler:addKeyword({'ankrahmun'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33092, y=32883, z=6} })
		
			local travelNode = keywordHandler:addKeyword({'darashia'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33289, y=32480, z=6} })
			
				local travelNode = keywordHandler:addKeyword({'zao'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33030, y=31553, z=9} })
				
		local travelNode = keywordHandler:addKeyword({'gengia'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=17012, y=21228, z=6} })
		
				local travelNode = keywordHandler:addKeyword({'oken'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=21959, y=16496, z=6} })
				
		local travelNode = keywordHandler:addKeyword({'pyre'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=13062, y=16630, z=6} })

	local travelNode = keywordHandler:addKeyword({'farmine'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33158, y=31226, z=7} })

	local travelNode = keywordHandler:addKeyword({'thais'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32310, y=32210, z=6} })

			local travelNode = keywordHandler:addKeyword({'yalahar'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32816, y=31272, z=6} })
			
						local travelNode = keywordHandler:addKeyword({'cormaya'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33287, y=31955, z=6} })
			
	local travelNode = keywordHandler:addKeyword({'goroma'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32161, y=32558, z=6} })
	
		local travelNode = keywordHandler:addKeyword({'zenit'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=23003, y=21346, z=6} })
		
				local travelNode = keywordHandler:addKeyword({'vinea'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=22752, y=21134, z=6} })
				
		local travelNode = keywordHandler:addKeyword({'ilania'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=22191, y=16630, z=7} })
        
        keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Where do you want to go? To Carlin, Ab Dendriel, Edron, Venore, Port Hope, Goroma, Pyre, Oken, Gengia, Farmine, Darashia, Ankrahmun, Liberty Bay, Cormaya, Yalahar, Zenit, Vinea, Ilania and Svargrond.'})
        keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the captain of this ship.'})
		keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the captain of this ship.'})
       

        npcHandler:addModule(FocusModule:new())