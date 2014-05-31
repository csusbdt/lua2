local textures = require('lua2.textures')

local fonts = {}
setmetatable(fonts, { __mode = 'v' })

local font_mt = {}

font_mt.__index = font_mt;

function font_mt:__gc()
	if app_print_gc then print('Garbage collecting ' .. self.k) end
	close_font(self.ud)
	fonts[self.k] = nil
end

function font_mt:text(text, color)
	local c = {
		r = color and color.r or 0,
		g = color and color.g or 0,
		b = color and color.b or 0,
		a = color and color.a or 255
	}
	return textures.text(self.ud, text, c)
end

local function create(filename, size)
	if not size then msgbox('Size missing from call to fonts.get'); return nil end
	local k = filename .. size
	if fonts[k] then return fonts[k] end
	local o = { k = k }
	o.ud = open_font(filename, size)
	setmetatable(o, font_mt)
	fonts[k] = o
	return o
end

return {
	create = create
}

