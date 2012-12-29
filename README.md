lua-keyboard
============

Keyboard helper for Love2D game engine.  
BSD license.  
For version log, view the individual files.  

##About This Module

Modifier keys can be troublesome to deal with in keypress events. 
For example, the user hits Ctrl and then another key, which state needs to be tracked.  
This module keeps track of which modifier keys are pressed.  

The events must be sent manually using 'keyboard.press' and 'keyboard.release'.  
If the 'keyboard.press(key)' returns true, then it should be ignored as input for text.  

