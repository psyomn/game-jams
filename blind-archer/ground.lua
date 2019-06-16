require "tile"

Ground = {}
Ground.__index = Ground

function Ground:new(grid_w, grid_h, tile_wh)
   local obj
   obj = {}
   setmetatable(obj, Ground)
   width = w
   tiles = {}
   for i = 1, grid_w do
      t = Tile:new("ground", i, grid_h)
      table.insert(tiles, t)
   end
   return obj
end

function Ground:draw(dt)
   for i= 1, table.getn(tiles) do
      tiles[i]:draw(dt)
   end
end





