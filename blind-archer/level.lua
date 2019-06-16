require "ground"

Level = {}
Level.__index = Level

function Level:new()
   local obj
   obj = {}
   setmetatable(obj, Level)
   obj.grid_w = 20
   obj.grid_h = 18
   obj.tile_w = 16
   obj.tile_h = 16

   obj.grid = {}
   for i = 1, obj.tile_w do
      for j = 1, obj.tile_h do
	 obj.grid[i] = {}
	 obj.grid[i][j] = 0
      end
   end

   obj.ground = Ground:new(obj.grid_w, obj.grid_h, obj.tile_w)
   obj.platforms = {}
   obj.clouds = {}

   

   return obj
end

function Level:update(dt)
end



function Level:draw(dt)
   self.ground:draw(dt)
end
		     
