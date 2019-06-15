local sti = require "sti/sti"

function love.load()
   -- theme = love.audio.newSource("snd/song.ogg", "stream")
   -- theme:setLooping(true)
   -- theme:play()

   -- turn off antialiasing
   love.graphics.setDefaultFilter("nearest", "nearest", 1)

   gameState = "main"

   sett = settings()

   windowWidth = love.graphics.getWidth()
   windowHeight = love.graphics.getHeight()
   xscale = windowWidth / sett.window.x
   yscale = windowHeight / sett.window.y

   map = sti("img/maps.lua", {"box2d"})
   world = love.physics.newWorld(0, 0)
   map:box2d_init(world)
   map:addCustomLayer("Sprite Layer", 3)

   local layer = map.layers["Sprite Layer"]
   local player
   for k, object in pairs(map.objects) do
      if object.name == "player" then
         player = object
         print("found")
         break
      end
   end

   local sprite = love.graphics.newImage("img/Archer.png")
   layer.player = {
      sprite = love.graphics.newImage("img/Archer.png"),
      x = 20,
      y = 20,
      ox = sprite:getWidth() / 2,
      oy = sprite:getHeight() / 1.35,
      r = 0,
   }

   layer.draw = function(self)
      love.graphics.draw(
         self.player.sprite,
         math.floor(self.player.x),
         math.floor(self.player.y),
         0, 1, 1,
         self.player.ox,
         self.player.oy
      )
   end

   drawable = {}
end

function love.update(dt)
   if love.keyboard.isDown("escape") then
      love.event.quit()
   end

   if gameState == "main" then
   elseif gameState == "intro" then
   elseif gameState == "game_over" then
   end
end

function love.draw()
   -- map:box2d_draw()
   map:draw()

   if gameState == "main" then
      for i, el in pairs(drawable) do
         el:draw()
      end
   elseif gameState == "intro" then
      intro_animation:draw(dt)
   elseif gameState == "game_over" then
      game_over_screen:draw()
   end
end
