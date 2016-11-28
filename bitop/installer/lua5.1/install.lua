local t = ...

local strPlatform = 'Windows_x64'

if strPlatform=='Windows_x86' then
	t:install('windows_x86/lua_plugins/bit.dll', '${install_lua_cpath}')

elseif strPlatform=='Windows_x64' then
	t:install('windows_x64/lua_plugins/bit.dll', '${install_lua_cpath}')

end

return true
