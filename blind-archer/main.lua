require "archer"
require "butterfly"
require "level"

function love.load()
   -- turn off antialiasing
   love.graphics.setDefaultFilter("nearest", "nearest", 1)
   love.graphics.setBackgroundColor(0.8, 1, 0.8)
   sett = settings()

   -- Music
   -- theme = love.audio.newSource("snd/song.ogg", "stream")
   -- theme:setLooping(true)
   -- theme:play()

   -- Physics
   love.physics.setMeter(16)
   world = love.physics.newWorld(0, 9.81 * 64, true)

   -- Scaling
   windowWidth = love.graphics.getWidth()
   windowHeight = love.graphics.getHeight()
   xscale = windowWidth / sett.window.x
   yscale = windowHeight / sett.window.y

   -- Actors
   ch = Archer:new(10, 10)
   bu = Butterfly:new(20, 10)
   ch:couple(bu)
   bu:couple(ch)

   -- Level
   level = Level:new()

   drawable = {level, ch, bu}
   updateable = {ch, bu}

   gameState = "main"
end

function love.update(dt)
   world:update(dt)

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
