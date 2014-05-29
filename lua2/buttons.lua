_ENV = {
	require = require,
	setmetatable = setmetatable
}

textures    = require('lua2.textures')
--button_font = require('lua2.fonts').get('button')

button_mt = {}

button_mt.__index = button_mt;

function button_mt.draw(self)
	if self.t then self.t:draw(self.x, self.y) end
end

function button_mt.contains(self, x, y)
	return x >= self.x and x <= self.x + self.w and y >= self.y and y <= self.y + self.h
end

function create_from_texture(t, x, y)
	local o = { t = t, x = x or 0, y = y or 0, w = t.w, h = t.h }
	setmetatable(o, button_mt)
	return o
end

function create_from_rect(x, y, w, h)
	local o = { x = x, y = y, w = w, h = h }
	setmetatable(o, button_mt)
	return o
end

return {
	create_from_texture = create_from_texture ,
	create_from_file    = create_from_file
}

