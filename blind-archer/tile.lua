
Tile = {}
Tile.__index = Tile

function Tile:new(t_type, pos_x, pos_y)
   local obj
   obj = {}
   setmetatable(obj, Tile)
   tile_w = 16
   tile_h = 16
   tileset = love.graphics.newImage("img/Tileset.png")
   tile_type = t_type
   quad = select_quad(tile_type, tileset)
   x = pos_x
   y = pos_y
   return obj
end

function select_quad(t_type, tileset)
   if t_type == "ground" then
      x = math.random(0, 4)
      return love.graphics.newQuad(x, 4, tile_w, tile_h, tileset:getDimensions())
   end
end

function Tile:draw(dt)
   --   print("what?")
   print(self.tileset)
   love.graphics.draw(self.tileset, self.quad, self.x, self.y, 0, xscale, yscale)
end
