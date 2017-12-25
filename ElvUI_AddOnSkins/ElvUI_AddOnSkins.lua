﻿local E, L, V, P, G = unpack(ElvUI)
local EP = LibStub("LibElvUIPlugin-1.0", true)
local AS = E:NewModule("AddOnSkins")

local AddOnName = ...

local find, lower, match, trim = string.find, string.lower, string.match, string.trim

local GetAddOnInfo = GetAddOnInfo

local addonList = {
	"_NPCScan",
	"AckisRecipeList",
	"ACP",
	"AdvancedTradeSkillWindow",
	"Archy",
	"Atlas",
	"AtlasLoot",
	"AtlasQuest",
	"AutoEquipQuestItem",
	"BindPad",
	"BugSack",
	"BuyEmAll",
	"Clique",
	"DBM",
	"Doom_CooldownPulse",
	"EveryGoldToBanker",
	"ExtVendor",
	"Factionizer",
	"FishingBuddy",
	"FlightMap",
	"InspectEquip",
	"KarniCrap",
	"KHunterTimers",
	"LightHeaded",
	"MageNuggets",
	"MinimalArchaeology",
	"Ogri'Lazy",
	"Omen",
	"OneClickEnchantScroll",
	"Overachiever",
	"PallyPower",
	"PlateBuffs",
	"Poisoner",
	"Postal",
	"QuestCompletist",
	"Recount",
	"RaidRoll",
	"SexyCooldown",
	"Skada",
	"Spy",
	"Titan",
	"TotemTimers",
	"TradeskillInfo",
	"VanasKoS",
	"WeakAuras",
	"WowLua",
}

AS.addOns = {}

for i = 1, GetNumAddOns() do
	local name, _, _, enabled = GetAddOnInfo(i)
	AS.addOns[lower(name)] = enabled ~= nil
end

function AS:CheckAddOn(addon)
	return self.addOns[lower(addon)] or false
end

function AS:RegisterAddonOption(AddonName, options)
	if select(6, GetAddOnInfo(AddonName)) == "MISSING" then return end

	options.args.skins.args.addOns.args[AddonName] = {
		type = "toggle",
		name = AddonName,
		desc = L["TOGGLESKIN_DESC"],
		hidden = function() return not self:CheckAddOn(AddonName) end
	}
end

local function ColorizeSettingName(settingName)
	return format("|cff1784d1%s|r", settingName)
end

local function getOptions()
	local options = {
		order = 52,
		type = "group",
		name = ColorizeSettingName(L["AddOn Skins"]),
		childGroups = "tab",
		args = {
			skins = {
				order = 1,
				type = "group",
				name = L["Skins"],
				childGroups = "tab",
				args = {
					header = {
						order = 1,
						type = "header",
						name = L["Skins"]
					},
					addOns = {
						order = 2,
						type = "group",
						name = L["AddOn Skins"],
						get = function(info) return E.private.addOnSkins[info[#info]] end,
						set = function(info, value) E.private.addOnSkins[info[#info]] = value E:StaticPopup_Show("PRIVATE_RL") end,
						args = {
							header = {
								order = 1,
								type = "header",
								name = L["AddOn Skins"]
							}
						}
					},
					blizzard = {
						order = 3,
						type = "group",
						name = L["Blizzard Skins"],
						get = function(info) return E.private.addOnSkins[info[#info]] end,
						set = function(info, value) E.private.addOnSkins[info[#info]] = value E:StaticPopup_Show("PRIVATE_RL") end,
						args = {
							header = {
								order = 1,
								type = "header",
								name = L["Blizzard Skins"]
							},
							Blizzard_WorldStateFrame = {
								type = "toggle",
								name = L["WorldState Frame"],
								desc = L["TOGGLESKIN_DESC"]
							}
						}
					}
				}
			},
			misc = {
				order = 2,
				type = "group",
				name = GAMEOPTIONS_MENU,
				childGroups = "tab",
				args = {
					header = {
						order = 1,
						type = "header",
						name = GAMEOPTIONS_MENU
					},
					skadaGroup = {
						order = 2,
						type = "group",
						name = "Skada",
						get = function(info) return E.db.addOnSkins[info[#info]] end,
						set = function(info, value) E.db.addOnSkins[info[#info]] = value Skada:ApplySettings() end,
						disabled = function() return not AS:CheckAddOn("Skada") end,
						args = {
							header = {
								order = 1,
								type = "header",
								name = "Skada"
							},
							skadaTitleBackdrop = {
								order = 2,
								type = "toggle",
								name = L["Skada Title Backdrop"]
							},
							skadaTitleTemplate = {
								order = 3,
								type = "select",
								name = L["Skada Title Template"],
								values = {
									["Default"] = DEFAULT,
									["Transparent"] = L["Transparent"]
								},
								disabled = function() return not E.db.addOnSkins.skadaTitleBackdrop end
							},
							skadaTitleTemplateGloss = {
								order = 4,
								type = "toggle",
								name = L["Skada Title Template Gloss"],
								disabled = function() return E.db.addOnSkins.skadaTitleTemplate == "Transparent" or not E.db.addOnSkins.skadaTitleBackdrop end
							},
							spacer = {
								order = 5,
								type = "description",
								name = ""
							},
							skadaBackdrop = {
								order = 6,
								type = "toggle",
								name = L["Skada Backdrop"]
							},
							skadaTemplate = {
								order = 7,
								type = "select",
								name = L["Skada Template"],
								values = {
									["Default"] = DEFAULT,
									["Transparent"] = L["Transparent"]
								},
								disabled = function() return not E.db.addOnSkins.skadaBackdrop end
							},
							skadaTemplateGloss = {
								order = 8,
								type = "toggle",
								name = L["Skada Template Gloss"],
								disabled = function() return E.db.addOnSkins.skadaTemplate == "Transparent" or not E.db.addOnSkins.skadaBackdrop end
							}
						}
					},
					dbmGroup = {
						order = 3,
						type = "group",
						name = "DBM",
						get = function(info) return E.db.addOnSkins[info[#info]] end,
						set = function(info, value) E.db.addOnSkins[info[#info]] = value DBM.Bars:ApplyStyle() DBM.BossHealth:UpdateSettings() end,
						disabled = function() return not AS:CheckAddOn("DBM-Core") end,
						args = {
							header = {
								order = 1,
								type = "header",
								name = "DBM"
							},
							dbmBarHeight = {
								order = 2,
								type = "range",
								name = L["Bar Height"],
								min = 6, max = 60,
								step = 1
							},
							spacer = {
								order = 3,
								type = "description",
								name = ""
							},
							dbmFont = {
								order = 4,
								type = "select",
								dialogControl = "LSM30_Font",
								name = L["Font"],
								values = AceGUIWidgetLSMlists.font
							},
							dbmFontSize = {
								order = 5,
								type = "range",
								name = FONT_SIZE,
								min = 6, max = 22, step = 1
							},
							dbmFontOutline = {
								order = 6,
								type = "select",
								name = L["Font Outline"],
								values = {
									["NONE"] = NONE,
									["OUTLINE"] = "OUTLINE",
									["MONOCHROMEOUTLINE"] = "MONOCROMEOUTLINE",
									["THICKOUTLINE"] = "THICKOUTLINE"
								}
							}
						}
					},
					waGroup = {
						order = 4,
						type = "group",
						name = "WeakAuras",
						get = function(info) return E.db.addOnSkins[info[#info]] end,
						set = function(info, value) E.db.addOnSkins[info[#info]] = value E:StaticPopup_Show("PRIVATE_RL") end,
						disabled = function() return not AS:CheckAddOn("WeakAuras") end,
						args = {
							header = {
								order = 1,
								type = "header",
								name = "WeakAuras"
							},
							weakAuraAuraBar = {
								order = 2,
								type = "toggle",
								name = L["AuraBar Backdrop"]
							},
							weakAuraIconCooldown = {
								order = 3,
								type = "toggle",
								name = L["WeakAura Cooldowns"]
							}
						}
					}
				}
			},
			embed = {
				order = 3,
				type = "group",
				name = L["Embed Settings"],
				get = function(info) return E.db.addOnSkins.embed[info[#info]] end,
				set = function(info, value) E.db.addOnSkins.embed[info[#info]] = value E:GetModule("EmbedSystem"):EmbedUpdate() end,
				args = {
					header = {
						order = 1,
						type = "header",
						name = L["Embed Settings"],
					},
					desc = {
						order = 2,
						type = "description",
						name = L["Settings to control Embedded AddOns\n\nAvailable Embeds: Omen | Skada | Recount"]
					},
					embedType = {
						order = 3,
						type = "select",
						name = L["Embed Type"],
						values = {
							["DISABLE"] = L["Disable"],
							["SINGLE"] = L["Single"],
							["DOUBLE"] = L["Double"]
						}
					},
					rightChatPanel = {
						order = 4,
						type = "toggle",
						name = L["Embed into Right Chat Panel"],
						disabled = function() return E.db.addOnSkins.embed.embedType == "DISABLE" end
					},
					belowTopTab = {
						order = 5,
						type = "toggle",
						name = L["Embed Below Top Tab"],
						disabled = function() return E.db.addOnSkins.embed.embedType == "DISABLE" end
					},
					leftWindow = {
						order = 6,
						type = "select",
						name = L["Left Panel"],
						values = {
							["Recount"] = "Recount",
							["Omen"] = "Omen",
							["Skada"] = "Skada"
						},
						disabled = function() return E.db.addOnSkins.embed.embedType == "DISABLE" end
					},
					rightWindow = {
						order = 7,
						type = "select",
						name = L["Right Panel"],
						values = {
							["Recount"] = "Recount",
							["Omen"] = "Omen",
							["Skada"] = "Skada"
						},
						disabled = function() return E.db.addOnSkins.embed.embedType ~= "DOUBLE" end
					},
					hideChat = {
						order = 8,
						type = "select",
						name = L["Hide Chat Frame"],
						values = E:GetModule("EmbedSystem"):GetChatWindowInfo(),
						disabled = function() return E.db.addOnSkins.embed.embedType == "DISABLE" end
					},
					leftWindowWidth = {
						order = 9,
						type = "range",
						name = L["Embed Left Window Width"],
						min = 100,
						max = 300,
						step = 1,
						disabled = function() return E.db.addOnSkins.embed.embedType == "DISABLE" end
					}
				}
			}
		}
	}

	for _, addonName in pairs(addonList) do
		AS:RegisterAddonOption(addonName, options)
	end

	E.Options.args.addOnSkins = options
end

function AS:Initialize()
	EP:RegisterPlugin(AddOnName, getOptions)

	if E.db.addOnSkins.embed.left then
		E.db.addOnSkins.embed.leftWindow = E.db.addOnSkins.embed.left
		E.db.addOnSkins.embed.left = nil
	end
	if E.db.addOnSkins.embed.right then
		E.db.addOnSkins.embed.rightWindow = E.db.addOnSkins.embed.right
		E.db.addOnSkins.embed.right = nil
	end
	if E.db.addOnSkins.embed.leftWidth then
		E.db.addOnSkins.embed.leftWindowWidth = E.db.addOnSkins.embed.leftWidth
		E.db.addOnSkins.embed.leftWidth = nil
	end
	if type(E.db.addOnSkins.embed.rightChat) == "boolean" then
		E.db.addOnSkins.embed.rightChatPanel = E.db.addOnSkins.embed.rightChat
		E.db.addOnSkins.embed.rightChat = nil
	end
	if type(E.db.addOnSkins.embed.belowTop) == "boolean" then
		E.db.addOnSkins.embed.belowTopTab = E.db.addOnSkins.embed.belowTop
		E.db.addOnSkins.embed.belowTop = nil
	end
	E.db.addOnSkins.embed.isShow = nil
end

local function InitializeCallback()
	AS:Initialize()
end

E:RegisterModule(AS:GetName(), InitializeCallback) 