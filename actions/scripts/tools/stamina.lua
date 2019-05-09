 local cfg =
{
       itemid = 2294,
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
       if (item.itemid == cfg.itemid) then
     doPlayerSetStamina(cid, 2520)
                       doSendAnimatedText(getCreaturePosition(cid), "Stamina!",TEXTCOLOR_RED)
                       doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)
                       doCreatureSay(cid, "You have reloaded your stamina.", TALKTYPE_ORANGE_1)  
                       doRemoveItem(item.uid, 1)  
               return TRUE
       end
end