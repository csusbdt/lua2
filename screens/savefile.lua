local fonts    = require('lua2.fonts')
local buttons  = require('lua2.buttons')
local sf       = require('lua2.savefile')

local f1 = fonts.create("fonts/DroidSansMono.ttf", 24)

local t1 = f1:text("Click me.")
local t2 = f1:text("Back.")
local t3 = f1:text(sf.click_count or '0')
local t4 = f1:text("Exit.")

local b1 = buttons.create_from_texture(t1, 100, 100)
local b2 = buttons.create_from_texture(t2, 100, 200)
local b3 = buttons.create_from_texture(t3, 100, 300)
local b4 = buttons.create_from_texture(t4, 200, 300)

function on_update()
        b1:draw()
        b2:draw()
        b3:draw()
        b4:draw()
end

function on_touch(x, y)
	if b1:contains(x, y) then 
		sf.click_count = tonumber(sf.click_count or 0) + 1
		b3 = buttons.create_from_texture(f1:text(sf.click_count), 100, 300)
	elseif b2:contains(x, y) then 
		dofile('screens/waves.lua')
	elseif b4:contains(x, y) then 
		quit()
	end
end

collectgarbage()

