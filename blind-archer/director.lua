require "enemy"
-- Should handle probabilistic creation of enemies and other thingies.
Director = {}
Director.__index = Director

function Director:new()
   local obj = {}
   setmetatable(obj, Director)
   obj.tickDuration = 3
   obj.tick = 0
   return obj
end

function Director:update(dt)
   self.tick = self.tick + dt

   if not (self.tick >= self.tickDuration) then
      return
   end

   self.tick = 0

   -- fire probabilities here
   if math.random(1, 10) >= 5 then
      enemy = Enemy.makeImp(windowWidth / 2, windowHeight / 8)
      table.insert(updateable, enemy)
      table.insert(drawable, enemy)
      return
   end

   if math.random(1, 10) >= 7 then
      enemy = Enemy.makeGnome(windowWidth / 2, windowHeight / 8)
      table.insert(updateable, enemy)
      table.insert(drawable, enemy)
      return
   end
end
