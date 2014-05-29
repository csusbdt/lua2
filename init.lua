-- There are 5 lua2 modules.

local fonts    = require('lua2.fonts')
local waves    = require('lua2.waves')
local textures = require('lua2.textures')
local buttons  = require('lua2.buttons')
local savefile = require('lua2.savefile')

-- Fonts are need to create textures from text.
local f1 = fonts.get("fonts/DroidSansMono.ttf", 24)
local t1 = f1:text("Hello there.", 0, 200, 120, 100) -- alpha not working yet
local t2 = f1:text("Bye now.", 0, 0, 0, 255)

-- You can use the texture module to create textures from images.
local bg = textures.image('bg/schoolFiller.jpg')

function on_touch(x, y)
end

function on_update()
	bg:draw()
	t1:draw(100, 50)
	t2:draw(100, 90)
end

