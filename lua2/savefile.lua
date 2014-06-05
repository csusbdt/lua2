local m = {}  -- module
local bt = {} -- backing table
local mt = {} -- the module's metatable

mt.__index = bt -- look up keys in the backing table

function read_backing_table()
	local data = read_file('savefile')
	if not data then return end
	for k, v in string.gmatch(data, "([%-_%w]+)=([%/%-_%w]+)") do
		bt[k] = v
	end
end

function write_backing_table()
	local data
	for k, v in pairs(bt) do
		data = data and data .. ','
		data = data or ''
		data = data .. k .. '=' .. v
	end
	if app_print_savefile then _G.print('savefile = ' .. (data or '')) end
	write_file('savefile', data)
end

function mt.__newindex(self, k, v)
	bt[k] = v
	write_backing_table()
end

setmetatable(m , mt)

read_backing_table()

return m
