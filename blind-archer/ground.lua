require "tile"

Ground = {}
Ground.__index = Ground

function Ground:new(grid_w, grid_h, tile_wh)
   local obj
   obj = {}
   setmetatable(obj, Ground)
   obj.width = grid_w
   obj.tiles = {}
   for i = 0, obj.width - 1 do
      t = Tile:new("ground", i, grid_h - 1)
      table.insert(obj.tiles, t)
   end
   return obj
end

function Ground:draw(dt)
   for i= 1, table.getn(self.tiles) do
      self.tiles[i]:draw(dt)
   end
end





