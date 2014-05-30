local textures = require('lua2.textures')
local fonts    = require('lua2.fonts')
local buttons  = require('lua2.buttons')

local bg = textures.image('bg/schoolFiller.jpg')
local t1 = textures.image('images/Cara.png') 

local f1 = fonts.create("fonts/DroidSansMono.ttf", 24)
local t2 = f1:text("Go to waves test.", 0, 100, 100, 60)
local t3 = f1:text("test.", 0, 0, 0)

--[[
Five possible ways to create a button from a texture:
	buttons.create_from_texture(t) 
	buttons.create_from_texture(t, dst_x, dst_y) 
	buttons.create_from_texture(t, dst_x, dst_y, dst_w, dst_h) 
	buttons.create_from_texture(t, src_x, src_y, src_w, src_h, dst_x, dst_y) 
	buttons.create_from_texture(t, src_x, src_y, src_w, src_h, dst_x, dst_y, dst_w, dst_h) 
--]]

-- Create buttons from textures.
local b1  = buttons.create_from_texture(t1, 0, 0)
local b2  = buttons.create_from_texture(t2, 300, 50)
local b3  = buttons.create_from_texture(t3, 100, 150)

-- You can also create an invisible button to define a clickable rectangle.

local b4  = buttons.create_from_rect(700, 350, 100, 100)

function on_update()
        bg:draw()
        b1:draw()
        b2:draw()
        b3:draw()
end

function on_touch(x, y)
	if b1:contains(x, y) then msgbox('x = ' .. x .. '  y = ' .. y) 
	elseif b2:contains(x, y) then 
		dofile('screens/waves.lua')
	elseif b4:contains(x, y) then
		msgbox('You clicked the corner.')
	end
end

collectgarbage()

