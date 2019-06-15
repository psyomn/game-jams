require "char"

Butterfly = {}
Butterfly.__index = Butterfly

function Butterfly:new(x, y)
   local obj = {}
   setmetatable(obj,Butterfly)
   obj.char = Char:new(10, 10, 9, 8, "img/butterfly.png", 0.3)

   -- archer is always the first active
   obj.char.active = false

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

function Butterfly:update(dt)
   self.char:update(dt)
end

function Butterfly:draw()
   self.char:draw()
end
