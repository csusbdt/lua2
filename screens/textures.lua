local textures = require('lua2.textures')

-- Create textures from image files.
local bg = textures.image('bg/schoolFiller.jpg')
local t1 = textures.image('images/Cara.png') 

function on_touch(x, y)
	dofile('screens/fonts.lua')	
end

--[[
Five possible ways to call draw on a texture:
	t:draw() 
	t:draw(dst_x, dst_y) 
	t:draw(dst_x, dst_y, dst_w, dst_h) 
	t:draw(src_x, src_y, src_w, src_h, dst_x, dst_y) 
	t:draw(src_x, src_y, src_w, src_h, dst_x, dst_y, dst_w, dst_h) 
--]]

function on_update()
	bg:draw() -- Background textures must be drawn first.
	t1:draw(50, 50)
	t1:draw(50, 200, 32, 32)
	t1:draw(50, 50, 100, 100, 250, 50)
	t1:draw(50, 100, 100, 100, 250, 200, 75, 75)
end

-- Note:
--
-- Backgrounds should be JPG to save space.
-- Foreground objects should be PNG with alpha=0 where background should show through.

