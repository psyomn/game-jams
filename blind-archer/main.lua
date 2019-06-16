require "archer"
require "butterfly"
require "level"

function love.load()
   love.graphics.setBackgroundColor(1, 1, 1)
   -- theme = love.audio.newSource("snd/song.ogg", "stream")
   -- theme:setLooping(true)
   -- theme:play()

   -- turn off antialiasing
   love.graphics.setDefaultFilter("nearest", "nearest", 1)
   sett = settings()

   -- SCALING
   windowWidth = love.graphics.getWidth()
   windowHeight = love.graphics.getHeight()
   xscale = windowWidth / sett.window.x
   yscale = windowHeight / sett.window.y


   -- Actors
   ch = Archer:new(10, 10)
   bu = Butterfly:new(20, 10)
   ch:couple(bu)
   bu:couple(ch)

   world = love.physics.newWorld(0, 0)

   -- Level
   level = Level:new()

   drawable = {ch, bu, level}
   updateable = {ch, bu}

   gameState = "main"
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

function love.draw(dt)
   if gameState == "main" then
      for i, el in pairs(drawable) do
         el:draw(dt)
      end
   elseif gameState == "intro" then
   elseif gameState == "game_over" then
   end

   -- draw borders of drawing area
   love.graphics.rectangle("line", 0, 0, windowWidth, windowHeight)
end
