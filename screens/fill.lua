local bg = textures.image('bg/schoolFiller.jpg')

local function image(filename, x, y)
	return buttons.create_from_texture(textures.image(filename), x, y)
end

local cara  = image('images/Cara.png', 150, 50)
local cara2 = image('images/Cara.png', 350, 50)

function _G.on_update()
	bg    : draw()
	cara  : draw()
	cara2 : draw()
	
	blendmode_none()
	set_draw_color(120, 80, 50, 255)
	fill_rect(100, 100, 100, 100)
	
	blendmode_blend()
	set_draw_color(120, 80, 50, 100)
	fill_rect(220, 100, 100, 100)

end

function _G.on_touch(x, y)
	dofile('screens/title.lua')
end

