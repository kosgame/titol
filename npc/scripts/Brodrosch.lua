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
        local travelNode = keywordHandler:addKeyword({'cormaya'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost =0, destination = {x=33311, y=31989, z=15} })
			
			        local travelNode = keywordHandler:addKeyword({'farmine'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost =0, destination = {x=33025, y=31553, z=10} })

       

        npcHandler:addModule(FocusModule:new())