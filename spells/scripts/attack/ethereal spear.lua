local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)

function getSpellDamage(cid, attackSkill, weaponAttack, attackFactor)
    local hit = (getPlayerLevel(cid) * 1.3 + (getPlayerSkill(cid, 4) * 1.0 + 25 + (getPlayerMagLevel(cid)+1) / 4) * 0.9)
    local damage = -(math.random(hit * 0.8, hit))
    return damage, damage
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "getSpellDamage")
    
function onCastSpell(cid, var)
    return doCombat(cid, combat, var)
end  