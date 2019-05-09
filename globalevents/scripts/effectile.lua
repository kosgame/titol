local config = {
positions = {
["Trainers"] = { x = 32366, y = 32236, z = 7 },
["Trainers "] = { x = 32955, y = 32073, z = 7 }

},

	effects = {
		CONST_ME_MAGIC_GREEN,
	},

	colors = {
		TEXTCOLOR_YELLOW
	}
}

function onThink(cid, interval, lastExecution)
	for text, pos in pairs(config.positions) do
		doSendMagicEffect(pos, config.effects[math.random(1, #config.effects)])
		doSendAnimatedText(pos, text, config.colors[math.random(1, #config.colors)])
	end
	return TRUE
end