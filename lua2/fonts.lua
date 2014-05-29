local textures = require('lua2.textures')

local fonts = {}
setmetatable(fonts, { __mode = 'v' })

local font_mt = {}

font_mt.__index = font_mt;

function font_mt:__gc()
	close_font(self.ud)
	fonts[self.k] = nil
end

function font_mt:text(t)
	return textures.text(self.ud, t)
end

local function get(filename, size)
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
	get = get
}

