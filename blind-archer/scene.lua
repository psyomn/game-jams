require "utils"

Scene = {}
Scene.__index = Scene

function Scene.makeIntro()
   local spriteHeight, spriteWidth = 64, 64
   local anim = newAnimation(
      love.graphics.newImage("img/Faim.png"),
      spriteWidth, spriteHeight,
      4)

   local scene = Scene:new()
   local stop = false
   local x = (windowWidth / 2) - (3 * spriteWidth / 2)
   local y = (windowHeight / 2) - (3 * spriteHeight / 2) - 16

   love.graphics.setBackgroundColor(0.50, 0.56, 0.49)

   scene.update = function(self, dt)
      anim.currentTime = anim.currentTime + dt

      if not stop then
         return
      end

      if love.keyboard.isDown("space") then
         gameState = "main"
      end
   end

   scene.draw = function(self)
      local spriteNum = math.floor(
         (anim.currentTime / anim.duration) * #anim.quads)
         % #anim.quads + 1

      if spriteNum == #anim.quads then
         stop = true
      end

      if stop then
         spriteNum = #anim.quads
      end

      love.graphics.draw(
         anim.spritesheet,
         anim.quads[spriteNum],
         x, y, 0, 3, 3)

      if not stop then
         -- should we draw text yet? Want to wait until animation is
         -- done.
         return
      end

      if math.floor(anim.currentTime) % 2 == 0 then
         r,g,b,a = love.graphics.getColor()

         love.graphics.setColor(0.2, 0.3, 0.2)
         love.graphics.print(
            "press space",
            windowWidth / 2 - 80,
            y + spriteHeight * 3 + 16, 0, 2, 2)

         love.graphics.setColor(r,g,b,a)
      end
   end

   return scene
end

function Scene.makeGameOver()
   local scene = Scene:new()

   scene.update = function(self, dt)
      if love.keyboard.isDown("space") then
         gameState = "main"
      end
   end

   scene.draw = function(self)
      local r,g,b,a= love.graphics.getColor()
      love.graphics.setColor(0, 0, 0)
      love.graphics.print("game over", 10, 10)
      love.graphics.print("press space key", 10, 30)
      love.graphics.setColor(r,g,b,a)
   end

   return scene
end

function Scene:new()
   local obj = {}
   setmetatable(obj,Scene)
   return obj
end

function Scene:update()
   assert(false, "implement me")
end

function Scene:draw()
   assert(false, "implement me")
end
