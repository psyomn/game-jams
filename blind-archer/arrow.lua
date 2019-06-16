require "char"

Arrow = {}
Arrow.__index = Arrow

function Arrow:new(x, y, vel_x, vel_y)
   local obj = {}
   setmetatable(obj,Arrow)
   obj.char = Char:new(x, y, 10, 3, "img/arrow.png", 0.1)
   obj.vel_x = vel_x
   obj.vel_y = vel_y
   obj.expiration = 5

   obj.char.phys.fixture:setFilterData(
      CATEGORY_PLAYER, FULL_MASK, GROUP_PROJECTILE)

   obj.char.phys.body:setLinearVelocity(vel_x, vel_y)
   obj.char.phys.body:setLinearDamping(8)

   return obj
end

function Arrow:update(dt)
   self.expiration = self.expiration - dt
end

function Arrow:draw()
   self.char:draw()
end

function Arrow:isExpired()
   return self.expiration <= 0
end
