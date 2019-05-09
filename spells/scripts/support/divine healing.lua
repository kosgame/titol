local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
function onGetFormulaValues(cid, level, maglevel)
min = (level * 0.8 + maglevel * 10.6) * 0.915
max = (level * 2.1 + maglevel * 21.9) * 0.915
return min, max	
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

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
