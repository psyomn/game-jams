require "archer"
require "butterfly"

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

   world = love.physics.newWorld(0, 0)

   ch = Archer:new(10, 10)
   bu = Butterfly:new(20, 10)

   drawable = {ch, bu}
   updateable = {ch, bu}
end

function love.update(dt)
   if love.keyboard.isDown("escape") then
      love.event.quit()
   end

   if gameState == "main" then
   elseif gameState == "intro" then
   elseif gameState == "game_over" then
   end

   for k, el in pairs(updateable) do
      el:update(dt)
   end
end

function love.draw()
   if gameState == "main" then
      for i, el in pairs(drawable) do
         el:draw()
      end
   elseif gameState == "intro" then
   elseif gameState == "game_over" then
   end
end
