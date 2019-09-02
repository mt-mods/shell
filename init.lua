
function execute(str)
	minetest.log("action", "[shell] executing: '" .. str .. "'")

	local found, _, commandname, params = str:find("^([^%s]+)%s(.+)$")
	if not found then
		commandname = str
	end
	local command = minetest.chatcommands[commandname]
	if not command then
		return "Not a valid command: " .. commandname
	end
	local _, result = command.func("admin", (params or ""))

	return result
end

function check_file()
	local path = minetest.get_worldpath().."/shell.txt"
	local result_path = minetest.get_worldpath().."/shell_result.txt"

	local file = io.open( path, "r" );
	if( file ) then
		local data = file:read("*all");
		file:close();
		minetest.safe_file_write(path, "")

		if not data then
			return
		end
		for s in data:gmatch("[^\r\n]+") do
			local result = execute(s)
			minetest.safe_file_write(result_path, result or "")
		end

	end
end

local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime
	if timer < 1 then return end
	timer=0

	check_file()
end)

print("[OK] shell")