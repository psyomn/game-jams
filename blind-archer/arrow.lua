require "char"

Arrow = {}
Arrow.__index = Arrow

function Arrow:new(x, y, pos_x, pos_y)
   local obj = {}
   setmetatable(obj,Arrow)
   obj.char = Char:new(
      x, y,
      10, 3, "img/arrow.png", 0.1)

   obj.pos_x = pos_x
   obj.pos_y = pos_y
   obj.expiration = 5

   obj.char.phys.fixture:setFilterData(
      CATEGORY_PROJECTILE,
      bit.bor(CATEGORY_ENEMY, CATEGORY_SCENERY),
      GROUP_PROJECTILE)

   obj.char.phys.fixture:setUserData(obj)

   obj.char.phys.body:setLinearDamping(8)

   return obj
end

function Arrow:update(dt)
   self.char.phys.body:setLinearVelocity(self.pos_x, self.pos_y)
   self.expiration = self.expiration - dt
end

function Arrow:draw()
   self.char:draw()
end

function Arrow:isExpired()
   return self.expiration <= 0
end

function Arrow:setExpired(exp)
   if exp == true then
      self.expiration = -1
   end
end

function Arrow:name()
   return "arrow"
end
