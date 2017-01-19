local E, L, V, P, G = unpack(ElvUI);
local addon = E:GetModule("AddOnSkins");

if(not addon:CheckAddOn("SexyCooldown")) then return; end

function addon:SexyCooldown()
	local S = E:GetModule("Skins");

	local function SkinSexyCooldownIcon(_, icon)
		icon:SetTemplate("Default", true);
		icon.overlay:SetTemplate("Default", true);
		icon.overlay.tex:SetInside();
		icon.tex:SetInside();
		icon.overlay.tex:SetTexCoord(unpack(E.TexCoords));
		icon.tex:SetTexCoord(unpack(E.TexCoords));
	end

	local function SkinSexyCooldownBackdrop(bar)
		bar:SetTemplate("Transparent");
	end

	local function HookSCDBar(bar)
		if(bar.hooked) then return; end
		hooksecurefunc(bar, "UpdateSingleIconLook", SkinSexyCooldownIcon);
		hooksecurefunc(bar, "UpdateBarBackdrop", SkinSexyCooldownBackdrop);
		bar.hooked = true;
	end

	for _, bar in ipairs(SexyCooldown.bars) do
		HookSCDBar(bar);
		bar:UpdateBarLook();
	end

	hooksecurefunc(SexyCooldown, "CreateBar", function(self)
		for _, bar in ipairs(self.bars) do
			HookSCDBar(bar);
			bar:UpdateBarLook();
		end
	end);
end

addon:RegisterSkin("SexyCooldown", addon.SexyCooldown);