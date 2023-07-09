TLib = TLib or {}
TLib.Config = TLib.Config or {}
TLib.Version = "1.0.0"

function TLib.LoadDirectory(path)
	local files, folders = file.Find(path .. "/*", "LUA")

	for _, fileName in ipairs(files) do
		local filePath = path .. "/" .. fileName

		if CLIENT then
			include(filePath)
		else
			if fileName:StartWith("cl_") then
				AddCSLuaFile(filePath)
			elseif fileName:StartWith("sh_") then
				AddCSLuaFile(filePath)
				include(filePath)
			else
				include(filePath)
			end
		end

        MsgC(Color(252, 186, 3),"[TLib] ",Color(255,255,255),"Including ",Color(0,255,255),filePath,Color(255,255,255),"...\n")
	end

	return files, folders
end

function TLib.LoadDirectoryRecursive(basePath)
	local _, folders = TLib.LoadDirectory(basePath)
	for _, folderName in ipairs(folders) do
		TLib.LoadDirectoryRecursive(basePath .. "/" .. folderName)
	end
end

TLib.LoadDirectoryRecursive("tlib")

hook.Run("TLib.UI.FullyLoaded")

hook.Add("Think", "TLib.VersionChecker", function()
	hook.Remove("Think", "TLib.VersionChecker")

	http.Fetch("https://raw.githubusercontent.com/Tee-Nydal-Development/TitansRP-SCP-RP/main/tlib/VERSION.txt?token=GHSAT0AAAAAACDRMS6LGIRAZ53F63NJ5XXMZFKZV6Q", function(body)
		if TLib.Version ~= string.Trim(body) then
			MsgC(Color(252, 186, 3),"[TLib] ",Color(255,255,255),"New version available: ",Color(0,255,255),body,Color(255,255,255),"!\n", Color(252, 186, 3),"[TLib] ",Color(255,255,255),"Current Version: ",Color(0,255,255), TLib.Version,Color(255,255,255),"\n")
			return
		end
	end)

end)
