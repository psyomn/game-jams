require "tile"

Platform = {}
Platform.__index = Platform

function Platform:new(x_left, x_right, y, tile_wh)
   local obj
   obj = {}
   setmetatable(obj, Platform)
   obj.x_left = x_left
   obj.x_right = x_right
   obj.width = x_right - x_left + 1
   obj.height = y

   obj.tiles = {}

   obj.tiles[x_left] = Tile:new("platform_left", x_left, obj.height)
   obj.tiles[x_right] = Tile:new("platform_right", x_right, obj.height)

   if obj.width > 2 then
      for i = x_left + 1, x_right - 1 do
	 t = Tile:new("platform_middle", i, obj.height)
	 obj.tiles[i] = t
      end
   end

   return obj
end
   
function Platform:draw(dt)
   for i = self.x_left, self.x_right do
      self.tiles[i]:draw()
   end
   
end
