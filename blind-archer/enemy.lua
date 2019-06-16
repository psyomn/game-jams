require "char"

Enemy = {}
Enemy.__index = Enemy

EnemyType = {imp = "img/Imp.png", gnome = "img/Gnome.png"}

function Enemy.makeGnome(x, y)
   -- 16, 16
   return Enemy:new(x, y, EnemyType.gnome, 16, 16)
end

function Enemy.makeImp(x, y)
   -- 14, 14
   return Enemy:new(x, y, EnemyType.imp, 14, 14)
end

function Enemy:new(x, y, theType, w, h)
   local obj = {}
   setmetatable(obj, Enemy)

   obj.char = Char:new(x, y, w, h, theType, 0.3)

   obj.phys = {}
   obj.char.phys.fixture:setFilterData(
      CATEGORY_ENEMY,
      bit.bor(CATEGORY_SCENERY, CATEGORY_PLAYER, CATEGORY_PROJECTILE),
      GROUP_ENEMY)

   -- hacky but wtv
   obj.char.phys.fixture:setUserData(obj)
   obj.expired = false

   obj.char.update = function(self, dt)
      self.animation.currentTime = self.animation.currentTime + dt

      _prevX, prevY = self.phys.body:getLinearVelocity()
      self.phys.body:setLinearVelocity(-10, prevY)
   end

   return obj
end

function Enemy:update(dt)
   self.char:update(dt)
end

function Enemy:draw()
   self.char:draw()
end

function Enemy:isExpired()
   return self.expired
end

function Enemy:setExpired(exp)
   self.expired = exp
end

function Enemy:name()
   return "enemy"
end
