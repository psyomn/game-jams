require "ground"
require "sky"
require "platform"

Level = {}
Level.__index = Level

function Level:new()
   local obj
   obj = {}
   setmetatable(obj, Level)
   obj.grid_w = 18
   obj.grid_h = 20
   obj.tile_w = 16
   obj.tile_h = 16

   obj.grid = {}
   for i = 1, obj.tile_w do
      for j = 1, obj.tile_h do
	 obj.grid[i] = {}
	 obj.grid[i][j] = 0
      end
   end


   obj.sky = Sky:new(obj.grid_w, obj.grid_h, obj.tile_w)
   obj.ground = Ground:new(obj.grid_w, obj.grid_h, obj.tile_w)
   obj.platform = Platform:new(10, 15, 17, 16)
   obj.platforms = {obj.platform}

   
   return obj
end

function Level:update(dt)
end



function Level:draw(dt)
   self.sky:draw(dt)
   self.ground:draw(dt)
   self.platform:draw(dt)
end
		     
