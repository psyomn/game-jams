require "char"

Archer = {}
Archer.__index = Archer

function Archer:new(x, y)
   local obj = {}
   setmetatable(obj,Archer)
   obj.char = Char:new(10, 10, 16, 16, "img/BetterArcher.png", 0.5)
   obj.swapCooldown = 1
   obj.currentSwapCooldown = 0
   obj.butterfly = nil

   obj.char.active = true

   obj.char.update = function(self, dt)
      self.animation.currentTime = self.animation.currentTime + dt

      if not self.active then
         return
      end

      if obj.currentSwapCooldown <= 0 and love.keyboard.isDown("e") then
         self.active = false
         obj.butterfly.char.active = true
         obj.currentSwapCooldown = obj.swapCooldown
         obj.butterfly.currentSwapCooldown = obj.swapCooldown
      end

      obj.currentSwapCooldown = obj.currentSwapCooldown - dt
      if obj.currentSwapCooldown < 0 then
         obj.currentSwapCooldown = 0
      end

      if love.keyboard.isDown("space") then
         -- jump
      end

      if love.keyboard.isDown("left", "a") then
         self.x = self.x - self.speed * dt
      end

      if love.keyboard.isDown("right", "d") then
         self.x = self.x + self.speed * dt
      end

      if love.keyboard.isDown("down", "s") then
      end
   end

   return obj
end

function Archer:update(dt)
   self.char:update(dt)
end

function Archer:draw()
   self.char:draw()
end

function Archer:couple(other)
   self.butterfly = other
end
