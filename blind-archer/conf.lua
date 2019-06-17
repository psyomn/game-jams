require "settings"

function love.conf(t)
   s = settings()

   t.version = "11.2"
   t.window.width = s.window.x
   t.window.height = s.window.y
   t.window.title = "FAIM"
   t.window.fullscreen = false
end
