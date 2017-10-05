local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule("Skins")
local AS = E:GetModule("AddOnSkins")
local EMB = E:GetModule("EmbedSystem")

local function LoadSkin()
	if not E.private.addOnSkins.Skada then return end

	local SkadaDisplayBar = Skada.displays["bar"]

	hooksecurefunc(SkadaDisplayBar, "AddDisplayOptions", function(_, win, options)
		options.baroptions.args.barspacing = nil
		options.titleoptions.args.texture = nil
		options.titleoptions.args.bordertexture = nil
		options.titleoptions.args.thickness = nil
		options.titleoptions.args.margin = nil
		options.titleoptions.args.color = nil
		options.windowoptions = nil
	end)

	hooksecurefunc(SkadaDisplayBar, "ApplySettings", function(_, win)
		local skada = win.bargroup
		skada:SetSpacing(1)
		skada:SetFrameLevel(5)
		skada:SetBackdrop(nil)

		if win.db.enabletitle then
			skada.button:SetBackdrop(nil)
			if not skada.button.backdrop then
				skada.button:CreateBackdrop()
				skada.button.backdrop:SetFrameLevel(skada.button:GetFrameLevel())
			end
			if E.db.addOnSkins.skadaTitleTemplate == "NONE" then
				skada.button.backdrop:SetBackdrop(nil)
			else
				skada.button.backdrop:SetTemplate(E.db.addOnSkins.skadaTitleTemplate, E.db.addOnSkins.skadaTitleTemplate == "Default" and E.db.addOnSkins.skadaTitleTemplateGloss or false)
			end
		end
		if not skada.backdrop then
			if E.db.addOnSkins.skadaTemplate == "NONE" then
				skada:SetBackdrop(nil)
			else
				skada:SetTemplate(E.db.addOnSkins.skadaTemplate, E.db.addOnSkins.skadaTemplate == "Default" and E.db.addOnSkins.skadaTemplateGloss or false)
			end
		end
		if skada.backdrop then
			skada.backdrop:ClearAllPoints()
			if win.db.reversegrowth then
				skada.backdrop:Point("LEFT", skada.button, "LEFT", -E.Border, 0)
				skada.backdrop:Point("RIGHT", skada.button, "RIGHT", E.Border, 0)
				skada.backdrop:Point("BOTTOM", skada.button, "TOP", 0, win.db.enabletitle and (E.Spacing) or -win.db.barheight - E.Border)
			else
				skada.backdrop:Point("LEFT", skada.button, "LEFT", -E.Border, 0)
				skada.backdrop:Point("RIGHT", skada.button, "RIGHT", E.Border, 0)
				skada.backdrop:Point("TOP", skada.button, "BOTTOM", 0, win.db.enabletitle and -(E.Spacing) or win.db.barheight + E.Border)
			end
		end

		for i, data in ipairs(win.dataset) do
			if data.id then
				local barid = data.id
				local bar = win.bargroup:GetBar(barid)

				if data.class and win.db.classicons and CLASS_ICON_TCOORDS[data.class] then
					bar:SetIconWithCoord("Interface\\WorldStateFrame\\Icons-Classes", CLASS_ICON_TCOORDS[data.class])
				end
			end
		end
	end)

	hooksecurefunc(Skada, "CreateWindow", function()
		if AS:CheckAddOn("Skada") then
			EMB:EmbedSkada()
		end
	end)

	hooksecurefunc(Skada, "DeleteWindow", function()
		if AS:CheckAddOn("Skada") then
			EMB:EmbedSkada()
		end
	end)
	
	hooksecurefunc(Skada, "UpdateDisplay", function()
		if AS:CheckAddOn("Skada") and not InCombatLockdown() then
			EMB:EmbedSkada()
		end
	end)

	hooksecurefunc(Skada, "SetTooltipPosition", function(self, tt)
		local p = self.db.profile.tooltippos
		if p == "default" then
			if not E:HasMoverBeenMoved("TooltipMover") then
				if ElvUI_ContainerFrame and ElvUI_ContainerFrame:IsShown() then
					tt:Point("BOTTOMRIGHT", ElvUI_ContainerFrame, "TOPRIGHT", 0, 18)
				elseif RightChatPanel:GetAlpha() == 1 and RightChatPanel:IsShown() then
					tt:Point("BOTTOMRIGHT", RightChatPanel, "TOPRIGHT", 0, 18)
				else
					tt:Point("BOTTOMRIGHT", RightChatPanel, "BOTTOMRIGHT", 0, 18)
				end
			else
				local point = E:GetScreenQuadrant(TooltipMover)
				if point == "TOPLEFT" then
					tt:Point("TOPLEFT", TooltipMover)
				elseif point == "TOPRIGHT" then
					tt:Point("TOPRIGHT", TooltipMover)
				elseif point == "BOTTOMLEFT" or point == "LEFT" then
					tt:Point("BOTTOMLEFT", TooltipMover)
				else
					tt:Point("BOTTOMRIGHT", TooltipMover)
				end
			end
	   end
	end)
end

S:AddCallbackForAddon("Skada", "Skada", LoadSkin)