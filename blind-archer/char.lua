require "utils"
require "settings"

Char = {}
Char.__index = Char

function Char:new(x, y,
                  spriteWidth, spriteHeight,
                  imgSpritePath, duration)
   local obj = {}
   setmetatable(obj,Char)

   assert(x ~= nil and y ~= nil, "must provide x, y")
   assert(spriteWidth ~= nil, "must provide sprite width")
   assert(spriteHeight ~= nil, "must provide sprite height")
   assert(imgSpritePath ~= nil, "must provide sprite path")
   assert(duration ~= nil, "must provide duration of animation")

   sett = settings()

   obj.x = x
   obj.y = y
   obj.x_vel = 0
   obj.y_vel = 0
   obj.active = true
   obj.w = spriteWidth
   obj.h = spriteHeight
   obj.direction = 1
   obj.img = love.graphics.newImage(imgSpritePath)
   obj.speed = sett.default.speed

   local py = love.physics
   obj.phys = {}
   obj.phys.body = py.newBody(world, obj.w, obj.h, "dynamic")
   obj.phys.shape = py.newRectangleShape(obj.w, obj.h)
   obj.phys.fixture = py.newFixture(
      obj.phys.body, obj.phys.shape, 1)

   obj.animation = newAnimation(
      obj.img, spriteWidth, spriteHeight, duration)

   return obj
end

function Char:update(dt)
   assert(false, "override me")
end

function Char:draw()
   local offset = 0
   if self.direction < 0 then
      offset = self.w * yscale
   end

   local spriteNum = math.floor(
      (self.animation.currentTime / self.animation.duration)
         * #self.animation.quads) % #self.animation.quads + 1

   love.graphics.draw(
      self.animation.spritesheet,
      self.animation.quads[spriteNum],
      -- self.x + offset, self.y,
      self.phys.body:getX(),
      self.phys.body:getY(),
      0,
      self.direction * xscale,
      yscale)
end

function Char:getY()
   return self.y
end

function Char:getX()
   return self.x
end
