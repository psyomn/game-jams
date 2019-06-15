require "char"

Archer = {}
Archer.__index = Archer

function Archer:new(x, y)
   local obj = {}
   setmetatable(obj,Archer)
   obj.char = Char:new(
      10, 10, 16, 16, "img/BetterArcher.png", 0.3)

   obj.char.active = true

   obj.char.update = function(self, dt)
      if not self.active then
         return
      end

      if love.keyboard.isDown("e") then
         self.active = not self.active
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
