-- There are 7 lua2 modules.
--
-- As a convenience to the program, you can load 
-- these modules and define global references to them.
-- But you must be careful not to overwrite these
-- variables.

fonts    = require('lua2.fonts')
textures = require('lua2.textures')
buttons  = require('lua2.buttons')
waves    = require('lua2.waves')
music    = require('lua2.music')
sounds   = require('lua2.sounds')
sf       = require('lua2.savefile')

app_black = { r =   0, g =   0, b =   0 }
app_white = { r = 255, g = 255, b = 255 }

dofile('screens/title.lua')

--[[
                    OVERVIEW

The fonts module let you create font objects.
Font objects are used to create textures from strings.

The textures module let you create textures in 2 ways:
from a font and from an image file.
Textures must be drawn to the screen in the global 
on_update function in order to be visible.

The buttons module is used to create clickable textures
or invisible rectangles. It's possible and convenient to
put wrap all textures in buttons even if they will not
respond to mouse clicks or touch events.  The sample code
illustrates this.

The waves module lets you load wave samples into memory
and then play once or as a loop.

The music module simplifies use of the waves module for
playout of music. Music is considered a block of audio 
samples that are repeated in a loop.

The sounds module simplifies the use of the waves module
for the playout of sound effects.  Sounds are blocks of
audio samples that are played once without looping.

The savefile module automatically saves the keys and
values of a table in writable persitant storage. 
When the program sets a value to a key in the savefile
table, the savefile module will automatically save this
to the file system.  When the savefile module is loaded,
it reads in the key-value entries that were previously 
saved into the filesystem.
--]]

