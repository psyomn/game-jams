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
  

   
   obj.platforms = generate_platforms(obj.grid_w, obj.grid_h)
   
   
   return obj
end

function generate_platforms(grid_w, grid_h)


   left = math.random(1, 8)
   right = left + math.random(1, 8)
   platforms = {}
   

   table.insert(platforms, Platform:new(left, right, grid_h - 3, 16))


   platform_h = math.random(1, grid_h - 8)
   for i= 1, platform_h do

      max_platform_w = math.floor(i/2) + 1
      
      last_left = left
      last_right = right


      
      

      if last_left <= 7 then
	 left = last_right + 1
	 right = left + math.random(1, max_platform_w)

      elseif last_right >= grid_w - 7 then
	 right = last_left - 1
	 left = right - math.random(1, max_platform_w)
	 print(right)
	 print(left)
	 
      else
	 if math.random() < 0.5 then	    
	    left = last_right + 1
	    right = left + math.random(1, max_platform_w)-- / (grid_h / 4)
	 else
	    right = last_left - 1
	    right = left - math.random(1, max_platform_w)-- / (grid_h / 4)
	 end
      end

      table.insert(platforms, Platform:new(left, right, grid_h - (3 + 2 * i), 16))      
   end


   
   return platforms
end

function Level:update(dt)
end



function Level:draw(dt)
   self.sky:draw(dt)
   self.ground:draw(dt)
   for i, el in pairs(self.platforms) do
      el:draw(dt)
   end
   
--   self.platform:draw(dt)
end
		     
