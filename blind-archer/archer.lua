require "char"
require "arrow"

Archer = {}
Archer.__index = Archer

function Archer:new(x, y)
   local obj = {}
   setmetatable(obj,Archer)
   obj.char = Char:new(10, 10, 16, 16, "img/BetterArcher.png", 0.5)
   obj.swapCooldown = 1
   obj.currentSwapCooldown = 0
   obj.shootCooldown = 0.3
   obj.currentShootCooldown = 0
   obj.butterfly = nil
   obj.jump = false

   obj.char.active = true

   obj.char.phys.fixture:setFilterData(CATEGORY_PLAYER, FULL_MASK, GROUP_PLAYER)

   obj.char.update = function(self, dt)
      self.animation.currentTime = self.animation.currentTime + dt

      -- Arrow/projectile creation
      obj.currentShootCooldown = obj.currentShootCooldown + dt
      if obj.currentShootCooldown > obj.shootCooldown and love.keyboard.isDown("q") then
         arr = Arrow:new(
            obj.char.phys.body:getX(),
            obj.char.phys.body:getY(), 10, 10)

         print(obj.char.phys.body:getX(), obj.char.phys.body:getY())
         obj.currentShootCooldown = 0

         table.insert(drawable, arr)
      end

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

      if not obj.jump and love.keyboard.isDown("space") then
         obj.jump = true
         self.phys.body:applyLinearImpulse(0, -self.speed * 2)
      end

      prevX, prevY = self.phys.body:getLinearVelocity()
      if love.keyboard.isDown("left", "a") then
         self.phys.body:setLinearVelocity(-self.speed, prevY)
      end

      if love.keyboard.isDown("right", "d") then
         self.phys.body:setLinearVelocity(self.speed, prevY)
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

function Archer:setJump(jump)
   self.jump = jump
end
