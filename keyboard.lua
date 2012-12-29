--[[

keyboard - Keyboard helper for Love2D game engine.
BSD license.
by Sven Nilsen, 2012
http://www.cutoutpro.com

Version: 0.000 in angular degrees version notation
http://isprogrammingeasy.blogspot.no/2012/08/angular-degrees-versioning-notation.html

Modifier keys can be troublesome to deal with in keypress events.
For example, the user hits Ctrl and then another key, which state needs to be tracked.
This module keeps track of which modifier keys are pressed.

--]]

--[[
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
The views and conclusions contained in the software and documentation are those
of the authors and should not be interpreted as representing official policies,
either expressed or implied, of the FreeBSD Project.
--]]

local keyboard = {}

-- Contains the states of different modifier keys.
local keys = {
  lshift = 1, 
  lctrl = 2, 
  lalt = 3, 
  lmeta = 4, 
  rshift = 5,
  rctrl = 6,
  ralt = 7, 
  rmeta = 8
}

-- Returns true if any modifier key is pressed.
function keyboard.anyDown()
  for i, val in pairs(keys) do
    if val < 0 then return true end
  end
  
  return false
end

function keyboard.ctrlDown()
  if keys["lctrl"] < 0 or keys["rctrl"] < 0 then return true end
    
    return false
end

function keyboard.shiftDown()
  if keys["lshift"] < 0 or keys["rshift"] < 0 then return true end
  
  return false
end

function keyboard.altDown()
  if keys["lalt"] < 0 or keys["ralt"] < 0 then return true end
  
  return false
end

function keyboard.metaDown()
  if keys["lmeta"] < 0 or keys["rmeta"] < 0 then return true end
  
  return false
end

-- Returns true if the keys should be filtered.
function keyboard.press(key)
 local isModifier = keys[key] ~= nil
 if not isModifier and keyboard.anyDown() then return true end
 if not isModifier then return false end
 
 keys[key] = -math.abs(keys[key])
 return true
end

-- Releases modifier keys.
function keyboard.release(key)
 local isModifier = keys[key] ~= nil
  if isModifier then keys[key] = math.abs(keys[key]) end
  
  return false
end

return keyboard
