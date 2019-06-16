require "tile"

Sky = {}
Sky.__index = Sky

function Sky:new(grid_w, grid_h, tile_wh)
   local obj
   obj = {}
   setmetatable(obj, Sky)
   obj.width = grid_w
   obj.height = grid_h

   obj.tiles = {}

   for i = 0, obj.width do
      obj.tiles[i] = {}
      for j = 0, obj.height do
	 t = Tile:new("sky", i, j)
	 obj.tiles[i][j] = t
      end
   end

   
   return obj
end

function Sky:draw(dt)
   for i = 0, table.getn(self.tiles) -1 do
      for j = 0, table.getn(self.tiles[1]) -1 do
	 self.tiles[i][j]:draw(dt)
      end
      
   end
   
end
