-- Screen design size is 800 by 450.

local function create_background()
	return textures.image('bg/schoolFiller.jpg')
end

local function create_title(text, x, y)
	local f = fonts.create("fonts/DroidSansMono.ttf", 32)
	local t = f:text(text, {r=0, g=100, b=0})
	return buttons.create_from_texture(t, x, y)
end

local function create_button(text, x, y)
	local f = fonts.create("fonts/DroidSansMono.ttf", 22)
	local t = f:text(text, app_black)
	return buttons.create_from_texture(t, x, y)
end

local bg              = create_background();
local title           = create_title ("Test Program for the Lua2 Library", 120,  50)
local continue_button = create_button("Continue game"       , 50, 180)
local restart_button  = create_button("Restart game"        , 50, 220)
local textures_button = create_button("Textures demo"       , 50, 260)
local buttons_button  = create_button("Buttons demo"        , 50, 300)
local exit_button     = create_button("Exit"                , 50, 340)

music.set('music/Overworld.wav')

function on_update()
	bg              :draw()
	title           :draw()
	continue_button :draw()
	restart_button  :draw()
	textures_button :draw()
	buttons_button  :draw()
	exit_button     :draw()
end

function on_touch(x, y)
	if continue_button:contains(x, y) then
		sounds.play('waves/door.wav')
		dofile('screens/play.lua')
	elseif restart_button:contains(x, y) then
		sf.clear()
		sf.current_node = 'start'
		dofile('screens/play.lua')
	elseif textures_button:contains(x, y) then
		dofile('screens/textures.lua')
	elseif buttons_button:contains(x, y) then
		dofile('screens/buttons.lua')
	elseif exit_button:contains(x, y) then
		quit()
	end
end

collectgarbage()

