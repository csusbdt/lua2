local textures = require('lua2.textures')
local fonts    = require('lua2.fonts')
local buttons  = require('lua2.buttons')
local waves    = require('lua2.waves')

local bg = textures.image('bg/schoolFiller.jpg')

local f1 = fonts.create("fonts/DroidSansMono.ttf", 24)
local t1 = f1:text("Door sound", 0, 0, 0)
local t2 = f1:text("Toggle music", 0, 0, 0)
local b1 = buttons.create_from_texture(t1, 100, 100)
local b2 = buttons.create_from_texture(t2, 100, 200)

function on_update()
        bg:draw()
        b1:draw()
        b2:draw()
end

local music

function on_touch(x, y)
	if b1:contains(x, y) then 
		waves.get('waves/door.wav'):play()
	elseif b2:contains(x, y) then 
		if music then
			music:stop()
			music = nil
		else
			music = waves.get('music/Overworld.wav'):loop()
		end
	end
end

