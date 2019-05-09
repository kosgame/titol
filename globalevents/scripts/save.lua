function onThink()
 for var = 1,3 do
		if var == 1 then
			doBroadcastMessage("Full server save, please mind it may freeze!")
		end
		if var == 2 then
			doSaveServer()
			doBroadcastMessage("Saving server...")
		end
		if var == 3 then
			doBroadcastMessage("The server has been successfully saved.")
		end
	end
	return true
end