local textures = require('lua2.textures')
local fonts = require('lua2.fonts')

local bg = textures.image('bg/schoolFiller.jpg')
local t1 = textures.image('images/Cara.png') 

-- Create fonts from font files with the following function.
--
--      fonts.create(fontfile, fontsize)
--

local f1 = fonts.create("fonts/DroidSansMono.ttf", 24)
local f2 = fonts.create("fonts/DroidSansMono.ttf", 18)

-- Create textures from fonts with the following function.
--
-- font:text(text, color) where color = { r, g, b, a } 
--
-- Notes: 
--     Alpha has no effect right now.
--     The default color is black.
--     Keys r, g, b and a are optional in color.
--

local t2 = f1:text("Hello 24 pts.", {r=0, g=100, b=100, a=60})
local t3 = f2:text("Hello 18 pts.", app_white) -- app_white defined in init.lua
local t4 = f1:text("The default color of text is black.")

function on_touch(x, y)
	dofile('screens/title.lua')	
end

function on_update()
	bg:draw()
	t1:draw(50, 50)
	t2:draw(50, 100)
	t3:draw(50, 150)
	t4:draw(50, 200)
end

collectgarbage()

