require "ground"

Level = {}
Level.__index = Level

function Level:new()
   local obj
   obj = {}
   setmetatable(obj, Level)
   grid_w = 16
   grid_h = 9
   tile_w = 16
   tile_h = 16

   grid = {}
   for i = 1, tile_w do
      for j = 1, tile_h do
	 grid[i] = {}
	 grid[i][j] = 0
      end
   end

   ground = Ground:new(grid_w, grid_h, tile_w)
   platforms = {}
   clouds = {}

   

   return obj
end

function Level:update(dt)
end



function Level:draw(dt)
   ground:draw(dt)
end
		     
