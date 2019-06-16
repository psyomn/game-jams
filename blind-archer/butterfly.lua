require "char"

Butterfly = {}
Butterfly.__index = Butterfly

function Butterfly:new(x, y)
   local obj = {}
   setmetatable(obj,Butterfly)
   obj.char = Char:new(10, 10, 9, 8, "img/butterfly.png", 0.3)
   obj.archer = nil
   obj.swapCooldown = 1
   obj.currentSwapCooldown = 0

   -- archer is always the first active
   obj.char.active = false
   obj.moving = false

   obj.char.update = function(self, dt)
      self.animation.currentTime = self.animation.currentTime + dt

      if not self.active then
         return
      end

      if obj.currentSwapCooldown <= 0 and love.keyboard.isDown("e") then
         self.active = false
         obj.currentSwapCooldown = obj.swapCooldown
         obj.archer.char.active = true
      end

      obj.currentSwapCooldown = obj.currentSwapCooldown - dt
      if obj.currentSwapCooldown < 0 then
         obj.currentSwapCooldown = 0
      end

      if love.keyboard.isDown("space") then
         -- jump
      end

      prevX, prevY = self.phys.body:getLinearVelocity()
      if love.keyboard.isDown("left", "a") then
         self.char.body:setLinearVelocity(self.speed, prevY)
      end

      if love.keyboard.isDown("right", "d") then
         self.char.body:setLinearVelocity(-self.speed, prevY)
      end

      if love.keyboard.isDown("down", "s") then
      end
   end

   return obj
end

function Butterfly:update(dt)
   self.char:update(dt)
end

function Butterfly:draw()
   self.char:draw()
end

function Butterfly:couple(other)
   self.archer = other
end
