-- There are 5 lua2 modules.
local fonts    = require('lua2.fonts')
local waves    = require('lua2.waves')
local textures = require('lua2.textures')
local buttons  = require('lua2.buttons')
local savefile = require('lua2.savefile')

-- Print lua2 garbage collection.
PRINT_GC = true

-- Create fonts from font files.
-- fonts.create(fontfile, fontsize)
local f1 = fonts.create("fonts/DroidSansMono.ttf", 24)
local f2 = fonts.create("fonts/DroidSansMono.ttf", 18)

-- Create textures from fonts.
-- font:text(text, r, g, b, a) -- ALPHA HAS NO EFFECT RIGHT NOW.
local t1 = f1:text("Hello 24 pts.", 0, 100, 100, 60) -- 60 has no effect yet.
local t2 = f2:text("Has there ever been a time for 18 pts?", 0, 60, 0) -- Alpha is optional.
local t3 = f1:text("The default color of text is white.") -- Default color is white.

-- Create textures from image files.
local bg = textures.image('bg/schoolFiller.jpg')
local t4 = textures.image('images/Cara.png') 

-- Create buttons from textures.
local b1 = buttons.create_from_texture(t4, 300, 50)
local b2 = buttons.create_from_texture(t4, 300, 50)

function on_touch(x, y)
	dofile('screens/textures.lua')
end

function on_update()
	bg:draw() -- Background textures must be drawn first.
	
	t1:draw(100, 50)
	t2:draw(100, 90)
	t3:draw(100, 130)
	b1:draw()
end


-- Backgrounds should be JPG to save space.
-- Foreground objects should be PNG with alpha=0 where background should show through.
