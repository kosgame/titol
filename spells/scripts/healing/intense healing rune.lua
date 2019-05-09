local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setHealingFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 7, 7, 7, 8)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
