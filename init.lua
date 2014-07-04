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

black = { r =   0, g =   0, b =   0 }
white = { r = 255, g = 255, b = 255 }
dark  = { r =  40, g =  40, b =  40 }
light = { r = 205, g = 205, b = 205 }

-- Note: Subsequent code should define global functions draw and load_textures.

function on_render_targets_reset()
	if draw then draw() end
end

function on_device_reset()
	textures.discard_userdata()
	if load_textures then load_textures() end
	if draw then draw() end
end

function on_window_size_changed()
	on_render_targets_reset()
end

dofile('screens/title.lua')

--[[
                    OVERVIEW

The textures module lets you create textures in 2 ways:
from a font or from an image file.

The fonts module lets you create font objects.
Font objects are used to create textures from strings.
Use the text fucntion of font objects to create textures
rather than creating from texture module directly.

The buttons module simplifies the use of texture objects
for drawing and for use capturing click events. The
It allows supports creation of invisible rectangles for
the purpose of caputing touch events. After obtaining
a texture object, wrap it in a button instance to
simplify drawing and use as a button.

The waves module lets you load wave samples into memory
and then play once or as a loop.

The music module simplifies use of the waves module for
playout of music. Music is considered a block of audio 
samples that are repeated in a loop. Use the music
module instead of the waves module directly.

The sounds module simplifies the use of the waves module
for the playout of sound effects.  Sounds are blocks of
audio samples that are played once without looping. Use
the sounds module instead of the waves file directly.

The savefile module automatically saves the keys and
values of a table in writable persitant storage. 
When the program sets a value to a key in the savefile
table, the savefile module will automatically save this
to the file system.  When the savefile module is loaded,
it reads in the key-value entries that were previously 
saved into the filesystem.
--]]

