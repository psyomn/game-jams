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
   
   for j = 0, obj.height/4 do
      for i = 0, obj.width do
	 if math.random() < 0.02 then
	    t = Tile:new("cloud_close", i, j)
	    obj.tiles[i][j] = t
	 end
      end
   end

   for j = obj.height/4, obj.height/2 do
      for i = 0, obj.width do
	 if math.random() < 0.014 then
	    t = Tile:new("cloud_medium", i, j)
	    obj.tiles[i][j] = t
	 end
      end
   end

   for j = obj.height/4, obj.height do
      for i = 0, obj.width do
	 if math.random() < 0.04 then
	    t = Tile:new("cloud_far", i, j)
	    obj.tiles[i][j] = t
	 end
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
