local textures = {}
setmetatable(textures, { __mode = 'v' })

local texture_mt = {}

texture_mt.__index = texture_mt;

function texture_mt:__gc()
	if PRINT_GC then 
		if self.name then 
			print('destroying texture ' .. self.name)
		elseif self.text then 
			print('destroying texture ' .. self.text) 
		end
	end
	destroy_texture(self.ud)
	if self.name then textures[self.name] = nil end
end

function texture_mt:draw(a1, a2, a3, a4, a5, a6, a7, a8)
	if     a8 then render_texture(self.ud, a1, a2, a3, a4, a5, a6, a7, a8)
	elseif a6 then render_texture(self.ud, a1, a2, a3, a4, a5, a6)
	elseif a4 then render_texture(self.ud, a1, a2, a3, a4)
	elseif a2 then render_texture(self.ud, a1, a2)
	else           render_texture(self.ud)
	end
end

local function image(filename)
	if textures[filename] then 
		return textures[filename]
	end
	local o = { name = filename }
	o.ud, o.w, o.h = texture_from_file(filename)
	setmetatable(o, texture_mt)
	textures[filename] = o
	return o
end

local function text(font, text, r, g, b, a)
	local o = { text = text }
	o.ud, o.w, o.h = texture_from_font(font, text, r, g, b, a)
	setmetatable(o, texture_mt)
	return o
end

return {
	image = image,
	text  = text
}

