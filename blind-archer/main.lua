require "categories"
require "archer"
require "butterfly"
require "level"
require "enemy"
require "director"

function love.load()
   -- turn off antialiasing
   love.graphics.setDefaultFilter("nearest", "nearest", 1)
   love.graphics.setBackgroundColor(0.8, 1, 0.8)

   sett = settings()

   -- Music
   -- theme = love.audio.newSource("snd/song.ogg", "stream")
   -- theme:setLooping(true)
   -- theme:play()

   -- Scaling
   windowWidth = love.graphics.getWidth()
   windowHeight = love.graphics.getHeight()
   xscale = windowWidth / sett.window.x
   yscale = windowHeight / sett.window.y

   -- Physics
   love.physics.setMeter(16)
   world = love.physics.newWorld(0, 9.81 * 64, true)
   world:setCallbacks(beginContact, endContact, preSolve, postSolve)

     -- Window borders
     borderWidth = 16
     windowBorders = {}
     windowBorders.left = {}
     windowBorders.right = {}
     windowBorders.top = {}
     windowBorders.bottom = {}

     local py = love.physics
     windowBorders.left.body = py.newBody(world, -16, 0)
     windowBorders.left.shape = py.newRectangleShape(borderWidth, windowHeight * 2)
     windowBorders.left.fixture = py.newFixture(windowBorders.left.body, windowBorders.left.shape, 1)
     windowBorders.left.fixture:setFilterData(CATEGORY_SCENERY, FULL_MASK, GROUP_WALL)

     windowBorders.right.body = py.newBody(world, windowWidth, 0)
     windowBorders.right.shape = py.newRectangleShape(borderWidth, windowHeight * 2)
     windowBorders.right.fixture = py.newFixture(windowBorders.right.body, windowBorders.right.shape, 1)
     windowBorders.right.fixture:setFilterData(CATEGORY_SCENERY, FULL_MASK, GROUP_WALL)

     windowBorders.top.body = py.newBody(world, 0, 0)
     windowBorders.top.shape = py.newRectangleShape(windowWidth, borderWidth)
     windowBorders.top.fixture = py.newFixture(windowBorders.top.body, windowBorders.top.shape, 1)
     windowBorders.top.fixture:setFilterData(CATEGORY_SCENERY, FULL_MASK, GROUP_WALL)

   -- Actors
   ch = Archer:new(10, 10)
   bu = Butterfly:new(20, 10)
   dir = Director:new()

   ch:couple(bu)
   bu:couple(ch)

   -- Level
   level = Level:new()

   drawable = {level, ch, bu, e1}
   updateable = {ch, bu, e1, dir}

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

   -- gets rid of expired objects
   updateable = cleanTable(updateable)
   for k, el in pairs(updateable) do
      el:update(dt)
   end
end

function love.draw(dt)
   if gameState == "main" then
      drawable = cleanTable(drawable)
      for i, el in pairs(drawable) do
         el:draw(dt)
      end
   elseif gameState == "intro" then
   elseif gameState == "game_over" then
   end

   -- draw borders of drawing area
   love.graphics.rectangle("line", 0, 0, windowWidth, windowHeight)
end

--
-- Physics
--
function beginContact(fixA, fixB)
   categoryA, maskA, groupA = fixA:getFilterData()
   categoryB, maskB, groupB = fixB:getFilterData()

   if groupA == GROUP_PLAYER and groupB == GROUP_GROUND or
      groupA == GROUP_GROUND and groupB == GROUP_PLAYER then
      -- player touches ground tile
      ch:setJump(false)
   end

   if groupA == GROUP_PROJECTILE and groupB == GROUP_ENEMY or
   groupB == GROUP_PROJECTILE and groupA == GROUP_ENEMY then
      -- arrow hits enemy in the knee
      uObjA = fixA:getUserData()
      uObjB = fixB:getUserData()
      uObjA:setExpired(true)
      uObjB:setExpired(true)

      uObjA.char.phys.fixture:destroy()
      uObjB.char.phys.fixture:destroy()
   end
end

function endContact()
end

function preSolve()
end

function postSolve()
end
