Char = {}
Char.__index = Char

function Char:new(x, y,
                  spriteWidth, spriteHeight,
                  imgSprite, duration)
   local obj = {}
   setmetatable(obj,Char)
   obj.x = x
   obj.y = y
   obj.w = spriteWidth
   obj.h = spriteHeight
   obj.animation = newAnimation()
   return obj
end


function Char:update(dt)
end

function Char:draw()
   love.graphics.draw(
      self.animation.spritesheet,
      self.animation.quads[1],
      self.x + offset, self.y,
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
