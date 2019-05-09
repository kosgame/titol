local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
setCombatParam(combat, COMBAT_PARAM_USECHARGES, true)

function getSpellDamage(cid, attackSkill, weaponAttack, attackFactor)
    local hit = (getPlayerLevel(cid) * 2.0 + (getPlayerSkill(cid, 4) * 2 + 50 + (getPlayerMagLevel(cid)+1) / 4) * 1)
    local damage = -(math.random(hit * 0.9, hit))
    return damage, damage
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "getSpellDamage")


function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
