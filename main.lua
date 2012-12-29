
local left = {2, 6}
local right = {5, 9}

local modifier = require "keyboard"

function love.keypressed(key)
  -- Custom exit combination.
  if modifier.metaDown() and key == "t" then
    os.exit(0)
  end
  if modifier.press(key) then return end
  
  print(key)
end

function love.keyreleased(key)
    if modifier.release(key) then return end
end
