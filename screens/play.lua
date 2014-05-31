-- Screen design size is 800 by 450.

local function create_background()
	return textures.image('bg/schoolFiller.jpg')
end

local function create_title(text, x, y)
	local f = fonts.create("fonts/DroidSansMono.ttf", 32)
	local t = f:text(text, {r=255, g=100, b=100})
	return buttons.create_from_texture(t, x, y)
end

local function create_button(text, x, y)
	local f = fonts.create("fonts/DroidSansMono.ttf", 22)
	local t = f:text(text, app_white)
	return buttons.create_from_texture(t, x, y)
end

-- Initialize the counter if needed.
if not sf.n then sf.n = 0 end

local counter_button

local function create_counter_button()
	counter_button = create_button("Counter: " .. sf.n          ,  50, 200)
end

local title             = create_title ("The Increment Counter Game", 120,  50)
local increment_button  = create_button("Increment the counter"     ,  50, 260)
local exit_button       = create_button("Exit"                      ,  50, 320)
create_counter_button()

music.set(nil)

function on_update()
	title            :draw()
	counter_button   :draw()
	increment_button :draw()
	exit_button      :draw()
end

function on_touch(x, y)
	if increment_button:contains(x, y) then
		sounds.play('waves/menuSound1.wav')
		sf.n = tonumber(sf.n) + 1
		create_counter_button()
	elseif exit_button:contains(x, y) then
		dofile('screens/title.lua')
	end
end

collectgarbage()

