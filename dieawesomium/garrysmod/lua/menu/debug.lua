concommand.Add("lua_run_mn", function(p,c,a,s) RunString(s) end)
concommand.Add("lua_find_mn", function(p,c,a,s) for k,v in pairs(_G) do if(string.find(string.lower(k), string.lower(s))) then print(k) end end end)

timer.Simple(1, function()

	RawConsoleCommand("con_enable 1")
	RawConsoleCommand("showconsole")

end)
