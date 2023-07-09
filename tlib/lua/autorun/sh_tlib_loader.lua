TLib = TLib or {}
TLib.Config = TLib.Config or {}

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



