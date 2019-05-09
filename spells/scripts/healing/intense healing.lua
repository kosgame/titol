local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setHealingFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 8, 20, 9, 12)

function onCastSpell(cid, var) 
    if isPlayer(cid) == TRUE then 
        if exhaustion.check(cid, 30030) then 
            return FALSE 
        else 
            return doRemoveCondition(cid, CONDITION_PARALYZE), doCombat(cid, combat, var) 
        end 
    else 
        return doRemoveCondition(cid, CONDITION_PARALYZE), doCombat(cid, combat, var) 
    end 
end 