local textures = require('lua2.textures')
local fonts = require('lua2.fonts')

local bg = textures.image('bg/schoolFiller.jpg')
local t1 = textures.image('images/Cara.png') 

function on_touch(x, y)
	quit()
	--dofile('screens/fonts.lua')	
end

--[[
Four possible ways to create texture from a font:
	t:draw(dst_x, dst_y) 
	t:draw(dst_x, dst_y, dst_w, dst_h) 
	t:draw(src_x, src_y, src_w, src_h, dst_x, dst_y) 
	t:draw(src_x, src_y, src_w, src_h, dst_x, dst_y, dst_w, dst_h) 
--]]

function on_update()
	bg:draw()
	t1:draw(50, 50)
end


