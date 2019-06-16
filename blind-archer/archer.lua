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
   obj.jump = false

   obj.char.active = true

   obj.char.phys.fixture:setFilterData(CATEGORY_PLAYER, FULL_MASK, GROUP_PLAYER)
   -- categories, mask, group = obj.char.phys.fixture:getFilterData()
   -- print("categories: ", categories, "mask ", mask, "group ", group)

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

function Archer:setJump(jump)
   self.jump = jump
end
