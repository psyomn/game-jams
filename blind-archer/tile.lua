
Tile = {}
Tile.__index = Tile

function Tile:new(t_type, pos_x, pos_y)
   local obj
   obj = {}
   setmetatable(obj, Tile)
   obj.tile_w = 16
   obj.tile_h = 16
   obj.tileset = love.graphics.newImage("img/Tileset.png")
   obj.tile_type = t_type
   obj.quad = select_quad(obj.tile_type, obj.tileset, obj.tile_w, obj.tile_h)
   obj.x = pos_x * obj.tile_w
   obj.y = pos_y * obj.tile_h
   return obj
end

function select_quad(t_type, tileset, w, h)
   if t_type == "ground" then
      x = math.random(0, 3)
      return love.graphics.newQuad(x * w, 3 * h, w, h, tileset:getDimensions())
   elseif t_type == "sky" then
      return love.graphics.newQuad(1 * w, 2 * h, w, h, tileset:getDimensions())
   end
end

function Tile:draw(dt)
   --   print("what?")
   love.graphics.draw(self.tileset, self.quad, self.x, self.y, 0, xscale, yscale)
end
