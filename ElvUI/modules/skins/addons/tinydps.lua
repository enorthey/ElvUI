local E, L, DF = unpack(select(2, ...)); --Engine
local S = E:GetModule('Skins')


local function LoadSkin()
	if E.db.skins.tinydps.enable ~= true then return end
	
	local frame = tdpsFrame
	
	frame:SetTemplate("Default")
<<<<<<< HEAD:modules/skins/addons/tinydps.lua
=======
	
	if status then
		status:SetBackdrop({bgFile = E["media"].normTex, edgeFile = E["media"].blank, tile = false, tileSize = 0, edgeSize = 1, insets = { left = 0, right = 0, top = 0, bottom = 0}})
		status:SetStatusBarTexture(E["media"].normTex)
	end
>>>>>>> origin/master:ElvUI/modules/skins/addons/tinydps.lua
end

S:RegisterSkin('TinyDPS', LoadSkin)