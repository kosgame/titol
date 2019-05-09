local config = {
   [200] = {reward = 'premium points', count = 30, min_level = 100},
               [300] = {reward = 'premium points', count = 80, min_level = 150}, 
   [400] = {reward = 'items', items = {2160,2157,2160}, count = {1,7,1}, min_level = 200},
               [500] = {reward = 'items', items = {2160,2157,2160}, count = {1,7,1}, min_level = 300},
               [600] = {reward = 'premium points', count = 250, min_level = 350}, 
   }
local storage = 1234

local function doPlayerAddPremiumPoints(cid, points)
   return db.executeQuery("UPDATE `accounts` SET `premium_points` = `premium_points` + " .. points .. " WHERE `id` = " .. getPlayerAccountId(cid) .. ";")
end 
   
function onLogin(cid)
local ip_tbl = {}
for k, v in pairs(config) do
if k == #getOnlinePlayers() and getStorage(storage) < k then
 doSetStorage(storage, k)
 for _, s in ipairs(getOnlinePlayers()) do
  if isInArray(ip_tbl, getPlayerIp(s)) == false and getPlayerLevel(s) >= v.min_level then
   table.insert(ip_tbl, getPlayerIp(s))
   if v.reward == 'premium points' then
    doPlayerAddPremiumPoints(s, v.count)
   elseif v.reward == 'items' then
    local p = math.random(#v.items)
    doPlayerAddItem(s, v.items[p], v.count[p])
   end
  end
 end
end
end
return true
end