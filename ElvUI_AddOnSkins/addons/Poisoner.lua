local E, L, V, P, G, _ = unpack(ElvUI);
local addon = E:GetModule("AddOnSkins");

if(not addon:CheckAddOn("Poisoner")) then return; end

function addon:Poisoner(event)
	local S = E:GetModule("Skins");
	
	--Options Menu
	PoisonerOptions_SettingsFrame:StripTextures()
	PoisonerOptions_SettingsFrame:SetTemplate("Transparent")
	
	S:HandleButton(PoisonerOptions_MenuSortingButton)
	S:HandleButton(PoisonerOptions_SettingsSave)
	S:HandleButton(PoisonerOptions_SettingsClose)
	S:HandleButton(PoisonerOptions_ResetFBPosition)
	
	S:HandleCheckBox(PoisonerOptions_ChkBox_Enable)
	S:HandleCheckBox(PoisonerOptions_ChkBox_MBShow)
	S:HandleCheckBox(PoisonerOptions_ChkBox_FBShow)
	S:HandleCheckBox(PoisonerOptions_ChkBox_FBLock)
	S:HandleCheckBox(PoisonerOptions_ChkBox_PoisonWeaponChatOuput)
	S:HandleCheckBox(PoisonerOptions_ChkBox_ShowOnMouseover)
	S:HandleCheckBox(PoisonerOptions_ChkBox_AutoHide_inCombat)
	S:HandleCheckBox(PoisonerOptions_ChkBox_MenuParentOwn)
	S:HandleCheckBox(PoisonerOptions_ChkBox_MenuParentMinimap)
	S:HandleCheckBox(PoisonerOptions_ChkBox_MPTopLeft)
	S:HandleCheckBox(PoisonerOptions_ChkBox_MPTop)
	S:HandleCheckBox(PoisonerOptions_ChkBox_MPTopRight)
	S:HandleCheckBox(PoisonerOptions_ChkBox_MPLeft)
	S:HandleCheckBox(PoisonerOptions_ChkBox_MPRight)
	S:HandleCheckBox(PoisonerOptions_ChkBox_MPBottomLeft)
	S:HandleCheckBox(PoisonerOptions_ChkBox_MPBottom)
	S:HandleCheckBox(PoisonerOptions_ChkBox_MPBottomRight)
	S:HandleCheckBox(PoisonerOptions_ChkBox_ToolTipFull)
	S:HandleCheckBox(PoisonerOptions_ChkBox_ToolTipName)
	S:HandleCheckBox(PoisonerOptions_ChkBox_OverwritePreset)
	S:HandleCheckBox(PoisonerOptions_ChkBox_ShowTimer)
	S:HandleCheckBox(PoisonerOptions_ChkBox_TimerOutput_IgnoreWhileFishing)
	S:HandleCheckBox(PoisonerOptions_ChkBox_TimerOutput_OnlyInstanced)
	S:HandleCheckBox(PoisonerOptions_ChkBox_TimerOutput_MainHand)
	S:HandleCheckBox(PoisonerOptions_ChkBox_TimerOutput_OffHand)
	S:HandleCheckBox(PoisonerOptions_ChkBox_TimerOutput_ThrowWeapon)
	S:HandleCheckBox(PoisonerOptions_ChkBox_TimerOutput_Audio)
	S:HandleCheckBox(PoisonerOptions_ChkBox_TimerOutput_Chat)
	S:HandleCheckBox(PoisonerOptions_ChkBox_TimerOutput_Aura)
	S:HandleCheckBox(PoisonerOptions_ChkBox_TimerOutput_ErrorFrame)
	S:HandleCheckBox(PoisonerOptions_ChkBox_TimerOutput_Aura_Lock)
	S:HandleCheckBox(PoisonerOptions_ChkBox_AutoBuy)
	S:HandleCheckBox(PoisonerOptions_ChkBox_AutoBuy_Prompt)
	S:HandleCheckBox(PoisonerOptions_ChkBox_AutoBuy_Check)
	S:HandleCheckBox(PoisonerOptions_ChkBox_QuickButton_Lock)
	
	S:HandleSliderFrame(PoisonerOptions_FB_ScaleSlider)
	S:HandleSliderFrame(PoisonerOptions_FB_AlphaSlider)
	S:HandleSliderFrame(PoisonerOptions_Menu_ScaleSlider)
	S:HandleSliderFrame(PoisonerOptions_Menu_SpacingSlider)
	S:HandleSliderFrame(PoisonerOptions_PoisonTimerSlider)
	S:HandleSliderFrame(PoisonerOptions_PoisonTimerScaleSlider)
	S:HandleSliderFrame(PoisonerOptions_PoisonTimerAlphaSlider)
	S:HandleSliderFrame(PoisonerOptions_Slider_CP)
	S:HandleSliderFrame(PoisonerOptions_Slider_DP)
	S:HandleSliderFrame(PoisonerOptions_Slider_IP)
	S:HandleSliderFrame(PoisonerOptions_Slider_MP)
	S:HandleSliderFrame(PoisonerOptions_Slider_WP)
	S:HandleSliderFrame(PoisonerOptions_QB_ScaleSlider)
	S:HandleSliderFrame(PoisonerOptions_QB_AlphaSlider)
	
	S:HandleDropDownBox(Poisoner_DropDownMenu_Mainhand)
	S:HandleDropDownBox(Poisoner_DropDownMenu_Offhand)
	S:HandleDropDownBox(Poisoner_DropDownMenu_Throwweapon)
	S:HandleDropDownBox(Poisoner_DropDownMenu_Mainhand_SHIFT)
	S:HandleDropDownBox(Poisoner_DropDownMenu_Offhand_SHIFT)
	S:HandleDropDownBox(Poisoner_DropDownMenu_Throwweapon_SHIFT)
	S:HandleDropDownBox(Poisoner_DropDownMenu_Mainhand_CTRL)
	S:HandleDropDownBox(Poisoner_DropDownMenu_Offhand_CTRL)
	S:HandleDropDownBox(Poisoner_DropDownMenu_Throwweapon_CTRL)
	S:HandleDropDownBox(Poisoner_DropDownMenu_Mainhand_ALT)
	S:HandleDropDownBox(Poisoner_DropDownMenu_Offhand_ALT)
	S:HandleDropDownBox(Poisoner_DropDownMenu_Throwweapon_ALT)
	
	Poisoner_DropDownMenu_MainhandButton:SetWidth(25)
	Poisoner_DropDownMenu_OffhandButton:SetWidth(25)
	Poisoner_DropDownMenu_ThrowweaponButton:SetWidth(25)
	Poisoner_DropDownMenu_Mainhand_SHIFTButton:SetWidth(25)
	Poisoner_DropDownMenu_Offhand_SHIFTButton:SetWidth(25)
	Poisoner_DropDownMenu_Throwweapon_SHIFTButton:SetWidth(25)
	Poisoner_DropDownMenu_Mainhand_CTRLButton:SetWidth(25)
	Poisoner_DropDownMenu_Offhand_CTRLButton:SetWidth(25)
	Poisoner_DropDownMenu_Throwweapon_CTRLButton:SetWidth(25)
	Poisoner_DropDownMenu_Mainhand_ALTButton:SetWidth(25)
	Poisoner_DropDownMenu_Offhand_ALTButton:SetWidth(25)
	Poisoner_DropDownMenu_Throwweapon_ALTButton:SetWidth(25)
	
	PoisonerOptions_SettingsFrameTab1:Point('TOPLEFT', PoisonerOptions_SettingsFrame, 'BOTTOMLEFT', 0, 2)
	
	for i = 1, 5 do
		S:HandleTab(_G['PoisonerOptions_SettingsFrameTab'..i])
	end
	
	--Menu Orientation Button
	PoisonerOptions_OrientationButton:StripTextures()
	PoisonerOptions_OrientationButton.backdrop = CreateFrame("Frame", nil, PoisonerOptions_OrientationButton)
	PoisonerOptions_OrientationButton.backdrop:SetTemplate("Transparent",true)
	PoisonerOptions_OrientationButton.backdrop:Point("TOPLEFT", PoisonerOptions_OrientationButton, "TOPLEFT", 0, 0)
	PoisonerOptions_OrientationButton.backdrop:Point("BOTTOMRIGHT", PoisonerOptions_OrientationButton, "BOTTOMRIGHT", 0, 0)
	PoisonerOptions_OrientationButton.backdrop:SetFrameLevel(PoisonerOptions_OrientationButton:GetFrameLevel())
	PoisonerOptions_OrientationButton.icon = PoisonerOptions_OrientationButton:CreateTexture(nil, "OVERLAY");
	PoisonerOptions_OrientationButton.icon:SetTexCoord(unpack(E.TexCoords))
	PoisonerOptions_OrientationButton.icon:SetPoint("TOPLEFT", PoisonerOptions_OrientationButton, "TOPLEFT", 0, 0)
	PoisonerOptions_OrientationButton.icon:SetPoint("BOTTOMRIGHT", PoisonerOptions_OrientationButton, "BOTTOMRIGHT", 0, 0)
	PoisonerOptions_OrientationButton.icon:SetTexture("Interface\\Icons\\Spell_Nature_CorrosiveBreath")
	
	--Missing Poisons Weapons Frame
	PoisonerTimer_IconFrame:SetWidth(145)
	PoisonerTimer_IconFrame:SetHeight(49)
	
	PoisonerTimer_Mainhand:CreateBackdrop()
	PoisonerTimer_Mainhand:SetWidth(45)
	PoisonerTimer_Mainhand:SetHeight(45)
	PoisonerTimer_Mainhand:Point("TOPLEFT", PoisonerTimer_IconFrame, "TOPLEFT", 2, -2)
	PoisonerTimer_MainhandIcon:SetTexCoord(unpack(E.TexCoords))
	
	PoisonerTimer_Offhand:CreateBackdrop()
	PoisonerTimer_Offhand:SetWidth(45)
	PoisonerTimer_Offhand:SetHeight(45)
	PoisonerTimer_Offhand:Point("TOP", PoisonerTimer_IconFrame, "TOP", 0, -2)
	PoisonerTimer_OffhandIcon:SetTexCoord(unpack(E.TexCoords))
	
	PoisonerTimer_Throwweapon:CreateBackdrop()
	PoisonerTimer_Throwweapon:SetWidth(45)
	PoisonerTimer_Throwweapon:SetHeight(45)
	PoisonerTimer_Throwweapon:Point("TOPRIGHT", PoisonerTimer_IconFrame, "TOPRIGHT", -2, -2)
	PoisonerTimer_ThrowweaponIcon:SetTexCoord(unpack(E.TexCoords))
	
	--Free Button
	Poisoner_FreeButton:StripTextures()
	Poisoner_FreeButton:CreateBackdrop()
	Poisoner_FreeButton:StyleButton()
	Poisoner_FreeButton:GetNormalTexture():SetTexture("Interface\\Icons\\Spell_Nature_CorrosiveBreath")
	Poisoner_FreeButton:GetNormalTexture():SetTexCoord(unpack(E.TexCoords))
	Poisoner_FreeButton:GetPushedTexture():SetTexture("Interface\\Icons\\Spell_Nature_CorrosiveBreath")
	Poisoner_FreeButton:GetPushedTexture():SetTexCoord(unpack(E.TexCoords))
	
	--Quick Button
	Poisoner_QuickButton:StripTextures()
	Poisoner_QuickButton:CreateBackdrop()
	Poisoner_QuickButton:GetNormalTexture():SetTexture("Interface\\Icons\\Ability_Creature_Poison_06")
	Poisoner_QuickButton:GetNormalTexture():SetTexCoord(unpack(E.TexCoords))
end

addon:RegisterSkin("Poisoner", addon.Poisoner);