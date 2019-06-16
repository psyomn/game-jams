require "char"

Enemy = {}
Enemy.__index = Enemy

EnemyType{imp = "img/Imp.png", gnome = "img/Gnome.png"}

function Enemy.makeGnome()
end

function Enemy.makeImp()
end

function Enemy:new(x, y, theType)
   local obj = {}
   setmetatable(obj, Enemy)

   obj.char = Char:new(10, 10, 9, 8, theType, 0.3)

   obj.phys = {}

   obj.char.update = function(self, dt)
      self.animation.currentTime = self.animation.currentTime + dt
   end

   return obj
end

function Enemy:update(dt)
   self.char:update(dt)
end

function Enemy:draw()
   self.char:draw()
end
